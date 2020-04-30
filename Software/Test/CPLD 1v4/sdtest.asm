 ; HD6309 SBC SD function debug/test

         INCLUDE "hd6309_hardware.inc"
         ORG    $1000
         JMP    START

 ;  Condition Code Register bits
CC_C     EQU    $01
CC_V     EQU    $02
CC_Z     EQU    $04
CC_N     EQU    $08
CC_I     EQU    $10
CC_H     EQU    $20
CC_F     EQU    $40
CC_E     EQU    $80

 ;  Other defines
CR       EQU    $0D                      ;CARRIAGE RETURN
LF       EQU    $0A                      ;LINE FEED
SPACE    EQU    $20

PUTCH    EQU    $E647                    ; output char in A
GETCH    EQU    $E60A                    ; get char from console
PUTCR    EQU    $E659
PUTWORD  EQU    $E66D
PUTBYTE  EQU    $E676
PUTSTR   EQU    $E6A6                    ; output string at X
PUTMSG   EQU    $E69C                    ; output string at PC
PUTSPACE EQU    $E665                    ; output SPACE
DELAYUS  EQU    $E73B                    ; delay X*10us
GOWOZ    EQU    $E203                    ; go to monitor

 ;; SPI interface primitives
 ;SPI_FastMode MACRO
 ;SPI_SlowMode MACRO
 ;SPI_Status MACRO

SPI_Read EQU    $E971
SPI_Write EQU   $E961
SPI_ReadBlock EQU $E979
SPI_WriteBlock EQU $E989

 ; SD card interface primitives
 ;SD_AssertCS MACRO
 ;SD_NegateCS MACRO
 ;SD_CardPresent MACRO

MODEBYTE EQU    $1FFF

 ; ==================================================
 ;   ENTRY POINT
 ; ==================================================

START:
         CLRA                            ; always start in SLOW block mode
         STA    MODEBYTE
         LDX    #BANNER
         JSR    PUTSTR
         LDX    #$1F80                   ; pointer to scratch buffer
         LDF    #$80                     ; verbose debug info
         JSR    SD_Initialize
         LBVS   ERROR0

READ0:
 ; read sector 0
         LDX    #READING
         JSR    PUTSTR

         LDX    #$1F90
         LDY    #$2000
         CLRA
         STA    0,X
         STA    1,X
         STA    2,X
         STA    3,X
         JSR    PUTBYTE
         JSR    PUTCR
         JSR    SD_ReadBlock
         LBVS   ERROR
         JSR    DISPSEC

 ; read sector 1
         LDX    #READING
         JSR    PUTSTR

         LDX    #$1F90
         LDY    #$2000
         CLRA
         STA    0,X
         STA    1,X
         STA    2,X
         INCA
         STA    3,X
         JSR    PUTBYTE
         JSR    PUTCR
         JSR    SD_ReadBlock
         LBVS   ERROR
         JSR    DISPSEC

 ; read sector 0
         LDX    #READING
         JSR    PUTSTR

         LDX    #$1F90
         LDY    #$2000
         CLRA
         STA    0,X
         STA    1,X
         STA    2,X
         STA    3,X
         JSR    PUTBYTE
         JSR    PUTCR
         JSR    SD_ReadBlock
         LBVS   ERROR
         JSR    DISPSEC

 ; alter sector data
         LDX    #CHANGING
         JSR    PUTSTR

         LDX    #$2000
         LDD    ,X
         INCD
         STD    ,X

 ; write sector 0
         LDX    #WRITING
         JSR    PUTSTR

         LDX    #$1FA0
         LDY    #$2000
         CLRA
         STA    0,X
         STA    1,X
         STA    2,X
         STA    3,X
         JSR    PUTBYTE
         JSR    PUTCR
         JSR    SD_WriteBlock
         LBVS   ERROR

 ; alter sector data
         LDX    #CHANGING
         JSR    PUTSTR

         LDX    #$2000
         LDD    ,X
         INCD
         STD    ,X

 ; write sector 1
         LDX    #WRITING
         JSR    PUTSTR

         LDX    #$1FA0
         LDY    #$2000
         CLRA
         STA    0,X
         STA    1,X
         STA    2,X
         INCA
         STA    3,X
         JSR    PUTBYTE
         JSR    PUTCR
         JSR    SD_WriteBlock
         LBVS   ERROR

         LDX    #ASK
         JSR    PUTSTR
         JSR    GETCH
         STA    MODEBYTE
         JSR    PUTCH
         JSR    PUTCR
         JMP    READ0

