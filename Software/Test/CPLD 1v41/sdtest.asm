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

SCC_InitA                    EQU $FF40     ; initialize SCC channel A
GETCH                        EQU $FF44     ; wait for character from CONSOLE

PUTCH                        EQU $FF58     ; output character to CONSOLE
PUTBYTE                      EQU $FF5C     ; output HEX BYTE to CONSOLE
PUTWORD                      EQU $FF5E     ; output HEX WORD to CONSOLE
PUTMSG                       EQU $FF60     ; output ASCIIZ message at PC to CONSOLE
PUTSTR                       EQU $FF62     ; output ASCIIZ message at X to CONSOLE
PUTCR                        EQU $FF64     ; output a CR+LF to CONSOLE
DELAYUS                      EQU $FFBA     ; delay X * 10us
SPI_Read                     EQU $FF94     ; SPI read byte (send $FF)
SPI_ReadBlock                EQU $FF96     ; SPI read block (send $FF)
SPI_Write                    EQU $FF98     ; SPI write byte
SPI_WriteBlock               EQU $FF9A     ; SPI write block         

SD_Initialize                EQU $FFA4     ; initialize SD card
SD_SendCmd                   EQU $FFA6     ; send command to SD card, get R1 response
SD_GetR7                     EQU $FFA8     ; get R7 response after command
SD_ReadBlock                 EQU $FFAA     ; read LBA block from SD card
SD_WriteBlock                EQU $FFAC     ; write LBA block to SD card
SD_WaitReady                 EQU $FFAE     ; wait for SD card to complete write operation


PUTSPACE EQU    $E73D                    ; output SPACE
GOWOZ    EQU    $E203                    ; go to monitor

MODEBYTE EQU    $1FFF

 ; ==================================================
 ;   ENTRY POINT
 ; ==================================================

START:
         CLRA                            ; always start in SLOW block mode
         STA    MODEBYTE
         LDX    #BANNER
         JSR    [PUTSTR]
S?0      LDX    #$1F80                   ; pointer to scratch buffer
         LDF    #$80                     ; verbose debug info
         JSR    [SD_Initialize]
         BVC    READ0
         LDA    MODEBYTE
         INCA
         CMPA   #10
         BLO    S?0
ERROR0:
         LDX    #SDERR
         JSR    [PUTSTR]
         JMP    GOWOZ

READ0:
 ; read sector 0
         LDX    #READING
         JSR    [PUTSTR]

         LDX    #$1F90
         LDY    #$2000
         CLRD
         CLRW
         STQ    ,X
         JSR    [PUTWORD]
         TFR    W,D
         JSR    [PUTWORD]
         JSR    [PUTCR]
         JSR    [SD_ReadBlock]
         LBVS   ERROR
         JSR    DISPSEC

         LDX    #ASK
         JSR    [PUTSTR]
         JSR    [GETCH]
         JSR    [PUTCH]
         JSR    [PUTCR]

 ; read sector 1
         LDX    #READING
         JSR    [PUTSTR]

         LDX    #$1FA0
         LDY    #$2000
         CLRD
         LDW    #1
         STQ    ,X
         JSR    [PUTWORD]
         TFR    W,D
         JSR    [PUTWORD]
         JSR    [PUTCR]
         JSR    [SD_ReadBlock]
         LBVS   ERROR
         JSR    DISPSEC

         LDX    #ASK
         JSR    [PUTSTR]
         JSR    [GETCH]
         JSR    [PUTCH]
         JSR    [PUTCR]

 ; read sector 0
         LDX    #READING
         JSR    [PUTSTR]

         LDX    #$1F90
         LDY    #$2000
         CLRD
         CLRW
         STQ    ,X
         JSR    [PUTWORD]
         TFR    W,D
         JSR    [PUTWORD]
         JSR    [PUTCR]
         JSR    [SD_ReadBlock]
         LBVS   ERROR
         JSR    DISPSEC

         LDX    #ASK
         JSR    [PUTSTR]
         JSR    [GETCH]
         JSR    [PUTCH]
         JSR    [PUTCR]

 ; alter sector data
         LDX    #CHANGING
         JSR    [PUTSTR]

         LDX    #$2000
         LDD    ,X
         INCD
         STD    ,X

 ; write sector 0
         LDX    #WRITING
         JSR    [PUTSTR]

         LDX    #$1FB0
         LDY    #$2000
         CLRD
         CLRW
         STQ    ,X
         JSR    [PUTWORD]
         TFR    W,D
         JSR    [PUTWORD]
         JSR    [PUTCR]
         JSR    [SD_WriteBlock]
         LBVS   ERROR
         
         LDX    #ASK
         JSR    [PUTSTR]
         JSR    [GETCH]
         JSR    [PUTCH]
         JSR    [PUTCR]

 ; alter sector data
         LDX    #CHANGING
         JSR    [PUTSTR]

         LDX    #$2000
         LDD    ,X
         INCD
         STD    ,X

 ; write sector 1
         LDX    #WRITING
         JSR    [PUTSTR]

         LDX    #$1FC0
         LDY    #$2000
         CLRD
         LDW    #1
         STQ    ,X
         JSR    [PUTWORD]
         TFR    W,D
         JSR    [PUTWORD]
         JSR    [PUTCR]
         JSR    [SD_WriteBlock]
         LBVS   ERROR

         LDX    #ASK
         JSR    [PUTSTR]
         JSR    [GETCH]
         JSR    [PUTCH]
         JSR    [PUTCR]
         JMP    READ0
ERROR:
         LDX    #ERRORTXT
         JSR    [PUTSTR]
         JMP    GOWOZ

DISPSEC:
 ; display 64 bytes of sector data at 2000
         LDX    #$2000
         LDE    #64
D?S0     TFR    E,A
         BITA   #$0F
         BNE    D?S1
         JSR    [PUTCR]
         TFR    X,D
         JSR    [PUTWORD]
         LDA    #':'
         JSR    [PUTCH]
         JSR    PUTSPACE
D?S1     LDA    ,X+
         JSR    [PUTBYTE]
         DECE
         BNE    D?S0
         JMP    [PUTCR]

BANNER   .ascii "=== HD6309 SD card test ==="
         .db    10,13,0

ASK      .ascii "Press a key"
         .db    10,13,0

SDERR    .ascii "Error: failed to init SD card"
         .db    10,13,0

ERRORTXT .ascii "I/O error during access"
         .db    10,13,0

READING  .ascii "Reading block "
         .db    0

CHANGING .ascii "Incrementing block bytes"
         .db    10,13,0

WRITING  .ascii "Writing block "
         .db    0


EOLSTR   .db    10,13,0

