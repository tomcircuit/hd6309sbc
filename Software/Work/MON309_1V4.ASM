
; MON309_1V4: A software debug monitor for the SBC6309 CPLD v1.4
; 
; The monitor is currently setup to run on a system which has 16K of ROM
; (for MON309) at the top of the memory may ($C000-$FFFF), and 48K of RAM
; from $0000-$BFFF. The 512B block from $E000-$E1FF is used for I/O devices
; MON309 uses 160 bytes of memory at the very top of available RAM,
; and the user stack pointer is initialized to point to the beginning of
; this area, allowing the user stack to grow downward into free user RAM.
;
; Z8536 CIO at $E000, Z85C30 SCC at $E010, SOFTI2C at $E020

; I2CPORT at $E020
;
;       7     6    5    4     3     2    1    0
;	 [DSCK][DSDA][---][---][MSCK][MSDA][---][---]
;      rw    rw    r    r    r     r     r    r
;      1     1     0    0    x     x     0    0
;
; DSCK == drive SCK --> float SCK ; 0 --> drive SCK low
; DSDA == drive SDA --> float SDA ; 0 --> drive SDA low
; MSCK == monitor SCK --> state of SCK
; MSDA == monitor SDA --> state of SDA

; SDCARD port at $E030
;    8 bits of data to transfer via SPI

; SYSPORT at $E040
;
; SYSTEM CONFIG port
;       7    6    5    4    3     2     1      0
;	 [---][---][---][CONF][RA14][ROMH][ROML][ROMWS]
;      r    r    r    r     rw    rw    rw    rw
;      0    0    0    x     1     1     1     1
;
;  CONF == status of CONFIG jumper 
;  RA14 == control ROM pin 27 (default to CONFIG jumper at reset)
;  ROMH == 1 --> bank ROM over $E200-$FFFF during reads (writes always go to RAM)
;  ROML == 1 --> bank ROM over $C000-$DFFF during reads (writes always go to RAM)
;  ROMWS == 1 --> insert wait state for ROM access; 0 --> no wait states for ROM

; IOPORT at $E050
;
; INPUT-OUTPUT port 
;       7     6      5      4    3  2    1     0
;    [SDSW][SDBSY][SDCLK][SDCS][PB][0][LED2][LED1]
;       I     I      O      O    x       O     O
;  all bits readable, output bits readback
;
;  SDSW == 1 when SD card is inserted
;  SDBSY == 1 while SPI transaction is taking place
;  SDCLK = 1 --> slow SPI clock; 0 --> fast SPI clock
;  SDCS = 1 --> CS signal to SDcard negated; 0 --> asserted
;  PB == 1 when pushbutton is pressed
;  LEDn = 1 --> illuminate corresponding LED

; Most of this copyright 1985-2007 Dave Dunfield
; Modified without permission!
;
; Additions 2014-2020 Tom LeMense
; assemble using LWASM !

; HARDWARE INFORMATION

IOPAGE	EQU	$E000		; Base address of I/O page
ROM		EQU	$E200		; Start of ROM space
RAM		EQU	$BF60		; MON309 data goes here
STACK	EQU	RAM+$A0		; MON309 Stack (Top of RAM)

ZCIO		EQU	IOPAGE+$00	; CIO base address
CIOC		EQU	ZCIO           ; CIO port C access
CIOB		EQU	ZCIO+1		; CIO port B access
CIOA		EQU	ZCIO+2		; CIO port A access
CIOCTL	EQU	ZCIO+3         ; CIO control register

ZSCC		EQU	IOPAGE+$10	; SCC base address
SCCBC	EQU	ZSCC			; SCC channel B command
SCCBD	EQU	ZSCC+1		; SCC channel B data
SCCAC	EQU	ZSCC+2		; SCC channel A command
SCCAD	EQU	ZSCC+3		; SCC channel A data

I2CPORT	EQU	IOPAGE+$20	;soft I2C port
I2C.DSCK EQU $80
I2C.DSDA EQU $40
I2C.MSCK EQU $08
I2C.MSDA EQU $04

;RTCBASE	EQU	IOPAGE+$20	; RTC base address
;RTC1S	EQU	RTCBASE
;RTC10S	EQU 	RTCBASE+1
;RTC1M	EQU 	RTCBASE+2
;RTC10M	EQU 	RTCBASE+3
;RTC1H	EQU 	RTCBASE+4
;RTC10H	EQU 	RTCBASE+5
;RTCDOW	EQU	RTCBASE+6
;RTC1D	EQU 	RTCBASE+7
;RTC10D	EQU	RTCBASE+8
;RTC1MO	EQU	RTCBASE+9
;RTC10MO	EQU	RTCBASE+10
;RTC1YR	EQU	RTCBASE+11
;RTC10YR	EQU	RTCBASE+12
;RTC100YR	EQU	RTCBASE+13
;RTC1KYR	EQU	RTCBASE+14
;RTCCTL	EQU	RTCBASE+15

;RTC.B0	EQU	0			; RTC bank 0
;RTC.B1	EQU	4			; RTC bank 1
;RTC.B2	EQU	8			; RTC bank 2
;RTC.STOP	EQU	2			; RTC STOP bit
;RTC.FOS	EQU	8			; RTC power interrupted bit

SDPORT	EQU	IOPAGE+$30	; SDPORT register address
SYSCFG	EQU	IOPAGE+$40	; SYSCFG register address
IOPORT	EQU	IOPAGE+$50	; INOUT register address
		
; MON09 INTERNAL MEMORY

		ORG	RAM			; Internal MON09 variables
SWIADR	RMB	2			; SWI VECTOR ADDRESS
SWI2ADR	RMB	2			; SWI2 VECTOR ADDRESS
SWI3ADR	RMB	2			; SWI3 VECTOR ADDRESS
IRQADR	RMB	2			; IRQ VECTOR ADDRESS
FIRQADR	RMB	2			; FIRQ VECTOR ADDRESS
NMIADR	RMB	2			; NMI VECTOR ADDRESS
IOCON	RMB	1			; I/O CONFIGURATION BYTE
UART1	RMB	2			; UART 1 ADDRESS
UART2	RMB	2			; UART 2 ADDRESS
SAVCC	RMB	1			; SAVED CONDITION CODE REGISTER
SAVA		RMB	1			; SAVED 6809 A REGISTER
SAVB		RMB	1			; SAVED 6809 B REGISTER
SAVDP	RMB	1			; SAVED DIRECT PAGE REGISTER
SAVX		RMB	2			; SAVED X REGISTER
SAVY		RMB	2			; SAVED Y REGISTER
SAVU		RMB	2			; SAVED U REGISTER
SAVPC	RMB	2			; SAVED PROGRAM COUNTER
SAVS		RMB	2			; SAVED S REGISTER
TEMP		RMB	2			; TEMPORARY STORAGE
STPFLG	RMB	1			; REGISTER DISPLAY WHILE STEPPING FLAG
PTRSAV	RMB	2			; SINGLE STEP AND DISASSEMBLER CODE POINTER
INSTYP	RMB	1			; DISASSEMBLED INSTRUCTION TYPE
POSBYT	RMB	1			; POSTBYTE STORAGE AREA
BRKTAB	RMB	24			; BREAKPOINT TABLE
DSPBUF	RMB	50			; DISASSEMBLER DISPLAY BUFFER
INSRAM	RMB	7			; INSTRUCTION EXECUTION ADDRESS

;                       	
		ORG	ROM			; MONITOR CODE
;
; INITIALIZATIONS
;
RESET	LDS	#STACK		; SET UP STACK
		CLR	RAM			; clear first byte of RAM
		LDX	#RAM			; point to start of RAM
		LDU	#RAM+1		; point to next byte of RAM
		LDW	#(INSRAM-SWIADR+7)	; length of RAM area
		TFM	X,U+			; copy zero to all of RAM area
		LDD	#NMIHND		; install default NMI handler
		STD	NMIADR		; at re-vector address
		LBSR	INITSCCA		; INITIALIZE SCC CHANNEL A
		LBSR	INITSCCB		; initialize SCC channel B
		LDA	#3			; DEFAULT I/O CONFIGURATION
		STA	IOCON		; SET IT
		LDD	#RAM			; DEFAULT STACK AT TOP OF RAM
		STD	SAVS			; SAVE IT
		LDA	#$D0			; SET CC
		STA	SAVCC		; SAVE IT
MONITOR	LBSR	WRMSG		; OUTPUT MESSAGE
		FCB	$0A,$0D
		FCC	'MON309 Version 1.4'
		FCB	$0A,$0D
		FCC	'May 2014, Tom LeMense'
		FCB	$0A,$0D
		FCC	'Portions Copyright 1985-2007 Dave Dunfield'
		FCB	$0A,$0D
		FCC	'All rights reserved.'
		FCB	$0A,$FF
MAIN		LDS	#STACK		; fix stack in case error               
		LBSR	WRMSG		; output message                        
		FCN	'* '           ; monitor prompt                        
		LBSR	GETECH		; get character                         
		CLRB				; indicate no second char               
		                                                                
; LOOK FOR COMMAND IN TABLE                                           
LOOKC	LDX	#CMDTAB		; point to command table                
		CLR	TEMP			; indicate no partial match             
L1?		CMPD	,X++			; does it match?                        
		BEQ	L3?			;    yes it does                        
		CMPA	-2,X			; does first char match?                
		BNE	L2?			;    no, don't record                   
		DEC	TEMP			; set flag                              
L2?		LEAX	2,X			; advance to next                       
		TST	,X			; have we hit the end?                  
		BNE	L1?			;    no, keep looking                   
		TSTB				; already have two chars?               
		BNE	ERROR		;    yes, error                         
		LDB	TEMP			; any partial matches?                  
		BEQ	ERROR		;    no, error                          
		TFR	A,B			; save char in 'a'                      
		LBSR	GETECH		; get next char                         
		EXG	A,B			; swap back                             
		BRA	LOOKC		; and continue                          
; COMMAND WAS FOUND, EXECUTE IT                                       
L3?		LBSR	SPACE		; output space                          
		JSR	[,X]			; execute command                       
		BRA	MAIN			;    and return                         
	                                                                     
; ERROR HAS OCCURED                                                   
ERROR	LBSR	WRMSG		; output message                        
		FCC	' ?'                                                   
		FCB	$FF                                                    
		BRA	MAIN			; try again                             
	                                                                     
* COMMAND LOOKUP TABLE                                                
CMDTAB	FCC	'DM'			; display memory                        
		FDB	MEMORY                                                 
		FCC	'DI'			; disassemble                           
		FDB	DISASM                                                 
		FCC	'DR'			; display registers                     
		FDB	DISREG                                                 
		FCC	'DB'			; view breakpoints                      
		FDB	DSPBRK                                                 
		FCC	'DV'			; display vectors                       
		FDB	DISVEC                                                 
		FCC	'CR'			; change register                       
		FDB	CHGREG                                                 
		FCC	'CV'			; change vectors                        
		FDB	CHGVEC                                                 
		FCC	'E'            ; substitute memory                     
		FCB 	0			
		FDB	SUBMEM                                                 
		FCC	'L'			; load ascii hex                        
          FCB  0              		
		FDB	LOAD                                                   
		FCC	'B'			; set breakpoint                        
          FCB  0              		
		FDB	SETBRK                                                 
		FCC	'S'			; step                                  
          FCB  0              		
		FDB	GOSTEP                                                 
		FCC	'G'			; go                                    
          FCB  0              		
		FDB	GOEXEC                                                 
		FCC	'FM'			; fill memory                           
		FDB	FILMEM                                                 
		FCC	'RR'			; repeating read                        
		FDB	RDLOOP                                                 
		FCC	'RW'			; repeating write                       
		FDB	WRLOOP                                                 
		FCC	'MT'			; memory test                           
		FDB	RAMTEST                                                
		FCC	'W'			; write memory                          
          FCB  0                        		
		FDB	WRIMEM                                                 
		FCC	'MM'			; move memory                           
		FDB	MOVMEM                                                 
;		FCC	'XR'			; repeating 16 bit read                 
;		FDB	XRLOOP                                                 
;		FCC	'XW'			; repeating 16 bit write                
;		FDB	XWLOOP                                                 
		FCC	'TI'			; initialize time and date              
		FDB	RTCINIT                                                
		FCC	'TD'			; display time and date                 
		FDB	RTCREAD                                                
		FCC	'TS'			; set time and date                     
		FDB	RTCSET                                                 
		FCC	'TN'			; enable/disable rtc nmi                
		FDB	RTCINTS                                                
		FCC	'ZI'			; zilog cio init                        
		FDB	ZINIT                                                  
		FCC	'ZR'			; zilog cio read                        
		FDB	ZREAD                                                  
		FCC	'ZW'			; zilog cio write                       
		FDB	ZWRITE                                                 
		FCC	'+'			; hex addition                          
          FCB  0                        		
		FDB	HEXADD                                                 
		FCC	'-'			; hex subtraction                       
          FCB  0                        		
		FDB	HEXSUB                                                 
		FCC	'?'			; help command                          
          FCB  0                        		
		FDB	HELP                                                   
		FCB	0			; mark end of table                     
;                                                                     
; 'F' - FILL MEMORY                                                   
;                                                                     
FILMEM	LBSR	GETRNG		; get addresses                         
		STD	TEMP			; save it                               
		LBSR	SPACE		; space over                            
		LBSR	GETBYT		; get data byte                         
		LBNE	ERROR		; invalid                               
F1?		STA	,X+			; write it                              
		CMPX	TEMP			; finished with range?                  
		BLS	F1?			;    no, keep going                     
		LBRA	LFCR			; exit via new line                     
                                                                      
;                                                                     
; 'MM' - MOVE MEMORY                                                  
;                                                                     
MOVMEM	LBSR	GETRNG		; get a range                           
		STD	TEMP			; save last value                       
		LBSR	SPACE		; seperator                             
		LBSR	GETADR		; get dest address                      
		TFR	D,Y			; set it up                             
M1?		LDA	,X+			; get source byte                       
		STA	,Y+			; save in dest                          
		CMPX	TEMP			; save it                               
		BLS	M1?			; keep moveing                          
          LBRA LFCR           ; exit via new line
		
;
; 'DM' - DISPLAY MEMORY
;
MEMORY	LBSR	GETRNG		; get address                
		STD	TEMP			; save                       
M1?		LBSR	LFCR			; new line                   
		LBSR	CHKCHR		; check for char             
		LBEQ	MAIN			; escape, quit               
		TFR	X,D			; get address                
		PSHS	A,B			; save for later             
		LBSR	WRDOUT		; display                    
		LDB	#16			; display 16 to a line       
M2?		LBSR	SPACE		; output a space             
		BITB	#3			; on a boundary?             
		BNE	M3?			;   no, keep going                  
		LBSR	SPACE		; extra space                
M3?		LDA	,X+			; get byte                   
		LBSR	HEXOUT		; display                    
		DECB				; reduce count               
		BNE	M2?			; continue?
		LDB	#4			; four space                 
M4?		LBSR	SPACE		; display a space            
		DECB				; reduce count               
		BNE	M4?			; continue                   
		PULS	X			; restore x                  
		LDB	#16			; count of 16                
M5?		LDA	,X+			; get char                   
		CMPA	#$20			; control character?
		BLO	M6?			;    yes, convert to dot             
		CMPA	#$7F			; printable?                 
		BLO	M7?			;    yes, ok to display              
M6?		LDA	#'. 			; change to dot              
M7?		LBSR	PUTCHR		; output                     
		DECB				; reduce count               
		BNE	M5?			; done with all bytes?
		CMPX	TEMP			; past end?                  
		BLS	M1?			;    no, keep going             
          LBRA LFCR           ; exit via new line
		
;
; 'W' - WRITE TO MEMORY
;
WRIMEM	LBSR	GETADR		; get address                     
		TFR	D,X			; set it up                       
		LBSR	SPACE		; step over                       
		LBSR	GETBYT		; get byte                        
		STA	,X			; write to memory                 
          LBRA LFCR           ; exit via new line
		                    
;                                                               
; 'E' - EDIT MEMORY                                             
;                                                               
SUBMEM	LBSR	GETADR		; get address                     
		TFR	D,X			; copy                            
SUBM1	LBSR	LFCR			; new line                        
		TFR	X,D			; get address                     
		LBSR	WRDOUT		; output                          
		LDB	#8			; new count                       
SUBM2	LBSR	SPACE		; seperator                       
		LDA	,X			; get byte                        
		LBSR	HEXOUT		; display                         
		LDA	#'- 			; prompt                          
		LBSR	PUTCHR		; output                          
		LBSR	GETBYT		; get a byte                      
		BNE	SUBM4		; invalid                         
		STA	,X			; resave                          
SUBM3	LEAX	1,X			; advance                         
		DECB				; reduce count                    
		BNE	SUBM2		; more, continue                  
		BRA	SUBM1		; new line                        
SUBM4	CMPA	#$0D			; cr?                             
		LBEQ	LFCR			; if so, quit                     
		CMPA	#$20			; space?                          
		BNE	SUBM5		; no                              
		LBSR	SPACE		; fill for two digits             
		BRA	SUBM3		; advance                         
