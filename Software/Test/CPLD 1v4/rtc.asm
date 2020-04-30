         INCLUDE "hd6309_hardware.inc"

CC_V     EQU    $02

RTC.ADDRESS EQU $D0
RTC.SECONDS EQU 0
RTC.MINUTES EQU 1
RTC.HOURS EQU   2
RTC.WEEKDAY EQU 3
RTC.DAY  EQU    4
RTC.MONTH EQU   5
RTC.YEAR EQU    6
RTC.CONTROL EQU 14
RTC.STATUS EQU  15

GONOICE  EQU    $E206
RAM_START EQU   $1F00
DELAYMS  EQU    $FFB8                    ; [INDIRECT] delay X * ms

         ORG    $2000
         OnLED1
         OnLED2
         I2C_ReleaseBoth
         LDX    #100
         JSR    [DELAYMS]
         JSR    I2C_Initialize

         LDX    #20
         JSR    [DELAYMS]

         LDB    #$20                     ; SRAM addr $20
         JSR    RTC_ReadByte             ; read RAM value into B
         INCB                            ; increment by one
         TFR    B,A                      ; copy into A
         STA    RAM_START
         LDB    #$20                     ; SRAM addr $20
         JSR    RTC_WriteByte            ; write A into RAM
         NOP

         LDY    #RAM_START               ; read the time REGS into RAM
         JSR    RTC_ReadRegs
         NOP
         LDY    #RAM_START               ; write the time REGS into RTC
         JSR    RTC_WriteRegs
         NOP

         LDY    #RAM_START+$10
         JSR    RTC_FmtTime
         LDY    #RAM_START+$20
         JSR    RTC_FmtDate
         NOP

         JMP    GONOICE

 ;;======================================================================
 ;; PLATFORM DEPENDENT SOFT I2C FUNCTIONS - LOW LEVEL DRIVER
 ;;======================================================================

 ;; I2C status flags
I2C_Success EQU 0
I2C_NoSlaveAck EQU 1
I2C_BusError EQU 2

 ;; I2C Acknowledge Constants
I2C_ACKNOWLEDGE EQU 1
I2C_NOTACKNOWLEDGE EQU 0

 ;;
 ;; I2C_Initialize - cycle SCK until SDA goes high, up to 255 times
 ;; This is per the DS3232M datasheet to re-sync communication.
 ;; inputs:  none
 ;; return:  V=0 if SDA went high during init
 ;;          V=1 if SDA remained low
 ;;
I2C_Initialize:
         LDA    #$80                     ; init cycle counter to $80
IN0?     JSR    I2C_SendNAK              ; do a NAK cycle (toggles SCL with SDA high), SDA status in Z
         BNE    I2C_SendStop             ; SDA is high, so all is well, return via SendStop
         INCA                            ; increment cycle counter
         BVC    IN0?                     ; not wrapped around to $80 yet, keep trying
         RTS

 ;;
 ;; I2C_SendByte - sends one byte of data to an I2C slave device and check for Slave ACK
 ;; inputs:  A = byte to send to slave
 ;; return:  A = byte sent to slave
 ;;          Z = 1 if slave ACK'd byte
 ;;          Z = 0 if no slave ACK
 ;;
I2C_SendByte:
         PSHS   A,B,X                    ; preserve ACC A, B and X
         LDX    #8                       ; init X as loop counter
SB0?     LDB    I2CPORT                  ; move I2C.DSDA [6] to B[7]
         ASLB
         EORR   A,B                      ; EOR A[7] with I2C.DSDA
         BPL    SB1?                     ;   B[7]=0 means drive is correct
         EIM    #(I2C.DSDA),I2CPORT      ; change drive output polarity
SB1?     I2C_ReleaseSCL                  ; release SCL
         I2C_BitDelay                    ; half-bit delay
         I2C_SinkSCL                     ; drive SCL low
         I2C_BitDelay                    ; half-bit delay
         ASLA                            ; shift ACC A to expose next bit to send
         LEAX   -1,X                     ; decrement loop counter
         BNE    SB0?                     ;   repeat until all bits are sent
         PULS   A,B,X                    ; restore ACC A,B and X
         BRA    I2C_SendNAK              ; exit via SendNAK (to check for slave ACK)

 ;;
 ;; I2C_SendStop - send a STOP condition
 ;; return: all registers preserved
 ;;
