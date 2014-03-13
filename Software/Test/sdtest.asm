********************************************
* SDCARD port at $230
* b0 = SD MOSI #$01
* b1 = SD CLK #$02
* b2 = CD csel #$04
* b6 = SD detect #$40
* b7 = SD MISO #$80
*
*-- SD CARD at 0x230
*--      7     6   5   4   3   2   1     0
*--    [MISO][SW][--][--][--][CS][CLK][MOSI]
*--      I     I   X   X   X   O   O     O
*--  all bits read, output bits readback
*
* assert SD clk  --> OIM #$02,$0230
* negate SD clk  --> AIM #$FD,$0230
*
* negate SD csel --> OIM #$04,$0230
* assert SD csel --> AIM #$FB,$0230 
*
* assert CD MOSI --> OIM #$01,$0230
* negate CD MOSI --> AIM #$FE,$0230
*
* see http://www.pjrc.com/tech/8051/ide/fat32.html
*
********************************************

ZSCC	EQU	$0210		SCC base address
SCCBC      EQU	ZSCC		SCC channel B command
SCCBD	EQU	ZSCC+1		SCC channel B data
SCCAC	EQU	ZSCC+2      		SCC channel A command
SCCAD	EQU	ZSCC+3		SCC channel A data

SDCARD	EQU	$0230

OP.AIM	EQU	$72		; AIM extended opcode
OP.OIM	EQU	$71		; OIM extended opcode
OP.TIM	EQU	$7B		; TIM extended opcode

SD.CLK	EQU	$02
SD.SEL	EQU	$04
SD.MISO	EQU	$80
SD.MOSI	EQU	$01
SD.CMD	EQU 	0
SD.A3	EQU	1
SD.A2	EQU	2
SD.A1	EQU	3
SD.A0	EQU	4
SD.CRC	EQU	5

	ORG	$0300

	JSR	SPIINIT
	JSR	SCCINIT
	JSR	WRMSG
	DB	$A,$D
	FCCZ	"SCC Initialized"
	
	JMP	MAIN

********************************************
*              SD stuff
********************************************

; LBA sectors for testing - these are FIVE bytes long to make room
; for a block counter (for multiple read/writes)

LBA_T_S	DB	$00,$12,$34,$56,0	; LBA of sector 00123456
LBA_T_6 	DB	$00,$12,$34,$50,5	; LBA of sector 00123450, with TC of 6 sectors
LBA_MBR	DB	0,0,0,0,0		; LBA of Master Boot Record
LBA_2GB	DB	0,$3A,$D2,0,0	; LBA limit of 2 GB card
LBA_4GB	DB	0,$75,$A4,0,0	; LBA limit of 4 GB card
LBA_8GB	DB	0,$EB,$48,0,0	; LBA limit of 8 GB card
LBA_16GB	DB	1,$D6,$90,0,0	; LBA limit of 16 GB card
LBA_32GB	DB	3,$Ad,$20,0,0	; LBA limit of 32 GB card

; SD card command and result buffers, pre-made command sentences 

RESBUF	DS	5			; SD RESULT buffer (R1/R7)
CMDBUF	DS	6			; SD COMMAND buffer (generic)
SDCMD0	DB	$40,$00,$00,$00,$00,$95		; SD CMD0 GO_IDLE_STATE
SDCMD8	DB	$48,$00,$00,$01,$AA,$87		; SD CMD8 SDV2_CHECK
SDCMD9   	DB      $49,$00,$00,$00,$00,$00		; SD CMD9 SEND_CSD
SDCMD55	DB	$77,$00,$00,$00,$00,$65		; SD CMD55 APP_OP
SDCMD41	DB	$69,$40,$00,$00,$00,$00		; SD ACMD41 APP_SEND_OP_COND
SDCMD58	DB	$7A,$00,$00,$00,$00,$75		; SD CMD58 SEND_IF_COND
SDCMD12    DB      $4C,$00,$00,$00,$00,$00		; SD CMD12 STOP_TRANSMISSION

***************************************
* SCCINIT - Initialize SCC Channel A
***************************************
* Configure SCC.A per the SCC config
* table.
***************************************
SCCINIT	LDA	SCCAC	; reset the register pointer
           LDX	#SCCATBL