SUBM5	CMPA	#$08			; backspace?                      
		LBNE	ERROR		; invalid                         
		LEAX	-1,X			; backup                          
		BRA	SUBM1		; edit new line                        
		
;
; 'DI' - DISASSEMBLE
;
DISASM	LBSR	GETRNG		; get address              
		STD	TEMP			; save                     
		TFR	X,Y			; copy to y                
		LBSR	LFCR			; new line                 
		LDU	#DSPBUF		; point to input buffer    
DISS1	LBSR	DISASS		; disassemble              
		TFR	U,X			; copy                     
		LBSR	WRLIN		; output                   
		LBSR	CHKCHR		; end?                     
		BEQ	DISS2		; yes, quit                
		CMPY	TEMP			; over?                    
		BLO	DISS1		; try again                
DISS2	RTS                                            

;                                                        
; 'DV' - DISPLAY VECTORS                                 
;                                                        
DISVEC	LDX	#VECTXT		; point to vector text     
		LDY	#SWIADR		; point to first vector    
DISV1	LBSR	WRLIN		; output a message         
		LDD	,Y++			; get a vector             
		LBSR	WRDOUT		; output vector address    
		LDA	,X			; more text?               
		BNE	DISV1		; and continue             
		LBRA	LFCR			; new line                 
VECTXT	FCN	'SWI='                                    
		FCN	' SWI2='                                  
		FCN	' SWI3='                                  
		FCN	' IRQ='                                   
		FCN	' FIRQ='                                  
		FCB	0			; end of table             
		
;                                                        
; 'DU' DISPLAY UARTS
;
DISURT	LDX	#URTEXT		; point to text                                     
		LDY	#UART1		; point to uart                                     
		BRA	DISV1		; display it                                        
URTEXT	FCN	'UART1='                                                           
		FCN	' UART2='                                                          
		FCB	0                                                                  
		
;                                                                                 
; 'CV' - CHANGE VECTOR                                                            
;                                                                                 
CHGVEC	LBSR	GETECH		; get char & echo                                   
		CMPA	#'S 			; swi?                                              
		BNE	CHGV1		; no                                                
		LDA	#'1 			; same as '1'                                       
		BRA	CHGV3		; continue                                          
CHGV1	CMPA	#'I 			; irq?                                              
		BNE	CHGV2		; no, its ok                                        
		LDA	#'4 			; convert                                           
		BRA	CHGV3		; and continue                                      
CHGV2	CMPA	#'F 			; firq?                                             
		BNE	CHGV3		; no                                                
		LDA	#'5 			; convert                                           
CHGV3	SUBA	#'1 			; test it                                           
		CMPA	#4			; check range                                       
		LBHI	ERROR		; invalid                                           
		LDX	#SWIADR		; point to it                                       
CHGV4	LSLA				; x2 for 2 byte entries                             
		LEAX	A,X			; advance to vector                                 
		LBSR	SPACE		; seperator                                         
		LBSR	GETADR		; get new value                                     
		STD	,X			; write new vector                                  
		LBRA	LFCR			; exit via new line
		
;
; 'DR' - DISPLAY REGISTERS
;
DISREG	LDX	#REGTXT		; point to text                          
		LDY	#SAVCC		; point to value                         
		BSR	RSUB1		; 'cc='                                  
		LBSR	WRLIN		; ' ['                                   
		LDU	#CCBITS		; point to bit table                     
		LDB	-1,Y			; get bits back                          
		PSHS	Y			; save pointer                           
		LDY	#8			; eight bits in byte                     
REGB1	LDA	,U+			; get     bit identifier                 
		ASLB				; is it set?                             
		BCS	RBITS		; yes, display it                        
		LDA	#'- 			; no, display dash                       
RBITS	LBSR	PUTCHR		; output a character                     
		LEAY	-1,Y			; reduce count                           
		BNE	REGB1		; more to go                             
		PULS	Y			; restore y                              
		BSR	RSUB1		; '] a='                                 
		BSR	RSUB1		; ' b='                                  
		BSR	RSUB1		; ' dp='                                 
		BSR	RSUB2		; ' x='                                  
		BSR	RSUB2		; ' y='                                  
		BSR	RSUB2		; ' u='                                  
		BSR	RSUB2		; ' pc='                                 
		BSR	RSUB2		; ' s='                                  
          LBRA LFCR           ; exit via new line                      
; DISPLAY 8 BIT REGISTER VALUE                                         
RSUB1	LBSR	WRLIN		; output byte value                      
		LDA	,Y+			; get register value                     
		LBRA	HEXOUT		; output in hex                          
; DISPLAY 16 BIT REGISTER VALUE                                        
RSUB2	LBSR	WRLIN		; output word value                      
		LDD	,Y++			; get register value                     
		LBRA	WRDOUT		; output in hex                          
		
; TABLE OF TEXT FOR REGISTER DISPLAY
REGTXT	FCN	'CC='
		FCN	' ['
		FCN	'] A='
		FCN	' B='
		FCN	' DP='
		FCN	' X='
		FCN	' Y='
		FCN	' U='
		FCN	' PC='
		FCN	' S='
		
; TABLE OF CONDITION CODE BIT MEANINGS
CCBITS	FCC	'EFHINZVC'

;
; 'CR' - CHANGE REGISTER
;
CHGREG	LBSR	GETECH		; get operand                     
		CMPA	#$20			; a+b?                            
		BEQ	CHG4			; yes                             
		LDX	#CHGTAB		; point to table                  
		CLRB				; zero indicator                  
CHG1		CMPA	,X			; is this it?                     
		BEQ	CHG2			; yes                             
		INCB				; advance count                   
		TST	,X+			; end     of table                
		BNE	CHG1			; no, keep trying                 
		LBRA	ERROR		; indicate error                  
CHG2		LBSR	SPACE		; output space                    
		LDX	#SAVCC		; point to start of registers     
		CMPB	#4			; 16      bit?                    
		BHS	R16			; yes                             
		LEAX	B,X			; offset to address               
		LBSR	GETBYT		; get new value                   
		LBNE	ERROR		; invalid                         
		STA	,X			; save in register                
		BRA	CHG3			; and quit                        
CHG4		LBSR	WRMSG		; output message                  
		FCN	'[AB] '                                          
		LDX	#SAVA		; point to 'd'                    
		BRA	R17			; make like 16 bit reg            
R16		LEAX	4,X			; offset to 16 bit registers      
		SUBB	#4			; convert to zero origin          
		LSLB				; double for word values          
		LEAX	B,X			; move to correct offset          
R17		LBSR	GETADR		; get word value                  
		STD	,X			; set     register value          
CHG3		LBRA LFCR           ; exit via new line               

; TABLE OF REGISTER NAMES
CHGTAB	FCN	'CABDXYUPS'

;
; 'DB' - DISPLAY BREAKPOINTS
;
DSPBRK	LDA	#'0 			; start with brkpt zero                  
		LDX	#BRKTAB		; point to table                         
DSPB1	PSHS	A			; save number                            
		LDA	#'B 			; precede with 'b'                       
		LBSR	PUTCHR 		; output                                 
		LDA	,S			; get number back                        
		LBSR	PUTCHR		; output                                 
		LDA	#'= 			; and follow with '='                    
		LBSR	PUTCHR		; output                                 
		LDD	,X++			; get value                              
		BNE	DSPB2		; non-zero, display                      
		LBSR	WRMSG		; output message instead                 
		FCN	'****'                                                  
		BRA	DSPB3		; continue                               
DSPB2	LBSR	WRDOUT		; output value                           
DSPB3	LBSR	SPACE		; seperate with space                    
		LEAX	1,X			; skip opcode save                       
		PULS	A			; restore number                         
		INCA				; advance                                
		CMPA	#'8 			; beyond end?                            
		BLO	DSPB1		; no, continue                           
		LBRA LFCR           ; exit via new line                      
		
;
; 'B' - SET BREAKPOINT
;
SETBRK	LBSR	GETECH		; get character                                 
		SUBA	#'0 			; convert to number                             
		CMPA	#8			; in range?                                     
		LBHS	ERROR		; no, quit                                      
		PSHS	A			; save number                                   
		LSLA				; double for 16 bit values                      
		ADDA	,S+			; triple for opcode byte                        
		LDX	#BRKTAB		; point to breakpoint table                     
		LEAX	A,X			; advance to breakpoint                         
		LBSR	SPACE		; seperate with space                           
		LBSR	GETADR		; get value                                     
		STD	,X			; save in table                                 
          LBRA LFCR           ; exit via new line                             
		                                                                        
;                                                                             
; 'S' - SINGLE STEP                                                           
;                                                                             
GOSTEP	LBSR	GETPC		; get address                                   
		LBSR	LFCR			; output message                                
GOSTP1	LBSR	STEPDI		; step and display instruction                  
		TST	STPFLG		; display registers?                            
		BMI	NODSR		; no, don't display                             
STPREG	LBSR	DISREG		; display registers                             
NODSR	LBSR	GETCHR		; get key from terminal                         
		CMPA	#'? 			; display regs?                                 
		BEQ	STPREG		; if so, display                                
		CMPA	#$20			; step to next?                                 
		BEQ	GOSTP1		; if so, step                                   
		CMPA	#$1B			; exit stepping?                                
		BEQ	GOSTP2		; if so, quit                                   
		CMPA	#$0D			; toggle register display?                      
		BNE	NODSR		; if not, ignore                                
		COM	STPFLG		; toggle display flag                           
		BRA	NODSR		; get next key                                  
GOSTP2	RTS

;
; 'G' - GO (EXECUTE)
;
GOEXEC	LBSR	GETPC		; get address
		LBSR	LFCR			; new line   
; STEP ONE INST. BEFORE INSERTING BREAKPOINTS, SO THAT BREAKPOINTS
; CAN BE USED WITHIN LOOPS ETC.
		LBSR	STEP			; step one instruction                      
; INSERT BREAKPOINTS                                                      
		LDX	#BRKTAB		; point to breakpoint table                 
		LDB	#8			; eight breakpoints                         
GOEX3	LDY	,X++			; get breakpoint address                    
		BEQ	GOEX4		; no breakpoint, quit                       
		LDA	,Y			; get opcode                                
		STA	,X			; save in table                             
		LDA	#$3F			; get 'swi' breakpoint opcode               
		STA	,Y			; save in code space                        
GOEX4	LEAX	1,X			; advance to next in table                  
		DECB				; reduce count of brkpts                    
		BNE	GOEX3		; do all eight                              
		LDS	SAVS			; restore stack pointer                     
		LDA	SAVCC		; get saved cc                              
		LDB	SAVDP		; get saved dpr                             
		PSHS	A,B			; save on stack for last restore            
		LDD	SAVA			; restore a, b registers                    
		LDX	SAVX			; restore x register                        
		LDY	SAVY			; restore y register                        
		LDU	SAVU			; restore u register                        
		PULS	CC,DP		; restore cc + dp                           
		JMP	[SAVPC]		; execute user pgm                          
		
;
; 'RR' - REPEATING READ
;
RDLOOP	LBSR	GETADR		; get address                                      
		TFR	D,X			; set up 'x'                                       
		LBSR	LFCR			; new line                                         
RDLP1	LDA	,X			; read location                                    
		LBSR	CHKCHR		; abort?                                           
		BNE	RDLP1		; no, its ok                                       
		RTS                                                                    
		                                                                           
;                                                                                
; 'RW' - REPEATING WRITE                                                         
;                                                                                
WRLOOP	LBSR	GETADR		; get address                                      
		TFR	D,X			; set up 'x'                                       
		LBSR	SPACE		; space over                                       
		LBSR	GETBYT		; get data                                         
		LBNE	ERROR		; invalid                                          
		PSHS	A			; save acca                                        
		LBSR	LFCR			; new line                                         
WRLP1	LDA	,S			; get char                                         
		STA	,X			; write it out                                     
		LBSR	CHKCHR		; abort command?                                   
		BNE	WRLP1		; continue                                         
		PULS	A,PC			; go home                                          
	                                                                                
;                                                                                
; 'XR' - REPEATING 16 BIT READ                                                   
;                                                                                
;XRLOOP	LBSR	GETADR		; get address                                      
;		TFR	D,X			; set up 'x'                                       
;		LBSR	LFCR			; new line                                         
;XRLP1	LDD	,X			; read location                                    
;		LBSR	CHKCHR		; abort?                                           
;		BNE	XRLP1		; no, its ok                                       
;		RTS
		
;
; 'XW' - REPEATING 16 BIT WRITE
;
;XWLOOP	LBSR	GETADR		; get address                  
;		TFR	D,X			; set up 'x'                   
;		LBSR	SPACE		; space over                   
;		LBSR	GETADR		; get data                     
;		PSHS	A,B			; save acca                    
;		LBSR	LFCR			; new     line                 
;XWLP1	LDD	,S			; get char                     
;		STD	,X			; write it out                 
;		LBSR	CHKCHR		; abort command?               
;		BNE	XWLP1		; continue                     
;		PULS	A,B,PC		; go home                      
	                                                            
;
; 'ZI' - ZILOG CIO INIT
;
ZINIT:	LDA	CIOCTL		; reset the chip to a known state and then clear the reset                      
		BSR	ZINIT1      ; a read will force the z8536 into state 0 if in state 1, otherwise it will     
						; not cause any changes                                                                                                                                    
        CLRA			; if the z8536 was reset, writing a 0 will force it into state 0. if in         
		STA	CIOCTL		; state 0, this will set the pointer to register 0 and go to state 1.           
		BSR	ZINIT1		
		LDA	CIOCTL		; another read operation will force the 8536 into state 0, from where further   
		BSR	ZINIT1		; instructions can be done                                                      
        CLRA            ; set address pointer to master interrupt control register (addr 0)             
		STA	CIOCTL	                                                                                        
		BSR	ZINIT1		
		LDA	#1			; reset the z8536 by enabling the reset bit (b0)                                
		STA	CIOCTL		                                                                                    
		BSR	ZINIT1		; next, by writing a 0 to register 0 during reset, the reset will be cleared.   
		CLRA			; successive writes can only be done during reset (during normal operation,     	
		STA	CIOCTL	    ; successive writes will change the address pointer to that output value).                                                                                      
        LBRA LFCR       ; exit via new line                                                             
ZINIT1  NOP
		NOP
		NOP
		RTS		
	                                                                                                             
;
; 'ZR' - ZILOG CIO READ
;
ZREAD:	LDA	CIOCTL		; read CIO control register to get to state 0
		LBSR	GETBYT		; get register number using getbyt ( --> A)                         
		ANDA	#$3F			; make sure it's in range                                           
		STA	CIOCTL		; set the address pointer to the desired register                   
		LDA	#'= 			; print a '=' as separator                                          
		LBSR	PUTCHR		                                                                        
		LDA	CIOCTL		; read the contents of the register                                 
		LBSR	HEXOUT		; display the contents                                              
        LBRA LFCR           ; exit via new line                                                             
	
;
; 'ZW' - ZILOG CIO WRITE
;
ZWRITE:	LDA  CIOCTL         ; read CIO control register to get to state 0
		LBSR	GETBYT		; get register number using GETBYT ( --> A)
        ANDA #$3F           ; make sure it's in range                                           
        STA  CIOCTL         ; set the address pointer to the desired register                   
		LDA	#': 			; print a ':' as separator
		LBSR	PUTCHR		
		LBSR	GETBYT		; get data value using GETBYT ( --> A)
		STA	CIOCTL
        LBRA LFCR           ; exit via new line                                                             
	
;
; RTCINIT
; Initialize RTC 
;
;RTCINIT	LDA	#(RTC.B0+RTC.STOP)	
;		STA	RTCCTL		; set the STOP bit
;		LDA	#76
;		BSR	DELAY		; wait 244us
;		LDA	#(RTC.B1+RTC.STOP)
;		STA	RTCCTL		; Select BANK 1
;		LDX	#RTCBASE
;R1?		CLR	,X+			; Clear RTC registers 1-14 in bank 1
;		CMPX	#RTCBASE+15	; cleared RTCBASE+0..14?
;		BNE	R1?
;		LDA	#(RTC.B2+RTC.STOP)	
;		STA	RTCCTL      	; Select BANK 2
;		LDX	#RTCBASE			
;R2?		CLR	,X+			; Clear RTC registers 1-14 in bank 2
;		CMPX	#RTCBASE+15    ; cleared RTCBASE+0..14?
;		BNE	R2?
;		LDA	#(RTC.B0+RTC.STOP)
;		STA	RTCCTL      	; Select BANK 0
;		LDX	#RTCBASE				
;R0?  	CLR	,X+			; Clear RTC registers 1-14 in bank 0
;		CMPX	#RTCBASE+15	; cleared RTCBASE+0..14?
;		BNE	R0?            
;		LDA	#RTC.B0
;		STA	RTCCTL		; Clear the STOP bit
;          LBRA LFCR           ; exit via new line                                                             
	