ERROR0:
         LDX    #SDERR
         JSR    PUTSTR
         SWI
         JMP    GOWOZ

ERROR:
         LDX    #ERRORTXT
         JSR    PUTSTR
         SWI
         JMP    GOWOZ

DISPSEC:
 ; display sector data at 2000
         LDX    #$2000
         CLRE
D?S0     TFR    E,A
         BITA   #$0F
         BNE    D?S1
         JSR    PUTCR
         TFR    X,D
         JSR    PUTWORD
         LDA    #':'
         JSR    PUTCH
         JSR    PUTSPACE
D?S1     LDA    ,X+
         JSR    PUTBYTE
         DECE
         BNE    D?S0
         JMP    PUTCR


BANNER   .ascii "=== HD6309 SD card test ==="
         .db    10,13,0

ASK      .ascii "Press a key to repeat R/W"
         .db    10,13,0

SDERR    .ascii "Error: failed to init SD card"
         .db    10,13,0

ERRORTXT .ascii "I/O error - sector 0"
         .db    10,13,0

READING  .ascii "Reading block "
         .db    0

CHANGING .ascii "Incrementing block bytes"
         .db    10,13,0

WRITING  .ascii "Writing block "
         .db    0


EOLSTR   .db    10,13,0



 ;;======================================================================
 ;; PLATFORM DEPENDENT SD CARD FUNCTIONS (USING SPI MASTER)
 ;;======================================================================

 ; https://electronics.stackexchange.com/questions/77417/what-is-the-correct-command-sequence-for-microsd-card-initialization-in-spi

 ; Definitions for MMC/SDC command
SD_CMD0  EQU    ($40+0)                  ; GO_IDLE_STATE
SD_CMD8  EQU    ($40+8)                  ; SEND_IF_COND
SD_CMD16 EQU    ($40+16)                 ; SET_BLOCKLEN
SD_CMD17 EQU    ($40+17)                 ; READ_SINGLE_BLOCK
SD_CMD24 EQU    ($40+24)                 ; WRITE_BLOCK
SD_ACMD41 EQU   ($40+41)                 ; SEND_OP_COND (SDC)
SD_CMD55 EQU    ($40+55)                 ; APP_CMD
SD_CMD58 EQU    ($40+58)                 ; READ_OCR
SD_CMD0CRC EQU  $95
SD_CMD8CRC EQU  $87
SD_CMD41CRC EQU $77
SD_CMD55CRC EQU $65
SD_CMD58CRC EQU $FD
SD_NOCRC EQU    $01

 ; SD CMD0 GO_IDLE_STATE --> R1
SD_XCMD0 FCB    SD_CMD0,$00,$00,$00,$00,SD_CMD0CRC

 ; SD CMD8 SEND_IF_COND --> R7
SD_XCMD8 FCB    SD_CMD8,$00,$00,$01,$AA,SD_CMD8CRC

 ; SD ACMD41 SEND_OP_COND (SDC)--> R1
SD_XCMD41 FCB   SD_ACMD41,$40,$00,$00,$00,SD_CMD41CRC

 ; SD CMD55 APP_CMD --> R1
SD_XCMD55 FCB   SD_CMD55,$00,$00,$00,$00,SD_CMD55CRC

 ; SD CMD58 READ_OCR --> R7
SD_XCMD58 FCB   SD_CMD58,$00,$00,$00,$00,SD_CMD58CRC

 ; Definitions of command fields
SD.CMD   EQU    0                        ; command byte
SD.A3    EQU    1                        ; A3
SD.A2    EQU    2                        ; A2
SD.A1    EQU    3                        ; A1
SD.A0    EQU    4                        ; A0 offset
SD.CRC   EQU    5                        ; CRC offset

 ; Definitions of response fields
