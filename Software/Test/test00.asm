* TEST00.ASM
* first test of the HD6309 SBC
* T. LeMense 1/20/2014

* HARDWARE INFORMATION
ROM	EQU	$C000		ROM starts here
RAM	EQU	$1F60		TEST00 data goes here

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
RES1	INC	RAM
	LDA	RAM
	STA	INOUTP
	BRA	RES1

* CPU vectors
	ORG	$FFF2
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	
	
