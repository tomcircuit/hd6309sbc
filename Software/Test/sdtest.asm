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

ZSCC		EQU	$C010		; SCC base address
SCCAC	EQU	ZSCC+2      	; SCC channel A command
SCCAD	EQU	ZSCC+3		; SCC channel A data

SDPORT	EQU	$C030
SYSPORT	EQU	$C040
IOPORT	EQU	$C050

IO.LED1	EQU	$1
IO.LED2	EQU	$2
IO.PBTN	EQU	$8
IO.SDCS	EQU	$10
IO.SDCLK	EQU	$20
IO.SDSW	EQU	$80
IO.SDBSY	EQU	$40

MONITOR 	EQU	$C100		; monitor coldstart entry

SD.CMD	EQU 	0
SD.A3	EQU	1
SD.A2	EQU	2
SD.A1	EQU	3
SD.A0	EQU	4
SD.CRC	EQU	5

		ORG	$0000

		JSR	SPIINIT
		JSR	SCCINIT
		JSR	WRMSG
		FCB	$A,$D
		FCN	"SCC Initialized"

SD00:	JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Trying a CMD8...R7="
		JSR	CLRRESBUF
		AIM	~IO.SDCS,IOPORT	; assert SD csel	
		JSR	SD_CMD8                                                                                                         
		OIM	IO.SDCS,IOPORT		; negate SD csel		
		JSR	PRRESBUF
		TST	RESBUF		; examine the R1 byte
		LBPL	SD0B			; if R1 is positive, command passed, so skip init

; use the SD_INIT routine to initialize the SD card into SPI mode
SD0:		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Trying to reset SD card...R1="
		JSR	SPIINIT		; init the SPI port
		TIM	IO.SDCS,IOPORT		; check the CS line
		LBNE	SDE			; if negated, there's no card - terminate!
		JSR	SD_INIT		; init the SD card
		JSR	WRBYTE
		LBMI	SDE			; if R1 is negative, init failed, so terminate

; send a CMD8 to query the card (only works for SD V2 or later, so pretty much all micro-SD cards)
SD0A:	JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Trying a CMD8...R7="
		JSR	CLRRESBUF
		AIM	~IO.SDCS,IOPORT	; assert SD csel			
		JSR	SD_CMD8                                                                                                         
		OIM	IO.SDCS,IOPORT		; negate SD csel		
		JSR	PRRESBUF
		TST	RESBUF		; examine the R1 byte
		LBMI	SDE			; if R1 is negative, terminate

; send ACMD41 to initialize the card
SD0B:	JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Trying an ACMD41"
		CLR	RESBUF+6		; clear timeout counter
SD1:		INC	RESBUF+6		; increment timeout counter
		BMI	SDE			; if 128 tries or more, terminate
; send CMD55 to precede the ACMD41	
		JSR	WRMSG	
		FCB	$0A,$0D
		FCN	"First sending CMD55...R1="
		AIM	~IO.SDCS,IOPORT	; assert SD csel
		JSR	SD_CMD55
		OIM	IO.SDCS,IOPORT		; negate SD csel
		JSR	WRBYTE
; send CMD41 to initialize the card
		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Next sending CMD41...R1="	
		AIM	~IO.SDCS,IOPORT	; assert SD csel
		JSR	SD_CMD41
		JSR	WRBYTE
		OIM	IO.SDCS,IOPORT		; negate SD csel
		TSTA				; test R1 for Z/N
		BEQ	SD2			;   zero; move on to next command
		BMI	SDE			;   negative; terminate
		BRA	SD1			; loop until init is complete

; error during SD card access - terminate!	
SDE:		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Terminating"
		OIM	IO.SDCS,IOPORT		; negate SD csel	
		JMP	MONITOR

; send CMD58 to ensure that block addressing is in effect	
SD2:		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Trying a CMD58...R1="
		AIM	~IO.SDCS,IOPORT  	; assert SD csel
		JSR	CLRRESBUF
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
		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Reading LBA #00123456...RET="
		AIM	~IO.SDCS,IOPORT	  	; assert SD csel
		LDX	#BLKBUF
		LDD	#LBA_T_S
		JSR	SD_RD_BLOCK
		JSR	WRBYTE
		OIM	IO.SDCS,IOPORT	; negate SD csel
	
; display the sector data
	
		JSR	WRMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	WRBYTE

; modify the sector data
	
		LDX	#BLKBUF		; point to beginning of block data
		LDD	LBA_T_S		; put $0012 into first word of block
		STD	,X
		LDD	LBA_T_S+2		; put $3456 into second word of block
		STD	2,X
		INC	BLKBUF+511	; increment last byte of block

; display the sector data
	
		JSR	WRMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	WRBYTE
		