SCCI.0  	LDA	0,X+	; load address from table
	CMPA	#$FF 	; is it $ff? (end of table)
	BEQ	SCCI.1	;    yes, done with init of Ch A
	STA	SCCAC	;    no, write the register pointer to WR0
	LDA	0,X+	; get data byte from table
	STA	SCCAC	; write to SCC channel A command
	BRA	SCCI.0
SCCI.1	RTS
	
;Initialization table for SCC Channel A in ASYNC mode, external 16x clock
; thanks to John Monahan (S100Computers.com)!

SCCATBL:
	DB 	$09,$80 	; WR9, reset channel A
	DB	$09,$00	; WR9, un-reset channel A
	DB	$04,$44	; WR4, X16 clock,1 Stop,NP
   	DB    	$03,$C1	; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
	DB	$05,$EA      ; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
   	DB	$0B,$05	; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
	DB	$0C,$04	; WR12, Low byte 9600 Baud (optional)
	DB	$0D,$00	; WR13, High byte for Baud (optional)
	DB	$0E,$01	; WR14, Using a 1,8432 MHz BRG Clock (ECLK)
	DB	$0F,$00	; WR15, No INT from hardware CTS/RTS
	DB	$FF,$FF	; EOT marker

***************************************
* SCCREAD - Read Byte from SCC Ch. A
***************************************
* return with the byte in A and the Z
* flag cleared. If no character avaialble,
* A and Z are both cleared.
***************************************
SCCREAD	LDA	SCCAC	; reset register pointer to WR0/RR0
	LDA	SCCAC	; read RR0
	ANDA	#%00000001	; examine the RX char available bit
	BEQ	SCCR.0	; none there, clear A,Z and exit
	LDA	SCCAD
	ANDCC	#%11111011	; clear the Z flag
	RTS
SCCR.0	CLRA 
	RTS
	
***************************************
* SCCWRITE - Write byte to SCC Ch. A
***************************************
* transmit byte in A via SCC channel
* A. This function is blocking, and
* will wait until the SCC is ready.
***************************************
SCCWRITE	PSHS	A
SCCW.0	LDA	SCCAC	; reset register pointer to WR0/RR0
	LDA	SCCAC	; read RR0
	ANDA	#%00000100	; examine the TX buffer empty bit
	BEQ	SCCW.0	;    if not empty, check again
   	PULS	A
	STA	SCCAD	; put character in data register
	RTS
	
	ORG	$0500
BLKBUF	DS	512
BLKEND	EQU	*

MULTBUF	DS	512*6
MULTEND	EQU	*	

; temporary storage
TEMP	DS	2
;(unsigned long)partition_LBA_begin - from MBR
PART_BEGIN	DS	4

;(unsigned long)fat_begin_lba = Partition_LBA_Begin + Number_of_Reserved_Sectors;
;(unsigned long)cluster_begin_lba = Partition_LBA_Begin + Number_of_Reserved_Sectors + (Number_of_FATs * Sectors_Per_FAT);
;(unsigned char)sectors_per_cluster = BPB_SecPerClus;
;(unsigned long)root_dir_first_cluster = BPB_RootClus;

MAIN:

; use the SD_INIT routine to initialize the SD card into SPI mode
SD0:	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Trying to reset SD card...R1="
	JSR	SPIINIT
	JSR	SD_INIT
	JSR	WRBYTE
	BPL	SD0A
	JMP	SDE			; if R1 is negative, init failed, so terminate

; send a CMD8 to query the card (only works for SD V2 or later, so pretty much all micro-SD cards)
SD0A:	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Trying a CMD8...R7="
	JSR	CLRRESBUF
	JSR	SD_CMD8                                                                                                         
	JSR	PRRESBUF
	TST	RESBUF		; examine the R1 byte
	LBMI	SDE			; if R1 is negative, init failed, so terminate
	DB	OP.OIM,SD.SEL
	DW	SDCARD		; negate SD csel	

; send ACMD41 to initialize the card
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Trying an ACMD41"
	CLR	RESBUF+6		; clear timeout counter
SD1:	INC	RESBUF+6		; increment timeout counter
	BMI	SDE			; if 128 tries or more, terminate
