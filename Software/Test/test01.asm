* TEST01.ASM
*  test of the HD6309 SBC
* T. LeMense 1/20/2014

* HARDWARE INFORMATION
ROM	EQU	$C000		ROM starts here
RAM	EQU	$8030		TEST01 data goes here

ZSCC	EQU	$0200		SCC base address
ZCIO	EQU	$0210		CIO base address
ZRTC	EQU	$0220		RTC base address
SDCARD	EQU	$0230		SDCARD register address
SYSCFG	EQU	$0240		SYSCFG register address
INOUTP	EQU	$0250		INOUT register address

* Start of program
	ORG	ROM
RESET	LDA	#$00
	STA	RAM
ZERO	LDA	INOUTP
	ANDA	#$80
	BMI	ZERO
ONE	INC	RAM                       ; increment the LED's (count up)
	LDA	RAM
	STA	INOUTP
TWO	LDA	INOUTP
	ANDA	#$80
	BPL	TWO
	BRA	ZERO

* CPU vectors
	ORG	$FFF2
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	
	
