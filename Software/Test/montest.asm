;********************************************
; SDCARD port at $C030
;    8 bits of data to transfer via SPI
;
; SYSPORT at $C040
;
; SYSTEM CONFIG port
;      7   6   5   4    3     2      1      0
;	[--][A2][A1][A0][CONF][RA14][ROMSEL][ROMWS]
;      X   O   O   O    I     O      O      O   
;  all bits readable, output bits readback
;  unused bits (X) read back as '0'
;
; INPUT-OUTPUT port at $C050
;
; INOUTP port
;       7     6      5      4    3   2    1     0
;    [SDSW][SDBSY][SDCLK][SDCS][PB][--][LED2][LED1]
;       I     I      O      O    I   X    O     O
;  all bits read, output bits readback
;
;  SDSW == 1 when SD card is inserted
;  SDBSY == 1 while SPI transaction is taking place
;  SDCLK = 1 --> slow SPI clock; 0 --> fast SPI clock
;  SDCS = 1 --> CS signal to SDcard negated; 0 --> asserted
;  PB == 1 when pushbutton is pressed
;  LEDn = 1 --> illuminate corresponding LED
;
; negate SD csel --> OIM IO.SDCS,IOPORT
; assert SD csel --> AIM ~IO.SDCS,IOPORT 
;
; see http://www.pjrc.com/tech/8051/ide/fat32.html
;
;********************************************

ZSCC		EQU	$C010		SCC base address
SCCBC     EQU	ZSCC		SCC channel B command
SCCBD	EQU	ZSCC+1		SCC channel B data
SCCAC	EQU	ZSCC+2      		SCC channel A command
SCCAD	EQU	ZSCC+3		SCC channel A data

SDPORT	EQU	$C030
SYSPORT	EQU	$C040
SYS.ROMWS	 	EQU	$01
SYS.ROMSEL 	EQU	$02
IOPORT	EQU	$C050

IO.LED1	EQU	$1
IO.LED2	EQU	$2
IO.PBTN	EQU	$8
IO.SDCS	EQU	$10
IO.SDCLK	EQU	$20
IO.SDSW	EQU	$80
IO.SDBSY	EQU	$40

MONITOR 	EQU	$C100
RELOBUF	EQU	$4100

		ORG	$0000

		JSR	SCCINIT
		JSR	WRMSG
		FCB	$A,$D
		FCN	"Moving monitor to RAM"

		LDX	#MONITOR
		LDU	#RELOBUF
		LDW	#$1F00
		TFM	X+,U+

		JSR	WRMSG
		FCB	$A,$D
		FCN	"Montior relocated to RAM"
		
		JSR	WRMSG
		FCB	$A,$D
		FCN	"turning OFF ROMSEL bit"
		
		AIM	~SYS.ROMSEL,SYSPORT	; turn off the ROMSEL signal - RAM banks over ROM

		JSR	WRMSG
		FCB	$A,$D
		FCN	"ROMSEL is off!"

		JSR	WRMSG
		FCB	$A,$D
		FCN	"Moving monitor to high RAM"
		
		LDX	#RELOBUF
		LDU	#MONITOR
		LDW	#$1F00
		TFM	X+,U+
		
		JSR	WRMSG
		FCB	$A,$D
		FCN	"Montior relocated to high RAM"
				
		JSR	WRMSG
		FCB	$A,$D
		FCN	"modifying high RAM copy of Monitor"
		
		; replace the version number with the word "RAM"
		LDA	#'R
		STA	$C141
		LDA	#'A
		STA	$C142
		LDA	#'M
		STA	$C143

		JSR	WRMSG
		FCB	$A,$D
		FCC	"returning to modified RAM monitor"
		FCB	$A,$D,$0
		
		JMP	$C100

***************************************
* SCCINIT - Initialize SCC Channel A
***************************************
* Configure SCC.A per the SCC config
* table.
***************************************
SCCINIT	LDA	SCCAC	; reset the register pointer
     	LDX	#SCCATBL
S0?	  	LDA	,X+		; load address from table
		CMPA	#$FF 	; is it $ff? (end of table)
		BEQ	S1?		;    yes, done with init of Ch A
		STA	SCCAC	;    no, write the register pointer to WR0
		LDA	,X+		; get data byte from table
		STA	SCCAC	; write to SCC channel A command
		BRA	S0?
S1?		RTS
	
;Initialization table for SCC Channel A in ASYNC mode, external 16x clock
; thanks to John Monahan (S100Computers.com)!

SCCATBL:
	FCB 	$09,$80 	; WR9, reset channel A
	FCB	$09,$00	; WR9, un-reset channel A
	FCB	$04,$44	; WR4, X16 clock,1 Stop,NP
   	FCB  $03,$C1	; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
	FCB	$05,$EA   ; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
   	FCB	$0B,$05	; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
	FCB	$0C,$04	; WR12, Low byte 9600 Baud (optional)
	FCB	$0D,$00	; WR13, High byte for Baud (optional)
	FCB	$0E,$01	; WR14, Using a 1,8432 MHz BRG Clock (ECLK)
	FCB	$0F,$00	; WR15, No INT from hardware CTS/RTS
	FCB	$FF,$FF	; EOT marker