; send CMD55 to precede the ACMD41	
	JSR	WRMSG	
	DB	$0A,$0D
	FCCZ	"First sending CMD55...R1="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	JSR	SD_CMD55
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
; send CMD41 to initialize the card
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Next sending CMD41...R1="	
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	JSR	SD_CMD41
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	; negate SD csel		
	DW	SDCARD
	TSTA			; test R1 for Z/N
	BEQ	SD2		;   zero; move on to next command
	BMI	SDE		;   negative; terminate
	BRA	SD1		; loop until init is complete

; error during SD card access - terminate!	
SDE:	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Terminating"
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
	JMP	$C000	

; send CMD58 to ensure that block addressing is in effect	
SD2:	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Trying a CMD58...R1="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	JSR	CLRRESBUF
	JSR	SD_CMD58
	JSR	PRRESBUF	
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
	TST	RESBUF		; examine the R1 byte
	BMI	SDE		; if R1 is negative, init failed, so terminate
	LDA	RESBUF+1		; look at CCS bit in OCR (bit 30)
	BITA	#%01000000		; is block addressing used?
	BEQ	SDE		;    no, exit
	
; At this point, the SD card is ready for reading/writing in SPI mode!

; read the MBR at LBA 0 - report the type code and the LBA of the first partition (P1) FAT Vol ID
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Reading MBR...RET="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	LDX	#BLKBUF
	LDD	#LBA_MBR
	JSR	SD_RD_BLOCK
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
; FAT type byte
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"FAT type =" 
	LDA	BLKBUF+$01BE+$4			; examine first partition Type Code
	JSR	WRBYTE
; determine LBA block of P1 boot sector
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"LBA of P1 boot sector ="
	LDX	#PART_BEGIN					; put LBA of P1 into PART_BEGIN
	LDA	BLKBUF+$01BE+$8	
	STA	3,X
	LDA	BLKBUF+$01BE+$9	
	STA	2,X
	LDA	BLKBUF+$01BE+$A	
	STA	1,X
	LDA	BLKBUF+$01BE+$B	
	STA	0,X
	LDD	PART_BEGIN
	JSR	WRWORD
	LDD	PART_BEGIN+2
	JSR	WRWORD	
; read the P1 FAT Volume ID into the block buffer
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Reading boot sector...RET="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	LDX	#BLKBUF
	LDD	#PART_BEGIN
	JSR	SD_RD_BLOCK
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
; disassemble the FAT Volume ID and display stats
; bytes per sector (should always be 512)
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"   Bytes per sector="
	LDB	BLKBUF+$0B
	LDA	BLKBUF+$0C
	JSR	WRWORD
; sectors per cluster
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"   Sectors per cluster="
	LDA	BLKBUF+$0D
	JSR	WRBYTE
; reserved sectors 
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"   Reserved sectors="
	LDB	BLKBUF+$0E
	LDA	BLKBUF+$0F
	JSR	WRWORD
; Number of FATs (should always be 2)
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"   Number of FATs="
	LDA	BLKBUF+$10
	JSR	WRBYTE
; Sectors per FAT
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"   Sectors per FAT="
	LDB	BLKBUF+$26
	LDA	BLKBUF+$27
	JSR	WRWORD
	LDB	BLKBUF+$24
	LDA	BLKBUF+$25
	JSR	WRWORD
; starting cluster of root directory
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"   Root directory 1st cluster="
	LDB	BLKBUF+$2E
	LDA	BLKBUF+$2F
	JSR	WRWORD
	LDB	BLKBUF+$2C
	LDA	BLKBUF+$2D
	JSR	WRWORD
	
; read some sector into the block buffer
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Reading LBA #00123456...RET="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	LDX	#BLKBUF
	LDD	#LBA_T_S
	JSR	SD_RD_BLOCK
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		

; display the sector data
	
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	" last byte of LBA #00123456 ="
	LDA	BLKBUF+511
	JSR	WRBYTE

; modify the sector data
	
	LDX	#BLKBUF		; point to beginning of block data
	LDD	LBA_T_S		; put $0012 into first word of block
	STD	0,X
	LDD	LBA_T_S+2		; put $3456 into second word of block
	STD	2,X
	INC	BLKBUF+511                ; increment last byte of block
		
; write this same sector back to the card 
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Writing LBA #00123456...RET="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	LDX	#BLKBUF
	LDD	#LBA_T_S
	JSR	SD_WR_BLOCK
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
	