;                                                                           
; DELAY                                                                     
; delay about 3us per acc-A LSB (used for RTC access)                           
;                                                                           
;D0?       NOP                                                               
;          NOP                                                               
;          NOP                                                               
;          NOP                                                               
;DELAY     DECA                                                              
;          BNE  D0?                                                          
;          RTS                                                               
	
;
; RTCREAD
; Read RTC registers and display time
;
;RTCREAD	LDX	#DSPBUF		; point to disassembly buffer space
;		BSR	RTCMSG		; build RTC time and date message at X
;		LBSR	WRLIN		; print it out
;		LBRA	LFCR			; return via CR-LF
		
;
; RTCMSG - build time/date string at X
;	
;RTCMSG	PSHS	X			; save pointer to buffer space
;		LDA	RTCCTL		; check the busy bit
;		BITA	#1			; mask all but the BUSY bit
;		BEQ	RTCR.1
;		LDA	#76
;		BSR	DELAY		; wait 244us
;		BRA	RTCREAD		; check BUSY bit again
;RTCR.1	LDA	#(RTC.B0)
;		STA	RTCCTL    	; Select BANK 0
;		LDY	#RTCTBL		; put address of display table into Y
;RTCR.2    LDX	#RTCBASE		; put RTC register base into X
;		LDB	,Y+			; get first table byte (reg offset)
;		BMI	RTCR.3		; if negative, table is done!
;		BITB	#64			; test for skip (when no RTC read is necessary)
;		BNE	RTCR.4		; yes, skip reading RTC this entry
;		ABX				; add reg offset to reg base
;		LDA	,X			; get RTC register value
;RTCR.4	PULS	X
;		PSHS	X			; copy saved buffer space pointer to X
;		LDB	,Y+			; get second table byte (DSPBUF offset)
;		ABX				; add disp table offset to base
;		ANDA	,Y+			; AND the register value with third table byte
;		ORA	,Y+			; OR the register value with fourth table byte
;		STA	,X			; put the ASCII byte value into the display table buffer		
;		BRA	RTCR.2		; process next table entry
;RTCR.3    PULS	X,PC			; restore buffer space pointer

;
; RTCSET
; Set RTC time and date registers 
;
;RTCSET	LDA	#(RTC.B0+RTC.STOP)	
;		STA	RTCCTL		; set the STOP bit
;		LDA	#77
;		LBSR	DELAY		; wait 122us
;		LDX	#RTCBASE	
;		LBSR	GETNIB		; get hours 10's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#3			; max value is 2
;		BHS	RTX?
;		STA	5,X
;		LBSR	GETNIB		; get hours 1's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	4,X
;		LDA	#': 
;		LBSR	PUTCHR
;		LBSR	GETNIB		; get minutes 10's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#6			; max value is 5
;		BHS	RTX?
;		STA	3,X
;		LBSR	GETNIB		; get hours 1's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	2,X
;		LDA	#': 
;		LBSR	PUTCHR
;		LBSR	GETNIB		; get seconds 10's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#6			; max value is 5
;		BHS	RTX?
;		STA	1,X
;		LBSR	GETNIB		; get seconds 1's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	,X
;		BRA	RT1?
;RTX?		LBRA	ERROR          ; error exit
;RT1?		LDA	#$20
;		LBSR	PUTCHR
;		LBSR	GETNIB		; get month 10's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#2			; max value is 1
;		BHS	RTX?
;		STA	10,X
;		LBSR	GETNIB		; get month 1's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	9,X
;		LDA	#'/ 
;		LBSR	PUTCHR
;		LBSR	GETNIB		; get day 10's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#4			; max value is 3
;		BHS	RTX?
;		STA	8,X
;		LBSR	GETNIB		; get day 1's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	7,X
;		LDA	#'/ 
;		LBSR	PUTCHR
;		LBSR	GETNIB		; get year 1000's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#3			; max value is 2
;		BHS	RTX?
;		STA	14,X
;		LBSR	GETNIB		; get year 100's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	13,X
;		LBSR	GETNIB		; get year 10's
;		BNE	RTX?			; if carry is clear, error!
;		CMPA	#10			; max value is 9
;		BHS	RTX?
;		STA	12,X
;		LBSR	GETNIB		; get year 1's
;		BNE	RTX?			; if carry is clear, error!	
;		CMPA	#10			; max value is 9
;		BHI	RTX?
;		STA	11,X
;		LDA	#(RTC.B0)	
;		STA	RTCCTL		; set the STOP bit
;          LBRA LFCR           ; return via CR-LF
		
;
; 'TN' - enable/disable RTC timer NMI 
;
;RTCINTS
;		LBSR	GETNIB       	; get the enable/disable 
;		CMPA	#1	          ; is it 1 for enable?
;		BEQ	RTCN.1		;    yes, setup timer ints
;
;		LDD	#NMI			; disable the timer and timer interrupt 
;		STD	NMIADR
;		LDA	#(RTC.B2+RTC.STOP)	
;		STA	RTCCTL		; set the STOP bit
;		CLR	RTCBASE+14	; clear the TIE and TF bits
;RTCN.0	LDA	#(RTC.B0)	
;		STA	RTCCTL		; restart everything
;		LBRA	LFCR			; return via CR-LF	
;
;RTCN.1	LDD	#RTCISR		; enable the timer and timer interrupt
;		STD	NMIADR
;          LDA	#(RTC.B2+RTC.STOP)	
;		STA	RTCCTL		; set the STOP bit
;		CLR	RTCBASE+14	; clear the TIE and TF bits
;		LDA	#8			; put $80 in the reload value (4 second period)
;		STA	RTCBASE+5
;		CLR	RTCBASE+4
;		LDA	#%00001101	; set TI/TP, TE, source = 64Hz		; 
;		STA	RTCBASE+8
;		LDA	#$1      		; enable the Timer Interrupt
;		STA	RTCBASE+14
;		BRA	RTCN.0		; reutrn via the tail of the disable code
	
;
; LED blinking NMI/IRQ service routine
;
RTCISR	EIM	#%00000010,IOPORT	; toggle IOPORT bit 1 (LED #2)
		RTI

;
; 'MT' - MEMORY TEST
;
RAMTEST	LBSR	GETRNG		; get address range                     
		STD	TEMP			; save ending address                   
		LDD	#-1			; begin with negative 1                 
		STD	DSPBUF		; save pass count                       
		LBSR	LFCR			; new line                              
		TFR	X,Y			; copy starting address                 
RAM0		CLR	,X+			; zap one byte                          
		CMPX	TEMP			; are we over?                          
		BLS	RAM0			; no, clear em all                      
RAM1		TFR	Y,X			; reset starting address                
		LDA	#$0D			; get cr                                
		LBSR	PUTCHR		; back to start of line                 
		LBSR	WRMSG		; output message                        
		FCN	'Pass: '                                             
		LDD	DSPBUF		; get counter                           
		ADDD	#1			; advance pass count                    
		STD	DSPBUF		; resave                                
		LBSR	WRDOUT		; output                                
		LBSR	SPACE		; space over                            
RAM2		LBSR	CHKCHR		; character ready?                      
		BEQ	RAM5			; escape, quit & restart monitor        
		LDB	DSPBUF+1		; get expected value                    
		CMPB	,X			; did it keep its value                 
		BNE	RAM7			; no, error                             
		LDA	#%00000001	; first data value                      
RAM3		STA	,X			; resave it                             
		CMPA	,X			; same ?                                
		BNE	RAM6			; failed                                
		LSLA				; shift the bit                         
		BNE	RAM3			; continue till all done                
RAM4		INCB				; advance to next value                 
		STB	,X+			; save register                         
		CMPX	TEMP			; are we in range?                      
		BLS	RAM2			; yes, its ok                           
		BRA	RAM1			; and restart                           
RAM5		LBSR	LFCR			; new line                              
		LBRA	MAIN			; and restart monitor                   
; VERIFY OF LOCATION FAILED                                         
RAM6		PSHS	A			; save value written                    
		LBSR	WRMSG		; output message                        
		FCN	'Addr: '                                             
		TFR	X,D			; get address                           
		LBSR	WRDOUT		; output                                
		LBSR	WRMSG		; output message                        
		FCN	', Wrote: '                                          
		PULS	A			; restore value                         
		LBSR	HEXOUT		; output                                
		LBSR	WRMSG		; output message                        
		FCN	', Read: '                                           
		LDA	,X			; get value read                        
		BRA	RAM8			; continue                              
; DATA WAS CORRUPTED BY OTHER WRITES
RAM7		LBSR	WRMSG		; output message        
		FCN	'Addr: '                               
		TFR	X,D			; get addr              
		LBSR	WRDOUT		; output                
		LBSR	WRMSG		; output message        
		FCN	', Expected: '                         
		LDA	DSPBUF+1		; get value             
		LBSR	HEXOUT		; output                
		LBSR	WRMSG		; output message        
		FCN	', Read: '                             
		LDA	,X			; get value back        
RAM8		LBSR	HEXOUT		; output value          
		LBSR	LFCR			; new line              
		LDB	DSPBUF+1		; get correct next value
		LBRA	RAM4
		
;
; '+' - Hexadecimal ADDITION
;
HEXADD	LBSR	GETADR		; get first value                                        
		PSHS	A,B			; save it                                                
		LDA	#'+ 			; plus sign                                              
		LBSR	PUTCHR		; display                                                
		LBSR	GETADR		; get second value                                       
		ADDD	,S			; perform addition                                       
		BRA	HEXSHO		; display it                                             
;                                                                                      
; '-' - Hexadecimal SUBTRACTION                                                        
;                                                                                      
HEXSUB	LBSR	GETADR		; get first                                              
		PSHS	A,B			; save it                                                
		LDA	#'- 			; minus sign                                             
		LBSR	PUTCHR		; display                                                
		LBSR	GETADR		; get second address                                     
		PSHS	A,B			; save it                                                
		LDD	2,S			; get first value                                        
		SUBD	,S++			; perform subtraction                                    
HEXSHO	STD	,S			; save result                                            
		LDA	#'= 			; equals sign                                            
		LBSR	PUTCHR		; display                                                
		PULS	A,B			; restore result                                         
		LBSR	WRDOUT		; output                                                 
		LBRA	LFCR			; new line & return                                      
;
; '?' - HELP COMMAND
;
HELP		LDX	#HTEXT		; point to help text                                         
HLP1		LDB	#25			; column counter                                             
HLP2		LDA	,X+			; get char from text                                         
		BEQ	HLP4			; exit this line                                             
		CMPA	#'| 			; seperator?                                                 
		BEQ	HLP3			;    yes, exit                                                  
		LBSR	PUTCHR		; output                                                     
		DECB				; backup                                                     
		BRA	HLP2			; next                                                       
HLP3		LBSR	SPACE		; output space                                               
		DECB				; reduce count                                               
		BNE	HLP3			; keep going                                                 
		LBSR	WRMSG		; output message                                             
		FCN	'- '			; seperator                                                  
		BRA	HLP2			; and continue                                               
HLP4		LBSR	LFCR			; new line                                                   
		LBSR	CHKCHR		; test for character entered                                 
		BEQ	HLP5			; if so, exit                                                
		LDA	,X			; is this the end?                                           
		BPL	HLP1			;    no, keep going                                             
HLP5		RTS

;
; 'DL' - DOWNLOAD
;
LOAD		LDA	IOCON		; GET I/O CONFIG
		PSHS	A			; SAVE
		LBSR	LFCR			; NEW LINE
DLO1		CLR	IOCON		; INDICATE NO OUTPUT, READ UART
		BSR	DLOAD		; DOWNLOAD RECORD
		BCC	DLO2			; END
		LDA	,S			; GET OLD I/O CONFIG
		STA	IOCON		; RESET
		LDA	#'. 			; GET DOT
		LBSR	PUTCHR		; OUTPUT
		BRA	DLO1			; CONTINUE
DLO2		PULS	A			; RESTORE A
		STA	IOCON		; SAVE
		LBRA	LFCR			; New line & return

; Download a record in either MOTOROLA or INTEL hex format
DLOAD	LBSR	GETCHR		; Get a character
		CMPA	#': 			; Start of INTEL record?
		LBEQ	DLINT		; Yes, download INTEL
		CMPA	#'S 			; Start of MOTOROLA record?
		BNE	DLOAD		; No, keep looking
		
; Download a record in MOTOROLA hex format
DLMOT	LBSR	GETCHR		; get next char  
		CMPA	#'0 			; header record? 
		BEQ	DLOAD		;    skip it        
		CMPA	#'5 			; count record?  
		BEQ	DLOAD		;    skip it        
		CMPA	#'9 			; end of file?   
		BEQ	DLMOT9		;    end of file    
		CMPA	#'1 			; should be a data record then!
		BNE	LODERR		; load error     
		LBSR	GETBYT		; get length     
		BNE	LODERR		; report error   
		STA	TEMP			; start checksum 
		SUBA	#3			; convert        
		STA	TEMP+1		; set length     
		LBSR	GETBYT		; get first byte of address
		BNE	LODERR		; report error   
		TFR	A,B			; save for later 
		ADDA	TEMP			; include in checksum
		STA	TEMP			; resave         
		LBSR	GETBYT		; get next byte of address
		BNE	LODERR		; report error   
		EXG	A,B			; swap           
		TFR	D,X			; set pointer    
		ADDB	TEMP			; include in checksum
		STB	TEMP			; resave checksum
DLMOT1	LBSR	GETBYT		; get a data byte
		STA	,X+			; Save in RAM
		ADDA	TEMP			; Include checksum
		STA	TEMP			; Resave
          DEC  TEMP+1         ; Reduce length                          
          BNE  DLMOT1         ; do them all                            
		LBSR	GETBYT		; get a byte                             
		ADDA	TEMP			; add computed checksum                  
		INCA				; test for success                       
		BEQ	DLRTS		; download ok                            
		
; Error occured on loading                                             
LODERR	LDA	#3			; get default i/o                        
		STA	IOCON		; set i/o                                
		LBSR	WRMSG		; output                                 
		FCC	' ?Load error'                                          
		FCB	$FF                                                     
		LBRA	MAIN			; go back for command                       
		
; properly handle S9 end record		
DLMOT9	LBSR GETBYT		; get length byte
          BNE  LODERR		; report error               
          STA  TEMP+1		; save length
DLMOT91   LBSR GETBYT		; get next byte
          DEC  TEMP+1		; Reduce length                          		
          BNE  DLMOT91		; get all the bytes

; set C flag to signal another record needed / clear if end of file
DLEOF 	ANDCC #$FE		; clear the 'c' flag to indicate end of file
		RTS
DLRTS 	ORCC #$01           ; set 'c' flag to indicate another record        		
		RTS

; Download record in INTEL format                                          		
DLINT 	LBSR GETBYT         ; Get count                                        		
		BNE  LODERR         ; Report error                                          		
		STA  TEMP      	; Start checksum                                             		
		STA  TEMP+1         ; Record length                                         		
		CMPA #0        	; Test & clear C                                             		
		BEQ	DLEOF		; End of file
; Get address
		LBSR	GETBYT		; Get first byte of address
		BNE	LODERR		; Report error
		TFR	A,B			; Save for later
		ADDA	TEMP			; Include in checksum
		STA	TEMP			; Resave
		LBSR	GETBYT		; Get next byte of address
		BNE	LODERR		; Report error
		EXG	A,B			; Swap
		TFR	D,X			; Set pointer
		ADDB	TEMP			; Include in checksum
		STB	TEMP			; Resave checksum
; Get record type
		LBSR	GETBYT		; Get type value
		BNE	LODERR		; Report error
		ADDA	TEMP			; Include checksum
		STA	TEMP			; Resave checksum
; Get data bytes
DLINT1	LBSR	GETBYT		; Get data byte
		BNE	LODERR		; Report error
		STA	,X+			; Write to memory
		ADDA	TEMP			; Include checksum
		STA	TEMP			; Resave checksum
		DEC	TEMP+1		; Reduce length
		BNE	DLINT1		; Do them all
; Get checksum
		JSR	GETBYT		; Read a byte
		BNE	LODERR		; Report error
		ADDA	TEMP			; Include checksum
		BEQ	DLRTS		; Report success
		LBRA	LODERR		; Report failure
		
;
; GETS AN ADDRESS, DEFAULTS TO (PC)
;
GETPC	BSR	GETAD1		; Get address
		BEQ	GETPC1		; Normal data
		CMPA	#$20			; Space?
		BNE	GETERR		; Report error
		LBSR	WRMSG		; Output message
		FCN	'->'			; Display address
		LDD	SAVPC		; Get PC value
		LBRA	WRDOUT		; Display
GETPC1	STD	SAVPC		; Set new PC
		RTS
		
;
; GETS A RANGE OF ADDRESS, RETURNS WITH START IN X, END IN D
;
GETRNG	BSR	GETADR		; Get first address
		TFR	D,X			; Save in X
		LDA	#', 			; Separator
		LBSR	PUTCHR		; Display
		BSR	GETAD1		; Get second address
		BEQ	DLEOF		; Normal data
		CMPA	#$20			; Space?
		BNE	GETERR		; No, report error
		LBSR	WRMSG		; Output message
		FCN	'FFFF'
		LDD	#$FFFF		; Assume top of RAM
		RTS
		