SD.R1    EQU    0                        ; response
SD.OCR0  EQU    1
SD.OCR1  EQU    2
SD.OCR2  EQU    3
SD.OCR3  EQU    4

 ; Card type flags (CardType)
CT_MMC   EQU    $01                      ; MMC ver 3
CT_SD1   EQU    $02                      ; SD ver 1
CT_SD2   EQU    $04                      ; SD ver 2
CT_BLOCK EQU    $08                      ; Block addressing

 ;;
 ;; SD_NativeMode - if card present bring it to NATIVE mode
 ;; inputs: none
 ;; return: V=1, no SD CARD present
 ;;         V=0, SD CARD present and selected
 ;;
SD_NativeMode:
         PSHS   A,B,X                    ; preserve regs
         SD_NegateCS                     ; start by negating CS
         SD_CardPresent                  ; check for a card
         ORCC   #CC_V                    ; set the V flag (assume failure)
 ;         BEQ      S?I0                              ;    if no card, leave CS negated and return
         BRN    S?I0                     ;    if no card, leave CS negated and return
         SPI_SlowMode                    ; set SPI to slow mode
         LDB    #10                      ; send 80 bits of 1's
S?I1     JSR    SPI_Read                 ;  (10 bytes of $FF)
         DECB                            ; decrement counter
         BNE    S?I1                     ; loop until all pulses sent
         SPI_FastMode                    ; set SPI to fast mode (clears V)
S?I0     PULS   A,B,X,PC                 ; restore regs and return

 ;;
 ;; SD_Initialize - attempt to open an SD card for read/write operations
 ;; inputs:  X=address of 5 byte result buffer
 ;;          F=output specifier
 ;;            0, do not display status to console
 ;;            <128, display short status to console
 ;;            >127, display verbose status to console
 ;; return:  V=0, SD CARD present and selected
 ;;          V=1, no SD CARD present, or error in communication
 ;;          E=last command attempted
 ;;             (0 = RESET, $40=CMD0, $48=CMD8, etc...)
 ;;
SD_Initialize:
         PSHS   A,B,U                    ; preserve registers
         TSTF                            ; check output specifier
         BEQ    O?C1A                    ; no status output
         JSR    PUTMSG
         FCB    CR,LF
         FCN    "SD:Reset"
O?C1A    CLRE                            ; indicate step 0 (reset)
         BSR    SD_NativeMode            ; put card into Native mode
         LBVS   O?SDE                    ;  V=1 means no card, so exit
 ; attempt repeated CMD0 to put the SD card into IDLE state (R1 = 01)
         LDB    #11                      ; init attempts counter
O?C2     DECB                            ; decrement attempt counter
         LBEQ   O?SDE                    ;   no more attempts; terminate
         TSTF                            ; check output specifier
         BEQ    O?C3A                    ; no status output
         JSR    PUTMSG
         FCB    CR,LF
         FCN    "SD:CMD0"
O?C3A    LDU    #SD_XCMD0                ; point to CMD0 string
         LDE    ,U                       ; put command byte into E
         JSR    SD_SendCmd               ; send it
         SD_NegateCS                     ; negate CS after command
         JSR    SD_DisplayR1             ; display response if enabled
O?C4     CMPA   #1                       ; R1 = 1?
         LBNE   O?C2                     ;   no = retry
 ; send a CMD8 to query the card for SD V2
         TSTF                            ; check output specifier
         BEQ    O?C5                     ; no status output
         JSR    PUTMSG                   ; output status to console
         FCB    CR,LF
         FCN    "SD:CMD8"
O?C5     LDU    #SD_XCMD8                ; point to CMD8 string
         LDE    ,U                       ; put command byte into E
         JSR    SD_SendCmd               ; send the command, return R1 in A
         SD_NegateCS                     ; negate CS after command
         JSR    SD_GetR7                 ; get R7 response type (R1 + 32bits of data)
         JSR    SD_DisplayR7             ; display R7 response if enabled (Acc F)
         LBMI   O?SDE                    ; if R1 is negative, init failed, not SD V2
 ; IDLE period (send four $FF bytes)
         JSR    SPI_Read
         JSR    SPI_Read
         JSR    SPI_Read
         JSR    SPI_Read
 ; attempt repeated ACMD41 to bring card out of IDLE state (can take a while)
         LDB    #11                      ; init attempts counter