; read the sector back into the block buffer
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Reading LBA #00123456...RET="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	LDX	#BLKBUF
	LDD	#LBA_T_S
	JSR	SD_RD_BLOCK
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		

; display the sector data
	
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	" last byte of LBA #00123456 ="
	LDA	BLKBUF+511
	JSR	WRBYTE
	
;; read the CSD info into the first 16 bytes of the block buffer 
;
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading CSD...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#BLKBUF
;	JSR	SD_RD_CSD
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
;; examine CSD structure field to be sure it's SDHC card
;	LDAA	BLKBUF						; get byte with CSD structure
;	ANDA	#$C0							; mask off CSD_STRUCTURE bits
;	CMPA	#$40							; check for CSD_STURCTURE = 1 (SDHC)
;	BEQ	*+5							;    no, terminate
;	JMP	SDX
;; card capacity ( in 512 KB increments ) is at offset +8,9
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"SDHC card found, C_SIZE value="
;	LDD	BLKBUF+8
;	JSR	WRWORD

;; read a sector that shouldn't exist
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #01D69000...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#BLKBUF
;	LDD	#LBA_16GB
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		

;; write a sector that shouldn't exist
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Writing LBA #01D69000...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#BLKBUF
;	LDD	#LBA_16GB
;	JSR	SD_WR_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		

;; write multiple sectors to the card 
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Writing LBA #00123450:5...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#$C000
;	LDD	#LBA_T_6
;	JSR	SD_WR_MULT
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
	
; clear multi-sector test RAM
	LDX	#MULTBUF
SD3:	CLR	0,X+
	CMPX	#MULTEND
	BNE	SD3
	
; read these sector back into the RAM starting at $0700
	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"Reading LBA #00123450:5...RET="
	DB	OP.AIM,~SD.SEL
	DW	SDCARD		; assert SD csel	
	LDX	#MULTBUF
	LDD	#LBA_T_6
	JSR	SD_RD_MULT
	JSR	WRBYTE
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		

;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #00123450...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#MULTBUF
;	LDD	#LBA_T_6
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
;
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #00123451...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#MULTBUF+$200
;	INC	LBA_T_6+3	
;	LDD	#LBA_T_6
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
;
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #00123452...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#MULTBUF+$400
;	INC	LBA_T_6+3	
;	LDD	#LBA_T_6
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
;
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #00123453...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#MULTBUF+$600
;	INC	LBA_T_6+3	
;	LDD	#LBA_T_6
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
;
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #00123454...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#MULTBUF+$800
;	INC	LBA_T_6+3	
;	LDD	#LBA_T_6
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		
;
;	JSR	WRMSG
;	DB	$0A,$0D
;	FCCZ	"Reading LBA #00123455...RET="
;	DB	OP.AIM,~SD.SEL
;	DW	SDCARD		; assert SD csel	
;	LDX	#MULTBUF+$A00
;	INC	LBA_T_6+3	
;	LDD	#LBA_T_6
;	JSR	SD_RD_BLOCK
;	JSR	WRBYTE
;	DB	OP.OIM,SD.SEL	
;	DW	SDCARD		; negate SD csel		

SDX:	JSR	WRMSG
	DB	$0A,$0D
	FCCZ	"All done!"
	DB	OP.OIM,SD.SEL	
	DW	SDCARD		; negate SD csel		
	JMP	$C000	
	
********************************************
* SD_INIT - put SD card into SPI mode
*           and into IDLE state
* On exit: A is R1 response byte from CMD0
********************************************
SD_INIT:
	DB	OP.OIM,SD.SEL		; negate SD csel
	DW	SDCARD	
	DB	OP.OIM,SD.CLK		; assert SD clock
	DW	SDCARD		
	DB	OP.OIM,SD.MOSI		; assert SD MOSI
	DW	SDCARD		

	LDB	#80							; send 80 clock pulses to SD card
SD_IN1
	DB	OP.AIM,~SD.CLK		; negate clk
	DW	SDCARD		
	NOP
	NOP
 	DB	OP.OIM,SD.CLK		; assert clk
	DW	SDCARD		
	DECB			   				; decrement counter
	BNE	SD_IN1						;    loop until all pulses sent
	
	DB	OP.AIM,~SD.CLK		; negate clk	
	DW	SDCARD		
	DB	OP.AIM,~SD.SEL	  	; assert SD csel
	DW	SDCARD		
	