;
; GETS AN ADDRESS (IN D) FROM THE INPUT DEVICE
;
GETADR	BSR	GETAD1		; Get word value
		BEQ	GETAD2		; Its OK
GETERR	LBRA	ERROR		; Report error
; Get word value without error checking
GETAD1	BSR	GETBYT		; Get HIGH byte
		BNE	GETAD3		; Test for special register
		TFR	A,B			; Copy for later
		BSR	GETBYT		; Get LOW byte
		BNE	GETERR		; Report error
		EXG	A,B			; Correct order
GETAD2	RTS
; Handle special register names
GETAD3	PSHS	X			; Save X
		LDX	SAVX			; Assume X
		CMPA	#'X 			; Is it X?
		BEQ	GETAD4		; Yes
		LDX	SAVY			; Assume Y
		CMPA	#'Y 			; Is it Y?
		BEQ	GETAD4		; Yes
		LDX	SAVU			; Assume U
		CMPA	#'U 			; Is it U?
		BEQ	GETAD4		; Yes
		LDX	SAVX			; Assume S
		CMPA	#'S 			; Is it S?
		BEQ	GETAD4		; Yes
		LDX	SAVPC		; Assume PC?
		CMPA	#'P 			; Is it PC?
		BNE	GETAD5		; No, error
GETAD4	LDA	#'= 			; Separator
		LBSR	PUTCHR		; Echo it
		TFR	X,D			; D = value
		BSR	WRDOUT		; Display it
		CLRA				; Set 'Z'
		TFR	X,D			; Get value back
GETAD5	PULS	X,PC			; Restore & return	

;
; GETS A SINGLE BYTE (IN HEX) FROM THE INPUT DEVICE
;
GETBYT	BSR	GETNIB		; Get FIRST nibble
		BNE	GETB3		; Invalid, test for quote
		LSLA				; Rotate
		LSLA				; into
		LSLA				; high
		LSLA				; nibble
		PSHS	A			; Save for later
		BSR	GETNIB		; Get SECOND nibble
		BNE	GETB2		; Report error
		ORA	,S			; Include high
GETB4	ORCC	#$04			; Indicate success (SET 'Z')
GETB2	LEAS	1,S			; Skip saved value
GETB1	RTS
GETB3	CMPA	#$27			; Single quote?
		BNE	GETB1		; No, abort
		LBSR	GETCHR		; Get ASCII character
		LBSR	PUTCHR		; Echo on terminal
		ORCC	#$04			; Indicate success (SET 'Z')
		RTS
		
;
; GETS A SINGLE HEX NIBBLE FROM THE INPUT DEVICE
;
GETNIB	LBSR	GETECH		; Get character
		SUBA	#'0 			; Convert numbers
		CMPA	#9			; Numeric?
		BLS	GETN1		; Yes, OK
		SUBA	#7			; Convert alphas
		CMPA	#$A			; Under?
		BLO	GETN2		; Yer, error
		CMPA	#$F			; Over?
		BHI	GETN2		; Yes, error
GETN1	ORCC	#$04			; SET 'Z' FLAG, INDICATE OK
		RTS
GETN2	ADDA	#$37			; Normalize character + clear Z
		RTS
		
;
; OUTPUT A WORD (IN HEX) FROM REGISTER D
;
WRDOUT	BSR	HEXOUT		; Output first byte
		TFR	B,A			; Get second byte
;
; OUTPUT A BYTE (IN HEX) FROM REGISTER A
;
HEXOUT	PSHS	A			; Save low nibble
		LSRA				; Rotate
		LSRA				; upper nibble
		LSRA				; into
		LSRA				; lower nibble
		BSR	HOUT			; Output high nibble
		PULS	A			; Rertore low nibble
		
;
; OUTPUT A NIBBLE (IN HEX) FROM REGISTER A
;
HOUT		ANDA	#$0F			; Remove upper half
		ADDA	#'0 			; Convert to printable
		CMPA	#'9 			; In range?
		BLS	HOUT1		; Yes, display
		ADDA	#7			; Convert to alpha
HOUT1	BRA	PUTCHR		; Output character

;
; WRITE ERROR MESSAGE FOLLOWING TEXT
;
WRMSG	PSHS	X			; save x                                     
		LDX	2,S			; get old pc                                 
		BSR	WRLIN		; output line                                
		STX	2,S			; update old pc                              
		PULS	X,PC			; restore x, return                          
		                                                                     
;                                                                          
; DISPLAY MESSAGE(X)                                                       
;                                                                          
WRLIN	LDA	,X+			; get char from message                      
		BEQ	WRLND		; end, quit                                  
		CMPA	#$FF			; newline end, lfcr & exit                   
		BEQ	LFCR			; if so, new line, return                    
		BSR	PUTCHR		; output to term                             
		BRA	WRLIN		; keep going                                 
WRLND	RTS                                                              

;
; GET CHAR. FROM TERMINAL, AND ECHO
;
GETECH	BSR	GETCHR		; get character              
		CMPA	#$20			; space?                     
		BLS	WRLND		; if < don't display         
		CMPA	#$61			; lower case?                
		BLO	PUTCHR		; ok                         
		ANDA	#$5F			; convert to upper           
		BRA	PUTCHR		; echo                       
		
;
; DISPLAY A SPACE ON THE TERMINAL
;
SPACE	PSHS	A			; save a                   
		LDA	#$20			; get space                
		BRA	LFC1			; dislay and go home       
		                                                   
;
; DISPLAY LINE-FEED, CARRIAGE RETURN ON TERMINAL
;
LFCR		PSHS	A			; save                        
		LDA	#$0A			; get lf                      
		BSR	PUTCHR		; output                      
		LDA	#$0D			; get cr                      
LFC1		BSR	PUTCHR		; output                      
		PULS	A,PC			; restore and go home         
		
;
; READ A CHARACTER FROM SELECTED INPUT DEVICE
;
GETCHR	PSHS	X			; save 'x'                
		LDX	>UART1		; point to console        
		LDA	IOCON		; get i/o config          
		LSRA				; shift to carry          
		BCS	GETC1		; read from uart          
		LDX	>UART2		; point to aux uart       
GETC1	LBSR	READ			; read terminal           
		BNE	GETC1		; keep trying             
		PULS	X,PC
;
; WRITE A CHARACTER TO ALL ENABLED OUTPUT DEVICES
;
PUTCHR	PSHS	A,B,X          ; save regs             
		LDB	IOCON	     ; get i/o config             
		BITB	#2			; write to term?                  
		BEQ	PUT1			; no, try uart                    
		LDX	>UART1	     ; point to uart1             
		LBSR	WRITE	     ; output to terminal         
PUT1		LDB	IOCON	     ; incase corrupted           
		BITB	#4			; write to uart?                  
		BEQ	PUT2			; no, skip it                     
		LDX	>UART2	     ; point to uart2             
		LBSR	WRITE	     ; output to uart             
PUT2		PULS	A,B,X,PC		; restore and go home             

;
; CHECK FOR <ESC> FROM TERMINAL. ALSO PERFORM <SPACE>, <CR>
; SCREEN OUTPUT FLOW CONTROL.
;
CHKCHR	PSHS	X	     	; save ptr              
		LDX	>UART1	     ; point to console uart 
		LDB	IOCON	     ; get i/o config        
		BMI	CHKC1	     ; already held             
		LBSR	READ			; read terminal              
		CMPA	#$20			; space?                     
		BNE	CHKC3	     ; no, ignore it            
CHKC1	ORB	#%10000000	; set held bit             
		LBSR	READ			; get key from console     
		CMPA	#$20			; space?                   
		BEQ	CHKC2		; yes, allow               
		ANDB	#%01111111	; disable held bit         
		CMPA	#$0D			; carriage return?         
		BEQ	CHKC2		; allow                    
		CMPA	#$1B			; escape?                  
		BNE	CHKC1		; no, ignore               
CHKC2	STB	IOCON		; resave i/o config byte   
CHKC3	CMPA	#$1B			; test for escape character
		PULS	X,PC
		
;
; STEP ONE INSTRUCTION
;
STEPDI	LDY	SAVPC		; get pc                  
		LDU	#DSPBUF		; get input buffer        
		LBSR	DISASS		; display                 
		TFR	U,X			; point to it             
		LBSR	WRLIN		; display                 
		BRA	STEPCE		; and perform step        
		                                                  
;
; STEP WITHOUT DISPLAYING INSTRUCTION
;
STEP		LDY	SAVPC		; get program counter                    
		LDU	#DSPBUF		; point to free ram for disasembly output
		LBSR	DISASS		; perform disassembly                    
STEPCE	STY	SAVPC		; save new pc                            
		LDU	PTRSAV		; get pointer back                       
		LDD	,U+			; get opcode                             
; TEST FOR LONG CONDITIONAL BRANCHES
LCBRAN	CMPA	#$10			; prefix?         
		BNE	LOBRAN		; no, got for it  
		LDB	,U			; get opcode      
		CMPB	#$22			; in range?       
		BLO	LOBRAN		; no              
		CMPB	#$2F			; in range?       
		BHI	LOBRAN		; no              
		LDA	,U+			; get opcoide byte
		LBSR	TSTCON		; test conditional
		BEQ	LBRAN1		; yes, do it      
		RTS	
		
; TEST FOR LONG BRANCHES
LOBRAN	CMPA	#$16			; is it lbra?               
		BNE	LBRANS		; no, try lbsr              
LBRAN1	LDD	,U++			; get offset                
		LEAX	D,U			; perform branch            
		BRA	SAVNPC		; save new pc               
		                                                    
; TEST FOR LONG BRANCH TO SUB                             
LBRANS	CMPA	#$17			; 'lbsr'?                   
		BNE	SCOBRA		; no, try short conditionals
		LDD	,U++			; get offset                
		LEAX	D,U			; set up address            
		BRA	SAVSTK	
		
; TEST FOR SHORT CONDITIONAL BRANCHES
SCOBRA	CMPA	#$22			; < 'bhi'?                    
		BLO	SHBRAN		; no, try short branches      
		CMPA	#$2F			; > 'ble'?                    
		BHI	SHBRAN		; no, try short branches      
		LBSR	TSTCON		; see of conditional is ok    
		BEQ	SBRAN1		; yes, do it                  
		RTS                                               
		                                                      
; TEST FOR SHORT BRANCHES                                   
SHBRAN	CMPA	#$20			; short branch?               
		BNE	SBRANS		; no, try short branch to sub 
SBRAN1	LDB	,U+			; get offset                  
		LEAX	B,U			; emulate jump                
		BRA	SAVNPC		; save new pc                 
		
; TEST FOR SHORT BRANCH TO SUBROUTINE
SBRANS	CMPA	#$8D			; 'bsr'?                   
		BNE	TSTTFR		; no, try transfer         
		LDB	,U+			; get offset               
		LEAX	B,U			; perform branch           
SAVSTK	LDY	SAVS			; get stack pointer        
		STU	,--Y			; push address             
		STY	SAVS			; resave                   
SAVNPC	STX	SAVPC		; save it                  
		RTS	                                           
		                                                   
; TEST FOR TRANSFER                                      
TSTTFR	CMPA	#$1F			; transfer?                
		BNE	TSTEXG		; no, try exchange         
		BSR	LOKREG		; lookup register          
		RTS
		
; LOOKUP REGISTER, AND SIMULATE IF PC XFER OR EXCHANGE
LOKREG	LDA	,U			; get postbyte                                
		ANDA	#$0F			; remove high register                        
		CMPA	#5			; is it pc?                                   
		BNE	LOK1			; no, it's ok to execute                      
		LDA	,U			; get reg postbyte back                       
		LSRA				; shift                                       
		LSRA				; high register                               
		LSRA				; to low (leave x 2)                          
LOK2	LDX	#TFREGT			; point to table                              
		ANDA	#$0F			; insure we get valid reg                     
		LDX	A,X			; get address of variable                     
		LDD	,X			; get register value                          
		BRA	STDPC		; save it                                     
LOK1		LEAS	2,S			; skip last call                              
		LBRA	NOREXE		; execute normal instruction                  
		                                                                      
; TEST FOR EXCHANGE                                                         
TSTEXG	CMPA	#$1E			; is it exchange                              
		BNE	TSTRTS		; no, try rts                                 
		LDY	SAVPC		; get old pc value                            
		LDA	,U			; get register                                
		ANDA	#$F0			; use high only                               
		CMPA	#$50			; is pc first?                                
		BNE	TSTE1		; no, skip                                    
		LDA	,U			; get reg back                                
		LSLA				; double                                      
		BSR	LOK2			; get address of reg to swap with             
		BRA	TSTE2		; perform move to pc                          
TSTE1	BSR	LOKREG		; get register see if pc is low register      
TSTE2	STY	,X			; save pc in register                         
		RTS                                                               
		                                                                      
; TEST FOR 'RTS' INSTRUCTIONS                                               
TSTRTS	CMPA	#$39			; is it 'rts'                                 
		BNE	TPULS		; no, try puls                                
		LDU	SAVS			; point to stack                              
		PULU	A,B			; get data                                    
		STU	SAVS			; resave sp                                   
STDPC	STD	SAVPC                                                        
		RTS                                                               
	                                                                           
; TEST FOR 'PULS' INSTRUCTION                                               
TPULS	CMPA	#$35			; pulling from s?                             
		BNE	TPULU		; no, try pulu                                
		LDX	SAVS			; get saved 's' reg                           
		LDY	#PULSTAB		; point to table                              
		BSR	DOPUL		; perform pull                                
		STX	SAVS			; resave new 's' register                     
		RTS	                                                              
	                                                                           
; TEST FOR A 'PULU' INSTRUCTION                                             
TPULU	CMPA	#$37			; is it 'pulu'?                               
		BNE	JSREXT		; no, try jsr extended                        
		LDX	SAVU			; get saved 'u'                               
		LDY	#PULUTAB		; point to table                              
		BSR	DOPUL		; perform pull                                
		STX	SAVU			; resave 's'                                  
		RTS	                                                              
	                                                                           
; PERFORM PUL OPERATIONS                                                    
DOPUL	LDA	,U			; get postbyte                                
		LDB	#4			; test for first four bits (8 bit reg)        
DOPUL1	DECB				; decrement count                             
		LSRA				; shift                                       
		BCC	DOPUL2		; nothing, go again                           
		PSHS	A,B			; save regs                                   
		TSTB				; are we into 16 bits?                        
		BMI	PUL16		; yes, perform 16 bits                        
		LDA	,X+			; pull a byte                                 
		STA	[,Y++]		; save in register                            
		BRA	DOPUL3		; go again                                    
PUL16	LDD	,X++			; get 16 bit value                            
		STD	[,Y++]		; save in register                            
DOPUL3	PULS	A,B			; restore                                     
		BRA	DOPUL1		; continue                                    
DOPUL2	LEAY	2,Y			; advance                                     
		TSTA				; are we done?                                
		BNE	DOPUL1		; continue                                    
		RTS                                                               
			                                                                 
; TEST FOR 'JSR' EXTENDED                                                   
JSREXT	CMPA	#$BD			; is it extended jsr                          
		BNE	JMPEXT		; no, try jump extended                       
		BSR	DJMPEX		; fake jump                                   
		BRA	PSHPC		; save pc                                     
		                                                                      
; TEST FOR 'JMP' EXTENDED                                                   
JMPEXT	CMPA	#$7E			; is it jmp extended?                         
		BNE	JSRDIR		; no, try jmp direct                          
DJMPEX	LDD	,U++			; get address                                 
		BRA	STDPC		; save it                                     
		                                                                      
; TEST FOR 'JSR' DIRECT                                                     
JSRDIR	CMPA	#$9D			; 'jsr' direct page?                          
		BNE	JMPDIR		; no, try jump                                
		BSR	DJMPDI		; do it                                       
		BRA	PSHPC		; save pc                                     
		                                                                      
; TEST FOR 'JMP' DIRECT PAGE                                                
JMPDIR	CMPA	#$0E			; is it jump direct page?                     
		BNE	JSRIND		; no, try jump indexed                        
DJMPDI	LDB	,U+			; get low address                             
		LDA	SAVDP		; get direct page                             
		BRA	STDPC		; save it                                     
		                                                                      
; TEST FOR 'JSR' INDEXED                                                    
JSRIND	CMPA	#$AD			; is it 'jsr' indexed?                        
		BNE	JMPIND		; no, try next                                
		BSR	DJMPIN		; do it                                       
PSHPC	LDX	SAVS			; get address                                 
		STU	,--X			; save                                        
		STX	SAVS			; resave                                      
		RTS	                                                              
		                                                                      
; TEST FOR 'JMP' INDEXED                                                    
JMPIND	CMPA	#$6E			; is it jump indexed?                         
		LBNE	NOREXE		; no, non-transfer instruction                
	