; write this same sector back to the card 

		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Writing LBA #00123456...RET="
		AIM	~IO.SDCS,IOPORT	  	; assert SD csel
		LDX	#BLKBUF
		LDD	#LBA_T_S
		JSR	SD_WR_BLOCK
		JSR	WRBYTE
		OIM	IO.SDCS,IOPORT	; negate SD csel

; clear the block buffer
		CLR	BLKBUF
		LDX	#BLKBUF
		LDU	#BLKBUF+1
		LDW	#511
		TFM	X+,U+
		
		JSR	WRMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	WRBYTE
			
; read the sector back into the block buffer

		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"Reading LBA #00123456...RET="
		AIM	~IO.SDCS,IOPORT	  	; assert SD csel
		LDX	#BLKBUF
		LDD	#LBA_T_S
		JSR	SD_RD_BLOCK
		JSR	WRBYTE
		OIM	IO.SDCS,IOPORT	; negate SD csel
	
; display the sector data
	
		JSR	WRMSG
		FCB	$0A,$0D
		FCN	" last byte of block buffer ="
		LDA	BLKBUF+511
		JSR	WRBYTE

SDX:		JSR	WRMSG
		FCB	$0A,$0D
		FCN	"All done!"
		OIM	IO.SDCS,IOPORT		; negate SD csel
		JMP	MONITOR
	
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
		JSR	SPIRECV			; read four more response bytes (R7)
		STB	RESBUF+1
		JSR	SPIRECV		
		STB	RESBUF+2	
		JSR	SPIRECV		
		STB	RESBUF+3	
		JSR	SPIRECV		
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
SD0?		JSR	SPIRECV		; send Ncs
		CMPB	#$FF
		BNE	SD0?			; loop until $FF received!
		CLRB				; clear byte counter
SD1?		LDA	,X+			; command + addr + crc
		JSR	SPISEND		; send the byte
		INCB				; increment byte counter
		CMPB	#6			; sent all 6 bytes yet?
		BNE	SD1?			;    no, loop again
		LDX	#0				; clear byte counter	
SD2?		JSR	SPIRECV		; send a dummy and read the response
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
RD1?		JSR	SPIRECV  		; wait for $FE start token
		TSTB				; examine token received
		BPL	SDRDEB		; if positive, it's an error token
		CMPB	#$FE			; check if it's a start token
		BNE	RD1?			;    no, get next token
		LDX	,S			; point to beginning of block buffer
		LDD	#512			; init transfer counter
SDRD2	JSR	SPIRBLK		; transfer 512 bytes
		JSR	SPIRECV		; read the CRC value into RESBUF[0..1]
		STB	RESBUF
		JSR	SPIRECV
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
CSD1?	JSR	SPIRECV     	; wait for $FE start token
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
		JSR	SPIRECV     	; send two $FF bytes
		JSR	SPIRECV
		LDA	#$FE			; send the $FE start token
		JSR	SPIBYTE
		LDX	,S			; load buffer pointer into X
		LDD	#512			; init transfer counter
		JSR	SPIWBLK		; transfer 512 bytes to SD card
		JSR	SPIRECV		; write a dummy CRC value to card
		JSR	SPIRECV		
		JSR	SPIRECV		; get data response
		ANDB	#$1F
		PSHS	B			; save the response on stack
SDWR2	JSR	SPIRECV		; send a dummy byte
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
		LDA	4,X 			; save transfer count to TEMP
		STA	TEMP	
		LDA	#$59			; WRITE_SINGLE_BLOCK command (25)
		STA	SD.CMD,X
		CLR	SD.CRC,X
		JSR	SD_SEND_CMD
		CMPA	#0			; OK response from write command?
		BNE	SDWME		;    no, terminate!
WM1?		JSR	SPIRECV     	; send two $FF bytes
		JSR	SPIRECV
		LDA	#$FC			; send the $FC START token
		JSR	SPIBYTE
		PULS	X			; point to source block buffer
		LDD	#512			; init transfer counter
		JSR	SPIWBLK		; transfer 512 bytes to SD card
		PSHS	X			; save updated block buffer pointer
		JSR	SPIRECV		; write a dummy CRC value to card
		JSR	SPIRECV		
		JSR	SPIRECV		; get data response
		ANDB	#$1F
		STB	TEMP+1		; save the response at TEMP+1
WM2?		JSR	SPIRECV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	WM2?			;    keep polling
		TST	TEMP			; examine the block transfer counter
		BEQ	WM3?			; counter is zero, done with all blocks
		DEC	TEMP			; non-zero, decrement the counter
		BRA	WM1?			; send the next packet	