; send GO_IDLE_STATE command 	
; 01 000000 00000000 00000000 00000000 00000000 1001010 1	
; response is R1 
	LDX	#SDCMD0						; point to CMD0 command sentence
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
	PSHS	B		; save original B value
SD_SEN0:	JSR	SPIRECV		; send Ncs
	CMPB	#$FF
	BNE	SD_SEN0		; loop until $FF received!
	CLRB			; clear byte counter
SD_SEN1:	LDA	0,X+		; command + addr + crc
	JSR	SPISEND		; send the byte
	INCB			; increment byte counter
	CMPB	#6		; sent all 6 bytes yet?
	BNE	SD_SEN1		;    no, loop again

	LDX	#0		; clear byte counter	
SD_SEN2:	JSR	SPIRECV		; send a dummy and read the response
	TSTB			; examine the received byte (B)
	BPL	SD_SEN3		;    non-negative, got a response!
	LEAX	1,X         		; increment byte counter
	CMPX	#8		; waited 8 bytes yet?
	BNE	SD_SEN2		;    no, try again
SD_SEN3:	TFR	B,A		; move response to A	
	PULS	B		; restore original B
	RTS			; return with R1 in A	
	
********************************************
* SD_RD_BLOCK - read a block (sector) from SD card
* On Entry: D is pointer to block number
*           X points to block buffer
* On Exit:  A is status (0 = OK, !0 = ERR)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_RD_BLOCK:
	PSHS	X		; save pointer to block buffer
	TFR	D,X		; put pointer to LBA into X
	LDA	3,X		; transfer LBA value to CMDBUF A3...A0
	STA	CMDBUF+SD.A0
	LDA	2,X
	STA	CMDBUF+SD.A1
	LDA	1,X
	STA	CMDBUF+SD.A2
	LDA	0,X
	STA	CMDBUF+SD.A3
	
	LDA	#$51		; READ_SINGLE_BLOCK command (17)
	STA	CMDBUF+SD.CMD
	CLR	CMDBUF+SD.CRC
	LDX	#CMDBUF
	BSR	SD_SEND_CMD
	CMPA	#0		; OK response from read command?
	BNE	SDRDE		;    no, terminate!

SDRD1	JSR	SPIRECV  		; wait for $FE start token
	TSTB			; examine token received
	BPL	SDRDEB		; if positive, it's an error token
	CMPB	#$FE		; check if it's a start token
	BNE	SDRD1		;    no, get next token
	
	PULS	X		; point to beginning of block buffer
	PSHS	X		; re-save block buffer pointer
	LDD	#512		; init transfer counter
SDRD2	JSR	SPIRBLK		; transfer 512 bytes

	JSR	SPIRECV		; read the CRC value into RESBUF[0..1]
	STB	RESBUF
	JSR	SPIRECV
	STB	RESBUF+1
	CLRA			; clear A (all OK)
SDRDE	PULS	X		; restore block buffer pointer
	RTS
SDRDEB	TFR	B,A		; move error token from B into A
	PULS	X		; restore block buffer pointer
	RTS				

********************************************
* SD_RD_CSD - read the CSD info from SD card
* On Entry: X points to block buffer
* On Exit:  A is status (0 = OK, !0 = ERR)
*	  B is destroyed
*	  X is preserved
********************************************	
SD_RD_CSD:
	PSHS	X		; save pointer to block buffer
	LDX	#SDCMD9	
	JSR	SD_SEND_CMD
	CMPA	#0		; OK response from read command?
	BEQ	*+4		;    yes, continue
	BRA	SDRDE 		;    no, terminate!