; FIRST POINT Y AT REGISTER INVOLVED
DJMPIN	LDA	,U+			; get postbyte                                                
		PSHS	A			; save it                                                     
		ANDA	#%01100000	; save only register                                          
		LSRA				; convert                                                     
		LSRA				; register                                                    
		LSRA				; into index value                                            
		LSRA				; shift it over                                               
		LDX	#INDTAB		; point to table                                              
		LDY	A,X			; get register address                                        
		STY	TEMP			; save for inc/dec                                            
		LDY	,Y			; get register contents                                       
		LDA	,S			; get postbyte back                                           
		BMI	NOT5BO		; not a five bit offset                                       
		                                                                                      
; FIVE BIT REGISTER OFFSET                                                                  
		ANDA	#%00011111	; save only offset                                            
		CMPA	#%00010000	; negative?                                                   
		BLO	SINOK		; no, it's ok                                                 
		ORA	#%11100000	; convert to negative                                         
SINOK	LEAX	A,Y			; get address                                                 
		BRA	XSAVPC		; save it                                                     
		                                                                                      
; TEST FOR NO OFFSET                                                                        
NOT5BO	ANDA	#%10001111	; remove register & indirect bit                              
		CMPA	#$84			; no offset?                                                  
		BNE	TOFF8		; no, try offset of 8                                         
		TFR	Y,X			; copy                                                        
		BRA	XSAVPC		; save it                                                     
		                                                                                      
; TEST FOR EIGHT BIT OFFSET                                                                 
TOFF8	CMPA	#$88			; 8 bit ofset?                                                
		BNE	TOFF16		; no, try 16 bit offset                                       
		LDB	,U+			; get offset                                                  
		BRA	BSAVOF		; go for it                                                   
	                                                                                           
; TEST FOR 16 BIT OFFSET                                                                    
TOFF16	CMPA	#$89			; 16 bit offset?                                              
	BNE	TOFFA			; try a accumulator offset                                    
	LDD	,U+				; get offset                                                  
	LEAX	D,Y				; do it                                                       
	BRA	XSAVPC			; save it                                                     
	                                                                                           
; TEST FOR ACCA OFFSET                                                                      
TOFFA	CMPA	#$86			; offset by acca                                              
		BNE	TOFFB		; no, try b                                                   
		LDB	SAVA			; get acca                                                    
		BRA	BSAVOF		; save it                                                     
	                                                                                           
; TEST FOR ACCB OFFSET                                                                      
TOFFB	CMPA	#$85			; b offset                                                    
		BNE	TOFFD		; no, try d offset                                            
		LDB	SAVB			; get b                                                       
BSAVOF	LEAX	B,Y			; do offset                                                   
		BRA	XSAVPC		; save it                                                     
	                                                                                           
; TEST FOR ACCD OFFSET                                                                      
TOFFD	CMPA	#$8B			; is it d offset?                                             
		BNE	TAINC1		; no, try auto inc                                            
		LDD	SAVA			; get d accumulator                                           
		LEAX	D,Y			; do it                                                       
		BRA	XSAVPC		; save it                                                     
	                                                                                           
; TEST FOR AUTO INCREMENT                                                                   
TAINC1	CMPA	#$80			; auto inc by 1?                                              
		BNE	TAINC2		; no, try auto inc by 2                                       
		LEAX	,Y+			; get address                                                 
		BRA	RSVREG		; resave register                                             
	                                                                                           
; TEST FOR DOUBLE AUTO INCREMENT                                                            
TAINC2	CMPA	#$81			; auto inc by 1?                                              
		BNE	TADEC1		; no, try auto dec                                            
		LEAX	,Y++			; get address                                                 
		BRA	RSVREG		; resave register                                             
	                                                                                           
; TEST FOR AUTO DECREMENT                                                                   
TADEC1	CMPA	#$82			; auto dec?                                                   
		BNE	TADEC2		; no, try auto dec by two                                     
		LEAX	,-Y			; get address                                                 
		BRA	RSVREG		; resave register                                             
	                                                                                           
; TEST FOR DOUBLE AUTO DECREMENT                                                            
TADEC2	CMPA	#$83			; double auto dec.                                            
		BNE	TPCO8		; no, try pc offset                                           
		LEAX	,--Y			; get offset                                                  
RSVREG	STY	[TEMP]		; resave register contents                                    
XSAVPC	BRA	SAVXPC		; save new pc                                                 

; TEST FOR EIGHT BIT OFFSET FROM PCR
TPCO8	CMPA	#$8C			; 8 bit pc relative?                                   
		BNE	TPCO16		; no, try 16 bit pc relative                           
		LDB	,U+			; get byte                                             
		LEAX	B,U			; offset it                                            
		BRA	SAVXPC		; resave pc                                            
		                                                                               
; TEST FOR 16 BIT OFFSET FROM PCR
TPCO16	CMPA	#$8D			; 16 bit offset                                            
		BNE	TEIND		; no, try extended indirect                                
		LDD	,U++			; get value                                                
		LEAX	D,U			; point to new location                                    
		BRA	SAVXPC		; resave                                                   
		
; EXTENDED ADDRESSING VIA INDEXED POSTBYTE
TEIND	LDX	,U++			; get address        
; SET SAVED PC TO CALCULATED ADDRESS (IN 'X').
; CHECK FOR & PERFORM INDIRECTION IF REQUIRED
SAVXPC	PULS	A			; restore postbyte                      
		BITA	#%00010000	; indirect addressing?                  
		BEQ	NINXIN		; not indirect                          
		LDX	,X			; perform a level of indirection        
NINXIN	STX	SAVPC		; save it                               
		RTS	                                                        
		                                                                
; NORMAL EXECUTABLE INSTRUCTION, COPY IT INTO OUR RAM, THEN EXECUTE IT
NOREXE	LEAU	-1,U			; backup to instruction                        
		LDX	#INSRAM		; point to ram for instruction                 
		                                                                       
; COPY INSTRUCTION INTO RAM                                                  
NORE1	CMPU	SAVPC		; are we there                                 
		BHS	NORE2		; end of instruction                           
		LDA	,U+			; get data                                     
		STA	,X+			; save in ram                                  
		BRA	NORE1		; continue                                     
		                                                                       
; INSERT A JUMP AFTER IT                                                     
NORE2	LDA	#$7E			; get 'jmp' extended instruction               
		STA	,X+			; save it                                      
		LDD	#NORE3		; point at address to jump to                  
		STD	,X			; save it                                      
		STS	TEMP			; save sp                                      
		LDS	SAVS			; restore stack pointer                        
		LDA	SAVCC		; get cc                                       
		LDB	SAVDP		; get dp                                       
		PSHS	A,B			; save cc and dp                               
		LDD	SAVA			; restore a, b                                 
		LDX	SAVX			; restore x                                    
		LDY	SAVY			; restore y                                    
		LDU	SAVU			; restore u                                    
		PULS	CC,DP		; restore cc and dp                            
		JMP	INSRAM		; execute instruction                          
		
; INSTRUCTION SHOULD RETURN TO HERE
NORE3	PSHS	CC,DP		; save regs                                    
		STD	SAVA			; save regs                                    
		STX	SAVX			; save x                                       
		STY	SAVY			; save y                                       
		STU	SAVU			; save u                                       
		PULS	A,B			; get regs back                                
		STA	SAVCC		; save cc                                      
		STB	SAVDP		; save dp                                      
		STS	SAVS			; save stack pointer                           
		LDS	TEMP			; restore our stack                            
		RTS                                                                
		
;
; SUBROUTINE TO EVALUATE CONDITIONAL BRANCH OPCODES, AND DETERMINE
; IF THEY ARE TO BE EXECUTED
;
TSTCON	LDB	#3			; test for three conditionals                          
		CMPA	#$2F			; is it 'ble'?                                         
		BNE	TSTC0		; no, its normal                                       
		LDB	#6			; handle wretched 'ble' case                           
TSTC0	SUBA	#$22			; convert opcode to simple index                       
		LSLA				; rotate..                                             
		LSLA				; twice for four byte entries                          
		LDX	#CONTAB		; point to table                                       
		LEAX	A,X			; advance to table entry                               
		LDA	SAVCC		; get condition codes                                  
		ANDA	,X+			; mask out non-applicable ones                         
TSTC1	CMPA	,X+			; does it match?                                       
		BEQ	TSTC2		; it's ok                                              
		DECB				; reduce count                                         
		BNE	TSTC1		; continue                                             
		LDA	#255			; indicate conditional not met                         
		RTS	                                                                       
TSTC2	CLRA				; indicate conditional met                             
		RTS	                                                                       
	
;
; DISASSEMBLE OPCODE POINTED TO BY Y. PLACE IN OUTPUT BUFFER POINTED TO BY U
;
DISASS	STY	PTRSAV		; save instruction pointer                          
		PSHS	U			; save inst pointer                                 
		LDD	#$2000+26		; get space+number of bytes to clear                
DISA1	STA	,U+			; set a space                                       
		DECB				; reduce count                                      
		BNE	DISA1		; continue                                          
		LDX	#OPTAB1		; point to general opcode table                     
		LDA	,Y			; get data byte                                     
		CMPA	#$10			; prefix byte?                                      
		BEQ	SETOP2		; new table                                         
		CMPA	#$11			; other prefix byte                                 
		BNE	OPFIND		; no, it's ok                                       
		LDX	#OPTAB3		; point to third table                              
		BRA	OPFNXT		; ok                                                
SETOP2	LDX	#OPTAB2		; point to second operand table                     
OPFNXT	LEAY	1,Y			; skip prefix byte                                  
                                                                                  
; LOOK FOR OPCODE IN TABLE                                                        
OPFIND	LDA	,X+			; get byte from table                               
		CMPA	,Y			; is this it?                                       
		BEQ	FNDOPC		; found it                                          
		CMPA	#$CF			; end of table?                                     
		BEQ	BADOPC		; if so, fake an opcode                             
		LEAX	2,X			; advance                                           
		BRA	OPFIND		; keep looking                                      
BADOPC	LDY	PTRSAV		; insure we are at beginning                        
                                                                                  
; LOCATED OPCODE, GENERATE STRING
FNDOPC	LEAY	1,Y			; skip to postbyte                                          
		LDA	,X+			; get data                                                  
		STA	INSTYP		; save for later                                            
		LDB	,X			; get instruction number                                    
		LDA	#4			; four bytes/entry                                          
		MUL				; calculate entry offset                                    
		LDX	#ITABLE		; point to instruction table                                
		LEAX	D,X			; advance to it                                             
		LDB	#4			; size of instriuction field                                
FNDO1	LDA	,X+			; get char                                                  
		STA	,U+			; save in output                                            
		DECB				; move four characters                                      
		BNE	FNDO1		; continue                                                  
FNDO2	LDA	INSTYP		; get type bits back                                        
		ANDA	#$0F			; remove crap                                               
		LBEQ	ENDIS		; no operands                                               
		                                                                                    
; INSERT SPACES FOR OPERAND                                                               
		LDB	#$20			; get a space                                               
		STB	,U+			; save in output                                            
		STB	,U+			; save in output                                            
		DECA				; is 8 bit it immediate?                                    
		BNE	IMM16		; no, try 16 bit immediate                                  
		                                                                                    
; EIGHT BIT IMMEDIATE ADDRESSING OPERAND
IMM8		LDA	#'# 			; indicate immediate                 
		STA	,U+			; save it                            
		BRA	OP8			; quit                               
		                                                             
; SIXTEEN BIT IMMEDIATE ADDRESSING
IMM16	DECA				; is this it?                                                   
		BNE	DIRECT		; no, try direct                                                
		LDA	#'# 			; indicate immediate                                            
		STA	,U+			; save it                                                       
		BRA	OP16			; 16 bit operand                                                
		                                                                                        
; DIRECT PAGE ADDRESSING                                                                      
DIRECT	DECA				; is this it?                                                   
		BNE	EXTEND		; no, try extended                                              
		LDA	#'< 			; indicate direct                                               
		STA	,U+			; save it                                                       
OP8		LDA	,Y+			; get operand byte                                              
		LBSR	WRHEXB		; output                                                        
		BRA	ENDIS1		; end go home                                                   
		                                                                                        
; EXTENDED ADDRESSING                                                                         
EXTEND	DECA				; is this it?                                                   
		BNE	INDEX		; no, try indexed                                               
OP16		LDD	,Y++			; get opcodes                                                   
		LBSR	WRHEXW		; output word                                                   
ENDIS1	LBRA	ENDIS		; go home                                                       
                                                                                              
; INDEXED ADDRESSING MODES                                                                    
INDEX	DECA				; is it indexed?                                                
		LBNE	PSHPUL		; no, try push or pul                                           
		LDA	,Y+			; get post byte                                                 
		STA	POSBYT		; save for later                                                
	                                                                                             
; TEST FOR FIVE BIT OFFSET                                                                    
		BMI	NO5BO		; not a five bit offset                                         
		ANDA	#$1F			; convert to postbyte                                           
		BRA	EVLX1		; insert register and continue                                  
	                                                                                             
; TEST FOR INDIRECT MODE                                                                      
NO5BO	BITA	#$10			; test for indirect                                             
		BEQ	NOIND		; not indirect                                                  
		LDB	#'[ 			; get opening                                                   
		STB	,U+			; save in output                                                
	                                                                                             
; TEST FOR NO OFFSET                                                                          
NOIND	ANDA	#$8F			; remove regs and indirect bit                                  
		CMPA	#$84			; no offset?                                                    
		BEQ	INSR1		; insert register and exit                                      
	                                                                                             
; TEST FOR EIGHT BIT OFFSET                                                                   
		CMPA	#$88			; eight bit offset                                              
		BNE	EVL1			; no, try next                                                  
		LDA	,Y+			; get byte offset                                               
EVLX1	LBSR	WRHEXB		; output                                                        
		BRA	INSR1		; continue                                                      
	                                                                                             
; TEST FOR 16 BIT OFFSET                                                                      
EVL1		CMPA	#$89			; 16 bit ofset?                                                 
		BNE	EVL2			; no, try next                                                  
		LDD	,Y++			; get operand                                                   
		LBSR	WRHEXW		; output                                                        
		BRA	INSR1		; insert register                                               
	                                                                                             
; TEST FOR A ACCUMULATOR OFFSET                                                               
EVL2		CMPA	#$86			; is it 'a' offset?                                             
		BNE	EVL3			; no, try next                                                  
		LDA	#'A 			; get acca                                                      
		BRA	SAIREG		; go home                                                       
	                                                                                             
; TEST FOR B ACCUMULATOR OFFSET                                                               
EVL3		CMPA	#$85			; is it 'b' offset?                                             
		BNE	EVL4			; no, try next                                                  
		LDA	#'B 			; get b                                                         
		BRA	SAIREG		; go home                                                       
		
; TEST FOR 'D' ACCUMULATOR OFFSET
EVL4		CMPA	#$8B			; d offset?                                   
		BNE	EVL5			; no, try next                                
		LDA	#'D 			; get d register                              
SAIREG	STA	,U+			; save it                                     
INSR1	BRA	INSREG	                                                      
                                                                            
; TEST FOR EXTENDED INDIRECT                                                
EVL5		CMPA	#$8F			; extended indirect?                          
		BNE	EVL6			; no, try next                                
		LDD	,Y++			; get offset                                  
		LBSR	WRHEXW		; output                                      
		BRA	EVLFIN		; and continue                                
	                                                                           
; TEST FOR PC OFFSET, 8 BIT                                                 
EVL6		CMPA	#$8C			; eight bit pc offset?                        
		BNE	EVL7			; no, try next                                
		LDA	,Y+			; get offset                                  
		LBSR	WRHEXB		; output                                      
		BRA	WRPCRG		; output pc register                          
		                                                                      
; TEST FOR PC OFFSET, 16 BIT                                                
EVL7		CMPA	#$8D			; pc offset?                                  
		BNE	INSREG		; no, insert register                         
		LDD	,Y++			; get offset                                  
		LBSR	WRHEXW		; output                                      
WRPCRG	LDX	#PCRG		; point to string                             
WRPR1	LDA	,X+			; get char                                    
		STA	,U+			; save                                        
		CMPA	#'R 			; end?                                        
		BNE	WRPR1		; no, continue                                
		BRA	EVLFIN		; end it now                                  
	                                                                           
; INSERT REGISTER BITS                                                      
INSREG	LDA	#', 			; get comma                                   
		STA	,U+			; save it                                     
		LDA	POSBYT		; get postbyte                                
		LDB	#'- 			; get minus                                   
		ANDA	#$8F			; remove crap                                 
		CMPA	#$82			; decrement by one?                           
		BEQ	DEC1			; decrement by one                            
		CMPA	#$83			; decrement by two?                           
		BNE	NODEC		; no, don't dec                               
		STB	,U+			; save                                        