O?C7A    DECB                            ; decrement attempt counter
         BEQ    O?SDE                    ;   no more attempts; terminate
         TSTF                            ; check output specifier
         BEQ    O?C7B                    ; no status output
         JSR    PUTMSG
         FCB    CR,LF
         FCN    "SD:CMD55"
O?C7B    LDU    #SD_XCMD55               ; point to CMD55 string
         LDE    ,U                       ; put command byte into E
         JSR    SD_SendCmd               ; send the command, return R1 in A
         SD_NegateCS                     ; negate CS after command
         JSR    SD_DisplayR1             ; display response if enabled
         TSTF                            ; check output specifier
         BEQ    O?C7C                    ; no status output
         JSR    PUTMSG
         FCB    CR,LF
         FCN    "SD:CMD41"
O?C7C    LDU    #SD_XCMD41               ; point to CMD41 string
         LDE    ,U                       ; put command byte into E
         JSR    SD_SendCmd               ; send the command, return R1 in A
         SD_NegateCS                     ; negate CS after command
         JSR    SD_DisplayR1             ; display response if enabled
         ANDA   #1                       ; desired R1 lsb is 0
         BNE    O?C7A                    ; loop until init is complete
 ; send CMD58 to and check CCS bit in OCR block addressing is in effect
         TSTF                            ; check output specifier
         BEQ    O?C12                    ; no status output
         JSR    PUTMSG
         FCB    CR,LF
         FCN    "SD:CMD58"
O?C12    LDU    #SD_XCMD58               ; point to CMD58 string
         LDE    ,U                       ; put command byte into E
         JSR    SD_SendCmd               ; send the command
         SD_NegateCS                     ; negate CS after command
         JSR    SD_GetR7                 ; get R7 response type (R1 + 32bits of data)
         JSR    SD_DisplayR7             ; display response if enabled (Acc F)
         BMI    O?SDE                    ; if R1 is negative, init failed, so terminate
         LDA    SD.OCR0,X                ; examine OCR0 in response
         ANDA   #$C0                     ; mask all but CCS bit (bit 30) and Powerup bit (bit 31)
         CMPA   #$C0                     ; these need to both be set
         BEQ    O?CX                     ;    if CCS=1 the SD card uses LBA, which clears V (success)
 ; SD Card Access ERROR handler
O?SDE    TSTF                            ; check output specifier
         BEQ    O?C13                    ; no status output
         JSR    PUTMSG                   ; output FAIL status to console
         FCB    CR,LF
         FCC    "SD:FAIL"
         FCB    $FF
O?C13    SD_NegateCS                     ; negate SD csel
         JSR    SPI_Read                 ; flush SD output buffer
         ORCC   #CC_V                    ; set the V flag
         PULS   A,B,U,PC                 ; restore registers and return
O?CX     TSTF                            ; check output specifier
         BEQ    O?C14                    ; no status output
         JSR    PUTMSG                   ; output FAIL status to console
         FCB    CR,LF
         FCC    "SD:SUCCESS"
         FCB    $FF
O?C14    SD_NegateCS                     ; negate CS after command
         JSR    SPI_Read                 ; flush SD output buffer
         CLRB                            ; clear V flag
         PULS   A,B,U,PC                 ; restore registers and return
 ;;
 ;; SD_SendCmd - sends a command to MMC/SD card, get R1 response byte
 ;;              Negates and flus
 ;; inputs:  U = address of 6 byte command sequence
 ;; return:  A is R1 response byte
 ;;          N & Z reflect A value
 ;;          CS is left asserted after command is sent
 ;;
SD_SendCmd:
         PSHS   U,B                      ; preserve U and B
         SD_NegateCS                     ; de-Select the card
         JSR    SPI_Read                 ; send 8 idle clocks
         SD_AssertCS                     ; Select the card
         JSR    SPI_Read                 ; send 8 idle clocks
         LDB    #6                       ; init byte counter