SDCSD1	JSR	SPIRECV     		; wait for $FE start token
	TSTB			; examine token received
	BPL	SDRDEB		; if positive, it's an error token
	CMPB	#$FE		; check if it's a start token
	BNE	SDCSD1		;    no, get next token
	
	PULS	X		; point to beginning of block buffer
	PSHS	X		; re-save block buffer pointer
	LDD	#16		; init transfer counter
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
	PSHS	X		; save pointer to block buffer
	TFR	D,X		; put pointer to LBA into X
	LDA	3,X		; transfer LBA value to CMDBUF A3...A0
	STA	CMDBUF+SD.A0
	LDA	2,X
	STA	CMDBUF+SD.A1
	LDA	1,X
	STA	CMDBUF+SD.A2
	LDA	0,X
	STA	CMDBUF+SD.A3

	LDX	#CMDBUF
	LDA	#$58		; WRITE_SINGLE_BLOCK command (24)
	STA	SD.CMD,X
	CLR	SD.CRC,X
	JSR	SD_SEND_CMD
	CMPA	#0		; OK response from write command?
	BNE	SDWRE		;    no, terminate!

	JSR	SPIRECV     		; send two $FF bytes
	JSR	SPIRECV
	LDA	#$FE		; send the $FE start token
	JSR	SPIBYTE
	
	PULS	X		; point to beginning of block buffer
	PSHS	X		; re-save block buffer pointer
	LDD	#512		; init transfer counter
	JSR	SPIWBLK		; transfer 512 bytes to SD card
	
	JSR	SPIRECV		; write a dummy CRC value to card
	JSR	SPIRECV		
	
	JSR	SPIRECV		; get data response
	ANDB	#$1F
	PSHS	B		; save the response on stack
	
SDWR2	JSR	SPIRECV		; send a dummy byte
	CMPB	#$FF		; anything other than $FF = busy
	BNE	SDWR2		;    keep polling
	
	PULS	A		; put data response back in A
SDWRE	PULS	X		; restore block buffer pointer
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
	PSHS	X		; save pointer to block buffer
	TFR	D,X		; put pointer to LBA into X
	LDA	3,X		; transfer LBA value to CMDBUF A3...A0
	STA	CMDBUF+SD.A0
	LDA	2,X
	STA	CMDBUF+SD.A1
	LDA	1,X
	STA	CMDBUF+SD.A2
	LDA	0,X
	STA	CMDBUF+SD.A3
	
	LDA	4,X 		; save transfer count to TEMP
	STA	TEMP	

	LDX	#CMDBUF
	LDA	#$59		; WRITE_SINGLE_BLOCK command (25)
	STA	SD.CMD,X
	CLR	SD.CRC,X
	JSR	SD_SEND_CMD
	CMPA	#0		; OK response from write command?
	BNE	SDWME		;    no, terminate!

SDWM1	JSR	SPIRECV     		; send two $FF bytes
	JSR	SPIRECV
	LDA	#$FC		; send the $FC START token
	JSR	SPIBYTE
	
	PULS	X		; point to source block buffer
	LDD	#512		; init transfer counter
	JSR	SPIWBLK		; transfer 512 bytes to SD card
	PSHS	X		; save updated block buffer pointer
	
	JSR	SPIRECV		; write a dummy CRC value to card
	JSR	SPIRECV		
	
	JSR	SPIRECV		; get data response
	ANDB	#$1F
	STB	TEMP+1		; save the response at TEMP+1
	
SDWM2	JSR	SPIRECV		; send a dummy byte
	CMPB	#$FF		; anything other than $FF = busy
	BNE	SDWM2		;    keep polling
	
	TST	TEMP		; examine the block transfer counter
	BEQ	SDWM3		; counter is zero, done with all blocks
	DEC	TEMP		; non-zero, decrement the counter
	BRA	SDWM1		; send the next packet	
	
SDWM3	LDA	#$FD		; send a STOP_TRAN token
	JSR	SPISEND	
	JSR	SPIRECV		; send a dummy byte 
		
SDWM4	JSR	SPIRECV		; send a dummy byte
	CMPB	#$FF		; anything other than $FF = busy
	BNE	SDWM4		;    keep polling
	
	LDA	TEMP+1		; put data response into A
SDWME	PULS	X		; restore block buffer pointer
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
	PSHS	X		; save pointer to block buffer
	TFR	D,X		; put pointer to LBA into X
	LDA	3,X		; transfer LBA value to CMDBUF A3...A0
	STA	CMDBUF+SD.A0
	LDA	2,X
	STA	CMDBUF+SD.A1
	LDA	1,X
	STA	CMDBUF+SD.A2
	LDA	0,X
	STA	CMDBUF+SD.A3
	
	LDA	4,X 		; save transfer count to TEMP
	STA	TEMP	
	
	LDA	#$52		; READ_MULTIPLE_BLOCK command (18)
	STA	CMDBUF+SD.CMD
	CLR	CMDBUF+SD.CRC
	LDX	#CMDBUF
	JSR	SD_SEND_CMD		; send CMD18
	CMPA	#0		; OK response from read command?
	BNE	SDRME		;    no, terminate!