DEC1		STB	,U+			; again                                       
NODEC	LDA	POSBYT		; get postbyte                                
		LSRA				; shift                                       
		LSRA				; register                                    
		LSRA				; bits                                        
		LSRA				; into                                        
		LSRA				; bottom                                      
		LDB	#'X 			; get 'x'                                     
		ANDA	#$03			; remove crap                                 
		BEQ	EVLEND		; its 'x'                                     
		LDB	#'Y 			; get 'y'                                     
		DECA				; test for 'y'                                
		BEQ	EVLEND		; yes                                         
		LDB	#'U 			; get 'u'                                     
		DECA				; test                                        
		BEQ	EVLEND		; its 'u'                                     
		LDB	#'S 			; must be 's'                                 
EVLEND	STB	,U+			; save in output                              
EVLFIN	LDA	POSBYT		; get postbyte                                
		LDB	#'+ 			; get plus                                    
		ANDA	#$8F			; get type                                    
		CMPA	#$80			; is it inc by one                            
		BEQ	INC1			; if so, we have it                           
		CMPA	#$81			; inc by two?                                 
		BNE	NOINC		; no increment                                
		STB	,U+			; save one                                    
INC1		STB	,U+			; save two                                    
NOINC	LDA	POSBYT		; get postbyte                                
		BPL	NOIND1		; five bit offset                             
		BITA	#$10			; indirect?                                   
		BEQ	NOIND1		; no indirect                                 
		LDA	#'] 			; closing brace                               
		STA	,U+			; save it                                     
NOIND1	LBRA	ENDIS		; end it                                      
                                                                            
; PULS OR PULL OPCODES                                                      
PSHPUL	DECA				; is it push or pull?                         
		BNE	TFREXG		; no, try transfer or exchange                
		LDA	,Y+			; get postbyte                                
		LDX	#PSHTAB		; get 'cc'                                    
PSH1		LSRA				; shift out bits                              
		BCC	PSHNXT		; skip this one                               
		PSHS	A,B			; save regs                                   
		LDD	,X++			; get data                                    
		CMPA	#'U 			; saveing u register                          
		BNE	PSH4			; no, it's ok                                 
		TST	INSTYP		; special case                                
		BPL	PSH4			; ok                                          
		LDA	#'S 			; convert                                     
PSH4		STA	,U+			; save it                                     
		TSTB				; more?                                       
		BEQ	PSH2			; no, skip it                                 
		STB	,U+			; save                                        
PSH2		PULS	A,B			; restore regs                                
		TSTA				; more bits?                                  
		BEQ	PSH3			; no, quit                                    
		PSHS	A			; resave                                      
		LDA	#', 			; get comma                                   
		STA	,U+			; save                                        
		PULS	A			; get it back                                 
		BRA	PSH1			; continue                                    
PSHNXT	LEAX	2,X			; advance                                     
		TSTA				; are we ok                                   
		BNE	PSH1			; keep trying                                 
PSH3		LBRA	ENDIS		; done                                        

; TRANSFER AND EXCHANGE POSTBYTE OPCODES
TFREXG	DECA				; transfer or exchange?                
		BNE	SBRAN		; try short branch                     
		LDA	,Y			; get postbyte                         
		LSRA				; shift                                
		LSRA				; into                                 
		LSRA				; low                                  
		LSRA				; nibble                               
		BSR	TFRREG		; get register                         
		LDA	#', 			; seperator                            
		STA	,U+			; save                                 
		LDA	,Y+			; get postbyte again                   
		BSR	TFRREG		; place it                             
		LBRA	ENDIS		; go home                              
		
; CALCULATE TRANSFER REGISTER
TFRREG	ANDA	#$0F			; remove high crap                
		LSLA				; multiply by two                 
		LDX	#REGTAB		; point to table                  
		LDD	A,X			; get register value              
		STA	,U+			; save it                         
		TSTB				; second byte?                    
		BEQ	TFRET		; no, skip it                     
		STB	,U+			; save it                         
TFRET	RTS	                                                  

; SHORT BRANCH
SBRAN	DECA				; short branch                             
		BNE	LBRAN		; no, try long branch                      
		LDB	,Y+			; get operator                             
		LEAX	B,Y			; get new address                          
		TFR	X,D			; copy                                     
		BRA	SAVADR		; finish                                   
	                                                                        
; LONG BRANCH                                                            
LBRAN	LDD	,Y++			; get operand                              
		PSHS	Y			; save y                                   
		ADDD	,S++			; add offset to reg                        
SAVADR	LBSR	WRHEXW		; output word.                             
ENDIS	LDA	#$FF			; line terminator                          
		STA	,U			; save it                                  
	                                                                        
; INSERT ADDRESS/BYTE DATA
		LDU	,S			; restore u register                                            
		PSHS	Y			; save pointer to end                                           
		LDX	PTRSAV		; point to starting address                                     
		TFR	X,D			; copy                                                          
		LBSR	WRHEX		; output                                                        
		TFR	B,A			; copy                                                          
		LBSR	WRHEX		; output                                                        
		CLRB				; start with zero                                               
END1		CMPX	,S			; are we at end?                                                
		BHS	END2			; if so, quit                                                   
		INCB				; advance                                                       
		LEAU	1,U			; advance                                                       
		LDA	,X+			; get byte                                                      
		LBSR	WRHEX		; output                                                        
		BRA	END1			; continue                                                      
END2		LEAS	2,S			; restore stack                                                 
		LDU	,S			; restore u register                                            
		LEAU	20,U			; advance to text field                                         
		LDX	PTRSAV		; get pointer back                                              
END3		DECB				; reduce count                                                  
		BMI	END4			; continue                                                      
		LDA	,X+			; go it again                                                   
		CMPA	#$20			; < space?                                                      
		BLO	END5			; yes                                                           
		CMPA	#$7F			; > 7f?                                                         
		BLO	END6			; ok                                                            
END5		LDA	#'. 			; convert to dot                                                
END6		STA	,U+			; save                                                          
		BRA	END3	                                                                          
END4		PULS	U,PC			; go home                                                       
                                                                                              
;                                                                                             
; SUBROUTINES                                                                                 
;                                                                                             
WRHEXB	PSHS	A			; save it                                                       
		LDA	#'$ 			; indicate hex                                                  
		STA	,U+			; save                                                          
		BRA	WRHEX1		; continue                                                      
WRHEXW	PSHS	B			; save b                                                        
		LDB	#'$ 			; indicate hex                                                  
		STB	,U+			; save it                                                       
		BSR	WRHEX		; output                                                        
WRHEX1	PULS	A			; restore                                                       
WRHEX	PSHS	A			; save it                                                       
		LSRA				; shift                                                         
		LSRA				; high byte                                                     
		LSRA				; into                                                          
		LSRA				; low for output                                                
		BSR	WRHEXN		; output nibble                                                 
		PULS	A			; retore                                                        
WRHEXN	ANDA	#$0F			; remove crap                                                   
		ADDA	#$30			; convert                                                       
		CMPA	#$39			; ok?                                                           
		BLS	WRNOK		; ok                                                            
		ADDA	#7			; convert                                                       
WRNOK	STA	,U+			; save it                                                       
		RTS
		
;
; NMI HANDLER
;
NMIHND	LDX	#SAVCC		; point to start of saved regs         
		LDB	#12			; move 12 bytes                        
NMIH1	LDA	,S+			; get byte                             
		STA	,X+			; save                                 
		DECB				; decrement count                      
		BNE	NMIH1		; do them all                          
		STS	SAVS			; save stack pointer                   
		LBSR	WRMSG		; display message                      
		FCC	'*** NMI Interrupt ***'
		FCB	$FF			; new line                             
		BRA	BRKREG		; display registers                    
;
; SWI HANDLER
;
SWIHND	LDY	#BRKTAB		; point to breakpoint table                                               
		LDX	10,S			; get stored pc                                                           
		LEAX	-1,X			; backup to breakpoint address                                            
		LDB	#8			; check eight breakpoints                                                 
SWIHN1	CMPX	,Y			; is this it?                                                             
		BEQ	SWIHN2		; yes                                                                     
		LEAY	3,Y			; skip opcode                                                             
		DECB				; reduce count                                                            
		BNE	SWIHN1		; continue                                                                
		LDB	2,S			; restore b.                                                              
		LDX	4,S			; restore x.                                                              
		LDY	6,S			; restore y.                                                              
		JMP	[SWIADR]		; not a breakpoint, execute swi handler                                   
SWIHN2	STB	INSTYP		; save breakpoint number                                                  
		LDX	#SAVCC		; point to start of saved regs                                            
		LDB	#10			; move 10                                                                 
SWIHN25	LDA	,S+			; get byte                                                                
		STA	,X+			; save                                                                    
		DECB				; decrement count                                                         
		BNE	SWIHN25		; do them all                                                             
		PULS	X			; get pc                                                                  
		LEAX	-1,X			; set back to real pc                                                     
		STX	SAVPC		; saved pc                                                                
		STS	SAVS			; save stack pointer                                                      
		LBSR	WRMSG		; display message                                                         
		FCN	'*** Breakpoint #'
		LDA	#$38			; get number, plus ascii convert                
		SUBA	INSTYP		; convert to proper digit                       
		LBSR	PUTCHR		; display                                       
		LBSR	WRMSG		; output message                                
		FCC	' ***'		; trailing message                              
		FCB	$FF			; new line                                      
BRKREG	LBSR	DISREG		; display                                       
BRKRES	LDX	#BRKTAB		; point to breakpoint table                     
		LDB	#8			; do it eight times                             
SWIHN3	LDY	,X++			; get reg                                       
		BEQ	SWIHN4		; no brk, next                                  
		LDA	,X			; get opcode                                    
		STA	,Y			; replace in ram                                
SWIHN4	LEAX	1,X			; skip opcode                                   
		DECB				; reduce count                                  
		BNE	SWIHN3		; go again                                      
		LBRA	MAIN			; do prompt                                     
	
; CONSTANTS
PCRG		FCC	',PCR'	

; TRANSFER/EXCHANGE REGISTER TABLE
REGTAB	FCN	'D'			; 0
		FCN	'X'			; 1
		FCN	'Y'			; 2
		FCN	'U'			; 3
		FCN	'S'			; 4
		FCC	'PC'			; 5
		FCN	'?'			; 6
		FCN	'?'			; 7
		FCN	'A'			; 8
		FCN	'B'			; 9
		FCC	'CC'			; A
		FCC	'DP'			; B
		FCN	'?'			; C
		FCN	'?'			; D
		FCN	'?'			; E
		FCN	'?'			; F
		
; PUSH/PULL REGISTER TABLE
PSHTAB	FCC	'CC'	
		FCN	'A'	
		FCN	'B'	
		FCC	'DP'	
		FCN	'X'	
		FCN	'Y'	
		FCN	'U'	
		FCN	'PC'	
		
;
; OPCODE TABLE, OPCODE BYTE, TYPE BYTE, TEXT BYTE
;
OPTAB1	FCB	$86,1,1		; 'LDA' INSTRUCTIONS
		FCB	$96,3,1	
		FCB	$A6,5,1	
		FCB	$B6,4,1	
		FCB	$C6,1,2		; 'LDB' INSTRUCTIONS
		FCB	$D6,3,2	
		FCB	$E6,5,2	
		FCB	$F6,4,2	
		FCB	$CC,2,3		; 'LDD' INSTRUCTIONS
		FCB	$DC,3,3	
		FCB	$EC,5,3	
		FCB	$FC,4,3	
		FCB	$CE,2,4		; 'LDU' INSTRUCTIONS
		FCB	$DE,3,4	
		FCB	$EE,5,4	
		FCB	$FE,4,4	
		FCB	$8E,2,5		; 'LDX' INSTRUCTIONS
		FCB	$9E,3,5	
		FCB	$AE,5,5	
		FCB	$BE,4,5	
		FCB	$97,3,6		; 'STA' INSTRUCTINOS
		FCB	$A7,5,6	
		FCB	$B7,4,6	
		FCB	$D7,3,7		; 'STB' INSTRUCTIONS
		FCB	$E7,5,7	
		FCB	$F7,4,7	
		FCB	$DD,3,8		; 'STD' INSTRUCTIONS
		FCB	$ED,5,8	
		FCB	$FD,4,8	
		FCB	$DF,3,9		; 'STU' INSTRUCTIONS
		FCB	$EF,5,9	
		FCB	$FF,4,9	
		FCB	$9F,3,10		; 'STX' INSTRUCTIONS
		FCB	$AF,5,10
		FCB	$BF,4,10
		FCB	$3A,0,11		; 'ABX'
		FCB	$89,1,12		; 'ADCA'
		FCB	$99,3,12           	
		FCB	$A9,5,12           	
		FCB	$B9,4,12           	
		FCB	$C9,1,13		; 'ADCB'
		FCB	$D9,3,13           	
		FCB	$E9,5,13           	
		FCB	$F9,4,13           	
		FCB	$8B,1,14		; 'ADDA'
		FCB	$9B,3,14           	
		FCB	$AB,5,14           	
		FCB	$BB,4,14           	
		FCB	$CB,1,15		; 'ADDB'
		FCB	$DB,3,15           	
		FCB	$EB,5,15           	
		FCB	$FB,4,15           	
		FCB	$C3,2,16		; 'ADDD'
		FCB	$D3,3,16           	
		FCB	$E3,5,16           	
		FCB	$F3,4,16           	
		FCB	$48,0,17		; 'ASLA'
		FCB	$58,0,18		; 'ASLB'
		FCB	$08,3,19		; 'ASL'
		FCB	$68,5,19           	
		FCB	$78,4,19           	
		FCB	$47,0,20		; 'ASRA'
		FCB	$57,0,21		; 'ASRB'
		FCB	$07,3,22		; 'ASR'
		FCB	$67,5,22           	
		FCB	$77,4,22           	
		FCB	$85,1,23		; 'BITA'
		FCB	$95,3,23           	
		FCB	$A5,5,23           	
		FCB	$B5,4,23           	
		FCB	$C5,1,24		; 'BITB'
		FCB	$D5,3,24           	
		FCB	$E5,5,24           	
		FCB	$F5,4,24           	
		FCB	$4F,0,25		; 'CLRA'
		FCB	$5F,0,26		; 'CLRB'
		FCB	$0F,3,27		; 'CLR'
		FCB	$6F,5,27           	
		FCB	$7F,4,27           	
		FCB	$81,1,28		; 'CMPA'
		FCB	$91,3,28           	
		FCB	$A1,5,28           	
		FCB	$B1,4,28           	
		FCB	$C1,1,29		; 'CMPB'
		FCB	$D1,3,29           	
		FCB	$E1,5,29           	
		FCB	$F1,4,29           	
		FCB	$8C,2,30		; 'CMPX'
		FCB	$9C,3,30           	
		FCB	$AC,5,30           	
		FCB	$BC,4,30           	
		FCB	$43,0,31		; 'COMA'
		FCB	$53,0,32		; 'COMB'
		FCB	$03,3,33		; 'COM'
		FCB	$63,5,33           	
		FCB	$73,4,33           	
		FCB	$3C,1,34		; 'CWAI'
		FCB	$19,0,35		; 'DAA'
		FCB	$4A,0,36		; 'DECA'
		FCB	$5A,0,37		; 'DECB'
		FCB	$0A,3,38		; 'DEC'
		FCB	$6A,5,38           	
		FCB	$7A,4,38           	
		FCB	$88,1,39		; 'EORA'
		FCB	$98,3,39           	
		FCB	$A8,5,39           	
		FCB	$B8,4,39           	
		FCB	$C8,1,40		; 'EORB'
		FCB	$D8,3,40           	
		FCB	$E8,5,40           	
		FCB	$F8,4,40           	
		FCB	$1E,7,41		; 'EXG'
		FCB	$1F,7,42		; 'TFR'
		FCB	$34,6,43		; 'PSHS'
		FCB	$36,$86,44	; 'PSHU'
		FCB	$35,6,45		; 'PULS'
		FCB	$37,$86,46	; 'PULU'
		FCB	$4C,0,47		; 'INCA'
		FCB	$5C,0,48		; 'INCB'
		FCB	$0C,3,49		; 'INC'
		FCB	$6C,5,49           	
		FCB	$7C,4,49           	
		FCB	$0E,3,50		; 'JMP'
		FCB	$6E,5,50           	
		FCB	$7E,4,50           	
		FCB	$9D,3,51		; 'JSR'
		FCB	$AD,5,51           	
		FCB	$BD,4,51           	
		FCB	$32,5,52		; 'LEAS'
		FCB	$33,5,53		; 'LEAU'
		FCB	$30,5,54		; 'LEAX'
		FCB	$31,5,55		; 'LEAY'
		FCB	$44,0,56		; 'LSRA'
		FCB	$54,0,57		; 'LSRB'
		FCB	$04,3,58		; 'LSR'
		FCB	$64,5,58           	
		FCB	$74,4,58           	
		FCB	$3D,0,59		; 'MUL'
		FCB	$40,0,60		; 'NEGA'
		FCB	$50,0,61		; 'NEGB'
		FCB	$00,3,62		; 'NEG'
		FCB	$60,5,62           	
		FCB	$70,4,62           	
		FCB	$12,0,63		; 'NOP'
		FCB	$8A,1,64		; 'ORA'
		FCB	$9A,3,64            	
		FCB	$AA,5,64           	
		FCB	$BA,4,64           	
		FCB	$CA,1,65		; 'ORB'
		FCB	$DA,3,65           	
		FCB	$EA,5,65           	
		FCB	$FA,4,65           	
		FCB	$1A,1,66		; 'ORCC'
		FCB	$84,1,67		; 'ANDA'
		FCB	$94,3,67           	
		FCB	$A4,5,67           	
		FCB	$B4,4,67           	
		FCB	$C4,1,68		; 'ANDB'
		FCB	$D4,3,68           	
		FCB	$E4,5,68           	
		FCB	$F4,4,68           	
		FCB	$1C,1,69		; 'ANDCC'
		FCB	$49,0,70		; 'ROLA'
		FCB	$59,0,71		; 'ROLB'
		FCB	$09,3,72		; 'ROL'
		FCB	$69,5,72           	
		FCB	$79,4,72           	
		FCB	$46,0,73		; 'RORA'
		FCB	$56,0,74		; 'RORB'
		FCB	$06,3,75		; 'ROR'
		FCB	$66,5,75           	
		FCB	$76,4,75           	
		FCB	$3B,0,76		; 'RTI'
		FCB	$39,0,77		; 'RTS'
		FCB	$82,1,78		; 'SBCA'
		FCB	$92,3,78           	
		FCB	$A2,5,78           	
		FCB	$B2,4,78           	
		FCB	$C2,1,79		; 'SBCB'
		FCB	$D2,3,79           	
		FCB	$E2,5,79           	
		FCB	$F2,4,79           	
		FCB	$1D,0,80           	
		FCB	$80,1,81		; 'SUBA'
		FCB	$90,3,81           	
		FCB	$A0,5,81           	
		FCB	$B0,4,81           	
		FCB	$C0,1,82		; 'SUBB'
		FCB	$D0,3,82           	
		FCB	$E0,5,82           	
		FCB	$F0,4,82           	
		FCB	$83,2,83		; 'SUBD'
		FCB	$93,3,83           	
		FCB	$A3,5,83           	
		FCB	$B3,4,83           	
		FCB	$3F,0,84		; 'SWI'
		FCB	$13,0,85		; 'SYNC'
		FCB	$4D,0,86		; 'TSTA'
		FCB	$5D,0,87		; 'TSTB'
		FCB	$0D,3,88		; 'TST'
		FCB	$6D,5,88           	
		FCB	$7D,4,88           	
		FCB	$16,9,99		; 'LBRA'
		FCB	$17,9,100		; 'LBSR'
		FCB	$20,8,101		; 'BRA'
		FCB	$21,8,102		; 'BRN'
		FCB	$22,8,103		; 'BHI'
		FCB	$23,8,104		; 'BLS'
		FCB	$24,8,105		; 'BCC'
		FCB	$25,8,106		; 'BCS'
		FCB	$26,8,107		; 'BNE'
		FCB	$27,8,108		; 'BEQ'
		FCB	$28,8,109		; 'BVC'
		FCB	$29,8,110		; 'BVS'
		FCB	$2A,8,111		; 'BPL'
		FCB	$2B,8,112		; 'BMI'
		FCB	$2C,8,113		; 'BGE'
		FCB	$2D,8,114		; 'BLT'
		FCB	$2E,8,115		; 'BGT'
		FCB	$2F,8,116		; 'BLE'
		FCB	$8D,8,132		; 'BSR'
		FCB	$CF,0,0		; 'FCB', UNKNOWN OPCODE
		
