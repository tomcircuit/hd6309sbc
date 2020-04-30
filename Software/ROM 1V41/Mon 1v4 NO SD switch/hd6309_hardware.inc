;
; 512B from $E000-$E1FF is reserved for I/O devices:
; Z8536 CIO at $E000, Z85C30 SCC at $E010

IOPAGE   EQU      $E000                             ; Base address of I/O page
ZCIO     EQU      IOPAGE+$00                        ; CIO base address
CIOC     EQU      ZCIO                              ; CIO port C access
CIOB     EQU      ZCIO+1                            ; CIO port B access
CIOA     EQU      ZCIO+2                            ; CIO port A access
CIOCTL   EQU      ZCIO+3                            ; CIO control register

ZSCC     EQU      IOPAGE+$10                        ; SCC base address
ZSCCBC   EQU      ZSCC                              ;	SCC channel B command reg
ZSCCBD   EQU      ZSCC+1                            ;   SCC channel B data reg
ZSCCAC   EQU      ZSCC+2                            ;	SCC channel A command reg
ZSCCAD   EQU      ZSCC+3                            ;	SCC channel A data reg
ZSCC.RXBF EQU     $01                               ; BIT MASK FOR RX BUFFER FULL
ZSCC.TXBE EQU     $04                               ; BIT MASK FOR TX BUFFER EMPTY

; I2CPORT at $E020
;
;       7     6    5    4     3     2    1    0
;	 [DSCL][DSDA][---][---][MSCL][MSDA][---][---]
;      rw    rw    r    r    r     r     r    r
;      1     1     0    0    x     x     0    0
;
; DSCL == drive SCL 1 --> float SCL ; 0 --> drive SCL low
; DSDA == drive SDA 1 --> float SDA ; 0 --> drive SDA low
; MSCK == monitor SCL --> state of SCL
; MSDA == monitor SDA --> state of SDA

I2CPORT  EQU      IOPAGE+$20                        ;soft I2C port
I2C.DSCL EQU      $80
I2C.DSDA EQU      $40
I2C.MSCL EQU      $08
I2C.MSDA EQU      $04

; SDCARD port at $E030
;    8 bits of data to transfer via SPI

SDPORT   EQU      IOPAGE+$30                        ; SDPORT register address

; SYSTEM CONFIG port at $E040
;       7    6    5    4    3     2     1      0
;	 [---][---][---][CONF][RA14][ROMH][ROML][ROMWS]
;      r    r    r    r     rw    rw    rw    rw
;      0    0    0    x     1     1     1     1
;
;  CONF == status of CONFIG jumper
;  RA14 == control ROM pin 27 (default to CONFIG jumper at reset)
;  ROMH == 1 --> bank ROM over $E200-$FFFF during reads (writes always go to RAM)
;  ROML == 1 --> bank ROM over $C000-$DFFF during reads (writes always go to RAM)
;  ROMWS == 1 --> insert wait state for ROM access; 0 --> no wait states for ROM

SYSCFG   EQU      IOPAGE+$40                        ; SYSCFG register address
SYS.ROMWS EQU     $01
SYS.ROMSEL EQU    $02
SYS.ROMSEH EQU    $04
SYS.RA14 EQU      $08

; INPUT-OUTPUT port at $E050
;       7     6      5      4    3  2    1     0
;    [SDSW][SDBSY][SDCLK][SDCS][PB][0][LED2][LED1]
;       I     I      O      O    x       O     O
;  all bits readable, output bits readback
;
;  SDSW == 1 when SD card is inserted
;  SDBSY == 1 while SPI transaction is taking place
;  SDCLK = 1 --> slow SPI clock; 0 --> fast SPI clock
;  SDCS = 1 --> CS signal to SDcard negated; 0 --> asserted
;  PB == 1 when pushbutton is pressed
;  LEDn = 1 --> illuminate corresponding LED

IOPORT   EQU      IOPAGE+$50                        ; INOUT register address
IO.LED1  EQU      $01
IO.LED2  EQU      $02
IO.PB    EQU      $08
IO.SDCS  EQU      $10
IO.SDCLK EQU      $20
IO.SDBSY EQU      $40
IO.SDSW  EQU      $80

CPLDVER  EQU      IOPAGE+$60                        ; CPLD VERSION register address

;; IOPORT LED and PB interface primitives
OnLED1   MACRO
         OIM      #IO.LED1,IOPORT                   ; turn on LED1
         ENDM

OffLED1  MACRO
         AIM      #~IO.LED1,IOPORT                  ; turn off LED1
         ENDM

ToggleLED1 MACRO
         EIM      #IO.LED1,IOPORT                   ; toggle LED1
         ENDM

OnLED2   MACRO
         OIM      #IO.LED2,IOPORT                   ; turn on LED2
         ENDM

OffLED2  MACRO
         AIM      #~IO.LED2,IOPORT                  ; turn off LED1
         ENDM

ToggleLED2 MACRO
         EIM      #IO.LED2,IOPORT                   ; toggle LED2
         ENDM
         
OnLEDS   MACRO
         OIM      #(IO.LED1+IO.LED2),IOPORT        ; turn on LED1 + LED2
         ENDM

OffLEDS  MACRO
         AIM      #~(IO.LED1+IO.LED2),IOPORT       ; turn off LED1 + LED2
         ENDM

StatusPB MACRO
         TIM      #IO.PB,IOPORT                     ; check the pushbutton
         ENDM

;; I2C interface primitives
I2C_StatSDA MACRO
         TIM      #I2C.MSDA,I2CPORT                 ;(Z = 1 if SDA is low)
         ENDM

I2C_SinkSDA MACRO
         AIM      #~I2C.DSDA,I2CPORT                ;Drive SDA line low
         ENDM

I2C_ReleaseSDA MACRO
         OIM      #I2C.DSDA,I2CPORT                 ;Release SDA line
         ENDM

I2C_StatSCL MACRO
         TIM      #I2C.MSCL,I2CPORT                 ;(Z = 1 if SCL is low)
         ENDM

I2C_SinkSCL MACRO
         AIM      #~I2C.DSCL,I2CPORT                ;Drive SCL line low
         ENDM

I2C_ReleaseSCL MACRO
         OIM      #I2C.DSCL,I2CPORT                 ;Release SCL line
         ENDM

I2C_ReleaseBoth MACRO
         OIM      #(I2C.DSCL+I2C.DSDA),I2CPORT      ;Release both SDA and SCL lines
         ENDM
         
I2C_BitDelay MACRO
         NOP
         ENDM         

I2C_StretchSCL MACRO
I?SSH    NOP
         I2C_ReleaseSCL                             ; try to release SCL
         NOP
         I2C_StatSCL                                ; check is SCL is really high yet
         BEQ      I?SSH                             ; if SCL is still low -> try again
         ENDM

;; SPI interface primitives
SPI_FastMode MACRO
         AIM      #~IO.SDCLK,IOPORT                 ; set SPI to fast mode
         ENDM

SPI_SlowMode MACRO
         OIM      #IO.SDCLK,IOPORT                  ; set SPI to slow mode
         ENDM

SPI_Status MACRO
         TIM      #IO.SDBSY,IOPORT                  ; check the SPI busy bit (Z=0 means busy)
         ENDM

;; SD card interface primitives
SD_AssertCS MACRO
         AIM      #~IO.SDCS,IOPORT                  ; assert SD card select
         ENDM

SD_NegateCS MACRO
         OIM      #IO.SDCS,IOPORT                   ; negate SD card select
         ENDM

SD_CardPresent MACRO
         TIM      #IO.SDSW,IOPORT                   ; examine SD card switch
         ENDM