S?SC1    LDA    ,U+                      ; command + addr + crc
         JSR    SPI_Write                ; send the byte
         DECB                            ; decrement byte counter
         BNE    S?SC1                    ;    loop until all 6 bytes sent
         LDB    #10                      ; init attempt counter
S?SC2    JSR    SPI_Read                 ; read the response
         TSTA                            ; examine the received byte
         BPL    S?SC3                    ;    non-negative, got a response!
         DECB                            ; negative, decrement attempt counter
         BNE    S?SC2                    ;    keep trying for 10 attempts
S?SC3    TSTA                            ; reflect error status in N and Z flags
         PULS   U,B,PC                   ; restore registers and return

 ;;
 ;; SD_GetR7 - get remainder of R7 type command response
 ;;            (R1 was already fetched by SD_SendCmd)
 ;; inputs:  X = address of 5 byte result buffer
 ;;          A = R1 response (from SD_SendCmd)
 ;; return:  all registers preserved
 ;;          N & Z reflect A value
 ;;
SD_GetR7:
         STA    SD.R1,X                  ; move R1 to result buffer
         JSR    SPI_Read                 ; read next byte from card
         STA    SD.OCR0,X                ; move OCR0 to result buffer
         JSR    SPI_Read                 ; read next byte from card
         STA    SD.OCR1,X                ; move OCR1 to result buffer
         JSR    SPI_Read                 ; read next byte from card
         STA    SD.OCR2,X                ; move OCR2 to result buffer
         JSR    SPI_Read                 ; read next byte from card
         STA    SD.OCR3,X                ; move OCR3 to result buffer
         LDA    SD.R1,X                  ; restore R1 to A (and set flags)
         RTS

 ;;
 ;; SD_DisplayR1 - display R1 results (per ACC F)
 ;; inputs:  A = R1 result value
 ;;          F > 127 display info, otherwise exit
 ;; return:  A = R1 value
 ;;          N & Z reflect A value
 ;;
SD_DisplayR1:
         PSHS   A                        ; save A (destroyed by PUTBYTE)
         TSTF                            ; check output specifier
         BPL    O?P0                     ; if <127, do not display verbose output
         JSR    PUTMSG
         FCN    "...R1="
         JSR    PUTBYTE
O?P0     LDA    ,S+                      ; restore A and set flags
         RTS

 ;;
 ;; SD_DisplayR7 - display R7 results (per ACC F)
 ;; inputs:  X = address of result buffer
 ;;          F > 127 display info, otherwise exit
 ;; return:  A = R1 value
 ;;          All other registers preserved
 ;;          N & Z reflect A value
 ;;
SD_DisplayR7:
         TSTF                            ; check output specifier
         BPL    O?P1                     ;  if <127, do not display verbose output
         JSR    PUTMSG
         FCN    "...R="
         PSHS   B,X                      ; preserve B and X
         LDB    #5                       ; init loop counter
O?P0     LDA    ,X+                      ; get byte from result buffer
         JSR    PUTBYTE                  ; output it
         JSR    PUTSPACE                 ;   and a space
         DECB
         BNE    O?P0                     ; loop until finished
         PULS   B,X                      ; restore B and X
         LDA    ,X                       ; restore R1 and flags
O?P1     RTS

 ;;
 ;; SD_ReadBlock - read a block (sector) from SD card
 ;; inputs:  X = pointer to 6 byte command structure
 ;;              0,X...3,X = LBA block number to read
 ;;          Y = pointer to block data buffer (512 bytes)
 ;; return:  V=1, read error
 ;;              A != 0 CMD51 failed
 ;;              A = 0 no read token received
 ;;          V=0, block data read successfully
 ;;          D = CRC of data block
 ;;
