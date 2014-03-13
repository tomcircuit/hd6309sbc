* TEST08.ASM
* EEPROM write test the HD6309 SBC
* T. LeMense 2/15/2014

* HARDWARE INFORMATION
RAM	EQU	$0800		TEST01 data goes here
ZCIO	EQU	$0200		CIO base address
CIOC	EQU	ZCIO                      CIO port C access
CIOB	EQU	ZCIO+1		CIO port B access
CIOA	EQU	ZCIO+2		CIO port A access
CIOCTL	EQU	ZCIO+3                    CIO control register
ZSCC	EQU	$0210		SCC base address
SCCBC      EQU	ZSCC		SCC channel B command
SCCBD	EQU	ZSCC+1		SCC channel B data
SCCAC	EQU	ZSCC+2      		SCC channel A command
SCCAD	EQU	ZSCC+3		SCC channel A data
INOUTP	EQU	$0250		INOUT register address
SYSPORT    EQU	$0240		SYS register
TARGET	EQU	$E500		target EEPROM write address

;-- SYSTEM CONFIG port at 0x240
;--       7    6   5   4   3    2      1       0
;--    [CONF][--][--][--][--][RA14][ROMSEL][BAUDSEL]
;--       I    X   X   X   X    O      O       O   
;--  all bits readable, output bits readback

* Start of program
	ORG	RAM

	LDA	SYSPORT		; load the SYSPORT contents
	BMI	QUIT		; CONF should be LOW, otherwise it's not EEPROM
	LDA	#$03		; try a write with RA14 (enable) low --> shouldn't work!!
	STA	SYSPORT
	
	LDA	#'T'
	STA	TARGET
	LDA	#'o'
	STA	TARGET+1
	LDA	#'m'
	STA	TARGET+2
	
	LDA	#$FF
	BSR	DELAY
	LDA	#$FF
	BSR	DELAY
	LDA	#$FF
	BSR	DELAY
		
TOG1
	LDA	TARGET
	CMPA	TARGET
	BNE	TOG1
	
	LDA	#$07		; try a write with RA14 (enable) high --> should work!!
	STA	SYSPORT
	
	LDA	#'D'
	STA	TARGET+3
	LDA	#'o'
	STA	TARGET+4
	LDA	#'g'
	STA	TARGET+5
	
	LDA	#$FF
	BSR	DELAY
	LDA	#$FF
	BSR	DELAY
	LDA	#$FF
	BSR	DELAY
		
TOG2
	LDA	TARGET
	CMPA	TARGET
	BNE	TOG2				
	
	LDA	#$03
	STA	SYSPORT
QUIT
	JMP	$C000
				
				
***************
* DELAY
* delay 3.2us per acc-A LSB
***************
DELAY.0
	NOP
	NOP
	NOP
	NOP
DELAY
	DECA
	BNE	DELAY.0
	RTS
				
