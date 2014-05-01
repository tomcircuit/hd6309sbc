* TEST09.ASM
* test of the Z85C30 SCC channel B
* T. LeMense 3/29/2014

* HARDWARE INFORMATION
ZSCC		EQU	$C010		; SCC base address
SCCBC	EQU	ZSCC			; SCC channel B command
SCCBD	EQU	ZSCC+1		; SCC channel B data
SCCAC	EQU	ZSCC+2      	; SCC channel A command
SCCAD	EQU	ZSCC+3		; SCC channel A data
ZCIO		EQU	$C000		; CIO base address
ZRTC		EQU	$C020		; RTC base address
SDCARD	EQU	$C030		; SDCARD register address
SYSCFG	EQU	$C040		; SYSCFG register address
INOUTP	EQU	$C050		; INOUT register address

* Start of program
		ORG	0

INITSCC:	LDA	SCCBC		; reset the SCC ch.B register pointer
		LDX	#SCCTBL
L?0		LDA	,X+			; load address from table
		CMPA	#$FF 		; is it $ff? (end of table)
		BEQ	OUTPUT		;    yes, done with init
		STA	SCCBC		;    no, write the register pointer to WR0
		LDA	,X+			; get data byte from table
		STA	SCCBC		; write it to SCC ch.B
		BRA	L?0
	
OUTPUT:	LDA	SCCBC		; reset ch.B register pointer to WR0/RR0
		LDA	SCCBC		; read RR0
		ANDA	#%00000100	; examine the TX buffer empty bit
		BEQ	OUTPUT		;    if not empty, check again
		LDA	#'B
		STA	SCCBD		; put character in ch.B data register
		
L?0		LDA	SCCAC		; reset ch.A register pointer to WR0/RR0
		LDA	SCCAC		; read RR0
		ANDA	#%00000100	; examine the TX buffer empty bit
		BEQ	L?0			;    if not empty, check again
		LDA	#'A
		STA	SCCAD		; put character in ch.A data register
		BRA	OUTPUT

;Initialization table for SCC registers
; thanks to John Monahan (S100Computers.com)

SCCTBL:
		FCB 	$09 			; select WR9
		FCB 	%01000000 	; Reset Ch B
		FCB	$09			; select WR9 again
		FCB	%00000000		; un-reset Ch B

		FCB	$04			; Point to WR4
   		FCB 	$44          	; X16 clock,1 Stop,NP

   		FCB 	$03          	; Point to WR3
   		FCB 	$C1          	; Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits

		FCB	$05          	; Point to WR5
		FCB	$EA          	; Enable, Transmit 8 bits RTS,DTR, Enable

	   	FCB	$0B          	; Point to WR11
		FCB	$05			; RX clock = TX clock = RTXC pin; TRXC pin = xmit clock

;		FCB	$0C          	; Point to WR12
;		FCB  $06          	; Low byte 19,200 Baud
;		FCB 	$0E          	; Low byte 9600 Baud

;		FCB	$0D          	; Point to WR13
;		FCB	$00          	; High byte for Baud
;		FCB	$01          	; High byte for Baud

;		FCB	$0E			; Point to WR14
;		FCB	$01			; Using a 4.9152 MHz BRG Clock.

;		FCB	$0F			; Point to WR15(If required)
;		FCB	$00			; Generate Int with CTS going high	

		FCB	$FF			; EOT marker
		FCB	$FF

	