SD_ReadBlock:
         PSHSW                           ; preserve E and F
         PSHS   U                        ; preserve U
         LDQ    ,X                       ; copy LBA block value
         STQ    SD.A3,X                  ; to A3...A0 of command string
         PULSW                           ; restore E and F
         CLR    SD.CRC,X                 ; clear the CRC byte of string
         LDA    #SD_CMD17                ; READ_SINGLE_BLOCK command (17)
         STA    SD.CMD,X                 ; put it in the command byte
         TFR    X,U                      ; put command buffer address in U
         JSR    SD_SendCmd               ; send the command to SD Card
         PULS   U                        ; restore U
         BNE    R?DERR                   ;   R1 is negative, terminate!
R?D1     JSR    SPI_Read                 ; get token value from card
         BPL    R?DERR                   ;   positive: error token
         CMPA   #$FE                     ; is it the $FE start token?
         BNE    R?D1                     ;   no, loop until we get one
         LDX    #512                     ; put transfer count (512) into X
         JSR    SPI_ReadBlock            ; transfer 512 bytes to buffer at Y
         JSR    SPI_Read                 ; read the CRC MSB
         TFR    A,B                      ; copy MSB to B
         JSR    SPI_Read                 ; read the CRC LSB into A (V=0 always)
         EXG    A,B                      ; put MSB in A, LSB in B
         SD_NegateCS                     ; negate CS after command
         RTS                             ; return with CRC in D and Z clear
R?DERR   SD_NegateCS                     ; negate CS on error return
         ORCC   #CC_V                    ; set the V flag
         RTS                             ; return with error info in A and V set

 ;;
 ;; SD_WriteBlock - write a block (sector) to SD card
 ;; inputs:  X = pointer to 6 byte command structure
 ;;              0,X...3,X = LBA block number to read
 ;;          Y = pointer to block data buffer (512 bytes)
 ;; return:  V=1, write error
 ;;          V=0, block data written successfully
 ;;          A is destroyed
 ;;
SD_WriteBlock:
         PSHSW                           ; preserve E and F
         PSHS   U                        ; preserve U
         LDQ    ,X                       ; copy LBA block value
         STQ    SD.A3,X                  ; to A3...A0 of command string
         PULSW                           ; restore E and F
         CLR    SD.CRC,X                 ; clear the CRC byte of string
         LDA    #SD_CMD24                ; WRITE_SINGLE_BLOCK command (24)
         STA    SD.CMD,X                 ; put it in the command byte
         TFR    X,U                      ; put command buffer address in U
         JSR    SD_SendCmd               ; send the command to SD Card
         PULS   U
         BNE    W?ERR                    ;   R1 is negative, terminate!
         JSR    SPI_Read                 ; send two $FF bytes
         JSR    SPI_Read
         LDA    #$FE                     ; send the $FE start token
         JSR    SPI_Write
         LDX    #512                     ; init transfer counter
         JSR    SPI_WriteBlock           ; transfer 512 bytes from buffer at Y
         JSR    SPI_Read                 ; write a dummy CRC value to card
         JSR    SPI_Read
         JSR    SPI_Read                 ; get data response
         BSR    SD_WaitReady             ; wait for card to do the write
         ANDA   #$1F                     ; mask off unused bits
         CMPA   #$05                     ; $15 = data accepted?
         BNE    W?ERR                    ;    no, so return with error
         SD_NegateCS                     ; negate CS after command
         RTS
W?ERR    SD_NegateCS                     ; negate CS on error return
         ORCC   #CC_V                    ; set the V flag
         RTS                             ; return with error info in A and V set

 ;;
 ;; SD_WaitReady - wait for the SD card to become ready
 ;;                   (e.g. after WriteBlock)
 ;; return:  Z=1, timeout error
 ;;          Z=0, card is ready
 ;;
SD_WaitReady:
         PSHS   A,Y,X                    ; preserve A,Y,X
         LDY    #25000                   ; 25,000 attempts
S?W0     LDX    #2                       ; 20us in between attempts = 500ms
         JSR    DELAYUS
         LEAY   -1,Y
         BEQ    S?W1                     ; timeout (Y=0 -> Z=1)
         JSR    SPI_Read                 ; send an FF over SPI
         COMA                            ; $FF -> $00?
         BNE    S?W0                     ;    nope, next attempt
         COMA                            ; $00 -> $FF (Z=0)
S?W1     PULS   A,Y,X,PC
