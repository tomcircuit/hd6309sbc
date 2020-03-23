;======================================================================
;  MONITOR 1V4 
;  For the HD6309 SBC Singleboard Computer
;  March 17, 2020
;  tomcircuit@gmail.com
;
; This source file is intended to be used with the HD6309 SBC board,
; described here:
;
;  https://hackaday.io/project/345-hd6309-singleboard-computer
;
; Specifically, this source file is for a "monitor ROM" for the SBC,
; and is targetted to reside in 7.5K of ROM at the top of the  
; memory map ($E200-$FFFF), and 56K of RAM from $0000-$DFFF.  
;
; This monitor ROM includes the following main portions:
;
;   0) MC6839 IEEE Floating Point functions (see note)
;   1) NoICE debug monitor, supporting both SCC channels
;   2) WOZMON port to 6809 of classic Apple 1 monitor
;   3) a S-Record/Intel Hex download function (also via WOZMON)
;   4) HD6309 SBC specific hardware support functions
;
; 512 bytes of RAM from $BE00-$BFFF are reserved for all of this, and
; the system stack stack pointer is initialized to point to the 
; beginning of this area, allowing the user stack to grow downward 
; into free user RAM.        
;
; note: the 8K of ROM $C000-$DFFF should contain the Motorola "MC6839" 
; IEEE Floating Point functions, which are (sadly) only avaialble as 
; a binary image. As such, the source for this is not included in this
; file. See the MC6839 User Manual and Datasheet for more information. 
;======================================================================

			INCLUDE "hd6309_hardware.inc"

;  Platform dependent memory information
RAM_START       EQU     $C000           ; START OF MONITOR RAM
ROM_START       EQU     $E200           ; START OF MONITOR CODE
HARD_VECT       EQU     $FFF0           ; START OF HARDWARE VECTORS

;  Condition Code Register bits
C       EQU     $01
V		EQU		$02
Z		EQU		$04
I       EQU     $10
F       EQU     $40                 
E       EQU     $80

;  Other defines
TRUE	EQU		1
FALSE	EQU		0

		
   		ORG     RAM_START
;
;  RAM for WOZMON
WOZ_RAM			RMB		128+7			; storage for WOZMON input buffer, vars
;
;  RAM for RTC operations
RTC_RAM			RMB		32				; buffer for 32 byte block of RTC registers
RTCBUFPTR		RMB		2				; points to a 32-byte block in RAM for RTC operations
										; (after reset points to RAMSTART-34)
;
;  RAM interrupt vectors (first in SEG for easy addressing, else move to their own SEG)
NVEC            EQU     8               ; number of vectors
RAMVEC          RMB     2*NVEC
;
;  Initial user stack
;  (Size and location is user option)
                RMB     64
INITSTACK
;
;  Monitor stack
;  (Calculated use is at most 7 bytes.  Leave plenty of spare)
                RMB     16
MONSTACK
;
GLOBAL_TEMP
TEST_STACK      RMB     14
; It is not possible to read bits 0 and 1 of regMD so the next three 
; lines enable testing of these bits.
E_FLAG          RMB     1               ; 0=not set $80=set
S_IMAGE         RMB     2               ; temporary store for regS
;  Target registers:  order must match that in TRGHC11.C
TASK_REGS
REG_STATE       RMB     1
REG_PAGE        RMB     1
REG_SP          RMB     2
REG_U           RMB     2
REG_Y           RMB     2
REG_X           RMB     2
REG_F           RMB     1               ; F BEFORE E, SO W IS LEAST SIG. FIRST
REG_E           RMB     1
REG_B           RMB     1               ; B BEFORE A, SO D IS LEAST SIG. FIRST
REG_A           RMB     1
REG_DP          RMB     1
REG_CC          RMB     1
REG_MD          RMB     1
REG_V           RMB     2
REG_PC          RMB     2
TASK_REG_SZ     EQU     *-TASK_REGS
;
;  Communications buffer
;  (Must be at least as long as TASK_REG_SZ.  At least 19 bytes recommended.
;  Larger values may improve speed of NoICE memory move commands.)
COMBUF_SIZE     EQU     128             ; DATA SIZE FOR COMM BUFFER
COMBUF          RMB     2+COMBUF_SIZE+1 ; BUFFER ALSO HAS FN, LEN, AND CHECK
COMCH			RMB		1               ; SCC address used for NoICE monitor
										; Added to $E000, so $10=Ch B, $12=Ch A
										; If no ch assigned yet, +$80 
RAM_END         EQU     *               ; ADDRESS OF TOP+1 OF RAM

		PRAGMA	6309
        ORG     ROM_START				

;======================================================================
; Jump table to utility functions at beginning of HIGH ROM 
;======================================================================

		FDB		WOZMON
		FDB		CIO_INIT                                 
		FDB		CIO_READ                                 
		FDB		CIO_WRITE                                
		FDB		SCC_INITA
		FDB		PUTA     
		FDB		GETA     
		FDB		GETA1	 
		FDB		GETA2
		FDB		GETNIB		
		FDB		GETBYTE  
		FDB		PUTWORD  
		FDB		PUTBYTE 
		FDB		PUTHEX   
		FDB		PUTCR    
		FDB		PUTMSG   
		FDB		PUTSTR   
		FDB		DELAYMS
		FDB		I2C_Initialize                                  
		FDB		I2C_ReadByte                                            
		FDB		I2C_WriteByte                                           
		FDB		I2C_ReadMany           
		FDB		I2C_WriteMany          
		FDB		RTC_ReadRegs
		FDB		RTC_WriteRegs

;======================================================================
;  SYSTEM RESET 
;======================================================================

RESET
        ORCC    #I+F            	; INTERRUPTS OFF
   		LDS     #MONSTACK       	; CLEAN STACK IS HAPPY STACK
		LDA		#(IO.SDCS|IO.SDCLK|IO.LED2|IO.LED1)		; un-select SDcard, slow SPI clock freq,
		STA		IOPORT									; both LED1 and LED2 on
		AIM		#~(SYS.ROMWS),SYSCFG					; make ROM access 0WS (fast flash)
		OIM		#(SYS.ROMSEL|SYS.ROMSEH),SYSCFG			; make sure all ROM is enabled
		JSR		SCC_INITA			; init SCC channel A for 115.2kbps 
		LDX		#500				; delay 0.5s 
		JSR		DELAYMS
		TIM		#IO.PB,IOPORT		; check the pushbutton
		BNE		WELCOME				; depressed, so go right to WOZMON
		LDX		#500				; delay 0.5s 
		JSR		DELAYMS
		OIM		#~IO.LED2,IOPORT	; turn off LED2		

; HD6309 SBC can be USB powered, which means that CPU execution begins before the 
; USB bridge finishes enumeration. Therefore, we wait a bit for console entry on
; Channel A to allow entry into the monitor via SPACE, CR, etc.

RESET0
		LDW		#500				; 500 iterations
R?0		DECW                        ; decement counter
		BEQ		RTIMEOUT			; 	done trying for console input
		JSR		GETA2				; attempt to get a character from SCC CH A
		BCS		R?0					; 	timeout --> try again
		TSTA						; examine the character
		BPL		WELCOME             ; it's normal ASCII, so consider it a keystroke!
RTIMEOUT							; either timeout without character, or non-ASCII character rcvd
		JMP		NOICE				; enter the NoICE resident debugger
		
; We received a caracter on UART channel A, so assume a human is at the console and
; display a welcome message and then enter WOZMON
		
WELCOME
		JSR		PUTMSG
		FDB		$0D,$0A
		FCC		"HD6309 Singleboard Computer"
		FDB		$0D,$0A
		FCC		"ROM Version 1.4"
		FDB		$0D,$0A		
		FCC		"CPLD Version "
		FDB		$00
		LDA		CPLDVER
		LSRA
		LSRA
		LSRA
		LSRA
		JSR		PUTHEX
		LDA		#'.'
		JSR		PUTA
		LDA		CPLDVER		
		JSR		PUTHEX		
		JSR		PUTCR
		JMP		WOZMON

;; DELAYMS - software loop time delay function (ms)
;; inputs: X = number of ms to delay
;; output: X = 0, Z flag set

TIMCON	EQU		598					; adjust TIMCON so that (5*TIMCON*CYCLE TIME)=1ms
DELAYMS 
		PSHS	D
D?LY0	LDD		#TIMCON
D?LY1 	DECD						;(2 cyc)
       	BNE    	D?LY1				;(3 cyc) = 5 cycle inner loop
       	LEAX   	-1,X				;(5 cyc)
       	BNE    	D?LY0				;(3 cyc) = TIMCON*5 + 8 outer loop
		PULS	D,PC

;======================================================================
; BEGINNING OF NoICE RESIDENT DEBUGGER 
;======================================================================

;======================================================================
;
;  6309 Debug monitor for use with NOICE09
;  Adapted for HD6309 SBC March 2020
;
;  This is intended as a generic 6309 monitor.
;
;  Copyright (c) 1992-2006 by John Hartman
;
;  Modification History:
;    13-Mar-2006 JLH ported from 6809 version with assistance from Robert Gault
;     8-Mar-2016 TJL corrected bug in the RUN_TARGET handler 
;    11-Mar-2020 TJL ported to HD6309 SBC platform, lwasm assembler
;
;======================================================================

;
;  Condition Code Register bits
;C       		EQU     $01
;V				EQU		$02
;Z				EQU		$04
;I       		EQU     $10
;F       		EQU     $40                 
;E       		EQU     $80
;
;============================================================================
;
;===========================================================================
;
;  Set CPU mode to safe state, configure hardware
;
NOICE   ORCC    #I+F            		; INTERRUPTS OFF
   		LDS     #MONSTACK       		; CLEAN STACK IS HAPPY STACK
		JSR		SCC_INITA				; init SCC channel A for 115.2kbps 
		JSR		SCC_INITB				; init SCC channel B for 115.2kbps 
		LDA		#(128+(ZSCCBC-IOPAGE))	; offset of DUART channel B + 128 ($90)
		STA		COMCH					; no assigned DUART channel for monitor at reset
;
;  Initialize RAM interrupt vectors
        LDY     #INT_ENTRY      		; ADDRESS OF DEFAULT HANDLER
        LDX     #RAMVEC         		; POINTER TO RAM VECTORS
        LDB     #NVEC           		; NUMBER OF VECTORS
RES10   STY     ,X++            		; SET VECTOR
        DECB
        BNE     RES10
;
;  Initialize user registers
        LDD     #INITSTACK
        STA     REG_SP+1                ; INIT USER'S STACK POINTER MSB
        STB     REG_SP                  ; LSB
;
        CLRD
        STD     REG_PC
        STA     REG_A
        STA     REG_B
        STA     REG_E
        STA     REG_F
        STA     REG_DP
        STA     REG_MD
        STD     REG_X
        STD     REG_Y
        STD     REG_U
        STD     REG_V
        STA     REG_STATE               ; initial state is "RESET"
;
        LDA     #E+I+F                  ; state "all regs pushed", no ints
        STA     REG_CC
;
;  Set function code for "GO".  Then if we reset after being told to
;  GO, we will come back with registers so user can see the crash
        LDA     #FN_RUN_TARG
        STA     COMBUF
        JMP     RETURN_REGS             ; DUMP REGS, ENTER MONITOR
		
;======================================================================
; BEGINNING OF PLATFORM DEPENDENT STARTUP AND INPUT/OUTPUT CODE
;======================================================================
;

;===========================================================================
;  Get a character to A
;
;  Return A=char, CY=0 if data received
;         CY=1 if timeout (0.5 seconds)
;
;  Uses 7 bytes of stack including return address
;  (increases to 9 bytes if the REWDT function is called)
;
GETCHAR
		PSHS	Y,X,B					; preserve X,Y,B 
		LDX		#IOPAGE					; point to base IOPAGE address
		LDB		COMCH					; get offset to monitor command channel (+10/+12)
		ANDB	#%01111111				; ignore the "unassigned" bit
		ABX								; X is address of specific monitor command channel
GC05?	LDY		#0						; clear Y for longest timeout (~450ms)		
GC10?   ;BSR	REWDT					; service watchdog
		LEAY    -1,Y					; decrement timeout counter
        BEQ     GC90?           		; 	EXIT IF TIMEOUT
		LDB		,X						; reset register pointer to WR0/RR0
		LDB		,X						; read RR0
		ANDB	#ZSCC.RXBF				; examine the RX char available bit
		BEQ		GC10?					; 	LOOP UNTIL CHARACTER AVAILABLE
		LDA		1,X						; read character from monitor data channel (+11/+13)
		ANDCC	#~C						; CY=0 indicates character is available
		PULS	Y,X,B,PC				; restore X and B and return
GC90?   ORCC    #C              		; CY=1 indicates timeout
		PULS	Y,X,B,PC				; restore Y,X,B and return
; alternate entry point - GETCHAR from UART CHANNEL A, with standard timeout duration
GETA2	PSHS	Y,X,B					; preserve X,Y,B
		LDX		#ZSCCAC					; point X to SCC Channel A ($E012)
		BRA		GC05?					; process as GETCHAR
; alternate entry point - GETCHAR from UART CHANNEL A, with no retry
GETA1	PSHS	Y,X,B					; preserve X,Y,B
		LDX		#ZSCCAC					; point X to SCC Channel A ($E012)		
		LDY		#2						; only check once for a character in channel A
		BRA		GC10?					; process as GETCHAR		