WM3?		LDA	#$FD			; send a STOP_TRAN token
		JSR	SPISEND	
		JSR	SPIRECV		; send a dummy byte 
WM4?		JSR	SPIRECV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	WM4?			;    keep polling
		LDA	TEMP+1		; put data response into A
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
		LDA	4,X 			; save transfer count to TEMP
		STA	TEMP	                   	
		LDA	#$52			; READ_MULTIPLE_BLOCK command (18)
		STA	CMDBUF+SD.CMD           	
		CLR	CMDBUF+SD.CRC           	
		LDX	#CMDBUF                 	
		JSR	SD_SEND_CMD	; send CMD18
		TSTA				; OK response from read command?
		BNE	SDRME		;    no, terminate!
RM1?		JSR	SPIRECV  		; wait for $FE start token
		TSTB				; examine token received
		BPL	SDRMEB		; if positive, it's an error token
		CMPB	#$FE			; check if it's a start token
		BNE	RM1?			;    no, get next token
		PULS	X			; get destination pointer
		LDD	#512			; init transfer counter
		JSR	SPIRBLK		; transfer 512 bytes
		PSHS	X			; save the updated dest pointer
		JSR	SPIRECV		; read the CRC value (16 bits)
		JSR	SPIRECV			
		TST	TEMP			; examine the block transfer counter
		BEQ	RM3?			; counter is zero, done with all blocks
		DEC	TEMP			; non-zero, decrement the counter
		BRA	RM1?			; get the next packet	
		LDX	#SDCMD12		; point to CMD12 sentence
RM3?		JSR	SPIRECV		; send Ncs
		CMPB	#$FF                   	
		BNE	RM3?			; loop until $FF received!
		CLRB				; clear byte counter
RM4?		LDA	,X+			; command + addr + crc
		JSR	SPISEND		; send the byte
		INCB				; increment byte counter
		CMPB	#6			; sent all 6 bytes yet?
		BNE	RM4?			;    no, loop again
		JSR	SPIRECV		; get stuff byte
		LDX	#0			; clear byte counter	
RM5?		JSR	SPIRECV		; send a dummy and read the response
		TSTB				; examine the received byte (B)
		BPL	RM6?			;    non-negative, got a response!
		LEAX	1,X	         	; increment byte counter
		CMPX	#8			; waited 8 bytes yet?
		BNE	RM5?			;    no, try again
RM6?		TFR	B,A			; move response to A	
RM7?		JSR	SPIRECV		; send a dummy byte
		CMPB	#$FF			; anything other than $FF = busy
		BNE	RM7?			;    keep polling
		CLRA				; clear A (all OK)
SDRME	PULS	X			; restore block buffer pointer
		RTS                         	
SDRMEB	TFR	B,A			; move error token from B into A
		PULS	X			; restore block buffer pointer
		RTS				

********************************************
*              SPI stuff
********************************************
	
********************************************
* SPIINIT - check for card, if card
*           present, assert SD CS
********************************************
SPIINIT:	OIM	IO.SDCS,IOPORT		; negate SD CS
		TIM	IO.SDSW,IOPORT 	; test the card detect switch
		BEQ	S0?				; if no card, leave CS negated
		AIM	~IO.SDCS,IOPORT	; if card, assert SD CS
S0?		RTS
	
********************************************
* SPIEXIT - negate SD CS signal
********************************************
SPIEXIT:	OIM	IO.SDCS,IOPORT		; negate SD CS signal
		RTS

********************************************
* SPIBYTE - r/w transfer a byte via SPI master 
* On Entry: A = byte to send
* On Exit:  B = byte received
*	  A is preserved
********************************************
SPIBYTE:	BSR	SPISEND			; send byte in A via SPI
SB0		TIM  IO.SDBSY,IOPORT	; wait for transaction to end
		BNE	SB0
		LDB	SDPORT			; read recevied byte into B
		RTS

********************************************
* SPISEND - write a byte via SPI master
* On Entry: A = byte to send
* On Exit: all registers preserved
********************************************
SPISEND:	TIM  IO.SDBSY,IOPORT	; make sure SPI is ready
		BNE	SPISEND
		STA	SDPORT			; send A via SPI
		RTS

********************************************
* SPIRECV - read a byte via SPI master
* On Entry: 
* On Exit: B = byte read from SPI
********************************************
SPIRECV:	TIM  IO.SDBSY,IOPORT	; make sure SPI is ready
		BNE	SPIRECV
		LDB	#$FF				; dummy byte value
		STB	SDPORT			; send dummy via SPI
		BRA	SB0				; exit via SPIBYTE