I2C_SendStop:
         I2C_SinkSDA                     ; SCL high followed by SDA high is STOP condition
         I2C_ReleaseSCL
         I2C_BitDelay
         I2C_ReleaseSDA
         I2C_BitDelay
         RTS

 ;;
 ;; I2C_RcvByte - receives one byte of data from an I2C slave device, with
 ;;                the ability to control NAK or ACK of the received data
 ;; inputs: A = 0 to NAK upon receipt
 ;;         A != 0 to ACK upon receipt
 ;; return: A = byte received from slave
 ;;
I2C_RcvByte:
         PSHS   B,X                      ; preserve B and X
         TFR    A,B                      ; copy ACC A to B (to save ACK/NAK status)
         LDX    #8                       ; init X as loop counter
         CLRA                            ; clear A before shifting in bits
         I2C_ReleaseSDA                  ; allow SDA to be asserted by slave
RB0?     LSLA                            ; shift A left each loop iteration
         I2C_ReleaseSCL                  ; release SCL, wait for stretch
         I2C_BitDelay                    ; half-bit delay
         I2C_StatSDA                     ; check SDA pin (Z = 1 if low)
         BEQ    RB1?                     ; if SDA is low, leave ACC A alone
         ORA    #$01                     ; otherwise, set lsb
RB1?     I2C_SinkSCL                     ; clear SCL to end bit
         I2C_BitDelay                    ; half-bit delay
         LEAX   -1,X                     ; decrement loop counter
         BNE    RB0?                     ; loop back until all bits are received
         TSTB                            ; examine ACK/NAK status (set/clear Z)
         PULS   B,X                      ; restore B and X (flags unaffected)
         BEQ    I2C_SendNAK              ; if input parameter was zero, send a NAK
                                         ; ...otherwise, fall into I2C_SendACK

 ;;
 ;; I2C_SendACK - send ACK to I2C slave device
 ;; inputs: none
 ;; return: ACK/NAK status in Z (Z = 1 if either slave or master ACK)
 ;;
I2C_SendACK:
         I2C_SinkSDA                     ; assert SDA for MASTER ACK
         BRA    I2C_SN0                  ; the rest is just like a NAK

 ;;
 ;; I2C_SendNAK & SendACK - send a NAK or ACK to I2C slave device
 ;; inputs: none
 ;; return: ACK/NAK status in Z (Z = 1 if either slave or master ACK)
 ;;
I2C_SendNAK:
         I2C_ReleaseSDA                  ; release SDA line for MASTER NAK / or query slave ACK
I2C_SN0  I2C_ReleaseSCL                  ; send clock for NAK
         I2C_BitDelay                    ; half-bit delay
         I2C_StatSDA                     ; check of ACK bit
         PSHS   CC                       ; save CC bits
         I2C_SinkSCL                     ; finish the NAK bit
         I2C_BitDelay                    ; half-bit delay
         PULS   CC,PC                    ; restore CC bits and return

 ;;
 ;; I2C_GoMaster - sends an I2C start and slave address and check for acknowledge
 ;; inputs:  A = slave address A[7:1] + R/W A[0]
 ;; return:  A = I2C.Success(0) or I2C_NoSlaveAck(1) or I2C.BusError(2)
 ;;          Z = 0 when I2C.Success, otherwise Z = 0
 ;;
I2C_GoMaster:
         I2C_ReleaseBoth                 ; release SDA and SCL
         I2C_BitDelay                    ; allow SDA to float high
         I2C_StatSDA                     ; check SDA state
         BEQ    GMBERR?                  ; if SDA is still low, return with fBusError
         I2C_SinkSDA                     ; begin I2C START by bringing SDA low first
         I2C_BitDelay                    ; half-bit delay
         I2C_SinkSCL                     ; complete I2C START by bringing SCL low
         I2C_BitDelay                    ; half-bit delay
         JSR    I2C_SendByte             ; now send the byte in A, Z = 1 means sent OK
         BNE    GMSNAK?                  ; if no slave ACK, then return with fNoSlaveAck
         LDA    #I2C_Success             ; send a fSuccess code (0)
         RTS
GMBERR?  LDA    #I2C_BusError            ; return a fBusError code (2)
         RTS
GMSNAK?  LDA    #I2C_NoSlaveAck          ; send a fNoSlaveAck code (1)
         RTS

 ;;
 ;; RTC_ReadStatus - read the STATUS register from DS3232M RTC
 ;; RTC_ReadByte - read a single byte from the DS3232M RTC
 ;; inputs: B = register address
 ;;
 ;; I2C_ReadByte - read a single byte from a specific address
 ;; inputs: E = slave address
 ;;         B = register address
 ;;
 ;; return: A = I2C.Success(0) or I2C_NoSlaveAck(1) or I2C.BusError(2)
 ;;         B = value of read data byte
 ;;         Z = 1 when I2C.Success, otherwise Z = 0
 ;;
 ;; READ REG  == [START], ADDR, [ack], <REG ADDR>, [ack], [START], ADDR, [ack], <read data>, [ACK], [STOP]
 ;;
