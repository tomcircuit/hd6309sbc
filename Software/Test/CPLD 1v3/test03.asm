* TEST03.ASM
* test of the Z85C30 SCC
* T. LeMense 1/26/2014

* HARDWARE INFORMATION
ROM	EQU	$C000		ROM starts here

ZSCC	EQU	$0210		SCC base address
SCCBC      EQU	ZSCC		SCC channel B command
SCCBD	EQU	ZSCC+1		SCC channel B data
SCCAC	EQU	ZSCC+2      		SCC channel A command
SCCAD	EQU	ZSCC+3		SCC channel A data
ZCIO	EQU	$0200		CIO base address
ZRTC	EQU	$0220		RTC base address
SDCARD	EQU	$0230		SDCARD register address
SYSCFG	EQU	$0240		SYSCFG register address
INOUTP	EQU	$0250		INOUT register address

* Start of program
	ORG	ROM
RESET	
INITSCC
	LDA	SCCAC	; reset the register pointer
           LDX	#SCCTBL
	
INIT0      LDA	0,X+	; load address from table
	CMPA	#$FF 	; is it $ff? (end of table)
	BEQ	OUTPUT	;    yes, done with init
	STA	SCCAC	;    no, write the register pointer to WR0
	LDA	0,X+	; get data byte from table
	STA	SCCAC	; write to SCC channel A command
	BRA	INIT0
	
OUTPUT
	LDA	SCCAC	; reset register pointer to WR0/RR0
	LDA	SCCAC	; read RR0
	ANDA	#%00000100	; examine the TX buffer empty bit
	BEQ	OUTPUT	;    if not empty, check again
	LDA	#'T'
	STA	SCCAD	; put character in data register
	BRA	OUTPUT

;Initialization table for SCC registers
; John Monahan (S100Computers.com)

SCCTBL:
	db 	$09 	; select WR9
	db 	%10000000 	; Reset Ch A
	db	$09	; select WR9 again
	db	%00000000	; un-reset CH A

	DB	$04          ;1, Point to WR4
   	DB    	$44          ;2, X16 clock,1 Stop,NP
;
   	DB    	$03          ;3, Point to WR3
   	DB    	$C1          ;4, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
;  	DB	$E1          ;4, Enable receiver, Auto Enable, Receive 8 bits (for CTS bit)
;
	DB	$05          ;5, Point to WR5
	DB	$EA          ;6, Enable, Transmit 8 bits RTS,DTR, Enable
;                 
   	DB	$0B          ;7, Point to WR11
;	DB	$56          ;8, Receive/transmit clock = BRG
	DB	$05	;8, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
;
	DB	$0C          ;9,  Point to WR12
;	DB	$02          ;10, Low byte 38,400 Baud
	DB    	$06          ;10, Low byte 19,200 Baud <<<<<<<<<<<
;	DB    	$0E          ;10, Low byte 9600 Baud
;	DB    	$1E          ;10, Low byte 4800 Baud
;	DB	$7E          ;10, Low byte 1200 Baud for debugging.
;	DB	$FE          ;10, Low byte 300 Baud for debugging.

	DB	$0D          ;11, Point to WR13
	DB	$00          ;12, High byte for Baud
;	DB	$01          ;12, High byte for Baud
;
	DB	$0E          ;13, Point to WR14
	DB	$01          ;14, Using a 4.9152 MHz BRG Clock.
;
	DB	$0F          ;15, Point to WR15(If required)
	DB	$00          ;16, Generate Int with CTS going high	

	DB	$FF	; EOT marker
	DB	$FF

	
	
;scctab: 	db 	$09 	;select WR9
;	db 	%10000000 	;Reset Ch A
;	db	$09
;	db	%00000000
;	db 	$04 	;select WR4A
;	db 	%01000100 	;x16,1stop,parity off
;	db 	$03 	;select WR3A
;	db 	%11000000 	;Rx 8bit/char, RX not enabled yet
;	db 	$05 	;select WR5A
;	db 	%01100000 	;tx 8bit/char, TX not enabled yet
;	db 	$0a 	;select WR10A
;	db 	%00000000 	;set as default
;	db 	$0b 	;select WR11A
;	db 	%00000100 	;
;                 ; 0 	No xtal
;                 ;  0000 	TxC,RxC from RTXCA
;                 ;      100 	TRxC = xtal out (high)
;	db 	$0e 	;select WR14A
;	db 	%00000110 	;
;	      ; 000 	nothing about DPLL
;	      ;    0 	No Local loopback
;	      ;     0 	No local echo
;	      ;      1 	DTR/REQ is req
;	      ;       1 	BRG source = PCLK
;	      ;        0 	Not enabling BRG 
;	db 	$03 	;select WR3
;	db 	%11000001 	;rx enable	
;	db 	$01 	;select WR1A
;	db 	%00000000 	;no DMA and no INTs
;	db 	$0f 	;select WR15
;	db 	%00000000 	;don’t use any of ext/stat int
;	db 	$10 	;reset ext/stat twice
;	db 	$10
;	db 	$01 	;select WR1B
;	db 	%00000000 	;no int
;	db 	$ff 	;end of table	

* CPU vectors
	ORG	$FFF2
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	