; OPERAND TABLE NUMBER TWO, $10 PREFIX INSTRUCTIONS
OPTAB2	FCB	$83,2,89		; 'CMPD'
		FCB	$93,3,89           	
		FCB	$A3,5,89           	
		FCB	$B3,4,89           	
		FCB	$8C,2,90		; 'CMPY'
		FCB	$9C,3,90           	
		FCB	$AC,5,90           	
		FCB	$BC,4,90           	
		FCB	$CE,2,91		; 'LDS'
		FCB	$DE,3,91           	
		FCB	$EE,5,91           	
		FCB	$FE,4,91           	
		FCB	$8E,2,92		; 'LDY'
		FCB	$9E,3,92           	
		FCB	$AE,5,92           	
		FCB	$BE,4,92           	
		FCB	$DF,3,93		; 'STS'
		FCB	$EF,5,93           	
		FCB	$FF,4,93           	
		FCB	$9F,3,94		; 'STY'
		FCB	$AF,5,94            	
		FCB	$BF,4,94           	
		FCB	$3F,0,95		; 'SWI2'
		FCB	$21,9,117		; 'LBRN'
		FCB	$22,9,118		; 'LBHI'
		FCB	$23,9,119		; 'LBLS'
		FCB	$24,9,120		; 'LBCC'
		FCB	$25,9,121		; 'LBCS'
		FCB	$26,9,122		; 'LBNE'
		FCB	$27,9,123		; 'LBEQ'
		FCB	$28,9,124		; 'LBVC'
		FCB	$29,9,125		; 'LBVS'
		FCB	$2A,9,126		; 'LBPL'
		FCB	$2B,9,127		; 'LBMI'
		FCB	$2C,9,128		; 'LBGE'
		FCB	$2D,9,129		; 'LBLT'
		FCB	$2E,9,130		; 'LBGT'
		FCB	$2F,9,131		; 'LBLE'
		FCB	$CF,1,0	
		
; OPERAND TABLE #3, $11 PREFIXES
OPTAB3	FCB	$8C,2,96		; 'CMPS'
		FCB	$9C,3,96
		FCB	$AC,5,96
		FCB	$BC,4,96
		FCB	$83,2,97		; 'CMPU'
		FCB	$93,3,97
		FCB	$A3,5,97
		FCB	$B3,4,97
		FCB	$3F,0,98		; 'SWI3'
	
; INSTRUCTION TEXT TABLE
ITABLE	FCC	'FCB '		; 0
		FCC	'LDA '		; 1
		FCC	'LDB '		; 2
		FCC	'LDD '		; 3
		FCC	'LDU '		; 4
		FCC	'LDX '		; 5
		FCC	'STA '		; 6
		FCC	'STB '		; 7
		FCC	'STD '		; 8
		FCC	'STU '		; 9
		FCC	'STX '		; 10
		FCC	'ABX '		; 11
		FCC	'ADCA'		; 12
		FCC	'ADCB'		; 13
		FCC	'ADDA'		; 14
		FCC	'ADDB'		; 15
		FCC	'ADDD'		; 16
		FCC	'ASLA'		; 17
		FCC	'ASLB'		; 18
		FCC	'ASL '		; 19
		FCC	'ASRA'		; 20
		FCC	'ASRB'		; 21
		FCC	'ASR '		; 22
		FCC	'BITA'		; 23
		FCC	'BITB'		; 24
		FCC	'CLRA'		; 25
		FCC	'CLRB'		; 26
		FCC	'CLR '		; 27
		FCC	'CMPA'		; 28
		FCC	'CMPB'		; 29
		FCC	'CMPX'		; 30
		FCC	'COMA'		; 31
		FCC	'COMB'		; 32
		FCC	'COM '		; 33
		FCC	'CWAI'		; 34
		FCC	'DAA '		; 35
		FCC	'DECA'		; 36
		FCC	'DECB'		; 37
		FCC	'DEC '		; 38
		FCC	'EORA'		; 39
		FCC	'EORB'		; 40
		FCC	'EXG '		; 41
		FCC	'TFR '		; 42
		FCC	'PSHS'		; 43
		FCC	'PSHU'		; 44
		FCC	'PULS'		; 45
		FCC	'PULU'		; 46
		FCC	'INCA'		; 47
		FCC	'INCB'		; 48
		FCC	'INC '		; 49
		FCC	'JMP '		; 50
		FCC	'JSR '		; 51
		FCC	'LEAS'		; 52
		FCC	'LEAU'		; 53
		FCC	'LEAX'		; 54
		FCC	'LEAY'		; 55
		FCC	'LSRA'		; 56
		FCC	'LSRB'		; 57
		FCC	'LSR '		; 58
		FCC	'MUL '		; 59
		FCC	'NEGA'		; 60
		FCC	'NEGB'		; 61
		FCC	'NEG '		; 62
		FCC	'NOP '		; 63
		FCC	'ORA '		; 64
		FCC	'ORB '		; 65
		FCC	'ORCC'		; 66
		FCC	'ANDA'		; 67
		FCC	'ANDB'		; 68
		FCC	'ANDC'		; 69
		FCC	'ROLA'		; 70
		FCC	'ROLB'		; 71
		FCC	'ROL '		; 72
		FCC	'RORA'		; 73
		FCC	'RORB'		; 74
		FCC	'ROR '		; 75
		FCC	'RTI '		; 76
		FCC	'RTS '		; 77
		FCC	'SBCA'		; 78
		FCC	'SBCB'		; 79
		FCC	'SEX '		; 80
		FCC	'SUBA'		; 81
		FCC	'SUBB'		; 82
		FCC	'SUBD'		; 83
		FCC	'SWI '		; 84
		FCC	'SYNC'		; 85
		FCC	'TSTA'		; 86
		FCC	'TSTB'		; 87
		FCC	'TST '		; 88
		FCC	'CMPD'		; 89
		FCC	'CMPY'		; 90
		FCC	'LDS '		; 91
		FCC	'LDY '		; 92
		FCC	'STS '		; 93
		FCC	'STY '		; 94
		FCC	'SWI2'		; 95
		FCC	'CMPS'		; 96
		FCC	'CMPU'		; 97
		FCC	'SWI3'		; 98
		FCC	'LBRA'		; 99
		FCC	'LBSR'		; 100
		FCC	'BRA '		; 101
		FCC	'BRN '		; 102
		FCC	'BHI '		; 103
		FCC	'BLS '		; 104
		FCC	'BCC '		; 105
		FCC	'BCS '		; 106
		FCC	'BNE '		; 107
		FCC	'BEQ '		; 108
		FCC	'BVC '		; 109
		FCC	'BVS '		; 110
		FCC	'BPL '		; 111
		FCC	'BMI '		; 112
		FCC	'BGE '		; 113
		FCC	'BLT '		; 114
		FCC	'BGT '		; 115
		FCC	'BLE '		; 116
		FCC	'LBRN'		; 117
		FCC	'LBHI'		; 118
		FCC	'LBLS'		; 119
		FCC	'LBCC'		; 120
		FCC	'LBCS'		; 121
		FCC	'LBNE'		; 122
		FCC	'LBEQ'		; 123
		FCC	'LBVC'		; 124
		FCC	'LBVS'		; 125
		FCC	'LBPL'		; 126
		FCC	'LBMI'		; 127
		FCC	'LBGE'		; 128
		FCC	'LBLT'		; 129
		FCC	'LBGT'		; 130
		FCC	'LBLE'		; 131
		FCC	'BSR '		; 132
		
;
; CONDITIONAL TABLE, FIRST BYTE IS MASK, NEXT THREE BYTES ARE POSSIBLE
; BIT SETTINGS
;
CONTAB	FCB	$05,$00,$00,$00	; 'BHI', NO C OR Z
		FCB	$05,$01,$04,$05	; 'BLS', EITHER C OR Z
		FCB	$01,$00,$00,$00	; 'BCC', NO C
		FCB	$01,$01,$01,$01	; 'BCS', C SET
		FCB	$04,$00,$00,$00	; 'BNE', NO Z
		FCB	$04,$04,$04,$04	; 'BEQ', Z SET
		FCB	$02,$00,$00,$00	; 'BVC', V CLEAR
		FCB	$02,$02,$02,$02	; 'BVS', V SET
		FCB	$08,$00,$00,$00	; 'BPL', N CLEAR
		FCB	$08,$08,$08,$08	; 'BMI', N SET
		FCB	$0A,$00,$0A,$0A	; 'BGE', N=V
		FCB	$0A,$08,$02,$02	; 'BLT', N -= V
		FCB	$0E,$0A,$00,$00	; 'BGT', N=V, Z=0
		FCB	$0E,$08,$02,$04	; 'BLE', V-=N OR Z=1
		FCB	$0C,$06,$0E
	
;	
; RTC Time Formatting Table
; RTC REG OFFSET, ASCII BUFFER OFFSET, AND value, OR value
;   REG OFFSET = 64 --> no RTC reg read
;   REG OFFSET = >127 --> end of table
;
;RTCTBL	FCB	64,19,0,$0A		; [LF]
;		FCB	64,20,0,$0D		; [CR]
;		FCB	$5,0,$03,$30		; 10 hour
;		FCB	$4,1,$0F,$30		; 1 hour
;		FCB	64,2,0,':			;   :
;		FCB	$3,3,$07,$30		; 10 minute
;		FCB	$2,4,$0F,$30		; 1 minute
;		FCB	64,5,0,':			;   :
;		FCB	$1,6,$07,$30		; 10 second
;		FCB	$0,7,$0F,$30		; 1 second
;		FCB	64,8,0,$20		; 
;		FCB	$A,9,$01,$30		; 10 month
;		FCB	$9,10,$0F,$30		; 1 month
;		FCB	64,11,0,'/		;   -
;		FCB	$8,12,$03,$30		; 10 day	
;		FCB	$7,13,$0F,$30		; 1 day
;		FCB	64,14,0,'/		;   -
;		FCB	$E,15,$03,$30		; 1000 year		
;		FCB	$D,16,$0F,$30		; 100 year
;		FCB	$C,17,$0f,$30		; 10 year
;		FCB	$B,18,$0F,$30		; 1 year
;		FCB	64,21,0,0			; [null]
;		FCB	255	 			; EOT
	
; TRANSFER AND EXCHANGE REGISTER TABLE
TFREGT	FDB	SAVA	
INDTAB	FDB	SAVX	
		FDB	SAVY	
		FDB	SAVU	
		FDB	SAVS	
		FDB	SAVPC	
		
; PULL TABLE FOR PULS
PULSTAB	FDB	SAVCC	
		FDB	SAVA	
		FDB	SAVB	
		FDB	SAVDP	
		FDB	SAVX	
		FDB	SAVY	
		FDB	SAVU
		FDB	SAVPC	
		
; PULL TABLE FOR PULU
PULUTAB	FDB	SAVCC
		FDB	SAVA
		FDB	SAVB
		FDB	SAVDP
		FDB	SAVX
		FDB	SAVY
		FDB	SAVS
		FDB	SAVPC
; VECTOR HANDLERS
SWI3		JMP	[SWI3ADR]
SWI2		JMP	[SWI2ADR]
IRQ		JMP	[IRQADR]
FIRQ		JMP	[FIRQADR]
NMI		JMP	[NMIADR]
; HELP TEXT
HTEXT	FCB	0		; NEW LINE TO START
		FCN	'B 0-7 <addr>|Set breakpoint (0000=remove)'
		FCN	'CR <reg> <data>|Change register'
		FCN	'CV <vec> <addr>|Change interrupt vector'
		FCN	'DB|Display breakpoints'
		FCN	'DI <addr>,<addr>|Display memory in assembly format'
		FCN	'DM <addr>,<addr>|Display memory in hex dump format'
		FCN	'DR|Display processor registers'
		FCN	'DV|Display interrupt vectors'
		FCN	'E <addr>|Edit memory'
		FCN	'FM <addr>,<addr> <data>|Fill memory'
		FCN	'G [<addr>]|Go (execute program)'
		FCN	'L|Load Intel hex or Motorola S-record'
		FCN	'MM <addr>,<addr> <addr>|Move memory'
		FCN	'MT <addr>,<addr>|Memory test'
		FCN	'RR <addr>|Repeating READ access'
		FCN	'RW <addr> <data>|Repeating WRITE access'
		FCN	'S [<addr>]|Single step execution'
		FCN	'W <addr> <data>|Write to memory'
;		FCN	'XR <addr>|Repeating 16 bit read'
;		FCN	'XW <addr> <word>|Repeating 16 bit write'
		FCN	'TI|Initialize RTC Registers' 	
		FCN	'TD|Display RTC Time & Date'
		FCN	'TS <...>|Set RTC Time & Date'
		FCN	'TN <0/1>|Disable/Enable RTC NMI LED toggle'
		FCN	'ZI|Initialize Zilog CIO'
		FCN	'ZR <reg>|Read Zilog CIO register'
		FCN	'ZW <reg> <data>|Write Zilog CIO register'
		FCN	'+ <value>+<value>|Hexadecimal addition'
		FCN	'- <value>-<value>|Hexadecimal subtraction'
		FCB	-1		; END OF TABLE

;
; MACHINE SPECIFIC I/O ROUTINES FOR Z85C30 SCC
;

;
; INITIALIZE UART CHANNEL A 
;
INITSCCA	LDA	SCCAC		; reset the register pointer
		LDX	#SCCATBL