RTC_ReadStatus:
         LDB    #RTC.STATUS              ; RTC status addr into B
RTC_ReadByte:
         LDE    #RTC.ADDRESS             ; RTC address into E
I2C_ReadByte:
         TFR    E,A                      ; slave address into A
         ANDA   #$FE                     ; send START and slave address (WRITE)
         JSR    I2C_GoMaster             ; try to send slave address
         BNE    I_ERR                    ; error, return with status!
         TFR    B,A                      ; register address into A
         JSR    I2C_SendByte             ; try to send register address
         BNE    I_ERR                    ; error, return with status!
         TFR    E,A                      ; slave address back into A
         ORA    #$01                     ; send START and slave address (READ)
         JSR    I2C_GoMaster             ; try to send slave address
         BNE    I_ERR                    ; error, return with status!
         LDA    #I2C_NOTACKNOWLEDGE      ; only one byte, so NAK it
         JSR    I2C_RcvByte              ; read the data byte
         TFR    A,B                      ; copy byte value to B
         BRA    I_OK

 ;;
 ;; RTC_ClearStatus - clear STATUS:OSF,BSY,A1F,A2F bits in the DS3232M RTC
 ;;
 ;; RTC_WriteByte - write a single byte to the DS3232M RTC
 ;; inputs: B = register address
 ;;
 ;; I2C_WriteByte - write one byte of data to a specific address
 ;; inputs: E = slave address
 ;;         B = register address
 ;;		   A = data to write
 ;; return: A = I2C.Success(0) or I2C_NoSlaveAck(1) or I2C.BusError(2)
 ;;         Z = 1 when I2C.Success, otherwise Z = 0
 ;;
 ;; WRITE REG == [START], ADDR, [ack], <REG ADDR>, [ack], <WRITE DATA>, [ack], [STOP]
 ;;
RTC_ClearStatus:
         CLRA                            ; clear OSF, 32KHz, BSY, A1F, A2F
         LDB    #RTC.STATUS              ; RTC status addr into B
RTC_WriteByte:
         LDE    #RTC.ADDRESS             ; RTC address into E
I2C_WriteByte:
         EXG    A,E                      ; slave address in A, data in E
         ANDA   #$FE                     ; send START and slave address (WRITE)
         BSR    I2C_GoMaster             ; try to send slave address
         BNE    I_ERR                    ; error, return with status!
         TFR    B,A                      ; copy register address into A
         JSR    I2C_SendByte             ; try to send register address
         BNE    I_ERR                    ; error, return with status!
         TFR    E,A                      ; copy data byte to be written into A
         JSR    I2C_SendByte             ; try to send data byte
         BNE    I_ERR                    ; error, return with status!
         BEQ    I_OK                     ; send stop and return with success

 ;;
 ;; RTC_WriteRegs - write registers 0-15 to the DS3232M RTC
 ;; inputs: Y = addr of write data buffer
 ;;
 ;; I2C_WriteBlock - writes one or more bytes of data to a specific address
 ;; inputs: E = slave address
 ;;         B = register address
 ;;         Y = addr of write data buffer
 ;;         X = number of bytes to write
 ;; return: A = I2C.Success(0) or I2C_NoSlaveAck(1) or I2C.BusError(2)
 ;;         Z = 1 when I2C.Success, otherwise Z = 0
 ;;         Y is preserved
 ;;         X is destroyed
 ;;
 ;; WRITE MANY == [START], ADDR, [ack], <REG ADDR>, [ack], <WRITE DATA>, [ack], <WRITE DATA>, [ack], ... [STOP]
 ;;
RTC_WriteRegs:
         CLRB                            ; start at Reg 0
         LDX    #15                      ; end at Reg 15
RTC_WriteBlock:
         LDE    #RTC.ADDRESS             ; RTC address into E
I2C_WriteBlock:
         PSHS   Y                        ; preserve write buffer address
         TFR    E,A                      ; slave address in A
         ANDA   #$FE                     ; send START and slave address (WRITE)
         BSR    I2C_GoMaster             ; try to send slave address
         BNE    I_ERRX                   ; error, return with status!
         TFR    B,A                      ; copy register address into A
         JSR    I2C_SendByte             ; try to send register address
         BNE    I_ERRX                   ; error, return with status!
