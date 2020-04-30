* TEST04.ASM
* test of the DLP2232 FIFO
* T. LeMense 2/1/2014

* HARDWARE INFORMATION
ROM	EQU	$C000		ROM starts here

RAM	EQU	$1234
STACK	EQU	$2000		
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
FIFOD	EQU	$02F0		; FIFO data port
FIFOS	EQU	$02F1		; FIFO status port

* Start of program
	ORG	ROM
RESET	
	LDA	#$00
	STA	RAM
	LDS	#STACK

ZERO	LDA	INOUTP
	ANDA	#$80
	BMI	ZERO
ONE	LDA	INOUTP
	ANDA	#$80
	BPL	ONE

	INC	RAM
	LDA	RAM
	STA	INOUTP
	ANDA	#$07
	ORA	#$30
	BSR	WRITE
	
	LDA	FIFOS
	BSR	HEXOUT
	BRA	ZERO
	
* READ UART(X)
READ	LDA	FIFOS
	ANDA	#$07
	STA	INOUTP
	ANDA	#%00001001
	BNE	NOCHR
	LDA	FIFOD
	ORCC	#%00000100	SET 'Z'
	RTS
NOCHR	LDA	#$FF		NO CHAR
	RTS
	
* WRITE UART(X)
WRITE	LDB	FIFOS
	ANDB	#%00001010
	BNE	WRITE
	STA	FIFOD
	RTS
	
HEXOUT	PSHS	A		Save low nibble
	LSRA			Rotate
	LSRA			upper nibble
	LSRA			into
	LSRA			lower nibble
	BSR	HOUT		Output high nibble
	PULS	A		Rertore low nibble
*
* OUTPUT A NIBBLE (IN HEX) FROM REGISTER A
*
HOUT	ANDA	#$0F		Remove upper half
	ADDA	#'0'		Convert to printable
	CMPA	#'9'		In range?
	BLS	HOUT1		Yes, display
	ADDA	#7		Convert to alpha
HOUT1	BRA	WRITE		Output character
	


* CPU vectors
	ORG	$FFF2
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	FDB	RESET
	
	
