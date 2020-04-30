* TEST06.ASM
* S-record load test the HD6309 SBC
* T. LeMense 2/8/2014

* HARDWARE INFORMATION
RAM	EQU	$0800		TEST01 data goes here

INOUTP	EQU	$0250		INOUT register address

* Start of program
	ORG	RAM
	
RESET	LDA	#$00
	STA	store
ZERO	LDA	INOUTP
	ANDA	#$80
	BMI	ZERO
ONE	INC	store                       ; increment the LED's (count up)
	LDA	store
	STA	INOUTP
TWO	LDA	INOUTP
	ANDA	#$80
	BPL	TWO
	BRA	ZERO
store	rmb	1	

	