WM0?     LEAX   0,X                      ; test the byte counter
         BEQ    I_OKX                    ; all done, send a STOP
WM1?     LDA    ,Y+                      ; copy byte from write buffer to A
         JSR    I2C_SendByte             ; try to send data byte
         BNE    I_ERRX                   ; error, return with status!
         LEAX   -1,X                     ; decrement the byte counter
         BNE    WM1?                     ; repeat until finished
I_OKX    PULS   Y                        ; restore buffer start address
I_OK     JSR    I2C_SendStop             ; send a STOP condition
         LDA    #I2C_Success             ; send a fSuccess code (0) and set Z = 1
         RTS
I_ERRX   PULS   Y                        ; restore buffer start address
I_ERR    JSR    I2C_SendStop             ; send a STOP condition
         LDA    #I2C_NoSlaveAck          ; send a fNoSlaveAck code (1) and set Z = 0
         RTS

 ;;
 ;; RTC_ReadRegs - read registers 0-15 from the DS3232M RTC
 ;; inputs: Y = addr of read data buffer
 ;;
 ;; I2C_ReadBlock - read one or more bytes of data from a specific (8 bit) address
 ;; inputs: E = slave address
 ;;         B = register address
 ;;         Y = addr of read data buffer
 ;;         X = number of bytes to read
 ;; return: A = I2C.Success(0) or I2C_NoSlaveAck(1) or I2C.BusError(2)
 ;;         B = value of last read data byte
 ;;         Z = 1 when I2C.Success, otherwise Z = 0
 ;;         Y is preserved
 ;;         X is destroyed
 ;;
 ;; READ MANY == [START], ADDR, [ack], <REG ADDR>, [ack], [START], ADDR, [ack], <read data>, [ACK], <read data>, [ACK], ... [STOP]
 ;;
RTC_ReadRegs:
         CLRB                            ; start at Reg 0
         LDX    #15                      ; end at Reg 15
RTC_ReadBlock:
         LDE    #RTC.ADDRESS             ; RTC address into E
I2C_ReadBlock:
         PSHS   Y                        ; preserve buffer start address
         TFR    E,A                      ; slave address in A
         ANDA   #$FE                     ; send START and slave address (WRITE)
         JSR    I2C_GoMaster             ; try to send slave address
         BNE    I_ERRX                   ; error, return with status!
         TFR    B,A                      ; register address into A
         JSR    I2C_SendByte             ; try to send register address
         BNE    I_ERRX                   ; error, return with status!
         TFR    E,A                      ; slave address back into A
         ORA    #$01                     ; send START and slave address (READ)
         JSR    I2C_GoMaster             ; try to send slave address
         BNE    I_ERRX                   ; error, return with status!
RM0?     LEAX   0,X                      ; test the byte counter
         BEQ    I_OKX                    ; all done, send a STOP
RM1?     LDA    #I2C_ACKNOWLEDGE         ; assume ACK (1)
         LEAX   -1,X                     ; decrement the byte counter
         BNE    RM2?                     ; not the last byte to read
         CLRA                            ; yes, last byte, respond with NAK (0)
RM2?     JSR    I2C_RcvByte              ; read the data byte
         STA    ,Y+                      ; store in buffer
         TFR    A,B                      ; copy read byte to B
         BRA    RM0?                     ; repeat until finished

 ;;======================================================================
 ;; PLATFORM DEPENDENT DS3232M I2C REALTIME CLOCK FUNCTIONS
 ;;======================================================================
 ;;
 ;; RTC_FmtDate - format the date from DS3232 RTC in MM/DD/YYYY format
 ;; inputs:  Y = pointer to 16 bytes of scratch RAM
 ;; output:  A = RTC status register value
 ;;          V = 1 if I2C bus error or RTC communication error
 ;;          V = 0 if successful read
 ;;          null terminated ASCII string structure
 ;;                                1 1
 ;;        X + 0 1 2 3 4 5 6 7 8 9 0 1
 ;;            M M / D D / C C Y Y * 0
 ;;          * at position 11 is only if OSF detected, otherwise NULL
 ;;
RTC_FmtDate:
         JSR    I2C_Initialize           ; try to initialize the I2C
         BVS    R?NORTC                  ; SDA stuck low, abort
         JSR    RTC_ReadRegs             ; read RTC registers 0-15
         BNE    R?NORTC                  ; error return from read, abort
         LDA    RTC.YEAR,Y               ; get the year (6)
         BSR    FMTBCD                   ; convert year to ASCII
         STD    8,Y                      ; store in buffer (8,9)
         LDA    #$20                     ; Assume 21st century
         LDB    RTC.MONTH,Y              ; get the month/century (5)
         ASLB                            ; shift CENTURY bit into C
         ADCA   #0                       ; add CENTURY bit to $20 (= $20 or $21)