; alternate entry point - GETCHAR from UART CHANNEL A, with infinite retry duration
GETA	PSHS	Y,X,B					; preserve X,Y,B
GA0?	LDX		#ZSCCAC					; point X to SCC Channel A ($E012)
		BSR		GC05?					; process as GETCHAR
		BCC		GA0?					; 	if no character, keep trying
		RTS								; 	otherwise, return with CY=1
		
;       		
;===========================================================================
;  Output character in A
;
;  Uses 5 bytes of stack including return address
;
PUTCHAR
		PSHS	X,B						; preserve X,B 
		LDX		#IOPAGE					; point to base IOPAGE address
		LDB		COMCH					; get offset to monitor command channel (+10/+12)
		ANDB	#%01111111				; ignore the "unassigned" bit
		ABX								; X is address of specific monitor command channel
PC10?   ;BSR	REWDT					; service watchdog
		LDB		,X						; reset register pointer to WR0/RR0
		LDB		,X						; read RR0
		ANDB	#ZSCC.TXBE				; 	examine the TX buffer empty bit
		BEQ		PC10?					; 	LOOP UNTIL EMPTY
		STA		1,X						; write character to monitor data channel (+11/+13)
		PULS	X,B,PC					; restore X and B and return
; alternate entry point - PURCHAR to UART CHANNEL A
PUTA	PSHS	X,B						; preserve X,B
		LDX		#ZSCCAC					; point X to SCC Channel A ($E012)
		BRA		PC10?					; process as PUTCHAR
;
;======================================================================
;  RESET WATCHDOG TIMER.  MUST BE CALLED AT LEAST ONCE EVERY LITTLE WHILE
;  OR COP INTERRUPT WILL OCCUR
;
;  Uses 2 bytes of stack including return address
;
;REWDT	CLRA
;       STA     WDT
;       INCA
;       STA     WDT             		; CU-style WDT:  must leave bit high
;       RTS
;
;======================================================================
;  Response string for GET TARGET STATUS request
;  Reply describes target:
TSTG    FCB     17                      ; 2: PROCESSOR TYPE = 6309
        FCB     COMBUF_SIZE             ; 3: SIZE OF COMMUNICATIONS BUFFER
        FCB     0                       ; 4: NO TASKING SUPPORT
        FDB     0,0                     ; 5-8: LOW AND HIGH LIMIT OF MAPPED MEM (NONE)
        FCB     B1-B0                   ; 9:  BREAKPOINT INSTR LENGTH
B0      SWI                             ; 10: BREAKPOINT INSTRUCTION
B1      FCC     '6309 monitor V1.0'     ; DESCRIPTION TEXT
        FCB     0                       ; DESCRIPTION NULL TERMINATOR
TSTG_SIZE       EQU     *-TSTG          ; SIZE OF STRING

;======================================================================
; INITIALIZE SCC DUART CHANNEL A
;
SCC_INITA
		PSHS	A,X,Y					; preserve A,X,Y
		LDY		#ZSCCAC					; Y points to DUART channel A command reg
		LDX		#SCCATBL				; X points to channel A config table
		BRA		IS0						; perform channel init

;======================================================================
; INITIALIZE SCC DUART CHANNEL B		
;		
SCC_INITB
		PSHS	A,X,Y					; preserve A,X,Y
		LDY		#ZSCCBC					; Y points to DUART channel B command reg
		LDX		#SCCBTBL				; X points to channel B config table
IS0		LDA		,Y						; reset register pointer to WR0/RR0
IS1?	LDA		,X+						; load address from table
		CMPA	#$FF 					; is it $ff? (end of table)
		BEQ		IS2?					;    yes, done with init of channel
		STA		,Y						;    no, write the register pointer to WR0
		LDA		,X+						; get data byte from table
		STA		,Y						; write data to SCC command register
		BRA		IS1?					; repeat until EOT reached..
IS2?	PULS	A,X,Y,PC				; restore registers and return

;======================================================================
; Initialization table for SCC Channel A in ASYNC mode, external 16x clock
; ACLK from CPLD is 1.843 MHz. 1.843 / 16 = 115.2kbps (USB VCP interface)
SCCATBL:
		FCB $09,$80 	; WR9, reset channel A
		FCB	$09,$00		; WR9, un-reset channel A
		FCB	$04,$44		; WR4, X16 clock,1 Stop,NP
		FCB $03,$C1		; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
		FCB	$05,$EA   	; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
		FCB	$0B,$05		; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
		FCB	$0C,$04		; WR12, Low byte 9600 Baud (optional)
		FCB	$0D,$00		; WR13, High byte for Baud (optional)
		FCB	$0E,$01		; WR14, Using a 1,8432 MHz BRG Clock (ECLK)
		FCB	$0F,$00		; WR15, No INT from hardware CTS/RTS
		FCB	$FF,$FF		; EOT marker

;======================================================================
; Initialization table for SCC Channel B in ASYNC mode, external 32x clock
; BCLK from CPLD is 3.686 MHz. 3.686M / 32 = 115.2kbps (ChB Header)
SCCBTBL:
		FCB $09,$40 	; WR9, reset channel B
		FCB	$09,$00		; WR9, un-reset channel B
		FCB	$04,$84		; WR4, X32 clock,1 Stop,NP
		FCB $03,$C1		; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
		FCB	$05,$EA   	; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
		FCB	$0B,$05		; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
		FCB	$0C,$04		; WR12, Low byte 9600 Baud (optional)
		FCB	$0D,$00		; WR13, High byte for Baud (optional)
		FCB	$0E,$01		; WR14, Using a 1,8432 MHz BRG Clock (ECLK)
		FCB	$0F,$00		; WR15, No INT from hardware CTS/RTS
		FCB	$FF,$FF		; EOT marker
		
;======================================================================
; END OF PLATFORM DEPENDENT STARTUP AND INPUT/OUTPUT CODE
;======================================================================

;======================================================================
;  HARDWARE PLATFORM INDEPENDENT EQUATES AND CODE
;
;  Communications function codes.
FN_GET_STAT     EQU     $FF    			; reply with device info
FN_READ_MEM     EQU     $FE    			; reply with data
FN_WRITE_M      EQU     $FD    			; reply with status (+/-)
FN_READ_RG      EQU     $FC    			; reply with registers
FN_WRITE_RG     EQU     $FB    			; reply with status
FN_RUN_TARG     EQU     $FA    			; reply (delayed) with registers
FN_SET_BYTE     EQU     $F9    			; reply with data (truncate if error)
FN_IN           EQU     $F8    			; input from port
FN_OUT          EQU     $F7    			; output to port
;                              			; 
FN_MIN          EQU     $F7    			; MINIMUM RECOGNIZED FUNCTION CODE
FN_ERROR        EQU     $F0    			; error reply to unknown op-code
;
;===========================================================================
;  Common handler for default interrupt handlers
;  Enter with A=interrupt code = processor state
;  All registers stacked, PC=next instruction
;
;  If 6809 mode, stack has CC A B DP XH XL YH YL UH UL PCH PCL
;  If 6309 mode, stack has CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
;
INT_ENTRY
        STA     REG_STATE       		; SAVE STATE
;
;  Save registers from stack to reg block for return to master
;  Host wants least significant bytes first, so flip as necessary
        PULS    A
        STA     REG_CC          		; CONDITION CODES
        PULS    A               		
        STA     REG_A           		; A
        PULS    A               		
        STA     REG_B           		; B

;  If native mode, E and F are on stack
;  If 6809 mode, E and F are in registers, unchanged from interrupt til here
        JSR     MD_TEST
        BNE     IE_10           		; Jump if 6809 mode
        PULSW                   		; else native: get from stack
IE_10   STE     REG_E
        STF     REG_F

;  V isn't on the stack, but we haven't touched it.  Copy to RAM
        TFR     V,D
        STA     REG_V+1         		; MSB V
        STB     REG_V           		; LSB V

;  There seems to be no way to store MD, and no way to load it except immediate
;  Thus we have to construct it by BITMD
        LDA     REG_MD
        ANDA    #$03            		; save only bits 1 and 0 (set by MD_TEST)
        BITMD   #$40
        BEQ     IE_11
        ORA     #$40
IE_11   BITMD   #$80
        BEQ     IE_12
        ORA     #$80
IE_12   STA     REG_MD

        PULS    A
        STA     REG_DP          		; DP
        PULS    D
        STA     REG_X+1         		; MSB X
        STB     REG_X           		; LSB X
        PULS    D
        STA     REG_Y+1         		; MSB Y
        STB     REG_Y           		; LSB Y
        PULS    D
        STA     REG_U+1         		; MSB U
        STB     REG_U           		; LSB U
;
;  If this is a breakpoint (state = 1), then back up PC to point at SWI
        PULS    X               		; PC AFTER INTERRUPT
        LDA     REG_STATE    
        CMPA    #1           
        BNE     NOTBP           		; BR IF NOT A BREAKPOINT
        LEAX    -1,X            		; ELSE BACK UP TO POINT AT SWI LOCATION
NOTBP   TFR     X,D             		; TRANSFER PC TO D
        STA     REG_PC+1        		; MSB
        STB     REG_PC          		; LSB
        JMP     ENTER_MON       		; REG_PC POINTS AT POST-INTERRUPT OPCODE
;
;===========================================================================
;  Main loop  wait for command frame from master
;
;  Uses 6 bytes of stack including return address
;
MAIN    LDS     #MONSTACK               ; CLEAN STACK IS HAPPY STACK
        LDX     #COMBUF                 ; BUILD MESSAGE HERE
;
; check to see if a DUART channel has been already established
		LDA 	COMCH					; examine the COMCH byte
		BPL		MA05					; 	<128 means channel is set already
; if not, then alternate channel (XOR with $02) after each timeout or message failure
; update LED2 to reflect the channel being tried
		EORA	#%00000010				; select alternate channel ($10 -> $12, $12 -> $10)
		STA		COMCH					; store new COMCH byte
		ANDA	#%00000010				; isolate the channel A/B bit in COMCH						
		AIM		#%11111101,IOPORT		; clear IOPORT bit 2 (LED2 control)
		ORA		IOPORT					; OR the IOPORT and channel A/B bit
		STA		IOPORT					; store back to IOPORT
;
;  First byte is a function code
MA05    JSR     GETCHAR                 ; GET A FUNCTION (6 bytes of stack)
        BCS     MAIN                    ; JIF TIMEOUT: RESYNC
        CMPA    #FN_MIN
        BLO     MAIN                    ; JIF BELOW MIN: ILLEGAL FUNCTION
        STA     ,X+                     ; SAVE FUNCTION CODE
;
;  Second byte is data byte count (may be zero)
        JSR     GETCHAR                 ; GET A LENGTH BYTE
        BCS     MAIN                    ; JIF TIMEOUT: RESYNC
        CMPA    #COMBUF_SIZE
        BHI     MAIN                    ; JIF TOO LONG: ILLEGAL LENGTH
        STA     ,X+                     ; SAVE LENGTH
        CMPA    #0
        BEQ     MA80                    ; SKIP DATA LOOP IF LENGTH = 0
;
;  Loop for data
        TFR     A,B                     ; SAVE LENGTH FOR LOOP
MA10    JSR     GETCHAR                 ; GET A DATA BYTE
        BCS     MAIN                    ; JIF TIMEOUT: RESYNC
        STA     ,X+                     ; SAVE DATA BYTE
        DECB
        BNE     MA10
;
;  Get the checksum
MA80    JSR     GETCHAR                 ; GET THE CHECKSUM
        BCS     MAIN                    ; JIF TIMEOUT: RESYNC
        PSHS    A                       ; SAVE CHECKSUM
;
;  Compare received checksum to that calculated on received buffer
;  (Sum should be 0)
        JSR     CHECKSUM
        ADDA    ,S+                     ; ADD SAVED CHECKSUM TO COMPUTED
        BNE     MAIN                    ; JIF BAD CHECKSUM
;
; at this point, we've received a valid message from the host via the
; current DUART channel. We'll clear the msb of COMCH to indicate
; that the current channel is now "assigned" for use
		AIM		#%01111111,COMCH		; clear the msbit
;
;  Process the message.
        LDX     #COMBUF
        LDA     ,X+                     ; GET THE FUNCTION CODE
        LDB     ,X+                     ; GET THE LENGTH
        CMPA    #FN_GET_STAT
        BEQ     TARGET_STAT
        CMPA    #FN_READ_MEM
        BEQ     JREAD_MEM
        CMPA    #FN_WRITE_M
        BEQ     JWRITE_MEM
        CMPA    #FN_READ_RG
        BEQ     JREAD_REGS
        CMPA    #FN_WRITE_RG
        BEQ     JWRITE_REGS
        CMPA    #FN_RUN_TARG
        BEQ     JRUN_TARGET
        CMPA    #FN_SET_BYTE
        BEQ     JSET_BYTES
        CMPA    #FN_IN
        BEQ     JIN_PORT
        CMPA    #FN_OUT
        BEQ     JOUT_PORT
;
;  Error: unknown function.  Complain
        LDA     #FN_ERROR
        STA     COMBUF          		; SET FUNCTION AS "ERROR"
        LDA     #1
        JMP     SEND_STATUS     		; VALUE IS "ERROR"
;
;  long jumps to handlers
JREAD_MEM       JMP     READ_MEM
JWRITE_MEM      JMP     WRITE_MEM
JREAD_REGS      JMP     READ_REGS
JWRITE_REGS     JMP     WRITE_REGS
JRUN_TARGET     JMP     RUN_TARGET
JSET_BYTES      JMP     SET_BYTES
JIN_PORT        JMP     IN_PORT
JOUT_PORT       JMP     OUT_PORT