********************************************
* SPIRBLK - read a block of bytes via SPI master
* CPOL=0 the base value of the clock is zero
* CPHA=0, data is propagated on a falling edge (high->low clock transition)
* On Entry: X = pointer to destination block
*           D = number of bytes to be read
* On Exit:  X = pointer to destination block+512
*           D = 0
********************************************
SPIRBLK:	PSHS	B			; B gets used by SPIRECV
		BSR	SPIRECV		; send a dummy and read a data byte
		STB	,X+			; store in buffer
		PULS	B			; restore LSB of byte counter
		DECD				; decrement it
		BNE	SPIRBLK		;    not done yet, keep reading
		RTS

********************************************
* SPIWBLK - write a block of bytes via SPI master
* CPOL=0 the base value of the clock is zero
* CPHA=0, data is propagated on a falling edge (high->low clock transition)
* On Entry: X = pointer to source block
*           D = number of bytes to be read
* On Exit:  X = pointer to source block+512
*           D = 0
********************************************
SPIWBLK:	PSHS	A			; A gets used by SPISEND
		LDA	,X+			; get byte to send from source block
		JSR	SPISEND		; send data byte (ignore read)
		PULS	A			; restore MSB of byte counter
		DECD				; decrement it
		BNE	SPIWBLK		;    not done yet, keep reading
		RTS
	
***************************************
*  Result Buffer utility functions
***************************************
; clear result buffer
CLRRESBUF	LDX	#RESBUF
C1?		CLR	,X+
		CMPX	#CMDBUF
		BLO	C1?	
		RTS
	
; print result buffer
PRRESBUF:	LDX	#RESBUF
P1?		LDA	,X+
		JSR	WRBYTE
		JSR	WRSPACE
		CMPX	#CMDBUF
		BLO	P1?	
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
WRMSG	PSHS	X			; save 'X'
		LDX	2,S			; return address is start of string
		BSR	WRSTR		; output the string to the console
						; X now points to end of string+1
		STX	2,S			; save the correct return address (end of string+1)
		PULS	X			; restore 'X'
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
W1?		LDA	,X+			; Get char from X
		TSTA				; Test character for null terminator
		BEQ	WRWRD1		;   yes, restore A and exit
		CMPA	#$FF			; is it an $FF terminator?
		BEQ	WRLFCR1		;  yes, issue LF+CR and exit
		JSR	SCCWRITE		; output the char to console
		BRA	W1?			; process next character
	
****************************************
* WRSPACE - Write a space to console
****************************************
WRSPACE	PSHS	A			; Save A value at entry
		LDA	#$20			; Output a space to console
		JSR	SCCWRITE
		BRA	WRWRD1		; restore A value prior to return	
		
****************************************
* WRLFCR - Write LF+CR to console
****************************************
WRLFCR	PSHS	A			; Save A value at entry
WRLFCR1	LDA	#$0A			; Output LF to console
		JSR	SCCWRITE	
		LDA	#$0D			; Output CR to console
		JSR	SCCWRITE	
		BRA	WRWRD1		; restore A value prior to return

****************************************
* WRWORD - Write value of D as hex word
****************************************
WRWORD	PSHS	A			; save the A accumulator value
		BSR	WRBYTE		; Output upper byte of word (A)
		TFR	B,A			; transfer lower byte of word to A
		BSR	WRBYTE		; output lower byte of word (B)
WRWRD1	PULS	A			; restore A value prior to return
		RTS
	
****************************************
* WRBYTE - Write value in A as hex byte
****************************************
WRBYTE	PSHS	A			; Save A value to restore upon return
		LSRA				; shift high nybble into 4 LSB of A
		LSRA			
		LSRA			
		LSRA			
		BSR	WRDIG		; write the high nybble of A to console
		LDA	,S			; restore byte value
		BSR	WRDIG		; write the low nybble to A to console
		BRA	WRWRD1		; restore A value prior to return
					
****************************************
* WRDIG - Write value in 4 LSB of A as a hex digit
****************************************
WRDIG	PSHS	A			; save A value to restore upon return
		ANDA	#$0F			; mask off 4 MSB
		ADDA	#'0			; convert base to ASCII 
		CMPA	#'9			; is result numeric?
		BLS	WRDIG1		;    yes, output to console
		ADDA	#7			; add 7 to convert to alpha
WRDIG1	JSR	SCCWRITE		; output character to console
		BRA	WRWRD1		; restore A value prior to return

********************************************
*              SCC stuff
********************************************

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
   	FCB  	$03,$C1	; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
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
TEMP		RMB	2
;(unsigned long)partition_LBA_begin - from MBR
PART_BEGIN	RMB	4

		ORG	$0800
BLKBUF	RMB	512
BLKEND	EQU	*

MULTBUF	RMB	512*6
MULTEND	EQU	*	