SDRM1	JSR	SPIRECV  		; wait for $FE start token
	TSTB			; examine token received
	BPL	SDRMEB		; if positive, it's an error token
	CMPB	#$FE		; check if it's a start token
	BNE	SDRM1		;    no, get next token
	
	PULS	X		; get destination pointer
	LDD	#512		; init transfer counter
	JSR	SPIRBLK		; transfer 512 bytes
	PSHS	X				; save the updated dest pointer
	JSR	SPIRECV		; read the CRC value (16 bits)
	JSR	SPIRECV		

	TST	TEMP		; examine the block transfer counter
	BEQ	SDRM3		; counter is zero, done with all blocks
	DEC	TEMP		; non-zero, decrement the counter
	BRA	SDRM1		; get the next packet	

	LDX	#SDCMD12		; point to CMD12 sentence
SDRM3	JSR	SPIRECV		; send Ncs
	CMPB	#$FF
	BNE	SDRM3		; loop until $FF received!
	CLRB			; clear byte counter
SDRM4	LDA	0,X+		; command + addr + crc
	JSR	SPISEND		; send the byte
	INCB			; increment byte counter
	CMPB	#6		; sent all 6 bytes yet?
	BNE	SDRM4		;    no, loop again
	
	JSR	SPIRECV		; get stuff byte

	LDX	#0		; clear byte counter	
SDRM5	JSR	SPIRECV		; send a dummy and read the response
	TSTB			; examine the received byte (B)
	BPL	SDRM6		;    non-negative, got a response!
	LEAX	1,X         		; increment byte counter
	CMPX	#8		; waited 8 bytes yet?
	BNE	SDRM5		;    no, try again
SDRM6	TFR	B,A		; move response to A	
	
SDRM7	JSR	SPIRECV		; send a dummy byte
	CMPB	#$FF		; anything other than $FF = busy
	BNE	SDRM7		;    keep polling

	CLRA			; clear A (all OK)
SDRME	PULS	X		; restore block buffer pointer
	RTS
SDRMEB	TFR	B,A		; move error token from B into A
	PULS	X		; restore block buffer pointer
	RTS				
	
***************************************
*     Bit-banged SPI functions
***************************************

	DB	OP.OIM,SD.SEL		; negate SD csel
	DW	SDCARD	
	DB	OP.OIM,SD.CLK		; assert SD clock
	DW	SDCARD		
	DB	OP.OIM,SD.MOSI		; assert SD MOSI
	DW	SDCARD		
	DB	OP.AIM,~SD.SEL		; assert SD csel	
	DW	SDCARD		
	DB	OP.AIM,~SD.CLK		; negate SD clk	
	DW	SDCARD		
	DB	OP.AIM,~SD.MOSI		; negate SD MOSI
	DW	SDCARD		

********************************************
* SPIINIT - set SD SPI port to initial state
********************************************
SPIINIT:	LDA	SDCARD
	BITA	#$40		; test card detect switch
	BEQ	SPII.0
	LDA	#SD.SEL	
	STA	SDCARD
SPII.0	RTS
	
	
********************************************
* SPIEXIT - release HD6303Y Port6 from bit-banged SPI
********************************************
SPIEXIT:	LDA	#SD.SEL
	STA	SDCARD
           RTS

********************************************
* SPIBYTE - r/w transfer a byte via bit-banged SPI on P6
* CPOL=0 the base value of the clock is zero
* CPHA=0, data are captured on the clock's rising edge (low->high transition)
*             and data is propagated on a falling edge (high->low clock transition)
* On Entry: A = byte to send
* On Exit:  B = byte received
*	  A is preserved
********************************************
SPIBYTE:
	PSHS	A		; save original A for later
	LDB	#$01		; init B (will shift out 1 when done!)
	
; make sure clock is negated (should be done prior to calling!)	
	DB	OP.AIM,~SD.CLK	; negate SD clk	
	DW	SDCARD		
	