;===========================================================================
;
;  Target Status:  FN, len
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
TARGET_STAT
        LDX     #TSTG                   ; DATA FOR REPLY
        LDY     #COMBUF+1               ; POINTER TO RETURN BUFFER
        LDB     #TSTG_SIZE              ; LENGTH OF REPLY
        STB     ,Y+                     ; SET SIZE IN REPLY BUFFER
TS10    LDA     ,X+                     ; MOVE REPLY DATA TO BUFFER
        STA     ,Y+
        DECB
        BNE     TS10
;
;  Compute checksum on buffer, and send to master, then return
        JMP     SEND

;===========================================================================
;
;  Read Memory:  FN, len, page, Alo, Ahi, Nbytes
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
READ_MEM
;
;  Set map
;;;;    LDA     0,X
;;;;    STA     MAPIMG
;;;;    STA     MAPREG
;
;  Get address
        LDA     2,X                     ; MSB OF ADDRESS IN A
        LDB     1,X                     ; LSB OF ADDRESS IN B
        TFR     D,Y                     ; ADDRESS IN Y
;
;  Prepare return buffer: FN (unchanged), LEN, DATA
        LDB     3,X                     ; NUMBER OF BYTES TO RETURN
        STB     COMBUF+1                ; RETURN LENGTH = REQUESTED DATA
        BEQ     GLP90                   ; JIF NO BYTES TO GET
;
;  Read the requested bytes from local memory
GLP     LDA     ,Y+                     ; GET BYTE
        STA     ,X+                     ; STORE TO RETURN BUFFER
        DECB
        BNE     GLP
;
;  Compute checksum on buffer, and send to master, then return
GLP90   JMP     SEND

;===========================================================================
;
;  Write Memory:  FN, len, page, Alo, Ahi, (len-3 bytes of Data)
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
;  Uses 6 bytes of stack
;
WRITE_MEM
;
;  Set map
        LDA     ,X+
;;;;    STA     MAPIMG
;;;;    STA     MAPREG
;
;  Get address
        LDB     ,X+                     ; LSB OF ADDRESS IN B
        LDA     ,X+                     ; MSB OF ADDRESS IN A
        TFR     D,Y                     ; ADDRESS IN Y
;
;  Compute number of bytes to write
        LDB     COMBUF+1                ; NUMBER OF BYTES TO RETURN
        SUBB    #3                      ; MINUS PAGE AND ADDRESS
        BEQ     WLP50                   ; JIF NO BYTES TO PUT
;
;  Write the specified bytes to local memory
        PSHS    B,X,Y
WLP     LDA     ,X+                     ; GET BYTE TO WRITE
        STA     ,Y+                     ; STORE THE BYTE AT ,Y
        DECB
        BNE     WLP
;
;  Compare to see if the write worked
        PULS    B,X,Y
WLP20   LDA     ,X+                     ; GET BYTE JUST WRITTEN
        CMPA    ,Y+
        BNE     WLP80                   ; BR IF WRITE FAILED
        DECB
        BNE     WLP20
;
;  Write succeeded:  return status = 0
WLP50   LDA     #0                      ; RETURN STATUS = 0
        BRA     WLP90
;
;  Write failed:  return status = 1
WLP80   LDA     #1

;  Return OK status
WLP90   JMP     SEND_STATUS

;===========================================================================
;
;  Read registers:  FN, len=0
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
READ_REGS
;
;  Enter here from SWI after "RUN" and "STEP" to return task registers
RETURN_REGS
        LDY     #TASK_REGS              ; POINTER TO REGISTERS
        LDB     #TASK_REG_SZ            ; NUMBER OF BYTES
        LDX     #COMBUF+1               ; POINTER TO RETURN BUFFER
        STB     ,X+                     ; SAVE RETURN DATA LENGTH
;
;  Copy the registers
GRLP    LDA     ,Y+                     ; GET BYTE TO A
        STA     ,X+                     ; STORE TO RETURN BUFFER
        DECB
        BNE     GRLP
;
;  Compute checksum on buffer, and send to master, then return
        JMP     SEND

;===========================================================================
;
;  Write registers:  FN, len, (register image)
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
WRITE_REGS
;
        TSTB                            ; NUMBER OF BYTES
        BEQ     WRR80                   ; JIF NO REGISTERS
;
;  Copy the registers
        LDY     #TASK_REGS              ; POINTER TO REGISTERS
WRRLP   LDA     ,X+                     ; GET BYTE TO A
        STA     ,Y+                     ; STORE TO REGISTER RAM
        DECB
        BNE     WRRLP
;
;  Return OK status
WRR80   CLRA
        JMP     SEND_STATUS

;===========================================================================
;
;  Run Target:  FN, len
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
RUN_TARGET
;
;  Restore user's map
;*      LDA     REG_PAGE                ; USER'S PAGE
;*      STA     MAPIMG                  ; SET IMAGE
;*      STA     MAPREG                  ; SET MAPPING REGISTER
;
;  Switch to user stack
        LDA     REG_SP+1                ; BACK TO USER STACK
        LDB     REG_SP
        TFR     D,S                     ; TO S
;
;  Restore MD, as it affects stack building and RTI
;  Only bits 1 and 0 can be written, and only using LDMD #
;  It's time for some self-modifying code!  Build LDMD #xxx, RTS in RAM and call it.
        LDD     #$113D                  ; LDMD #imm
        STD     COMBUF+30               ; Start code string
        LDA     REG_MD                  ; #imm is desired MD value
        STA     COMBUF+32
        LDA     #$39                    ; RTS
        STA     COMBUF+33
        JSR     COMBUF+30
;
;  Restore V, which isn't on the stack
        LDA     REG_V+1
        LDB     REG_V
        TFR     D,V
;
;  Restore registers
        LDA     REG_PC+1                ; MS USER PC FOR RTI
        LDB     REG_PC                  ; LS USER PC FOR RTI
        PSHS    D
;
        LDA     REG_U+1
        LDB     REG_U
        PSHS    D
;
        LDA     REG_Y+1
        LDB     REG_Y
        PSHS    D
;
        LDA     REG_X+1
        LDB     REG_X
        PSHS    D
;
        LDA     REG_DP
        PSHS    A
;
;  Restore W from memory (not used between here and RTI)
        LDE     REG_E
        LDF     REG_F
        LDA     REG_MD
        BITA    #1
        BEQ     RT_10                   ; jump if 6809 mode
        PSHSW                          	; else push W on stack for RTI
RT_10
;
        LDA     REG_B
        PSHS    A
;
        LDA     REG_A
        PSHS    A
;
        LDA     REG_CC                  ; SAVE USER CONDITION CODES FOR RTI
        ORA     #E                      ; _MUST_ BE "ALL REGS PUSHED"
        PSHS    A
;
;  Return to user (conditioned by MD.0)
        RTI
;
;===========================================================================
;
;  Common continue point for all monitor entrances
;  SP = user stack
ENTER_MON
        TFR     S,D             		; USER STACK POINTER
        STA     REG_SP+1        		; SAVE USER'S STACK POINTER (MSB)
        STB     REG_SP          		; LSB
;
;  Change to our own stack
        LDS     #MONSTACK       		; AND USE OURS INSTEAD
;
;  Operating system variables
;*      LDA     MAPIMG          		; GET CURRENT USER MAP
        LDA     #0              		; ... OR ZERO IF UNMAPPED TARGET
        STA     REG_PAGE        		; SAVE USER'S PAGE
;
;  Return registers to master
        JMP     RETURN_REGS

;===========================================================================
;
;  Set target byte(s):  FN, len { (page, alow, ahigh, data), (...)... }
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
;  Return has FN, len, (data from memory locations)
;
;  If error in insert (memory not writable), abort to return short data
;
;  This function is used primarily to set and clear breakpoints
;
;  Uses 1 byte of stack
;
SET_BYTES
        LDU     #COMBUF+1               ; POINTER TO RETURN BUFFER
        LDA     #0 
        STA     ,U+                     ; SET RETURN COUNT AS ZERO
        LSRB       
        LSRB                            ; LEN/4 = NUMBER OF BYTES TO SET
        BEQ     SB99                    ; JIF NO BYTES (COMBUF+1 = 0)
;                          
;  Loop on inserting bytes 
SB10    PSHS    B                       ; SAVE LOOP COUNTER
;
;  Set map
;;;;    LDA     0,X
;;;;    STA     MAPIMG
;;;;    STA     MAPREG
;
;  Get address
        LDA     2,X                     ; MSB OF ADDRESS IN A
        LDB     1,X                     ; LSB OF ADDRESS IN B
        TFR     D,Y                     ; MEMORY ADDRESS IN Y
;
;  Read current data at byte location
        LDA     0,Y
;
;  Insert new data at byte location
        LDB     3,X                     ; GET BYTE TO STORE
        STB     0,Y                     ; WRITE TARGET MEMORY
;
;  Verify write
        CMPB    0,Y                     ; READ TARGET MEMORY
        PULS    B                       ; RESTORE LOOP COUNT, CC'S INTACT
        BNE     SB90                    ; BR IF INSERT FAILED: ABORT
;
;  Save target byte in return buffer
        STA     ,U+
        INC     COMBUF+1                ; COUNT ONE RETURN BYTE
;
;  Loop for next byte
        LEAX    4,X                     ; STEP TO NEXT BYTE SPECIFIER
        CMPB    COMBUF+1
        BNE     SB10                    ; *LOOP FOR ALL BYTES
;
;  Return buffer with data from byte locations
SB90
;
;  Compute checksum on buffer, and send to master, then return
SB99    JMP     SEND

;===========================================================================
;
;  Input from port:  FN, len, PortAddressLo, PAhi (=0)
;
;  While the 6809 has no input or output instructions, we retain these
;  to allow write-without-verify
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
IN_PORT
;
;  Get port address
        LDA     1,X                     ; MSB OF ADDRESS IN A
        LDB     0,X                     ; LSB OF ADDRESS IN B
        TFR     D,Y                     ; MEMORY ADDRESS IN Y
;
;  Read the requested byte from local memory
        LDA     0,Y
;
;  Return byte read as "status"
        JMP     SEND_STATUS

;===========================================================================
;
;  Output to port  FN, len, PortAddressLo, PAhi (=0), data
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
OUT_PORT
;
;  Get port address
        LDA     1,X                     ; MSB OF ADDRESS IN A
        LDB     0,X                     ; LSB OF ADDRESS IN B
        TFR     D,Y                     ; MEMORY ADDRESS IN Y
;
;  Get data
        LDA     2,X
;
;  Write value to port
        STA     0,Y