IS0?		LDA	,X+			; load address from table
		CMPA	#$FF 		; is it $ff? (end of table)
		BEQ	IS1?			;    yes, done with init of Ch A
		STA	SCCAC		;    no, write the register pointer to WR0
		LDA	,X+			; get data byte from table
		STA	SCCAC		; write to SCC channel A command
		BRA	IS0?
IS1?		RTS
	
; Initialization table for SCC Channel A in ASYNC mode, external 16x clock
; thanks to John Monahan (S100Computers.com)!

SCCATBL:
		FCB 	$09,$80 	; WR9, reset channel A
		FCB	$09,$00	; WR9, un-reset channel A
		FCB	$04,$44	; WR4, X16 clock,1 Stop,NP
		FCB 	$03,$C1	; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
		FCB	$05,$EA   ; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
		FCB	$0B,$05	; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
		FCB	$0C,$04	; WR12, Low byte 9600 Baud (optional)
		FCB	$0D,$00	; WR13, High byte for Baud (optional)
		FCB	$0E,$01	; WR14, Using a 1,8432 MHz BRG Clock (ECLK)
		FCB	$0F,$00	; WR15, No INT from hardware CTS/RTS
		FCB	$FF,$FF	; EOT marker

;
; INITIALIZE UART CHANNEL B
;
INITSCCB	LDA	SCCBC		; reset the register pointer
		LDX	#SCCBTBL
IS0?		LDA	,X+			; load address from table
		CMPA	#$FF 		; is it $ff? (end of table)
		BEQ	IS1?			;    yes, done with init of Ch B
		STA	SCCBC		;    no, write the register pointer to WR0
		LDA	,X+			; get data byte from table
		STA	SCCBC		; write to SCC channel B command
		BRA	IS0?
IS1?		RTS

; Initialization table for SCC Channel B in ASYNC mode, external 32x clock
; BCLK from CPLD is 3.686 MHz. 3.686M / 32 = 115.2kbps (for NoICE debugger)

SCCBTBL:
		FCB 	$09,$40 	; WR9, reset channel B
		FCB	$09,$00	; WR9, un-reset channel B
		FCB	$04,$84	; WR4, X32 clock,1 Stop,NP
		FCB 	$03,$C1	; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
		FCB	$05,$EA   ; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
		FCB	$0B,$05	; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
		FCB	$0C,$04	; WR12, Low byte 9600 Baud (optional)
		FCB	$0D,$00	; WR13, High byte for Baud (optional)
		FCB	$0E,$01	; WR14, Using a 1,8432 MHz BRG Clock (ECLK)
		FCB	$0F,$00	; WR15, No INT from hardware CTS/RTS
		FCB	$FF,$FF	; EOT marker

; READ UART A
READ:	LDA	SCCAC		; reset register pointer to WR0/RR0
		LDA	SCCAC		; read RR0
		ANDA	#%00000001	; examine the RX char available bit
		BEQ	NOCHR
		LDA	SCCAD
		ORCC	#%00000100	; SET 'Z' to indicate char read
		RTS
NOCHR	LDA	#$FF			; load $FF (and clear Z) to indicate no char read
		RTS
	
; WRITE UART A
WRITE:	PSHS	A
W1?		LDA	SCCAC		; reset register pointer to WR0/RR0
		LDA	SCCAC		; read RR0
		ANDA	#%00000100	; examine the TX buffer empty bit
		BEQ	W1?			; if not empty, check again
   		PULS	A
		STA	SCCAD		; put character in data register
		RTS

; STATUS UART A
USTAT	LDA	SCCAC		; reset register pointer to WR0/RR0
		LDA	SCCAC		; read RR0
		ANDA	#$00000101	; mask the RX char available and TX buffer empty
		EORA	#$00000101	; invert both flags to make ZERO result mean not ready / no char waiting	
		RTS
		
;
; MACHINE SPECIFIC I/O ROUTINES FOR DS3232M RTC
;
		
; READ REG     == [START], 0xD0 ADDR, [ack], <REG ADDR>, [ack], [START], 0xD1 ADDR, [ack], <read data>, [ACK], [STOP]
; WRITE REG    == [START], 0xD0 ADDR, [ack], <REG ADDR>, [ack], <WRITE DATA>, [ack], [STOP]
; READ MULTI   == [START], 0xD0 ADDR, [ack], <REG ADDR>, [ack], [START], 0xD1 ADDR, [ack], <read data>, [ACK], <read data>, [ACK], ... [STOP]
; WRITE MULTI  == [START], 0xD0 ADDR, [ack], <REG ADDR>, [ack], <WRITE DATA>, [ack], <WRITE DATA>, [ack], ... [STOP]

; best strategy is probably to allocate a 16 BYTE RAM buffer of time & date that is loaded via MULTI READ r0-r6:
; B0 = BCD seconds 00-59 [ 0  40S 20S 10S 8S 4S 2S 1S ]
; B1 = BCD minutes 00-59 [ 0  40M 20M 10M 8S 4S 2S 1S ]
; B2 = BCD hours   00-23 [ 0  ~24 20H 10H 8H 4H 2H 1H ]   ~24 == 0
; B3 = day 0-7           [ 0   0   0   0   0 4D 2D 1D ]
; B4 = date 0-31         [ 0   0   0  10T 8T 4T 2T 1T ]
; B5 = cent/month        [ C   0   0  10N 8N 4N 2N 1N ]
; B6 = year 0-99         [80Y 40Y 20Y 10Y 8Y 4Y 2Y 1Y ]
; B7,8,9,A = alarm 1 (see datasheet)
; BB,C,D = alarm 2  (see datasheet)
; BE = control [~EOSC BBSQW CONV NA NA INTCN A2IE A1IE ]   ~EOSC == 0, BBSQW == 0, CONV == 0, INTCN = 0 for 1HZ INT, 1 for ALARM INT, AxIE = 1 to enable alarm 
; BF = status  [ OSF  BB32K  0    0 EN32K BSY A2F A1F ]    OSF set when osc has stopped, BB32K == 0, EN32K == 0 (turn off), BSY (doing temp), AxF = 1 alarm match occured (manual clear)

; the RTC has SRAM built in as well, so let's just make a function to read a 16B page, to write a 16B page, and to write a single byte.
; These could all target a common buffer located in RAM.

; I2C low-level routines

;I2CPORT	EQU	IOPAGE+$20	;soft I2C port
;I2C.DSCK EQU $80
;I2C.DSDA EQU $40
;I2C.MSCK EQU $08
;I2C.MSDA EQU $04


// interface primitives
#define sI2C_SetSDAHigh		SDADataPort |= ( SDAMask )
SetSDAHigh MACRO NOEXPAND
		OIM	  #I2C.DSDA,I2CPORT		;I2C_SetSDAHigh
ENDM
	
#define sI2C_SetSDALow		SDADataPort &= ~( SDAMask )
SetSDALow MACRO NOEXPAND
		AIM   #~I2C.DSDA,I2CPORT	;I2C_SetSDALow
ENDM

#define sI2C_SDAStatus		(( SDADataPort & ( SDAMask )) != 0)
SDAStatus MACRO NOEXPAND
		TIM   #I2C.MSDA,I2CPORT		;I2C_SDAStatus (Z = 1 if SDA is low)
ENDM

#define sI2C_SetSCLHigh		SCLDataPort |= ( SCLMask )
SetSCLHigh MACRO NOEXPAND
		OIM	  #I2C.DSCK,I2CPORT		;I2C_SetSCLKigh
ENDM

#define sI2C_SetSCLLow		SCLDataPort &= ~( SCLMask )
SetSCLLow MACRO NOEXPAND
		AIM   #~I2C.DSCK,I2CPORT	;I2C_SetSCKLow
ENDM

#define sI2C_SCLStatus		(( SCLDataPort & ( SCLMask )) != 0)
SCLStatus MACRO NOEXPAND
		TIM   #I2C.MSCK,I2CPORT		;I2C_SCKStatus (Z = 1 if SCK is low)
ENDM



// I2C status flags
#define sI2C_fSuccess		0
#define sI2C_fNoSlaveAck	1
#define sI2C_fBusError		2

// EERead Acknowledge Constants
#define sI2C_ACKNOWLEDGE	1
#define sI2C_NOTACKNOWLEDGE	0

;; I2C_Initialize - set SCL and SDA high
I2C_Initialize
		SetSDAHigh		;I2C_SetSDAHigh
		SetSCKHigh		;I2C_SetSCKHigh
		RTS

;; I2C_SetClkHigh - sends SCL pin high and waits for any clock stretching peripherals. 
;	while (!sI2C_SCLStatus)
;	{
;		_nop_();		
;		_nop_();		
;		sI2C_SetSCLHigh;
;		_nop_();
;	}
I2C_SetClkHigh
		NOP
		NOP
		SetSCKHigh      ; try to release SCK
		NOP
		NOP
		SCKStatus 		; check is SCK is really high yet
		BEQ	  SetClkHigh   
		RTS

;; I2C_BitDelay - insures minimum high and low clock times on I2C bus. 
I2C_BitDelay
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
        RTS                                                               

;; I2C_SendStop - send a STOP condition
;	sI2C_SetSDALow;			// Get SDA ready for stop
;	sI2C_SetClkHigh();		// Set Clock for stop
;	sI2C_BitDelay();
;	sI2C_SetSDAHigh;		// Send I2C stop
;	sI2C_BitDelay();
I2C_SendStop
    	SetSDALow
		BSR	 SetClkHigh
		BSR  I2C_BitDelay
		SetSDAHigh
		BRA  I2C_BitDelay

;; I2C_SendByte - sends one byte of data to an I2C slave device and check for Slave ACK
;{
;	char stat;
;	unsigned char mask, i;
;	mask = 0x80;				// start at MSB
;	
;	for(i=0; i<8; i++)			// send one byte of data
;	{
;		if (wrbyte & mask)		// examine bit under mask
;			sI2C_SetSDAHigh;	// bit to send is 1, bring SDA high
;		else
;			sI2C_SetSDALow;		// bit to send is 0, bring SDA low
;
;		sI2C_SetClkHigh();		// bring SCL high at beginning of bit
;		sI2C_BitDelay();
;		sI2C_SetSCLLow;			// bring SCL low to clock in data
;		sI2C_BitDelay();
;		mask = mask >> 1;		// move from MSB -> LSB
;	}
;	stat = sI2C_SendNAK();		// Master NAK allows check for Slave ACK	
;	return stat;
;}
;;char I2C_SendByte(accumulator A)
I2C_SendByte
		PUSHS	A,X
		LDX		#8
?SB0	SetSDAHigh
		TSTA
		BPL		?SB1
		SetSTALow
?SB1	BSR		I2C_SetClkHigh
		BSR		I2C_BitDelay
		SetSCLLow
		BSR		I2C_BitDelay
		LSLA
		LEAX	-1,X
		BNE		?SB0
		PULS	A,X
		RTS

;; sI2C_RcvByte - receives one byte of data from an I2C slave device
;{
;	unsigned char mask,rdata,i;
;	rdata=0;
;	mask = 0x80;
;
;	sI2C_SDAInput;				// make DIR an input so reading can take place
;
;	for(i=0; i<8; i++)			// read one byte of data
;	{
;		sI2C_SetClkHigh();		// read one data bit
;		sI2C_BitDelay();
;		if ( sI2C_SDAStatus )		// get data bit from SDA pin
;			rdata |= mask;		// set masked bit in received byte if SDA is high
;
;		sI2C_SetSCLLow;			// clear SCL pin to end bit
;		sI2C_BitDelay();
;		mask = mask >> 1;		// move from MSB -> LSB
;	}
;
;	sI2C_SDAOutput;
;	if (sendack == 0)
;		sI2C_SendNAK();
;	else
;		sI2C_SendACK();
;
;	return rdata;
;}
;;accumulator B <- sI2C_RcvByte(sendack in CC.C)
I2C_RcvByte
		PUSHS	A,X
		TFR		CC,B		; copy CCR to B (to save carry bit)
		




// sI2C_SendNAK - send a NotAcknowlege from Master (also, check for Slave ACK)

char sI2C_SendNAK(void)
{
	char stat;

	sI2C_SetSDAHigh;		// release SDA line for MASTER Not Acknowledge / Query Slave Ack
	sI2C_SDAInput;
	sI2C_SetClkHigh();		// send clock for Mot Acknowledge
	sI2C_BitDelay();

	if ( sI2C_SDAStatus )		// check for valid acknowledge bit
		stat = sI2C_fNoSlaveAck;
	else
		stat = sI2C_fSuccess;

	sI2C_SetSCLLow;				// finish acknowledge bit
	sI2C_BitDelay();
	sI2C_SDAOutput;
	return stat;
}

// sI2C_SendACK - send an Acknowlege from Master

void sI2C_SendACK(void)
{
	sI2C_SetSDALow;			// Pull SDA low line for Acknowledge
	sI2C_SetClkHigh();		// send clock for acknowledge
	sI2C_BitDelay();
	sI2C_SetSCLLow;			// finish acknowledge bit
	sI2C_BitDelay();
}

// sI2C_GoMaster - sends an I2C start and slave address and check for acknowledge

char sI2C_GoMaster(unsigned char slaveaddr)
{
	char stat;

	sI2C_SetSDAHigh;		// make sure SDA and SCL are both high to start with
	sI2C_SetSCLHigh;
	sI2C_BitDelay();

	sI2C_SDAInput;			// make SDA an input temporarily to check its status

	if (sI2C_SDAStatus)
	{
		sI2C_SDAOutput;
		sI2C_SetSDALow;			// begin I2C start
		sI2C_BitDelay();
		sI2C_SetSCLLow;
		sI2C_BitDelay();		// complete I2C start
		stat = sI2C_SendByte(slaveaddr);
	}
	else
		stat = sI2C_fBusError;

	return stat;
}

// sI2C_EEWrite - writes one or more bytes of data to a specific address to an I2C EEPROM;

char sI2C_EEWrite(unsigned char slaveaddr, unsigned char bytecnt, unsigned int wraddr, char *wrdata)
{
	char stat;
	unsigned char count,temp;
	count = 0;

	stat = sI2C_GoMaster(slaveaddr & 0xfe);		// send START and slave address (WRITE)
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	temp = wraddr >> 8;
	stat = sI2C_SendByte(temp);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	temp = wraddr & 0xff;
	stat = sI2C_SendByte(temp);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	for(count=0; count < bytecnt; count++)
	{
		stat = sI2C_SendByte(wrdata[count]);
		if (stat != sI2C_fSuccess)
		{
			sI2C_SendStop();
			return stat;
		}
	}

	sI2C_SendStop();		// send stop command
	return sI2C_fSuccess;
}					


// sI2C_EEWriteByte - writes one byte of data to a specific address to an I2C EEPROM;

char sI2C_EEWriteByte(unsigned char slaveaddr, unsigned int wraddr, char wrdata)
{
	char stat;
	unsigned char temp;

	stat = sI2C_GoMaster(slaveaddr & 0xfe);		// send START and slave address (WRITE)
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	temp = wraddr >> 8;
	stat = sI2C_SendByte(temp);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	temp = wraddr & 0xff;
	stat = sI2C_SendByte(temp);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	stat = sI2C_SendByte(wrdata);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	sI2C_SendStop();		// send stop command
	return sI2C_fSuccess;
}					


// sI2C_EEWrite - writes one or more bytes of data to a specific address to an I2C EEPROM;

char sI2C_EERead(unsigned char slaveaddr, unsigned char bytecnt, unsigned int rdaddr, char *rddata)
{
	char stat;
	unsigned char count,temp;
	count = 0;

	stat = sI2C_GoMaster(slaveaddr & 0xfe);		// send START and slave address (WRITE)
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	temp = rdaddr >> 8;
	stat = sI2C_SendByte(temp);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	temp = rdaddr & 0xff;
	stat = sI2C_SendByte(temp);
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	stat = sI2C_GoMaster(slaveaddr | 0x01);		// send START and slave address (READ)
	if (stat != sI2C_fSuccess)
	{
		sI2C_SendStop();
		return stat;
	}

	if (bytecnt > 1)
		for(count=0; count < bytecnt-1; count++)
			rddata[count] = sI2C_RcvByte(sI2C_ACKNOWLEDGE);

	rddata[bytecnt-1] = sI2C_RcvByte(sI2C_NOTACKNOWLEDGE);

	sI2C_SendStop();		// send stop command
	return sI2C_fSuccess;
}

// sI2C_EEStatus - report status of the EEPROM (check for slave ack);

char sI2C_EEStatus(unsigned char slaveaddr)
{
	char stat;

	stat = sI2C_GoMaster(slaveaddr | 0x01);		// send START and slave address (READ)
												// slave should ACK the slave address
	sI2C_SendStop();							// we really didn't want to do anything else
												// so send I2C stop command.
	return stat;
}

		
;
; MACHINE VECTORS
;
		ORG	$FFF0
		FDB	RESET		; hd6309 illegal / div0 vector
		FDB	SWI3
		FDB	SWI2
		FDB	FIRQ
		FDB	IRQ
		FDB	SWIHND
		FDB	NMI
		FDB	RESET
	
;04165 3/10/2013