R?DCEN   BSR    FMTBCD                   ; convert century to ASCII
         STD    6,Y                      ; store in buffer (6,7)
         LDA    RTC.MONTH,Y              ; get the month/century (5)
         ANDB   #$1F                     ; strip off the century info
         BSR    FMTBCD                   ; convert BCD to ASCII
         STD    ,Y                       ; store in buffer (0,1)
         LDA    RTC.DAY,Y                ; get the day of month (4)
         BSR    FMTBCD                   ; convert BCD to ASCII
         STD    3,Y                      ; store in buffer (3,4)
         LDA    #'/'                     ; separator character
         STA    2,Y                      ; month/date
         STA    5,Y                      ; date/year
         CLRD
         STD    10,Y                     ; null terminate the string (even with *) (10,11)
         LDA    RTC.STATUS,Y             ; get status register
         BPL    R?NOOSF                  ; OSF in b7, if clear no OSF events occurred
         OIM    #'*',10,Y                ; put OSF event indicator after date
R?NOOSF  RTS                             ; return with overflow clear
R?NORTC  ORCC   #CC_V                    ; set the overflow flag for RTC read error
         RTS

 ;;
 ;; FMTBCD - convert a BCD value in A to ASCII characters in D
 ;; inputs: A = BCD input value
 ;; output: D = ASCII character pairs (MSD in A, LSD in B)
 ;;
FMTBCD:
         TFR    A,B                      ; copy A to B
         LSRA                            ; move MSD down to lower nybble
         LSRA
         LSRA
         LSRA
         ANDB   #$0F                     ; clear upper bits in LSD
         ORD    #$3030                   ; convert to ASCII 00-99
         RTS

 ;;
 ;; RTC_FmtTime - format the time from DS3232 RTC in HH:MM:SS format
 ;; inputs:  Y = pointer to 16 bytes of scratch RAM
 ;; output:  A = RTC status register value
 ;;          V = 1 if I2C bus error or RTC communication error
 ;;          V = 0 if successful read
 ;;          null terminated ASCII string structure
 ;;        X + 0 1 2 3 4 5 6 7 8 9
 ;;            H H : M M : S S * 0
 ;;          * at position 11 is only if OSF detected, otherwise NULL
 ;;
RTC_FmtTime:
         JSR    I2C_Initialize           ; try to initialize the I2C
         BVS    R?NORTC                  ; SDA stuck low, abort
         JSR    RTC_ReadRegs             ; read RTC registers 0-15
         BNE    R?NORTC                  ; error return from read, abort
         LDA    RTC.SECONDS,Y            ; get the seconds (0)
         BSR    FMTBCD                   ; convert seconds to ASCII
         STD    6,Y                      ; store in buffer (6,7)
         LDA    RTC.MINUTES,Y            ; get the minutes (1)
         BSR    FMTBCD                   ; convert BCD to ASCII
         STD    3,Y                      ; store in buffer (3,4)
         LDA    RTC.HOURS,Y              ; get the hours (2)
         TFR    A,B                      ; copy hours to B (for LSD)
         BITA   #$40                     ; test the 12/24 bit (1 = 12, 0 = 24)
         BEQ    R?T24                    ;  24HR time already
         BITA   #$20                     ; is it AM or PM (0 = AM, 1 = PM)
         BEQ    R?T24                    ;   AM, so leave it alone
         ANDA   #$1F                     ; start with BCD 12H time
         ADDA   #$12                     ; add BCD 12 hours
         DAA                             ; adjust decimal result
R?T24    ANDA   #$3F                     ; retain only the 24 hour time
         BSR    FMTBCD                   ; convert BCD to ASCII
         STD    0,Y                      ; store in buffer (0,1)
         LDA    #':'                     ; separator character
         STA    2,Y                      ; month/date
         STA    5,Y                      ; date/year
         CLRD
         STD    8,Y                      ; null terminate the string (even with *) (8,9)
         LDA    RTC.STATUS,Y             ; get status register
         BPL    R?NOOSF                  ; OSF in b7, if clear no OSF events occurred
         OIM    #'*',8,Y                 ; put OSF event indicator after time
R?NOOSF  RTS                             ; return with overflow clear
R?NORTC  ORCC   #CC_V                    ; set the overflow flag for RTC read error
         RTS