;
;  Do not read port to verify (some I/O devices don't like it)
;
;  Return status of OK
        CLRA
        JMP     SEND_STATUS

;===========================================================================
;  Build status return with value from "A"
;
SEND_STATUS
        STA     COMBUF+2                ; SET STATUS
        LDA     #1
        STA     COMBUF+1                ; SET LENGTH
        BRA     SEND

;===========================================================================
;  Append checksum to COMBUF and send to master
;
SEND    JSR     CHECKSUM                ; GET A=CHECKSUM, X->checksum location
        NEGA
        STA     0,X                     ; STORE NEGATIVE OF CHECKSUM
;
;  Send buffer to master
        LDX     #COMBUF                 ; POINTER TO DATA
        LDB     1,X                     ; LENGTH OF DATA
        ADDB    #3                      ; PLUS FUNCTION, LENGTH, CHECKSUM
SND10   LDA     ,X+
        JSR     PUTCHAR                 ; SEND A BYTE
        DECB
        BNE     SND10
        JMP     MAIN                    ; BACK TO MAIN LOOP

;===========================================================================
;  Compute checksum on COMBUF.  COMBUF+1 has length of data,
;  Also include function byte and length byte
;
;  Returns:
;       A = checksum
;       X = pointer to next byte in buffer (checksum location)
;       B is scratched
;
CHECKSUM
        LDX     #COMBUF                 ; pointer to buffer
        LDB     1,X                     ; length of message
        ADDB    #2                      ; plus function, length
        LDA     #0                      ; init checksum to 0
CHK10   ADDA    ,X+
        DECB
        BNE     CHK10                   ; loop for all
        RTS                             ; return with checksum in A

;**********************************************************************
;
;  Interrupt handlers to catch unused interrupts and traps
;  Registers are stacked.  Jump through RAM vector using X, type in A
;
;  This will affect only interrupt routines looking for register values!
;
;  Our default handler uses the code in "A" as the processor state to be
;  passed back to the host.
;

;  This is "reserved" on 6809
;  Used for Divide-by-zero and Illegal-instruction on 6309
RES_ENT     LDA     #7
            LDX     RAMVEC+0
            JMP     0,X
;
SWI3_ENT    LDA     #6
            LDX     RAMVEC+2
            JMP     0,X
;
SWI2_ENT    LDA     #5
            LDX     RAMVEC+4
            JMP     0,X
;
;  Will have only PC and CC's pushed unless we were waiting for an interrupt
;  or MD.1 is true.  Use CC's E bit to distinguish.
;  Push all registers here for common entry (else we can't use our RAM vector)
FIRQ_ENT    STA     REG_A       		; SAVE A REG
            PULS    A           		; GET CC'S FROM STACK
            BITA    #E
            BNE     FIRQ9       		; BR IF ALL REGISTERS PUSHED ALREADY

; CC.E was not set which means that regMD bit2 was not set and that bit in
; the image should be cleared. If CC.E is set, we can't tell what set it, a
; direct command, CWAI, or bit 1 of regMD.
;
; Push registers as if CC.E had been set
;  If 6809 mode, stack needs CC A B DP XH XL YH YL UH UL PCH PCL
;  If 6309 mode, stack needs CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
;
            CLR     E_FLAG
            LDA     REG_MD
            ANDA    #$FD        		; BIT1 must be clear, else all regs would have been pushed
            STA     REG_MD
            PSHS    U,Y,X,DP    		; push regs next below PC

            STW     REG_F       		; MD_TEST will not preserve regW
            JSR     MD_TEST
            PSHS    CC          		; Save result
            LDW     REG_F       		; Recover regW
            PULS    CC          		; Recover result of test
            BNE     FE1
            PSHSW
FE1         PSHS    B
            LDB     REG_A
            PSHS    B
            ORA     #E          		; SET AS "ALL REGS PUSHED"

FIRQ9       TST     E_FLAG
            BNE     FIRQ9B
            LDB     REG_MD      		; We got here with E_FLAG clear and CC.E set which
            ORB     #2          		; means regMD bit2 must be set.
            STB     REG_MD
FIRQ9B      PSHS    A           		; REPLACE CC'S
            LDA     #4
            LDX     RAMVEC+6
            JMP     0,X
;
IRQ_ENT     LDA     #3
            LDX     RAMVEC+8
            JMP     0,X
;
NMI_ENT     LDA     #2
            LDX     RAMVEC+12
            JMP     0,X
;
SWI_ENT     LDA     #1
            JMP     INT_ENTRY
;
;============================================================================
; TEST FOR BIT0 OF regMD:
; Exit emulation mode: regW=$1234
;      native    mode: regW=$0000
;
; Preserves W and V.  Other registers destroyed.
;
MD_TEST     
        PSHSW
;
; If 6809 mode, RTI will pop 12 bytes: CC A B DP XH XL YH YL UH UL PCH PCL
; If 6309 mode, RTI will pop 14 bytes: CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
;
; Initialize TEST_STACK used for fake RTI. The return address will be MD_RETURN
; in both emulation and native modes. If native mode, regW will be cleared.
;
        LDX     #TEST_STACK

        LDA     #$80
        STA     ,X+             		; CC with E set

        LDB     #9
RES11   CLR     ,X+             		; zeros for other registers, including W
        DECB
        BNE     RES11

        LDD     #MD_RETURN
        STD     ,X++            		; 6809 return address, or 6309 U
        STD     ,X++            		; 6309 return address, or past 6809 stack

        STS     S_IMAGE
        LDS     #TEST_STACK
        LDW     #$1234
        RTI								; if 6309 mode, W gets 0; else unchanged

MD_RETURN   
        LDS     S_IMAGE
        TSTW                            ; adjust CC.Z: set if 6309 mode
        PULSW
        RTS
;;======================================================================
;; END OF NOICE DEBUG MONITOR
;;======================================================================

;;======================================================================
;; BEGINNING OF WOZMON RESIDENT MONITOR
;;======================================================================
; This is adapted from Jeff Tranter's port of Woz Mon to my HD6309 SBC
; Jeff's work can be found here:
; https://github.com/jefftranter/6809/blob/master/sbc/wozmon/wozmon.asm
;
; It now fits easily < 256 bytes, thanks to the SCC UART functions that
; are already present elsewhere in this ROM. I've tweaked it a bit in
; terms of adding the "G" synonym for "R", and an "S" command to invoke
; a nice S-Record/Intel Hex loader (stolen from Dave Dunfield's 6809
; monitor). 
;
; Following are notes from Jeff Tranter on this:
;
; This is a port of the 6800 version of Woz Mon to my 6809-based Single
; Board Computer. It was converted to 6809 instructions as well as
; ported to use the 6850 ACIA for input/output.
;
; The original 6800 port came from here: https://pastebin.com/TSM2DdRL
;
; Note: The code internally converts all characters to high ASCII (bit
; 7 = 1) because the Apple 1 used this format and the program logic is
; dependent on it in several places.
;
; The code is not quite small enough to fit in 256 bytes as the
; original 6502 and 6800 versions did.
;
;***********************************************************************

; This is a rewrite of the Apple 1 monitor to run on an MC6800
; microprocessor, rather than the MCS6502 microprocessor that
; was standard.  This source code will assemble with the
; AS Macro Assembler; with minor changes it should assemble
; with any MC6800 assembler.

; Copyright 2011 Eric Smith <eric@brouhaha.com>
;
; This program is free software; you can redistribute and/or modify it
; under the terms of the GNU General Public License version 3 as
; published by the Free Software Foundation.
;
; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.
;
; The text of the license may be found online at:
;     http://www.brouhaha.com/~eric/software/GPLv3
; or:
;     http://www.gnu.org/licenses/gpl-3.0.txt

CR      EQU  	$8D     ; Carriage return
LF      EQU  	$8A     ; Line feed
ESC     EQU  	$9B		; Escape

INBUF	EQU		WOZ_RAM		  		; input buffer (128 chars long)
XAM		EQU  	WOZ_RAM+128			; two bytes
ST		EQU  	WOZ_RAM+128+2		; two bytes
H		EQU		WOZ_RAM+128+4		; word access with just "H"
L		EQU		WOZ_RAM+128+5
MODE	EQU		WOZ_RAM+128+6
;YSAV	EQU 	RAM_WOZMON+128+7	; use Yreg instead
;INPTR	EQU		RAM_WOZMON+128+9    ; INPTR+1 is LSB - use Wreg instead (E is MSB, F is LSB)

WOZMON: 
 		LDS	 	#INITSTACK			; use "user stack" already reserved by noICE
		OIM		#(IO.SDCS|IO.SDCLK),IOPORT      ; un-select SDcard, slow SPI clock freq,
		OIM		#(SYS.ROMSEH),SYSCFG			; make sure upper ROM is enabled
		JSR		SCC_INITA				; init SCC channel A for 115.2kbps 
        BRA  	ESCAPE  

; Get a line of input from the keyboard, echoing to display.
; Normally enter at escape or getline.

NOTCR:
		CMPA 	#$88       			; ^H?  ["backspace"]
		BEQ  	BACKSPACE  			; Yes.
		CMPA 	#ESC       			; ESC?
		BEQ  	ESCAPE     			; Yes.
		LEAX 	1,X        			; Advance text index.
		INCB 	                	    	
		BPL  	NEXTCHAR   			; Auto ESC if > 127.
		                	
ESCAPE:
		LDA  	#'\'       			; "\".
		JSR  	ECHO       			; Output it.
                          
GETLINE:
		JSR  	PUTCR
        LDX  	#INBUF+1      		; Initialize text index.
        LDB  	#1       
BACKSPACE:  
		LEAX 	-1,X       			; Back up text index.
        DECB 	           			
        BMI  	GETLINE    			; Beyond start of line, reinitialize.
                            	
NEXTCHAR:   
		JSR  	GETA				; get a character from UART Ch A
		ORA  	#$80       			; Convert to high ASCII.
		STA  	,X         			; Add to text buffer.
		BSR  	ECHO       			; Display character.
		CMPA 	#CR        			; CR?
		BNE  	NOTCR      			; No.
                          
; Process an input line.

RETURN:        
;		LDX  	#INBUF+256-1  		; Reset text index to in-1, +256 so that
                            		;  'inc inptr+1' will result in $0200.
;		STX  	INPTR                  	
		LDW	 	#INBUF+256-1		; reset text index to in-1+256 so that
                            		;  'inc inptr+1' will result in $0200.			
		CLRA            			; For XAM mode. 0->B.
SETBLOK:    
		ASLA            			; Leaves $56 if setting BLOCK XAM mode.
SETMODE:                    		
		STA  	MODE       			; $00 = XAM, $BA = STOR, $56 = BLOK XAM.
BLSKIP:                     			
;		INC  	INPTR+1    			; Advance text index.
		INCF						; advance text index (LSB only, so modulo 256)
NEXTITEM:                   	
;		LDX  	INPTR              	
		TFR  	W,X					; copy text index to X
		LDA  	,X         			; Get character.
		CMPA 	#CR        			; CR?
		BEQ  	GETLINE    			; Yes, done this line.
		CMPA 	#$AE       			; "."?
		BEQ  	SETBLOK    			; Set BLOCK XAM mode.
		BLS  	BLSKIP     			; Skip delimiter.
		CMPA 	#$BA       			; ":"?
		BEQ  	SETMODE    			; Yes, set STOR mode.
		CMPA 	#$D2       			; "R"?  ("Run" - original WOZMON)
		BEQ  	RUN        			; Yes, run user program.
		CMPA 	#$C7       			; "G"?  ("Go" - applesoft ROM)
		BEQ  	RUN        			; Yes, run user program.
		CMPA 	#$D3				; "S"?  ("S-Record" - download)
		BNE  	N?EXT1				; no, so attempt to process numeric value
		JSR  	DLOAD				; yes, try to download from host
		BRA  	GETLINE				; get next 
N?EXT1:
		CLR  	L          			; $00->L.
		CLR  	H          			;  and H.
;		STX  	YSAV      	 		; Save Y for comparison.
		TFR  	X,Y					; copy text index (X) to Y (Y is used for 'YSAV' instead of RAM)
NEXTHEX:                    	
;		LDX  	INPTR       		       	
 		TFR  	W,X					; copy text index to X
 		LDA  	,X         			; Get character for hex test.
 		EORA 	#$B0       			; Map digits to $0-9.
 		CMPA 	#$09       			; Digit?
 		BLS  	DIG        			; Yes.
 		ADDA 	#$89       			; Map letter "A"-"F" to $FA-FF.
 		CMPA 	#$F9       			; Hex letter?
 		BLS  	NOTHEX     			; No, character not hex.
DIG:
		ASLA            			; Hex digit to MSD of A.
		ASLA            	
		ASLA            	
		ASLA            	
        LDB  	#$04       			; Shift count.
HEXSHIFT:   
		ASLA            			; Hex digit left, MSB to carry.
		ROL  	L          			; Rotate into LSD.
		ROL  	H          			; Rotate into MSD's.
		DECB 	           			; Done 4 shifts?
		BNE  	HEXSHIFT   			; No, loop.
                            	
;		INC 	INPTR+1   			; Advance text index.
 		INCF	   					; advance text index (LSB only, so modulo 256)
 		BRA 	NEXTHEX    			; Always taken. Check next character for hex.
                            	
NOTHEX:                     	
;		CMPX 	YSAV       			; Check if L, H empty (no hex digits).    CMPX ( X - YSAV )    
 		CMPR 	Y,X					; check if L, H empty (no hex digits)     CMPR ( X - Y)
 		BEQ  	ESCAPE     			; Yes, generate ESC sequence.
 		TST  	MODE       			; Test MODE byte.
 		BPL  	NOTSTOR    			; B7=0 for STOR, 1 for XAM and BLOCK XAM
                            	
; STOR mode                 	
		LDX  	ST         			
		LDA  	L          			; LSD's of hex data.
		STA  	,X         			; Store at current 'store index'.
		LEAX 	1,X        			
		STX  	ST         			
TONEXTITEM: 
		BRA  	NEXTITEM   			; Get next command item.
ECHO:
		ANDA 	#$7F       			; Convert to low ASCII.
		JSR	 	PUTA        		        	
		ORA  	#$80       			; Convert back to high ASCII.
		RTS             			; Return.
RUN:        
		JMP  	[XAM]      			; Run at current XAM index.  
NOTSTOR:
		BNE  	XAMNEXT    			; mode = $00 for XAM, $56 for BLOCK XAM.
		     	            		           	
		LDX  	H          			; Copy hex data to
		STX  	ST         			;  'store index'.
		STX  	XAM        			; And to 'XAM index'.
		CLRA 	           			; set Z flag to force following branch.
NXTPRNT:    
		BNE  	PRDATA     			; NE means no address to print.
		JSR  	PUTCR       		        	
		LDA  	XAM        			; 'Examine index' high-order byte.
		JSR  	PUTBYTE     		        	
		LDA  	XAM+1      			; Low-order 'Examine index' byte.
		JSR  	PUTBYTE						
		LDA  	#$BA       			; ":".
		BSR  	ECHO       			; Output it.
PRDATA:     
		LDA  	#$A0       			; Blank.
		BSR  	ECHO       			; Output it.
		     	           			
		LDX  	XAM        			
		LDA  	,X         			; Get data byte at 'examine index'.
		JSR	 	PUTBYTE     		        	
XAMNEXT:    
		CLR  	MODE       			; 0->MODE (XAM mode).
		LDX  	XAM        			; Compare 'examine index' to hex data.
		CMPX 	H         			 
		BEQ  	TONEXTITEM 			; Not less, so more data to output.
		LEAX 	1,X        			
		STX  	XAM        			
		LDA  	XAM+1      			; Check low-order 'examine index' byte
		ANDA 	#$07       			; For MOD 8 = 0
		BRA  	NXTPRNT    			; always taken

;;======================================================================
;; END OF ORIGINAL WOZMON MONITOR CODE
;;======================================================================
;; S-RECORD AND INTEL HEX DOWNLOAD FUNCTION
;;======================================================================
;;
DLOAD	JSR		PUTCR			; NEW LINE
DLO1?	BSR		DLREC			; DOWNLOAD RECORD
		BCC		DLO2?			; END
		LDA		#'.' 			; OUTPUT ONE DOT PER RECORD
		JSR		PUTA			; OUTPUT
		BRA		DLO1?			; CONTINUE
DLO2?	BEQ		DLO3?			; if Z is clear, all went ok
		JMP		PUTMSG			; error occurred
		FCB		$0D,$0A
		FCC		"ERR"
		FCB		$FF		
DLO3?   JMP		PUTMSG			; load successful
		FCB		$0D,$0A
		FCC		"OK"
		FCB		$FF		

; Download a record in either MOTOROLA or INTEL hex format
DLREC	JSR		GETA			; Get a character
		CMPA	#$03			; Check for ^C (Break)
		BEQ		LODERR			; yes, abort with error
		CMPA	#':' 			; Start of INTEL record?
		LBEQ	DLINT			; Yes, download INTEL
		CMPA	#'S' 			; Start of MOTOROLA record?
		BNE		DLREC			; No, keep looking
		
; Download a record in MOTOROLA hex format
DLMOT	JSR		GETA			; get next char  
		CMPA	#'0' 			; header record? 
		BEQ		DLOAD			;    skip it        
		CMPA	#'5' 			; count record?  
		BEQ		DLOAD			;    skip it        
		CMPA	#'9' 			; end of file?   
		BEQ		DLMOT9			;    end of file    
		CMPA	#'1' 			; should be a data record (S1) then!
		BNE		LODERR			; 	none of these = load error     
		JSR		GETBYTE			; get length     
		BCC		LODERR			; report error   
		STA		GLOBAL_TEMP			; start checksum 
		SUBA	#3				; adjust length (omit address and checksum)
		STA		GLOBAL_TEMP+1			; set length     
		JSR		GETBYTE			; get first byte of address
		BCC		LODERR			; report error   
		TFR		A,B				; save for later 
		ADDA	GLOBAL_TEMP			; include in checksum
		STA		GLOBAL_TEMP			; resave         
		JSR		GETBYTE			; get next byte of address
		BCC		LODERR			; report error   
		EXG		A,B				; swap address halves (endian stuff)
		TFR		D,X				; set pointer    
		ADDB	GLOBAL_TEMP			; include in checksum
		STB		GLOBAL_TEMP			; resave checksum
DLMOT1	JSR		GETBYTE			; get a data byte
		BCC		LODERR			; report error   
		STA		,X+				; Save in RAM
		ADDA	GLOBAL_TEMP			; Include checksum
		STA		GLOBAL_TEMP			; Resave
		DEC  	GLOBAL_TEMP+1         	; Reduce length                          
		BNE  	DLMOT1         	; do them all                            
		JSR		GETBYTE			; get checksum byte
		BCC		LODERR			; report error   
		ADDA	GLOBAL_TEMP			; add computed checksum                  
		INCA					; test for success                       
		BEQ		DLRTS			; download ok                            
		
; Error occured on loading                                             
LODERR	ORCC	#Z				; set the Z flag to indicate an error occurred
		ANDCC 	#~C				; clear the 'c' flag to indicate end of file
		RTS
		
; properly handle S9 end record	(just eat it)	
DLMOT9	JSR		GETBYTE			; get length byte
		BCC		LODERR			; report error   
		STA  	GLOBAL_TEMP+1			; save length
DLM91?	JSR		GETBYTE			; get next byte
		DEC  	GLOBAL_TEMP+1			; Reduce length                          		
		BNE  	DLM91?			; get all the bytes
								; fall into DLEOF

; set C flag to signal another record needed / clear if end of file
DLEOF 	ANDCC	#~Z				; clear the 'z' flag to indicate no errors occurred
		ANDCC 	#~C				; clear the 'c' flag to indicate end of file
		RTS
DLRTS 	ANDCC   #~Z             ; clear the 'z' flag to indicate no errors occurred
		ORCC 	#C           	; set 'c' flag to indicate another record        		
		RTS

; Download record in INTEL format                                          		
DLINT 	JSR     GETBYTE         ; get count
		BCC     LODERR          ; report error   
		STA  	GLOBAL_TEMP      		; Start checksum                                             		
		STA  	GLOBAL_TEMP+1         	; Record length                                         		
		CMPA 	#0 		       	; Test & clear C                                             		
		BEQ		DLEOF			; End of file
; Get address
		JSR     GETBYTE         ; get first byte of address
		BCC     LODERR          ; report error   
		TFR		A,B				; Save for later
		ADDA	GLOBAL_TEMP			; Include in checksum
		STA		GLOBAL_TEMP			; Resave
		JSR     GETBYTE         ; get next byte of address
		BCC     LODERR          ; report error   
		EXG		A,B				; Swap
		TFR		D,X				; Set pointer
		ADDB	GLOBAL_TEMP			; Include in checksum
		STB		GLOBAL_TEMP			; Resave checksum
; Get record type
		JSR     GETBYTE         ; get type value
		BCC     LODERR          ; report error   
		ADDA	GLOBAL_TEMP			; Include checksum
		STA		GLOBAL_TEMP			; Resave checksum
; Get data bytes
DLINT1	JSR     GETBYTE         ; get data byte
		BCC     LODERR          ; report error   
		STA		,X+				; Write to memory
		ADDA	GLOBAL_TEMP			; Include checksum
		STA		GLOBAL_TEMP			; Resave checksum
		DEC		GLOBAL_TEMP+1			; Reduce length
		BNE		DLINT1			; Do them all
; Get checksum
		JSR		GETBYTE			; Read checksum byte
		BCC		LODERR			; Report error
		ADDA	GLOBAL_TEMP			; add into checksum
		BEQ		DLRTS			; Report success
		JMP		LODERR			; Report failure                 
		
;;======================================================================
;; END OF S-RECORD AND INTEL HEX DOWNLOAD FUNCTION
;;======================================================================
;; BEGINNING OF PLATFORM DEPENDENT CIO UTILITY FUNCTIONS
;;======================================================================
;;
;; CIO_INIT - put the Z8536 CIO into a known state. Call this before trying to use
;;			  the CIO_READ and CIO_WRITE functions! 
;; inputs: none
;; return: A is destroyed
;;
CIO_INIT
		LDA  	CIOCTL			; read CIO control register to get to state 0
		BSR		ZI?				; a read will force the z8536 into state 0 if in state 1, otherwise it will     
								; not cause any changes                                                                                                                                    
        CLRA					; if the z8536 was reset, writing a 0 will force it into state 0. if in         
		STA		CIOCTL			; state 0, this will set the pointer to register 0 and go to state 1.           
		BSR		ZI?                  	
		LDA		CIOCTL			; another read operation will force the 8536 into state 0, from where further   
		BSR		ZI?				; instructions can be done                                                      
        CLRA	            	; set address pointer to master interrupt control register (addr 0)             
		STA		CIOCTL	                                                                                        
		BSR		ZI?
		LDA		#1				; reset the z8536 by enabling the reset bit (b0)                                
		STA		CIOCTL			                                                                                    
		BSR		ZI?				; next, by writing a 0 to register 0 during reset, the reset will be cleared.   
		CLRA					; successive writes can only be done during reset (during normal operation,     	
		STA		CIOCTL	    	; successive writes will change the address pointer to that output value).                                                                                      
ZI?	  	NOP
		NOP
		NOP
		RTS		
;;
;; CIO_READ - Z8536 CIOCTL Register READ Function
;; inputs: A = register number to read (0...3F)
;; return: B = value from register			
;;
CIO_READ
		LDB  	CIOCTL			; read CIO control register to get to state 0
		ANDA	#$3F			; make sure register value is in range                                           
		STA		CIOCTL			; set the address pointer to the desired register                   
		LDB		CIOCTL			; read the contents of the register                                 
		RTS
;;
;; CIO_WRITE - Z8536 CIOCTL register WRITE Function
;; inputs: A = register number to read (0...3F)
;;		   B = value to write to register
;; return: none
;;
CIO_WRITE
		TST  	CIOCTL			; read CIO control register to get to state 0
        ANDA 	#$3F        	; make sure it's in range                                           
        STA  	CIOCTL      	; set the address pointer to the desired register                   
		STB		CIOCTL
		RTS

;;======================================================================
;; END OF PLATFORM DEPENDENT CIO UTILITY FUNCTIONS
;;======================================================================
;; BEGINNING OF PLATFORM DEPENDENT SCC UTILITY FUNCTIONS
;;======================================================================
;;
;; These are hardcoded to SCC channel A, intended for console use!
;;

;;
;; GETBYTE - acquire an ASCII HEX byte from UART A and return in A
;; inputs: none
;; return: C=1 means input was valid, byte value in A
;;         C=0 means input was non-ASII HEX, A is destroyed
;;
GETBYTE	
		BSR		GETNIB			; Get FIRST nibble
		BCC		GETB1?			; Invalid, abort (CY=0)
		LSLA					; Rotate
		LSLA					; into
		LSLA					; high
		LSLA					; nibble
		PSHS	A				; Save for later
		BSR		GETNIB			; Get SECOND nibble
		BCC		GETB2?			; Report error (CY=0)
		ORA		,S				; Include high
		ORCC	#C				; Indicate success (CY=1)
GETB2?	LEAS	1,S				; Skip saved value
GETB1?	RTS
		
;;
;; GETBIN - acquire an ASCII HEX nibble from UART A and return in A
;; inputs: none
;; return: C=1 means input was valid, nibble value in A
;;         C=0 means input was non-ASII HEX, A is restored
;;
GETNIB	
		JSR		GETA			; get a character
		SUBA	#'0'	 		; Convert numbers
		CMPA	#9				; Numeric?
		BLS		GETN1?			; Yes, OK
		SUBA	#7				; Convert alphas
		CMPA	#10				; Under?
		BLO		GETN2?			; Yes, error
		CMPA	#15				; Over?
		BHI		GETN2?			; Yes, error (C and Z both clear)
GETN1?	ORCC	#C				; SET 'C' FLAG, INDICATE OK
		RTS
GETN2?	ADDA	#$37			; Normalize character 
		ANDCC	#~C				; clear C to indicate non-hex input
		RTS

;;
;; PUTSPACE - output a SPACE to UART A
;; inputs: none
;; return: none
;;
PUTSPACE
		PSHS	A
		LDA		#$20			; Output a space to console
		JSR		PUTA
		PULS	A,PC			; restore A value prior to return	
		
;;
;; PUTWORD - output ASCII HEX WORD to UART A
;; inputs: D = value to output
;; return: A is destroyed
;;
PUTWORD	
		BSR		PUTBYTE			; Output first byte
		TFR		B,A				; Get second byte
					            ; fall into PUTBYTE
		
;;
;; PUTBYTE - output ASCII HEX BYTE to UART A
;; inputs: A = value to output
;; return: A is destroyed
;;
PUTBYTE	
		PSHS	A				; Save low nibble
		LSRA					; Rotate
		LSRA					; upper nibble
		LSRA					; into
		LSRA					; lower nibble
		BSR		PUTHEX			; Output high nibble
		PULS	A				; Rertore low nibble
								; fall into PUTHEX
		
;;
;; PUTHEX - output ASCII HEX NIBBLE to UART A
;; inputs: A = value to output
;; return: A is destroyed
;;
PUTHEX	
		ANDA	#$0F			; Remove upper half
		ADDA	#'0' 			; Convert to printable
		CMPA	#'9' 			; In range?
		BLS		PH1				; Yes, display
		ADDA	#7				; Convert to alpha
PH1		JMP		PUTA			; exit via PUTA
		
;;
;; PUTCR - output CRLF to UART A
;; inputs: none
;; return: A is destroyed
;;
PUTCR	
		LDA		#$0D			; output a carriage return
		JSR		PUTA            ; 
		LDA		#$0A			; output a line feed
		BRA		PH1				; exit via PUTA
		
;;
;; PUTMSG - output NULL/FF terminated string at PC to UART A
;; terminate with either 0, or $FF (CRLF before terminates) 
;; inputs: PC = address of string to output
;; return: none
;;
PUTMSG	
		PSHS	X				; preserve X                                    
		LDX		2,S				; get old pc                                 
		BSR		PUTSTR			; output string
		STX		2,S				; update old pc                              
		PULS	X,PC			; restore X, return                          
		
;;
;; PUTSTR - output NULL/FF terminated string at X to UART A
;; terminate with either 0, or $FF (CRLF before terminates)                                                       
;; inputs: X = address of string to output
;; return: X = terminator byte of string
;;
PUTSTR	
		PSHS	A				; preserve A
		LDA		,X+				; get char from message                      
		BEQ		PSTRX?			; 	0 = end
		CMPA	#$FF			; FF = newline end?
		BEQ		PUTCR			; 	yes, new line, exit via PUTCR
		JSR		PUTA			; output character to term                             
		BRA		PUTSTR			; keep going                                 
PSTRX?	PULS	A,PC			; restore A and return                                                              

;;======================================================================
;; END OF PLATFORM DEPENDENT CIO AND USART UTILITY FUNCTIONS
;;======================================================================
;; BEGINNING OF PLATFORM DEPENDENT SOFT I2C FUNCTIONS
;;======================================================================

;; I2C status flags
I2C_Success			EQU	0
I2C_NoSlaveAck 		EQU 1
I2C_BusError		EQU	2

;; I2C Acknowledge Constants
I2C_ACKNOWLEDGE 	EQU	1
I2C_NOTACKNOWLEDGE 	EQU	0

RTC_I2C_ADDR		EQU	$D0

;; I2C interface primitives - hardware dependent
SDAStatus 	MACRO 
		TIM   #I2C.MSDA,I2CPORT		;I2C.SDAStatus (Z = 1 if SDA is low)
			ENDM

SetSDALow 	MACRO 
		AIM   #~I2C.DSDA,I2CPORT	;I2C.SetSDALow
			ENDM

SetSDAHigh 	MACRO 
		OIM	  #I2C.DSDA,I2CPORT		;I2C.SetSDAHigh
			ENDM
	
SCLStatus 	MACRO 
		TIM   #I2C.MSCL,I2CPORT		;I2C.SCKStatus (Z = 1 if SCK is low)
			ENDM

SetSCLLow 	MACRO 
		AIM   #~I2C.DSCL,I2CPORT	;I2C.SetSCLLow
			ENDM

SetSCLHigh 	MACRO 
		OIM	  #I2C.DSCL,I2CPORT		;I2C.SetSCLHigh
			ENDM

SetBothHigh MACRO
		OIM	  #(I2C.DSCL+I2C.DSDA),I2CPORT		;set both SDA and SCL high
			ENDM

StretchSCLHigh 	MACRO 
I?SSH 	NOP
		SetSCLHigh      		; try to release SCL
		NOP                       	
		SCLStatus 				; check is SCL is really high yet
		BEQ	  I?SSH				; if Z set, SCL is still low -> try again
				ENDM

;;
;; I2C_Initialize - cycle SCK until SDA goes high, up to 255 times 
;; This is per the DS3232M datasheet to re-sync communication.
;; inputs: none
;; return: A = number of SCL cycles required (255 = fault)
;;
I2C_Initialize
		CLRA						; clear cycle counter
IN0?	JSR		I2C_SendNAK			; do a NAK cycle (toggles SCL with SDA high), SDA status in Z
		BNE		I2C_SendStop		; SDA is high, so all is well, return via SendStop
		INCA						; increment cycle counter
		BNE		IN0?				; not wrapped to '0' yet, keep trying
		SetBothHigh 				; failed: release both SCL and SDA		
		DECA						; decrement counter back to 255
		RTS

;; I2C_SendStop - send a STOP condition
;; inputs: none
;; return: none
;;
I2C_SendStop
    	SetSDALow					; SCL high followed by SDA high is STOP condition
		StretchSCLHigh
		BSR		I2C_BitDelay
		SetSDAHigh		
		; fall into BitDelay...		

;; I2C_BitDelay - ensures minimum high and low clock times on I2C bus. 
;; inputs: none
;; return: none
;;
I2C_BitDelay
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
        RTS                                                               

;; I2C_SendByte - sends one byte of data to an I2C slave device and check for Slave ACK
;; inputs: A = byte to send to slave
;; return: A = byte sent to slave, Z = 1 if slave ACK
;;
I2C_SendByte
		PSHS	A,B					; preserve ACC A and B
		LDB		#8					; init B as loop counter
SB0?	SetSDAHigh					; assume data bit is '1'
		TSTA						; examine ACC A bits
		BMI		SB1?				; if MSB is clear (positive value)...
		SetSDALow					; clear data bit to '0'
SB1?	StretchSCLHigh				; release SCL, wait for stretch
		BSR		I2C_BitDelay		; half-bit delay
		SetSCLLow					; drive SCL low
		BSR		I2C_BitDelay		; half-bit delay
		LSLA						; shift ACC A to expose next bit to send
		DECB						; decrement loop counter
		BNE		SB0?				; loop back until all bits are sent
		PULS	A,B             	; restore ACC A and B
		SDAStatus					; get ACK/NAK status into Z
		RTS

;; sI2C_RcvByte - receives one byte of data from an I2C slave device, with
;;                the ability to control NAK or ACK of the received data
;; inputs: A = 0 --> NAK, otherwise ACK
;; return: A = byte received from slave
;;
I2C_RcvByte
		PSHS	B,Y					; preserve B and Y
		TFR		A,B					; copy ACC A to B (to save ACK/NAK status)
		LDY		#8					; init E as loop counter
		CLRA						; clear A before shifting in bits		
RB0?	StretchSCLHigh				; release SCL, wait for stretch
		BSR		I2C_BitDelay		; half-bit delay
		SDAStatus					; check SDA pin (Z = 1 if low)
		BEQ		RB1?				; if SDA is low, leave ACC A alone
		ORA		#$80				; otherwise, set MSB
RB1?	SetSCLLow					; clear SCL to end bit		
		BSR		I2C_BitDelay		; half-bit delay
		LEAY	-1,Y				; decrement loop counter
		BNE		RB0?				; loop back until all bits are received
		TSTB						; examine B (to determine ACK/NAK status)
		PULS	B,Y					; restore B and E (no flags affected)
		BEQ		I2C_SendNAK			; if input parameter was zero, send a NAK
		; fall into I2C_SendACK

;; I2C_SendNAK & SendACK - send a NAK or ACK to I2C slave device
;; inputs: none
;; return: ACK/NAK status in Z (Z = 1 if either slave or master ACK)
;;
I2C_SendACK
		SetSDALow					; assert SDA for MASTER ACK
		BRA		I2C_SN1				; otherwise same as sending NAK
I2C_SendNAK                     	
		SetSDAHigh					; release SDA line for MASTER NAK / or query slave ACK
I2C_SN1	StretchSCLHigh				; send clock for NAK
		BSR		I2C_BitDelay		; half-bit delay
		SDAStatus					; reflect SDA status in Z
		SetSCLLow					; finish the NAK bit
		JMP		I2C_BitDelay		; return through half-bit delay

;; I2C_GoMaster - sends an I2C start and slave address and check for acknowledge
;; inputs: A = slave address A[7:1] + R/W A[0]
;; return: A = I2C.Success or I2C_NoSlaveAck or I2C.BusError (if SDA stuck low)
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;
I2C_GoMaster
		SetBothHigh					; release SDA and SCL
		JSR		I2C_BitDelay		; allow SDA to float high
		SDAStatus					; check SDA state
		BNE		GMBERR?				; if SDA is still low, return with fBusError
		SetSDALow					; begin I2C START by bringing SDA low first
		JSR		I2C_BitDelay		; half-bit delay		
		SetSCLLow					; complete I2C START by bringing SCL low
		JSR		I2C_BitDelay		; half-bit delay
		JSR		I2C_SendByte		; now send the byte in A, Z = 1 means sent OK
		BNE		GMSNAK?				; if no slave ACK, then return with fNoSlaveAck
		LDA		#I2C_Success		; send a fSuccess code (0) and set Z = 1
		RTS                           	
GMSNAK? LDA		#I2C_NoSlaveAck		; send a fNoSlaveAck code (1) and set Z = 0
		RTS                           	
GMBERR?	LDA		#I2C_BusError		; return a fBusError code (2) and set Z = 0
		RTS

;; RTC_WriteRegs - write registers 0-32 of the RTC 
;; inputs: RTCBUFPTR must contain the addr of write data buffer
;; return: A = I2C.Success or I2C.NoSlaveAck or I2C.BusError
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;		   Y is destroyed
;;
RTC_WriteRegs
		LDA		#RTC_I2C_ADDR		; use DS3231M I2C address
		CLRB						; start at register 0
		LDX		RTCBUFPTR			; use addr in RTCBUFPTR
		LDY	    #32					; 32 bytes
									; fall into I2C_ReadMany...

;; I2C_WriteMany - writes one or more bytes of data to a specific address
;; inputs: A = slave address
;;         B = register address
;;         X = addr of write data buffer
;;         Y = number of bytes to write
;; return: A = I2C.Success or I2C.NoSlaveAck or I2C.BusError
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;		   Y is destroyed
;;
;; WRITE MANY == [START], ADDR, [ack], <REG ADDR>, [ack], <WRITE DATA>, [ack], <WRITE DATA>, [ack], ... [STOP]
;;
I2C_WriteMany
		PSHS	X					; preserve write buffer address
		ANDA	#$FE				; send START and slave address (WRITE)
		BSR 	I2C_GoMaster		; try to send slave address
		BNE		WMERR?				; error, return with status!
		TFR     B,A					; copy register address into A
		JSR		I2C_SendByte		; try to send register address
		BNE		WMERR?				; error, return with status!
WM0?	LEAY	0,Y					; test the byte counter
		BEQ		WMEND?				; all done, send a STOP
WM1?	LDA		,X+					; copy byte from write buffer to A
		JSR		I2C_SendByte		; try to send data byte
		BNE		WMERR?				; error, return with status!
		LEAY	-1,Y				; decrement the byte counter
		BNE		WM1?				; repeat until finished
WMEND?	CLRA						; return code is fSuccess (0)
WMERR?	JSR		I2C_SendStop		; send a STOP condition		
		TSTA						; make sure Z is set according to return code!
		PULS	X					; restore buffer start address
		RTS

;; I2C_WriteByte - write one byte of data to a specific address
;; inputs: A = slave address
;;         B = register address
;;		   E = data to write
;; return: A = I2C.Success or I2C.NoSlaveAck or I2C.BusError
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;
;; WRITE REG == [START], ADDR, [ack], <REG ADDR>, [ack], <WRITE DATA>, [ack], [STOP]
;;
I2C_WriteByte
		ANDA	#$FE				; send START and slave address (WRITE)
		BSR 	I2C_GoMaster		; try to send slave address
		BNE		WBERR?				; error, return with status!
		TFR     B,A					; copy register address into A
		JSR		I2C_SendByte		; try to send register address
		BNE		WBERR?				; error, return with status!
		TFR		E,A					; copy data byte to be written into A
		JSR		I2C_SendByte		; try to send data byte
		BNE		WBERR?				; error, return with status!
		CLRA						; return code is fSuccess (0)
WBERR?	JSR		I2C_SendStop		; send a STOP condition		
		TSTA						; make sure Z is set according to return code!
		RTS

;; RTC_ReadRegs - read registers 0-32 of the RTC 
;; inputs: RTCBUFPTR must contain the addr of read data buffer
;; return: B = value of last read data byte
;;         X = addr of read data buffer
;;		   A = I2C.Success or I2C.NoSlaveAck or I2C.BusError
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;		   Y is destroyed
;;
RTC_ReadRegs
		LDA		#RTC_I2C_ADDR		; use DS3231M I2C address
		CLRB						; start at register 0
		LDX		RTCBUFPTR			; use addr in RTCBUFPTR
		LDY	    #32					; 32 bytes
									; fall into I2C_ReadMany...

;; I2C_ReadMany - read one or more bytes of data from a specific address
;; inputs: A = slave address
;;         B = register address
;;         X = addr of read data buffer
;;         Y = number of bytes to read
;; return: B = value of last read data byte
;;         X = addr of read data buffer
;;		   A = I2C.Success or I2C.NoSlaveAck or I2C.BusError
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;		   Y is destroyed
;;
;; READ MANY == [START], ADDR, [ack], <REG ADDR>, [ack], [START], ADDR, [ack], <read data>, [ACK], <read data>, [ACK], ... [STOP]
;;
I2C_ReadMany
		PSHS	X					; preserve buffer start address
		ANDA	#$FE				; send START and slave address (WRITE)
		JSR 	I2C_GoMaster		; try to send slave address
		BNE		RMERR?				; error, return with status!
		EXG     B,A					; register address into A, slave address into B
		JSR		I2C_SendByte		; try to send register address
		BNE		RMERR?				; error, return with status!
		TFR		B,A					; slave address back into A		
		ORA		#$01				; send START and slave address (READ)		
		JSR 	I2C_GoMaster		; try to send slave address
		BNE		RMERR?				; error, return with status!
RM0?	LEAY	0,Y					; test the byte counter
		BEQ		RMEND?				; all done, send a STOP
RM1?	LDA		#I2C_ACKNOWLEDGE	; assume ACK
		LEAY	-1,Y				; decrement the byte counter
		BNE		RM2?				; not the last byte to read
		LDA		#I2C_NOTACKNOWLEDGE	; yes, last byte, responsd with NAK
RM2?	JSR		I2C_RcvByte			; read the data byte
		STA		,X+					; store in buffer
		TFR		A,B					; copy read byte to B
		BRA		RM0?				; repeat until finished
RMEND?	CLRA						; return code is fSuccess (0)
RMERR?	JSR		I2C_SendStop		; send a STOP condition		
		TSTA						; make sure Z is set according to return code!
		PULS	X					; restore buffer start address
		RTS
		
;; I2C_ReadByte - read a single byte from a specific address
;; inputs: A = slave address
;;         B = register address, 
;; return: B = value of read data byte
;;		   A = I2C.Success or I2C.NoSlaveAck or I2C.BusError
;;         Z = 1 when I2C.Success, otherwise Z = 0
;;
;; READ REG  == [START], ADDR, [ack], <REG ADDR>, [ack], [START], ADDR, [ack], <read data>, [ACK], [STOP]
;;
I2C_ReadByte
		ANDA	#$FE				; send START and slave address (WRITE)
		JSR 	I2C_GoMaster		; try to send slave address
		BNE		RBERR?				; error, return with status!
		EXG    	B,A					; register address into A, slave address into B
		JSR		I2C_SendByte		; try to send register address
		BNE		RBERR?				; error, return with status!
		TFR		B,A					; slave address back into A		
		ORA		#$01				; send START and slave address (READ)		
		JSR 	I2C_GoMaster		; try to send slave address
		BNE		RBERR?				; error, return with status!
		LDA		#I2C_NOTACKNOWLEDGE	; only one byte, so NAK it
		JSR		I2C_RcvByte			; read the data byte
		TFR		A,B					; copy byte value to B
RBEND?	CLRA						; return code is fSuccess (0)
RBERR?	JSR		I2C_SendStop		; send a STOP condition		
		TSTA						; make sure Z is set according to return code!
		RTS
		
;;======================================================================
;; END OF PLATFORM DEPENDENT SOFT I2C FUNCTIONS
;;======================================================================
;; BEGINNING OF PLATFORM DEPENDENT LOW LEVEL SPI AND SD FUNCTIONS
;;======================================================================

;;   
;; LOW LEVEL SPI FUNCTIONS
;;
;; CPOL=0 the base value of the clock is zero
;; CPHA=0, data is propagated on a falling edge (high->low clock transition)
	
;; SPIINIT - check for card, if card present, assert SD CS
;; return: Z=1, no SD CARD present
;;         Z=0, SD CARD present and selected
SPIINIT:	
		OIM		IO.SDCS,IOPORT		; negate SD CS
		TIM		IO.SDSW,IOPORT 		; test the card detect switch
		BEQ		S0?					; if no card, leave CS negated
		AIM		~IO.SDCS,IOPORT		; if card, assert SD CS
		ANDCC	#~Z					; and clear Z flag
S0?		RTS
	
;; SPI_TXRX - r/w transfer a byte via SPI master 
;; inputs: A = byte to send
;; return: B = byte received
;;	       A is preserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPI_TXRX:
		BSR		SPI_SEND			; send byte in A via SPI
SB0		TIM  	IO.SDBSY,IOPORT		; wait for transaction to end
		BNE		SB0
		LDB		SDPORT				; read recevied byte into B
		RTS

;; SPI_SEND - send a byte via SPI master
;; inputs: A = byte to send
;; return: all registers preserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPI_SEND:	
		TIM  	IO.SDBSY,IOPORT		; make sure SPI is ready
		BNE		SPI_SEND
		STA		SDPORT				; send A via SPI
		RTS

;; SPI_RCV - receive a byte via SPI master
;; return: B = byte read from SPI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPI_RCV:	
		TIM  	IO.SDBSY,IOPORT		; make sure SPI is ready
		BNE		SPI_RCV
		LDB		#$FF				; dummy byte value
		STB		SDPORT				; send dummy via SPI
		BRA		SB0					; exit via SPI_TXRX

;; SPI_RCVMANY - receive multiple bytes via SPI master
;; inputs: X = pointer to destination block
;;         D = number of bytes to be read
;; return: X = pointer to destination block+512
;;         D = 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPI_RCVMANY:	
		PSHS	B					; B gets used by SPI_RCV
		BSR		SPI_RCV				; send a dummy and read a data byte
		STB		,X+					; store in buffer
		PULS	B					; restore LSB of byte counter
		DECD						; decrement it
		BNE		SPI_RCVMANY			;    not done yet, keep reading
		RTS

;; SPI_SENDMANY - send multiple bytes via SPI master
;; inputs: X = pointer to source block
;;         D = number of bytes to be sent
;; return: X = pointer to source block+512
;;         D = 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPI_SENDMANY:	
		PSHS	A					; A gets used by SPI_SEND
		LDA		,X+					; get byte to send from source block
		JSR		SPI_SEND			; send data byte (ignore read)
		PULS	A					; restore MSB of byte counter
		DECD						; decrement it
		BNE		SPI_SENDMANY		;    not done yet, keep reading
		RTS

;; SPI_BUFCLR - clear SPI result buffer
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPI_BUFCLR	LDX	#RESBUF
C1?		CLR	,X+
		CMPX	#CMDBUF
		BLO	C1?	
		RTS
	
; print result buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRRESBUF:	LDX	#RESBUF
P1?		LDA	,X+
		JSR	PUTBYTE
		JSR	PUTSPACE
		CMPX	#CMDBUF
		BLO	P1?	
		RTS

	
SD.CMD	EQU 	0
SD.A3	EQU	1
SD.A2	EQU	2
SD.A1	EQU	3
SD.A0	EQU	4
SD.CRC	EQU	5

		JSR	SPIINIT
		BNE	SDGO
SDGO:	JSR	PUTMSG
		FCB	$A,$D
		FCN	"SCC Initialized"

SD00:	JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Trying a CMD8...R7="
		JSR	SPI_BUFCLR
		AIM	~IO.SDCS,IOPORT	; assert SD csel	
		JSR	SD_CMD8                                                                                                         
		OIM	IO.SDCS,IOPORT		; negate SD csel		
		JSR	PRRESBUF
		TST	RESBUF		; examine the R1 byte
		LBPL	SD0B			; if R1 is positive, command passed, so skip init

; use the SD_INIT routine to initialize the SD card into SPI mode
SD0:		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Trying to reset SD card...R1="
		JSR	SPIINIT		; init the SPI port
		TIM	IO.SDCS,IOPORT		; check the CS line
		LBNE	SDE			; if negated, there's no card - terminate!
		JSR	SD_INIT		; init the SD card
		JSR	PUTBYTE
		LBMI	SDE			; if R1 is negative, init failed, so terminate

; send a CMD8 to query the card (only works for SD V2 or later, so pretty much all micro-SD cards)
SD0A:	JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Trying a CMD8...R7="
		JSR	SPI_BUFCLR
		AIM	~IO.SDCS,IOPORT	; assert SD csel			
		JSR	SD_CMD8                                                                                                         
		OIM	IO.SDCS,IOPORT		; negate SD csel		
		JSR	PRRESBUF
		TST	RESBUF		; examine the R1 byte
		LBMI	SDE			; if R1 is negative, terminate

; send ACMD41 to initialize the card
SD0B:	JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Trying an ACMD41"
		CLR	RESBUF+6		; clear timeout counter
SD1:		INC	RESBUF+6		; increment timeout counter
		BMI	SDE			; if 128 tries or more, terminate
; send CMD55 to precede the ACMD41	
		JSR	PUTMSG	
		FCB	$0A,$0D
		FCN	"First sending CMD55...R1="
		AIM	~IO.SDCS,IOPORT	; assert SD csel
		JSR	SD_CMD55
		OIM	IO.SDCS,IOPORT		; negate SD csel
		JSR	PUTBYTE
; send CMD41 to initialize the card
		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Next sending CMD41...R1="	
		AIM	~IO.SDCS,IOPORT	; assert SD csel
		JSR	SD_CMD41
		JSR	PUTBYTE
		OIM	IO.SDCS,IOPORT		; negate SD csel
		TSTA				; test R1 for Z/N
		BEQ	SD2			;   zero; move on to next command
		BMI	SDE			;   negative; terminate
		BRA	SD1			; loop until init is complete

; error during SD card access - terminate!	
SDE:		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Terminating"
		OIM	IO.SDCS,IOPORT		; negate SD csel	
		JMP	WOZMON

; send CMD58 to ensure that block addressing is in effect	
SD2:		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Trying a CMD58...R1="
		AIM	~IO.SDCS,IOPORT  	; assert SD csel
		JSR	SPI_BUFCLR
		JSR	SD_CMD58
		JSR	PRRESBUF	
		OIM	IO.SDCS,IOPORT	; negate SD csel
		TST	RESBUF		; examine the R1 byte
		BMI	SDE			; if R1 is negative, init failed, so terminate
		LDA	RESBUF+1		; look at CCS bit in OCR (bit 30)
		BITA	#%01000000	; is block addressing used?
		BEQ	SDE			;    no, exit
	
; At this point, the SD card is ready for reading/writing in SPI mode!
	
; read some sector into the block buffer
		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Reading LBA #00123456...RET="
		AIM	~IO.SDCS,IOPORT	  	; assert SD csel
		LDX	#BLKBUF
		LDD	#LBA_T_S
		JSR	SD_RD_BLOCK
		JSR	PUTBYTE
		OIM	IO.SDCS,IOPORT	; negate SD csel
	
; display the sector data
	
		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	PUTBYTE

; modify the sector data
	
		LDX	#BLKBUF		; point to beginning of block data
		LDD	LBA_T_S		; put $0012 into first word of block
		STD	,X
		LDD	LBA_T_S+2		; put $3456 into second word of block
		STD	2,X
		INC	BLKBUF+511	; increment last byte of block

; display the sector data
	
		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	PUTBYTE
		
; write this same sector back to the card 

		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Writing LBA #00123456...RET="
		AIM	~IO.SDCS,IOPORT	  	; assert SD csel
		LDX	#BLKBUF
		LDD	#LBA_T_S
		JSR	SD_WR_BLOCK
		JSR	PUTBYTE
		OIM	IO.SDCS,IOPORT	; negate SD csel

; clear the block buffer
		CLR	BLKBUF
		LDX	#BLKBUF
		LDU	#BLKBUF+1
		LDW	#511
		TFM	X+,U+
		
		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	PUTBYTE
			
; read the sector back into the block buffer

		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"Reading LBA #00123456...RET="
		AIM	~IO.SDCS,IOPORT	  	; assert SD csel
		LDX	#BLKBUF
		LDD	#LBA_T_S
		JSR	SD_RD_BLOCK
		JSR	PUTBYTE
		OIM	IO.SDCS,IOPORT	; negate SD csel
	
; display the sector data
	
		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	PUTBYTE

SDX:		JSR	PUTMSG
		FCB	$0A,$0D
		FCN	"All done!"
		OIM	IO.SDCS,IOPORT		; negate SD csel
		JMP	WOZMON
	
********************************************
* SD_INIT - put SD card into SPI mode
*           and into IDLE state
* On exit: A is R1 response byte from CMD0
********************************************
SD_INIT:
;		AIM	~IO.SDCS,IOPORT	; assert SD csel
;		AIM	~IO.SDCLK,IOPORT	; set SPI to fast mode
;		LDX	#SDCMD0			; point to CMD0 command structure
;		LBSR	SD_SEND_CMD
;		CMPA	#$FF				; check response byte for $FF
;		BEQ	IN0?
;		RTS		
IN0?		OIM 	IO.SDCS,IOPORT		; negate the CS line
		OIM  IO.SDCLK,IOPORT	; set SPI to slow mode
		LDB	#10				; send 10 bytes (80 clock pulses) to SD card
IN1?		LDA	#$FF
		STA	SDPORT
IN2?		TIM	IO.SDBSY,IOPORT	; check the SPI busy bit
		BNE	IN2?				; if set, keep waiting!
		DECB			   		; decrement counter
		BNE	IN1?				; loop until all pulses sent
		AIM	~IO.SDCS,IOPORT	; assert SD csel
		AIM	~IO.SDCLK,IOPORT	; set SPI to fast mode
; send GO_IDLE_STATE command 	
; 01 000000 00000000 00000000 00000000 00000000 1001010 1	
; response is R1 
		LDX	#SDCMD0			; point to CMD0 command sentence
		BRA	SD_SEND_CMD
	
********************************************
* SD_CMD8 - send SD CMD8 
* On exit: A is R1 response byte from CMD8
*          RESBUF[0..4] contains R1+OCR
********************************************
SD_CMD8:	
; send CMD8 command - only valid for SDC V2
; 01 001000 00000000 00000000 00000001 10101010 0000111 1
; response is R7 (R1 + 32 bits of data)
		LDX	#SDCMD8			; point to CMD8 command sentence
		BSR	SD_SEND_CMD		; send command and get R1
		BRA	SD_GET_R7		; get the R7 (R1+OCR) response bytes

********************************************
* SD_CMD58 - send SD CMD58 
* On exit: A is R1 response byte
*          RESBUF[0..4] contains R1+OCR
********************************************
SD_CMD58:
; send CMD58 command 		
;01 111010 00000000 00000000 00000000 00000000 0111010 1	
; response is R7 (R1 + 32 bits of data)
		LDX	#SDCMD58			; point to CMD58 command sentence
		BSR	SD_SEND_CMD		; send command and get R1
		BRA	SD_GET_R7		; get the R7 (R1+OCR) response bytes
	
********************************************
* SD_CMD55 - send CD CMD55
* On exit: A is R1 response byte
********************************************
SD_CMD55:	
; send CMD55 command - "application specific"
; response is R1 
		LDX	#SDCMD55			; point to CMD55 command sentence
		BRA	SD_SEND_CMD		; send command and get R1
	
********************************************
* SD_CMD41 - send CD CMD41
* On exit: A is R1 response byte
********************************************
SD_CMD41:	
; send CMD41 command - APP_SEND_OP_COND (need CMD55 first!)
; response is R1 
		LDX	#SDCMD41			; point to CMD41 command sentence
		BRA	SD_SEND_CMD		; send command and get R1

********************************************
* SD_GET_R7 - get SD R7 (R1+OCR) response
* on entry: A is R1 response byte
* On exit:  A is R1 response byte
*           B is destroyed
*           RESBUF[0..4] contains R7
********************************************
SD_GET_R7	STA	RESBUF			; save R1 into result buffer
		JSR	SPI_RCV			; read four more response bytes (R7)
		STB	RESBUF+1
		JSR	SPI_RCV		
		STB	RESBUF+2	
		JSR	SPI_RCV		
		STB	RESBUF+3	
		JSR	SPI_RCV		
		STB	RESBUF+4	
		RTS
	
********************************************
* SD_SEND_CMD - sends a 6-byte command to MMC/SD card
* On Entry: X points to command sequence
* On exit: A is R1 response byte
*          X is destroyed
*          B is preserved
********************************************
SD_SEND_CMD:
		PSHS	B			; save original B value
SD0?		JSR	SPI_RCV		; send Ncs
		CMPB	#$FF
		BNE	SD0?			; loop until $FF received!
		CLRB				; clear byte counter
SD1?		LDA	,X+			; command + addr + crc
		JSR	SPI_SEND		; send the byte
		INCB				; increment byte counter
		CMPB	#6			; sent all 6 bytes yet?
		BNE	SD1?			;    no, loop again
		LDX	#0				; clear byte counter	
SD2?		JSR	SPI_RCV		; send a dummy and read the response
		TSTB				; examine the received byte (B)
		BPL	SD_SEN3			;    non-negative, got a response!
		LEAX	1,X	       	; increment byte counter
		CMPX	#8			; waited 8 bytes yet?
		BNE	SD2?			;    no, try again
SD_SEN3:	TFR	B,A			; move response to A	
		PULS	B			; restore original B
		RTS				; return with R1 in A	
	
********************************************
* SD_RD_BLOCK - read a block (sector) from SD card
* On Entry: D is pointer to block number
*           X points to block buffer
* On Exit:  A is status (0 = OK, !0 = ERR)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_RD_BLOCK:
		PSHS	X			; save pointer to block buffer
		TFR	D,X			; put pointer to LBA into X
		LDA	3,X			; transfer LBA value to CMDBUF A3...A0
		STA	CMDBUF+SD.A0
		LDA	2,X
		STA	CMDBUF+SD.A1
		LDA	1,X
		STA	CMDBUF+SD.A2
		LDA	,X
		STA	CMDBUF+SD.A3
		LDA	#$51			; READ_SINGLE_BLOCK command (17)
		STA	CMDBUF+SD.CMD
		CLR	CMDBUF+SD.CRC
		LDX	#CMDBUF
		BSR	SD_SEND_CMD
		CMPA	#0			; OK response from read command?
		BNE	SDRDE		;    no, terminate!
RD1?		JSR	SPI_RCV  		; wait for $FE start token
		TSTB				; examine token received
		BPL	SDRDEB		; if positive, it's an error token
		CMPB	#$FE			; check if it's a start token
		BNE	RD1?			;    no, get next token
		LDX	,S			; point to beginning of block buffer
		LDD	#512			; init transfer counter
SDRD2	JSR	SPI_RCVMANY		; transfer 512 bytes
		JSR	SPI_RCV		; read the CRC value into RESBUF[0..1]
		STB	RESBUF
		JSR	SPI_RCV
		STB	RESBUF+1
		CLRA				; clear A (all OK)
SDRDE	PULS	X			; restore block buffer pointer
		RTS
SDRDEB	TFR	B,A			; move error token from B into A
		PULS	X			; restore block buffer pointer
		RTS				

********************************************
* SD_RD_CSD - read the CSD info from SD card
* On Entry: X points to block buffer
* On Exit:  A is status (0 = OK, !0 = ERR)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_RD_CSD:
		PSHS	X			; save pointer to block buffer
		LDX	#SDCMD9	
		JSR	SD_SEND_CMD
		CMPA	#0			; OK response from read command?
		BEQ	*+4			;    yes, continue
		BRA	SDRDE 		;    no, terminate!
CSD1?	JSR	SPI_RCV     	; wait for $FE start token
		TSTB				; examine token received
		BPL	SDRDEB		; if positive, it's an error token
		CMPB	#$FE			; check if it's a start token
		BNE	CSD1?		;    no, get next token
		LDX	,S			; point to beginning of block buffer
		LDD	#16			; init transfer counter
		BRA	SDRD2

********************************************
* SD_WR_BLOCK - write a block (sector) to SD card
* On Entry: D is pointer to block number
*           X points to block buffer
* On Exit:  A is status (either R1 or data response)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_WR_BLOCK:
		PSHS	X			; save pointer to block buffer
		TFR	D,X			; put pointer to LBA into X
		LDA	3,X			; transfer LBA value to CMDBUF A3...A0
		STA	CMDBUF+SD.A0
		LDA	2,X
		STA	CMDBUF+SD.A1
		LDA	1,X
		STA	CMDBUF+SD.A2
		LDA	,X
		STA	CMDBUF+SD.A3
		LDX	#CMDBUF
		LDA	#$58			; WRITE_SINGLE_BLOCK command (24)
		STA	SD.CMD,X
		CLR	SD.CRC,X
		JSR	SD_SEND_CMD
		CMPA	#0			; OK response from write command?
		BNE	SDWRE		;    no, terminate!
		JSR	SPI_RCV     	; send two $FF bytes
		JSR	SPI_RCV
		LDA	#$FE			; send the $FE start token
		JSR	SPI_TXRX
		LDX	,S			; load buffer pointer into X
		LDD	#512			; init transfer counter
		JSR	SPI_SENDMANY		; transfer 512 bytes to SD card
		JSR	SPI_RCV		; write a dummy CRC value to card
		JSR	SPI_RCV		
		JSR	SPI_RCV		; get data response
		ANDB	#$1F
		PSHS	B			; save the response on stack
SDWR2	JSR	SPI_RCV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	SDWR2		;    keep polling
		PULS	A			; put data response back in A
SDWRE	PULS	X			; restore block buffer pointer
		RTS
	
********************************************
* SD_WR_MULT - write multiple blocks (sectors) to SD card
* On Entry: D is pointer to block number:transfer count (FIVE bytes)
*           X points to start of source data
* On Exit:  A is status (either R1 or data response)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_WR_MULT:
		PSHS	X			; save pointer to block buffer
		TFR	D,X			; put pointer to LBA into X
		LDA	3,X			; transfer LBA value to CMDBUF A3...A0
		STA	CMDBUF+SD.A0
		LDA	2,X
		STA	CMDBUF+SD.A1
		LDA	1,X
		STA	CMDBUF+SD.A2
		LDA	,X
		STA	CMDBUF+SD.A3
		LDA	4,X 			; save transfer count to SPITEMP
		STA	SPITEMP	
		LDA	#$59			; WRITE_SINGLE_BLOCK command (25)
		STA	SD.CMD,X
		CLR	SD.CRC,X
		JSR	SD_SEND_CMD
		CMPA	#0			; OK response from write command?
		BNE	SDWME		;    no, terminate!
WM1?		JSR	SPI_RCV     	; send two $FF bytes
		JSR	SPI_RCV
		LDA	#$FC			; send the $FC START token
		JSR	SPI_TXRX
		PULS	X			; point to source block buffer
		LDD	#512			; init transfer counter
		JSR	SPI_SENDMANY		; transfer 512 bytes to SD card
		PSHS	X			; save updated block buffer pointer
		JSR	SPI_RCV		; write a dummy CRC value to card
		JSR	SPI_RCV		
		JSR	SPI_RCV		; get data response
		ANDB	#$1F
		STB	SPITEMP+1		; save the response at SPITEMP+1
WM2?		JSR	SPI_RCV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	WM2?			;    keep polling
		TST	SPITEMP			; examine the block transfer counter
		BEQ	WM3?			; counter is zero, done with all blocks
		DEC	SPITEMP			; non-zero, decrement the counter
		BRA	WM1?			; send the next packet	
WM3?		LDA	#$FD			; send a STOP_TRAN token
		JSR	SPI_SEND	
		JSR	SPI_RCV		; send a dummy byte 
WM4?		JSR	SPI_RCV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	WM4?			;    keep polling
		LDA	SPITEMP+1		; put data response into A
SDWME	PULS	X			; restore block buffer pointer
		RTS

********************************************
* SD_RD_MULT - read multiple blocks (sectors) from SD card
* On Entry: D is pointer to block number:transfer count (FIVE bytes)
*           X points to destination start
* On Exit:  A is status (0 = OK, !0 = ERR)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_RD_MULT:
		PSHS	X			; save pointer to block buffer
		TFR	D,X			; put pointer to LBA into X
		LDA	3,X			; transfer LBA value to CMDBUF A3...A0
		STA	CMDBUF+SD.A0            	
		LDA	2,X                     	
		STA	CMDBUF+SD.A1            	
		LDA	1,X                     	
		STA	CMDBUF+SD.A2            	
		LDA	,X                      	
		STA	CMDBUF+SD.A3            	
		LDA	4,X 			; save transfer count to SPITEMP
		STA	SPITEMP	                   	
		LDA	#$52			; READ_MULTIPLE_BLOCK command (18)
		STA	CMDBUF+SD.CMD           	
		CLR	CMDBUF+SD.CRC           	
		LDX	#CMDBUF                 	
		JSR	SD_SEND_CMD	; send CMD18
		TSTA				; OK response from read command?
		BNE	SDRME		;    no, terminate!
RM1?		JSR	SPI_RCV  		; wait for $FE start token
		TSTB				; examine token received
		BPL	SDRMEB		; if positive, it's an error token
		CMPB	#$FE			; check if it's a start token
		BNE	RM1?			;    no, get next token
		PULS	X			; get destination pointer
		LDD	#512			; init transfer counter
		JSR	SPI_RCVMANY		; transfer 512 bytes
		PSHS	X			; save the updated dest pointer
		JSR	SPI_RCV		; read the CRC value (16 bits)
		JSR	SPI_RCV			
		TST	SPITEMP			; examine the block transfer counter
		BEQ	RM3?			; counter is zero, done with all blocks
		DEC	SPITEMP			; non-zero, decrement the counter
		BRA	RM1?			; get the next packet	
		LDX	#SDCMD12		; point to CMD12 sentence
RM3?		JSR	SPI_RCV		; send Ncs
		CMPB	#$FF                   	
		BNE	RM3?			; loop until $FF received!
		CLRB				; clear byte counter
RM4?		LDA	,X+			; command + addr + crc
		JSR	SPI_SEND		; send the byte
		INCB				; increment byte counter
		CMPB	#6			; sent all 6 bytes yet?
		BNE	RM4?			;    no, loop again
		JSR	SPI_RCV		; get stuff byte
		LDX	#0			; clear byte counter	
RM5?		JSR	SPI_RCV		; send a dummy and read the response
		TSTB				; examine the received byte (B)
		BPL	RM6?			;    non-negative, got a response!
		LEAX	1,X	         	; increment byte counter
		CMPX	#8			; waited 8 bytes yet?
		BNE	RM5?			;    no, try again
RM6?		TFR	B,A			; move response to A	
RM7?		JSR	SPI_RCV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	RM7?			;    keep polling
		CLRA				; clear A (all OK)
SDRME	PULS	X			; restore block buffer pointer
		RTS                         	
SDRMEB	TFR	B,A			; move error token from B into A
		PULS	X			; restore block buffer pointer
		RTS				



********************************************
*              SD stuff
********************************************

; LBA sectors for testing - these are FIVE bytes long to make room
; for a block counter (for multiple read/writes)

LBA_T_S	FCB	$00,$12,$34,$56,0	; LBA of sector 00123456
LBA_T_6 	FCB	$00,$12,$34,$50,5	; LBA of sector 00123450, with TC of 6 sectors
LBA_MBR	FCB	0,0,0,0,0		; LBA of Master Boot Record
LBA_2GB	FCB	0,$3A,$D2,0,0	; LBA limit of 2 GB card
LBA_4GB	FCB	0,$75,$A4,0,0	; LBA limit of 4 GB card
LBA_8GB	FCB	0,$EB,$48,0,0	; LBA limit of 8 GB card
LBA_16GB	FCB	1,$D6,$90,0,0	; LBA limit of 16 GB card
LBA_32GB	FCB	3,$Ad,$20,0,0	; LBA limit of 32 GB card

; SD card command and result buffers, pre-made command sentences 

RESBUF	RMB	5			; SD RESULT buffer (R1/R7)
CMDBUF	RMB	6			; SD COMMAND buffer (generic)
SDCMD0	FCB	$40,$00,$00,$00,$00,$95	; SD CMD0 GO_IDLE_STATE
SDCMD8	FCB	$48,$00,$00,$01,$AA,$87	; SD CMD8 SDV2_CHECK
SDCMD9   	FCB	$49,$00,$00,$00,$00,$00	; SD CMD9 SEND_CSD
SDCMD55	FCB	$77,$00,$00,$00,$00,$65	; SD CMD55 APP_OP
SDCMD41	FCB	$69,$40,$00,$00,$00,$00	; SD ACMD41 APP_SEND_OP_COND
SDCMD58	FCB	$7A,$00,$00,$00,$00,$75	; SD CMD58 SEND_IF_COND
SDCMD12	FCB	$4C,$00,$00,$00,$00,$00	; SD CMD12 STOP_TRANSMISSION

; temporary storage
SPITEMP		RMB	2
;(unsigned long)partition_LBA_begin - from MBR
PART_BEGIN	RMB	4

		ORG	$0800
BLKBUF	RMB	512
BLKEND	EQU	*

MULTBUF	RMB	512*6
MULTEND	EQU	*	






                                                                        
		                                                                   
;======================================================================
; BEGINNING OF PLATFORM DEPENDENT UTILITY FUNCTIONS             
;======================================================================
		                                                        
; VECTORS THROUGH RAM                                           
        ORG     HARD_VECT                                       
        FDB     RES_ENT		; fff0 (reserved/trap)              
        FDB     SWI3_ENT    ; fff2 (SWI3)                       
        FDB     SWI2_ENT    ; fff4 (SWI2)                       
        FDB     FIRQ_ENT    ; fff6 (FIRQ)                       
        FDB     IRQ_ENT     ; fff8 (IRQ)                        
        FDB     SWI_ENT     ; fffa (SWI/breakpoint)
        FDB     NMI_ENT     ; fffc (NMI)
        FDB     RESET       ; fffe reset
;
        END     RESET