***************************************
* SCCREAD - Read Byte from SCC Ch. A
***************************************
* return with the byte in A and the Z
* flag cleared. If no character avaialble,
* A and Z are both cleared.
***************************************
SCCREAD
		LDA	SCCAC	; reset register pointer to WR0/RR0
		LDA	SCCAC	; read RR0
		ANDA	#%00000001	; examine the RX char available bit
		BEQ	S0?		; none there, clear A,Z and exit
		LDA	SCCAD
		ANDCC #%11111011	; clear the Z flag
		RTS
S0?		CLRA 
		RTS
	
***************************************
* SCCWRITE - Write byte to SCC Ch. A
***************************************
* transmit byte in A via SCC channel
* A. This function is blocking, and
* will wait until the SCC is ready.
***************************************
SCCWRITE	PSHS	A
S0?		LDA	SCCAC	; reset register pointer to WR0/RR0
		LDA	SCCAC	; read RR0
		ANDA	#%00000100	; examine the TX buffer empty bit
		BEQ	S0?	;    if not empty, check again
   		PULS	A
		STA	SCCAD	; put character in data register
		RTS
	

***************************************
* WRMSG - Write string(PC) to console
***************************************
* The string data immediately follows
* the function call. The string must
* be terminated with either a 0 (null)
* or an $FF. The $FF terminator issues
* a newline (CR+LF) after the string,
* while the null terminator does not.
*
* Return address on stack is altered
* to be term+1 prior to RTS.
***************************************
WRMSG	PSHS	X				; save 'X'
	LDX	2,S			; return address is start of string
	BSR	WRSTR			; output the string to the console
					; X now points to end of string+1
	STX	2,S			; save the correct return address (end of string+1)
	PULS	X				; restore 'X'
	RTS
	
****************************************
* WRSTR - Write string(x) to console
***************************************
* The string data is in memory and is
* pointed to by X. The string must
* be terminated with either a 0 (null)
* or an $FF. The $FF terminator issues
* a newline (CR+LF) after the string,
* while the null terminator does not.
*
* X is destroyed (points to term+1)
***************************************
WRSTR	PSHS	A			; Save A value at entry
WRSTR1	LDA	,X+			; Get char from X
	TSTA				; Test character for null terminator
	BEQ	WRSPAC1			;   yes, restore A and exit
	CMPA	#$FF			; is it an $FF terminator?
	BEQ	WRLFCR1			;  yes, issue LF+CR and exit
	JSR	SCCWRITE			; output the char to console
	BRA	WRSTR1			; process next character
	
****************************************
* WRSPACE - Write a space to console
****************************************
WRSPACE	PSHS	A			; Save A value at entry
	LDA	#$20			; Output a space to console
	JSR	SCCWRITE
WRSPAC1	PULS	A			; restore A value prior to return
	RTS
	
****************************************
* WRLFCR - Write LF+CR to console
****************************************
WRLFCR	PSHS	A				; Save A value at entry
WRLFCR1	LDA	#$0A			; Output LF to console
	JSR	SCCWRITE	
	LDA	#$0D			; Output CR to console
	JSR	SCCWRITE	
	PULS	A				; restore A value prior to return
	RTS

****************************************
* WRWORD - Write value of D as hex word
****************************************
WRWORD	PSHS	A				; save the A accumulator value
	BSR	WRBYTE			; Output upper byte of word (A)
	TFR	B,A			; transfer lower byte of word to A
	BSR	WRBYTE			; output lower byte of word (B)
	PULS	A				; restore original A value
	RTS
	
****************************************
* WRBYTE - Write value in A as hex byte
****************************************
WRBYTE	PSHS	A				; Save A value to restore upon return
	PSHS	A				; Save A value for later
	LSRA				; shift high nybble into 4 LSB of A
	LSRA			
	LSRA			
	LSRA			
	BSR	WRDIG			; write the high nybble of A to console
	PULS	A				; restore byte value
	BSR	WRDIG			; write the low nybble to A to console
	PULS	A				; restore A value prior to return
	RTS
					
****************************************
* WRDIG - Write value in 4 LSB of A as a hex digit
****************************************
WRDIG	PSHS	A				; save A value to restore upon return
	ANDA	#$0F			; mask off 4 MSB
	ADDA	#'0			; convert base to ASCII 
	CMPA	#'9			; is result numeric?
	BLS	WRDIG1		;    yes, output to console
	ADDA	#7			; add 7 to convert to alpha
WRDIG1	JSR	SCCWRITE			; output character to console
	PULS	A				; restore A value prior to return
	RTS