; propagate the MOSI bit 
SPIB1	DB	OP.AIM,~SD.MOSI	; negate SD MOSI (assume it's 0)
	DW	SDCARD		
	ASLA			; shift MSB out of send byte
	BCC	SPIB2		; was data to send 0?
	DB	OP.OIM,SD.MOSI	; no, data to send is 1
	DW	SDCARD			

; delay for the low portion of CLK	
SPIB2	BSR	SPIBX		

; assert the clock output
 	DB	OP.OIM,SD.CLK
	DW	SDCARD			
	
; sample the MISO pin 
	ORCC	#$01		; assume data received is 1
	DB	OP.TIM,SD.MISO	; check the MISO bit
	DW	SDCARD			
	BNE	SPIB3		; assuption was correct
	ANDCC	#$FE		; no, it was zero, so clear carry
SPIB3	ROLB			; shift LSB into recieve byte

; delay for the high portion of CLK	
	BSR	SPIBX		
	
; negate the clock output
	DB	OP.AIM,~SD.CLK
	DW	SDCARD			
	
; loop until sentinel bit shifts out of RX byte
	BCC	SPIB1
		
	PULS	A		; restore the original send byte (A)
SPIBX:	RTS

********************************************
* SPISEND - write a byte via bit-banged SPI on P6
* CPOL=0 the base value of the clock is zero
* CPHA=0, data is propagated on a falling edge (high->low clock transition)
* On Entry: A = byte to send
* On Exit: all registers preserved
********************************************
SPISEND:	PSHS	B
	BSR	SPIBYTE
	PULS	B
	RTS

********************************************
* SPIRECV - read a byte via bit-banged SPI on P6
* CPOL=0 the base value of the clock is zero
* CPHA=0, data is propagated on a falling edge (high->low clock transition)
* On Entry: 
* On Exit: B = byte read from SPI
********************************************
SPIRECV:	PSHS	A
	LDA	#$FF
	BSR	SPIBYTE
	PULS	A
	RTS

********************************************
* SPIRBLK - read a block of bytes via bit-banged SPI on P6
* CPOL=0 the base value of the clock is zero
* CPHA=0, data is propagated on a falling edge (high->low clock transition)
* On Entry: X = pointer to destination block
*           D = number of bytes to be read
* On Exit:  X = pointer to destination block+512
*           D = 0
********************************************
SPIRBLK:	PSHS	B		; B gets used by SPIRECV
	JSR	SPIRECV		; send a dummy and read a data byte
	STB	0,X+		; store in buffer
	PULS	B		; restore LSB of byte counter
	SUBD	#1		; decrement it
	BNE	SPIRBLK		;    not done yet, keep reading
	RTS

********************************************
* SPIWBLK - write a block of bytes via bit-banged SPI on P6
* CPOL=0 the base value of the clock is zero
* CPHA=0, data is propagated on a falling edge (high->low clock transition)
* On Entry: X = pointer to source block
*           D = number of bytes to be read
* On Exit:  X = pointer to source block+512
*           D = 0
********************************************
SPIWBLK:	PSHS	A		; B gets used by SPIRECV
	LDA	0,X+		; get byte to send from source block
	JSR	SPISEND		; send data byte (ignore read)
	PULS	A		; restore MSB of byte counter
	SUBD	#1		; decrement it
	BNE	SPIWBLK		;    not done yet, keep reading
	RTS
	
***************************************
*  Result Buffer utility functions
***************************************
; clear result buffer
CLRRESBUF:
	LDX	#RESBUF
CLRRES1	CLR	0,X+
	CMPX	#CMDBUF
	BLO	CLRRES1	
	RTS
	
; print result buffer
PRRESBUF:
	LDX	#RESBUF
PRRES1	LDA	0,X+
	JSR	WRBYTE
	JSR	WRSPACE
	CMPX	#CMDBUF
	BLO	PRRES1	
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
WRSTR1	LDA	0,X+			; Get char from X
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
	LDA	#' '			; Output a space to console
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
	ADDA	#'0'			; convert base to ASCII 
	CMPA	#'9'			; is result numeric?
	BLS	WRDIG1		;    yes, output to console
	ADDA	#7			; add 7 to convert to alpha
WRDIG1	JSR	SCCWRITE			; output character to console
	PULS	A				; restore A value prior to return
	RTS






