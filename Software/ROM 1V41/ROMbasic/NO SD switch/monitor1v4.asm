;======================================================================
;  
; HD6309 SBC Singleboard Computer MONITOR ROM 
; Version 1.41
; April 26, 2020
; Tom LeMense
; tomcircuit AT gee male PERIOD com
;
; Intended to be used with the HD6309 SBC board, described here:
; https://hackaday.io/project/345-hd6309-singleboard-computer
;
; Specifically, this source file is for a "monitor ROM" for the SBC,
; and is targeted to reside in 15.5K of ROM at the top of the
; memory map ($C000-$FFFF), with 512 bytes of memory-mapped IO
; ($E000-$E1FF) and 48K of RAM from $0000-$BFFF.
;
; This file is intended to be assembled by William Astle's LWASM
; http://www.lwtools.ca/
;
; This monitor ROM includes the following main portions:
;
;   0) MC6839 IEEE Floating Point functions (see note)
;   1) HD6309 SBC platform support functions
;       . Zilog CIO access functions
;       . Zilog SCC Ch A character I/O functions
;       . Other misc functions
;       . Soft I2C and RTC functions
;       . SPI master functions
;       . SD card functions (through SPI master)
;   2) NoICE 6309 serial debug monitor
;      https://www.noicedebugger.com/
;   3) WOZMON port to 6809 of classic Apple 1 monitor
;   4) a S-Record/Intel Hex download function (also via WOZMON)
;
; 384 bytes of RAM from $BE80-$BFFF are reserved for all of this, and
; the system stack pointer is initialized to point to the
; beginning of this area, allowing the user stack to grow downward
; into user RAM.
;
; note: the 8K of ROM $C000-$DFFF should contain the Motorola "MC6839"
; IEEE Floating Point functions, which are (sadly) only availible as
; a binary image. As such, the source for this is not included in this
; file. See the MC6839 User Manual and Datasheet for more information.
;
; LICENSE:
;
; This source file is an amalgam of several components. All portions
; that are not otherwise covered under some license terms (e.g. the
; NoICE Monitor is (c) John Hartman; the WozMon port is GPL) are 
; free and unencumberd software and released into the public domain.
;
; Aanyone is free to copy, modify, publish, use, compile, sell, or
; distribute this software, either in source code form or as a compiled
; binary, for any purpose, commercial or non-commercial, and by any
; means.

; In jurisdictions that recognize copyright laws, the author or authors
; of this software dedicate any and all copyright interest in the
; software to the public domain. We make this dedication for the benefit
; of the public at large and to the detriment of our heirs and
; successors. We intend this dedication to be an overt act of
; relinquishment in perpetuity of all present and future rights to this
; software under copyright law.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
; IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
; OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
; OTHER DEALINGS IN THE SOFTWARE.
;
; For more information, please refer to <https://unlicense.org>
;
;======================================================================

_MONITOR_REV      EQU  $0141
_MON_REV_TEXT     MACRO
                  FCC "1.41"
                  ENDM
_MON_REV_DATE     MACRO
                  FCC "04/29/2020"
                  ENDM

         INCLUDE  "hd6309_hardware.inc"
         
TRUE              EQU  1
FALSE             EQU  0
         
CPU_FREQ_MHZ      EQU  3
COPY_MON_TO_RAM   EQU  TRUE
COMMON_TEXT_BUFFER EQU TRUE
IGNORE_SD_SWITCH  EQU TRUE

; Map SCC channels to "CONSOLE" and "DEBUG"
; Default is CONSOLE is SCC channel A, DEBUG is SCC channel B
SCC_CHA           EQU  1
SCC_CHB           EQU  2
CONSOLE_CH        EQU  SCC_CHA
DEBUG_CH          EQU  SCC_CHB

;  Condition Code Register bits
CC_C              EQU  $01
CC_V              EQU  $02
CC_Z              EQU  $04
CC_N              EQU  $08
CC_I              EQU  $10
CC_H              EQU  $20
CC_F              EQU  $40
CC_E              EQU  $80

;  Other defines
CR                EQU  $0D                          ;CARRIAGE RETURN
LF                EQU  $0A                          ;LINE FEED
SPACE             EQU  $20

;  Platform dependent memory information
RAM_START         EQU  $BF00                        ; START OF RESERVED RAM
ROML_START        EQU  $C000                        ; START OF LOW ROM (ROM IMAGE)
ROMH_START        EQU  $E200                        ; START OF HIGH ROM
JUMP_TABLE        EQU  $FF40                        ; START OF UTILITY JUMP TABLE
HARD_VECT         EQU  $FFF0                        ; START OF HARDWARE VECTORS


;======================================================================
;         RAM STORAGE USED BY *ALL* PORTIONS STARTS HERE
;======================================================================
                  ORG  RAM_START
                  
;  Initial user stack
INITSTACK         EQU  *                            ; user stack starts below monitor stack
                  ALIGN 128,$00         

      IFEQ (COMMON_TEXT_BUFFER)                     ; 128B RAM for WOZMON below NoICE RAM         
WOZ_RAM           RMB  128                          ; storage for WOZMON input buffer, vars (on $80 boundary)
      ENDC

;  NoICE Communications buffer
;  (Must be at least as long as TASK_REG_SZ.  At least 19 bytes recommended.
;  Larger values may improve speed of NoICE memory move commands.)
COMBUF_SIZE       EQU  128                          ; DATA SIZE FOR COMM BUFFER
COMBUF            RMB  2+COMBUF_SIZE+1              ; BUFFER ALSO HAS FN, LEN, AND CHECK

      IF (COMMON_TEXT_BUFFER)                       ; use NoICE Communications buffer as WOZMON RAM
WOZ_RAM  EQU      COMBUF
      ENDC

;  RAM interrupt vectors (first in SEG for easy addressing, else move to their own SEG)
NVEC              EQU  8                            ; number of vectors
RAMVEC            RMB  2*NVEC
RV_TRAP           EQU  RAMVEC
RV_SWI3           EQU  RAMVEC+2
RV_SWI2           EQU  RAMVEC+4
RV_FIRQ           EQU  RAMVEC+6
RV_IRQ            EQU  RAMVEC+8
RV_SWI            EQU  RAMVEC+10
RV_NMI            EQU  RAMVEC+12
;
;  NoICE DEbug Monitor stack
;  (Calculated use is at most 7 bytes.  Leave plenty of spare)
                  RMB  24
MONSTACK
;
;  NoICE Test Stack is for fake RTI instruction (14 bytes in 6309 Native Mode)
TEST_STACK        RMB  14
; It is not possible to read bits 0 and 1 of regMD so the next three
; lines enable testing of these bits.
E_FLAG            RMB  1                            ; 0=not set $80=set
S_IMAGE           RMB  2                            ; temporary store for regS
;  NoICE Target registers:  order must match that in TRGHC11.C
TASK_REGS
REG_STATE         RMB  1
REG_PAGE          RMB  1
REG_SP            RMB  2
REG_U             RMB  2
REG_Y             RMB  2
REG_X             RMB  2
REG_F             RMB  1                            ; F BEFORE E, SO W IS LEAST SIG. FIRST
REG_E             RMB  1
REG_B             RMB  1                            ; B BEFORE A, SO D IS LEAST SIG. FIRST
REG_A             RMB  1
REG_DP            RMB  1
REG_CC            RMB  1
REG_MD            RMB  1
REG_V             RMB  2
REG_PC            RMB  2
TASK_REG_SZ       EQU  *-TASK_REGS

RAM_END           EQU  *                            ; ADDRESS OF TOP+1 OF RAM

      IFGT     (RAM_END-ROML_START)
         ERROR    "RESERVED RAM OVERLAPS WITH ROM IMAGE"
      ENDC

;======================================================================
;                    ROM IMAGE BEGINS HERE
;======================================================================

;======================================================================
; Part 0 - Motorola 6839 Floating Point ROM (8KB binary image)
;======================================================================
         ORG      ROML_START
         INCLUDEBIN float09.bin
         
      IFNE     (*-IOPAGE)
         ERROR    "FP ROM IMAGE INCORRECT SIZE"
      ENDC

;======================================================================
;
;======================================================================

BANNER   FCC      "HD6309 SBC Monitor ROM build "
         _MON_REV_TEXT
         FCC      " "
         _MON_REV_DATE
         FCC      " Tom LeMense "         
         FCC      "This ROM is for the HD6309 SBC "
         FCC      "described at https://hackaday.io/project/345"
         FCC      "-hd6309-singleboard-computer. "
         FCC      "This ROM occupies $C000-$FFFF, and "
         FCC      "includes the following portions: "
         FCC      "MC6839 IEEE Floating Point functions, "
         FCC      "Reset and RTC utilities, "
         FCC      "NoICE debug monitor, "
         FCC      "A simple monitor (inspired by "
         FCC      "Apple 1 WOZMON), and "
         FCC      "SBC HW support functions. "
      IF       (COPY_MON_TO_RAM)
         FCC      "ROM copy to RAM at reset. "
      ENDC
      IF       (COMMON_TEXT_BUFFER)
         FCC      "NoICE and WOZMON same txt buffer. "
      ENDC
      IF       (IGNORE_SD_SWITCH)
         FCC      "SD switch ignored. "
      ENDC
      IFEQ (CONSOLE_CH-SCC_CHA)
         FCC      "Console SCC Ch A. "      
      ELSE
         FCC      "Console SCC Ch B. "      
      ENDC                  
      IFEQ (DEBUG_CH-SCC_CHA)
         FCC      "NoICE SCC Ch A. "      
      ELSE
         FCC      "NoICE SCC Ch B. "      
      ENDC                  

BANNER_END  EQU *-1
         
      IFGE     (BANNER_END-BANNER-512)
         WARNING  "ROM BANNER EXCEEDS 512B"
      ELSE
         FILL     $FF,(ROMH_START-BANNER_END)
      ENDC

         PRAGMA   6309
         ORG      ROMH_START
;======================================================================
; Jump table to useful entry points
;======================================================================
         JMP      RESET                             ; COLDSTART
         JMP      GOWOZ                             ; WOZMON
         JMP      GONOICE                           ; NOICE
         JMP      GOBASIC                           ; MS BASIC
         
;======================================================================
;  SYSTEM RESET
;======================================================================
RESET:
         ORCC     #CC_I+CC_F                        ; disable interrupts
         LDS      #MONSTACK                         ; set default stack pointer
      IF       (COPY_MON_TO_RAM)
         JSR      MOVEMON                           ; Move MONITOR image into RAM
      ENDC
         LDA      #(IO.SDCLK|IO.SDCS|IO.LED2|IO.LED1)  ; slow SPI clock freq, negate SD CS
         STA      IOPORT                               ; LED1 and LED2 both ON
         AIM      #~(SYS.ROMWS),SYSCFG              ; make ROM access 0WS (fast flash)
         LDA      #(I2C.DSCL|I2C.DSDA)              ; release SDA and SCL

; populate exception handler redirection table
         LDY      #EXC_STUB                         ; ADDRESS OF DEFAULT HANDLER
         LDX      #RAMVEC                           ; POINTER TO RAM VECTORS
         LDB      #NVEC                             ; NUMBER OF VECTORS
R?VEC    STY      ,X++                              ; SET VECTOR
         DECB
         BNE      R?VEC                             ; repeat until all vectors set

; initialize the two SCC channels         
         JSR      CONSOLE_INIT                      ; init console SCC channel for 115.2kbps
         JSR      DEBUG_INIT                        ; init debug SCC channel for 115.2kbps

; HD6309 SBC can be USB powered, which means that CPU execution might begin before the
; USB bridge finishes enumeration. So wait a bit - also allows for the PB output to settle
; after poweron
         LDX      #500                              ; delay 0.5s to allow PB output to fall, USB to enumerate
         JSR      DELAYMS
         OffLED2                                    ; turn off LED2 
         StatusPB                                   ; check the pushbutton
         BNE      RESET1                            ; PB depressed, go to CONSOLE mode
        
; Check CONSOLE and DEBUG ports, alternately, for activity. Whichever one is active first
; determines if the SBC is in "CONSOLE MODE" (human operator via USB term) or in "DEBUG
; MODE" (control via NoICE debug port). Illuminate LED1 while trying CONSOLE and LED2
; while trying DEBUG ports, respsectively.
RESET0   OnLED1                                     ; turn on LED1 while trying console channel
         OffLED2                                    ; turn off LED2 while trying console channel
         JSR      GETCH2                            ; attempt to get a character from console channel
         BVC      RESET1                            ;  got a character, console is active!
         OffLED1                                    ; turn off LED1 while trying debug channel
         OnLED2                                     ; turn on LED2 while trying debug channel
         JSR      DBGETCH                           ; attempt to get a character from debug channel 
         BVS      RESET0                            ;  no character on SCC B, so keep trying
         CMPA     #$F0                              ; is the byte received $Fx (NoICE commands look like this)
         BLO      RESET0                            ;   no, so keep trying!
GONOICE:
         OffLED1
         OnLED2
         JMP      NOICE                             ; enter the NoICE resident debugger (LED2 ON)

; We received a character from console before a NoICE command arrived, or the pushbutton 
; was depressed during boot (skip NoICE check). Attempt to get a second character from console 
; while flashing LED1, then display system info.
RESET1   OffLED2                                    ; turn off LED2 when in console-only operation
         JSR      GETCHT                            ; get a second character, flash LED1 while waiting
         STA      RAM_START                         ; save that second character for later...
         JSR      PUTMSG
         FCB      CR,LF                             ; newline
         FCC      "HD6309 Singleboard Computer"
         FCB      CR,LF                             ; newline
         FCC      "Monitor ROM v"
         _MON_REV_TEXT         
         FCB      CR,LF                             ; newline
         _MON_REV_DATE
         FCC      " build"
         FCB      CR,LF                             ; newline
         FCN      "Mainboard CPLD v"
         LDA      CPLDVER                           ; display CPLD version from CPLDVER register
         LSRA                                       ; display MAJOR revision 0-F
         LSRA
         LSRA
         LSRA
         JSR      PUTHEX
         LDA      #'.'
         JSR      PUTCH
         LDA      CPLDVER                           ; display MINOR revision 0-F
         JSR      PUTHEX
         JSR      PUTCR                             ; newline

; Examine the character received in RESET1 to see what the operator wants to do:
;        B = Enter MS BASIC
;        N = Enter NoICE debugger
;        R = Realtime Clock Utility
;        S = Boot from SDcard
;        <anything else> = enter WOZMON
;
         LDA      RAM_START                         ; get that second character back
RESET2   CMPA     #'?'                              ; request for help?
         BEQ      GOHELP
         ANDA     #$5F                              ; convert to UPPERCASE
         CMPA     #'B'                              ; request to enter BASIC?
         LBEQ     GOBASIC                           
         CMPA     #'N'                              ; request to enter NoICE?
         LBEQ     GONOICE
         CMPA     #'R'                              ; request to run RTC UTILITY?
         BEQ      GORTC
         CMPA     #'S'                              ; request to BOOT FROM SD?
         LBEQ     GOBOOT
         CMPA     #'?'                              ; request for help?
         BEQ      GOHELP
         ; fall into "normal startup"

; No special action required, so try to output time and date before entering WOZMON
         LDA      CPLDVER                           ; check for I2C RTC support
         CMPA     #$14                              ; which began at CPLD V1.4
         BLO      GOWOZ                             ;  too old, jump to monitor
         LDY      #RAM_START                        ; use reserved RAM for buffer
         JSR      RTC_FmtTime                       ; read RTC and create formatted time string at X
         BVS      W?RTCX                            ;   RTC read failed
         TFR      Y,X                               ; copy string address to X
         JSR      PUTSTR                            ; display formatted string at X         
         JSR      PUTCR                             ; newline
         JSR      RTC_FmtDate                       ; read RTC and create formatted date string at X
         BVC      W?RTC                             ; RTC read successful?
W?RTCX   LDY      #RTCERR                           ;   no, failed, point Y to error string
W?RTC    TFR      Y,X                               ; copy string address to X
         JSR      PUTSTR                            ; display the formatted string at X

;;
;; GOWOZ - Start WOZMON
;;
GOWOZ:   
         OnLED1
         OffLED2
         JSR      PUTCR                             ; newline
         JMP      WOZMON                            ; jump to WOZMON
         
;;
;; GOHELP - Display boot help
;;
GOHELP:
         JSR      PUTMSG                            ; display help message
         FCB      LF,CR         
         FCC      "B=MS BASIC, N=NoICE, R=RTC Util, S=SD Boot"
         FCB      $FF
         JSR      GETCHT                             ; give operator another chance
         JMP      RESET2                            ; try again

;;
;; GORTC - Start Realtime Clock and NVRAM Utility
;;
RTC.STATUS        EQU   15

GORTC:   
         OnLED1
         OnLED2
         JSR      PUTMSG
         FCN      "Realtime Clock Utility"
GORTC1:
         JSR      PUTMSG
         FCB      LF,CR
         FCC      "0=EXIT   1=SET TIME   2=SET DATE   3=ENABLE 1HZ NMI   4=DISABLE 1HZ NMI"
         FCB      LF,CR,'#','?',0
         LDB      #4
         JSR      GETBDIG                           ; get digit 0-4
         BVS      GORTC1
         TSTA                                       ; is it 0?
         LBEQ     RESET
         CMPA     #1                                ; is it 1?
         BEQ      RTC_SETT
         CMPA     #2                                ; is it 2?
         BEQ      RTC_SETD
         CMPA     #3                                ; is it 3?
         LBEQ     RTC_ENNMI
         CMPA     #4                                ; is it 4?
         LBEQ     RTC_DISNMI
         BRA      GORTC1                            ; re-prompt

; Interactive Time Set         
RTC_SETT:
         JSR      PUTMSG                            ; output format prompt
         FCB      LF,CR         
         FCN      "Time HH:MM:SS = "
         LDY      #R_TIMEPAT                        ; address of TIME PATTERN table
         BRA      RTCS0
         
; Interactive Date Set         
RTC_SETD:
         JSR      PUTMSG                            ; output format prompt
         FCB      LF,CR         
         FCN      "Date MM/DD/YYYY = "
         LDY      #R_DATEPAT                        ; address of DATE PATTERN table
         
; common, table-driven, time/date set stuff         
RTCS0    PSHS     Y                                 ; preserve Y pointer to pattern
         LDY      #RAM_START                        ; point Y to start of monitor RAM
         JSR      RTC_ReadRegs                      ; read RTC registers 0-15 to Y[0...15]
         BNE      RTCIF                             ;   report I2C error
         PULS     Y                                 ; restore Y pointer to pattern
         LDX      #RAM_START                        ; point to RAM array
         JSR      GETPATT                           ; process input per pattern
         BVS      RTCIE                             ;   report entry error
         LDY      #RAM_START                        ; use reserved RAM for buffer
         LDA      RTC.STATUS,Y                      ; get STATUS register
         ANDA     #$07                              ; clear the OSF and 32KHz bits
         STA      RTC.STATUS,Y                      ; write updated STATUS register
         JSR      RTC_WriteRegs                     ; write Y[0...15] to RTC registers 0-15
         BNE      RTCIF                             ;   report I2C error
         JSR      PUTMSG
         FCB      LF,CR         
         FCN      "RTC Updated."
         JMP      GORTC1         
RTCIE    JSR      PUTMSG
         FCB      LF,CR         
         FCN      "Entry Error!"
         JMP      GORTC1
RTCIF    JSR      PUTMSG
         FCB      LF,CR         
RTCERR   FCN      "RTC Access Error!"
         JMP      GORTC1         
         
; Enable 1Hz NMI         
RTC_ENNMI:         
         JSR      RTC_NMIEnable
         BVS      RTCIF
         JSR      PUTMSG
         FCB      LF,CR         
         FCN      "1Hz NMI Disabled"
         JMP      GORTC1
         
; Disable 1Hz NMI         
RTC_DISNMI:         
         JSR      RTC_NMIDisable
         BVS      RTCIF
         JSR      PUTMSG
         FCB      LF,CR         
         FCN      "1Hz NMI Disabled"
         JMP      GORTC1
         
R_TIMEPAT:
         FCB      $42,$82,$00                       ; HOURS 10's - bound is 2, shift left 4, STORE at +2
         FCB      $09,$42,':'                       ; HOURS 1's - bound is 9, no shift, OR at +2, ":"
         FCB      $45,$81,$00                       ; MINS 10's - bound is 5, shift left 4, STORE at +1
         FCB      $09,$41,':'                       ; MINS 1's - bound is 9, no shift, OR at +1, ":"                
         FCB      $45,$80,$00                       ; SECS 10's - bound is 5, shift left 4, STORE at +0
         FCB      $09,$40,$FF                       ; SECS 1's - bound is 9, no shift, OR at +0, TERM
         
R_DATEPAT:
         FCB      $41,$85,$00                       ; MONTHS 10's - bound is 1, shift left 4, STORE at +5
         FCB      $09,$45,'/'                       ; MONTHS 1's - bound is 9, no shift, OR at +5, "/"
         FCB      $43,$84,$00                       ; DAYS 10's - bound is 3, shift left 4, STORE at +4
         FCB      $09,$44,'/'                       ; DAYS 1's - bound is 9, no shift, OR at +4
         FCB      $42,$00,$00                       ; YEARS 1000's - bound is 2, shift left 4, DISCARD
         FCB      $81,$45,$00                       ; YEARS 100's - bound is 1, rotate lsb into msb, OR at +5
         FCB      $49,$86,$00                       ; YEARS 10's - bound is 9, shift left 4, STORE at +6
         FCB      $09,$46,$FF                       ; YEARS 1's - boudn is 9, no shift, OR at +6, TERM

;;
;; GOBOOT - Read SDcard LBA block 0 into RAM ($0-$1FF)
;;          If read success, either WOZMON or jump to $0
;;          If read fails, jump to WOZMON
;;
GOBOOT:  
         OffLED1
         OffLED2
         JSR      PUTMSG
         FCN      "Booting from SD Card..."
         LDB      #4                                ; initialize attempts counter
B?IL     DECB                                       ; decrement attempt counter
         BEQ      B?ERR0                            ;   done ; terminate with error
         LDX      #100                              ; 100ms delay
         JSR      DELAYMS                           
         LDX      #$0400                            ; pointer to scratch area
         LDF      #$01                              ; minimal debug info
         JSR      SD_Initialize                     ; initialize the card
         BVS      B?IL                              ;   error during init; try again
         JSR      PUTMSG
         FCC      "Loading LBA Block 0"
         FCB      $FF         
         LDX      #$0400                            ; pointer to scratch area
         LDY      #$0000                            ; pointer to start of RAM
         STY      0,X                               ; fill block field in structure with
         STY      2,X                               ; 00:00:00:00
         JSR      SD_ReadBlock
         BVS      B?ERR1                            ;   error during read; terminate
         JSR      PUTMSG
         FCC      "Loaded."
         FCB      LF,CR
         FCN      "M=Monitor or X=Execute ?"
B?DO     JSR      GETCH                             ; get a keystroke
         JSR      PUTCH
         CMPA     #'M'                              ; is it M?
         LBEQ     GOWOZ                             ;   yes, go to WOZMON
         CMPA     #'X'                              ; is it X?
         BNE      B?DO                              ;   no, get option again
         JSR      PUTMSG                            ; yes, execute the boot code
         FCN      "Executing"
         JMP      $0                                
; error during SD initalize
B?ERR0   JSR      PUTMSG
         FCN      "Error during SD Initialization :"
         TFR      E,A
         JSR      PUTBYTE
         JMP      RESET
; error during SD initalize
B?ERR1   JSR      PUTMSG
         FCN      "Error during LBA Block 0 read!"
         JMP      RESET

;;
;; Default Exception Handler - RTI stub
;;
EXC_STUB:
         RTI

;;
;; GOBASIC - switch to MS Basic interpreter
;;           located in the alternate ROM bank
;;
GOBASIC:
         LDD      #RAM_START                        ; point to RAM
         LDX      #BSWAP                            ; address of bankswap snippet         
         LDW      #B?SWP_SZ                         ; length of snippet
         TFM      X+,D+                             ; copy the snippet (W=0)
         JMP      RAM_START                         ; execute it!
BSWAP    CLRA
         TFR      A,DP                              ; DP should be 0 on a "reset"
         STA      <$6E                              ; clear MS BASIC's "reset flag"
         EIM      #SYS.RA14,SYSCFG                  ; flip the RA14 control bit ("other bank")
         OIM      #(SYS.ROMSEL|SYS.ROMSEH),SYSCFG   ; make sure ROM is enabled
         JMP      [V_RESET]                         ; jump to "other bank" RESET vector
B?SWP_SZ EQU      *-BSWAP                           ; size of bankswap function

;;
;; MOVEUP - move bytes from $0000-$3FFF to upper RAM/ROM area, disable the 
;;          ROM decoding, and start execution from RAM reset vector.
;;
MOVEUP:
         CLRD                                       ; address of RAM block start is $0
         LDX      #$C000                            ; address of HIGH RAM start
         LDW      #$4000                            ; length of RAM block
         TFM      D+,X+                             ; copy the block to RAM (W=0)
         TFR      W,X                               ; clear X (W is always 0)
         LDF      #R?SEL_SZ                         ; length of block (MSB E is already 0)
         LDD      #RAMSEL                           ; address of ROM disable+JMP snippet
         TFM      D+,X+                             ; copy the snippet (W=0)
         JMP      ,W                                ; jump to 0
RAMSEL   AIM      #~(SYS.ROMSEL|SYS.ROMSEH),SYSCFG  ; disable all ROM
         CLRD
         TFR      A,DP                              ; DP should be 0 on a "reset"
         JMP      [V_RESET]                         ; jump to the RESET vector in RAM
R?SEL_SZ EQU      *-RAMSEL                          ; size of bankswap function

;;
;; MOVEMON - copy ROM Monitor into upper RAM area,
;;           then disable ROM decoding ("move Monitor to RAM").
;;           Allows for debugging of WOZMON and Utils via NoICE
MOVEMON:
         LDX      #$C000                            ; address of ROM start
         TFR      X,Y                               ; address of HIGH RAM start
         LDW      #$3FFF                            ; length of RAM block
         TFM      X+,Y+                             ; copy the ROM to RAM
         AIM      #~(SYS.ROMSEL|SYS.ROMSEH),SYSCFG  ; disable ROM (safe to do - we're "in place")
         RTS
         
;;======================================================================
;; PLATFORM DEPENDENT Z8536 CIO UTILITY FUNCTIONS
;;======================================================================

;;
;; CIO_Initialize - put the Z8536 CIO into a known state.
;;                  Call this before trying to use the
;;                  CIO_ReadReg and CIO_WriteReg functions!
;; inputs: none
;; return: A is destroyed
;;
CIO_Initialize:
         LDA      CIOCTL                            ; read CIO control register to get to state 0
         BSR      ZI?                               ; a read will force the z8536 into state 0 if in state 1, otherwise it will
; not cause any changes
         CLRA                                       ; if the z8536 was reset, writing a 0 will force it into state 0. if in
         STA      CIOCTL                            ; state 0, this will set the pointer to register 0 and go to state 1.
         BSR      ZI?
         LDA      CIOCTL                            ; another read operation will force the 8536 into state 0, from where further
         BSR      ZI?                               ; instructions can be done
         CLRA                                       ; set address pointer to master interrupt control register (addr 0)
         STA      CIOCTL
         BSR      ZI?
         LDA      #1                                ; reset the z8536 by enabling the reset bit (b0)
         STA      CIOCTL
         BSR      ZI?                               ; next, by writing a 0 to register 0 during reset, the reset will be cleared.
         CLRA                                       ; successive writes can only be done during reset (during normal operation,
         STA      CIOCTL                            ; successive writes will change the address pointer to that output value).
ZI?      NOP
         NOP
         NOP
         RTS

;;
;; CIO_ReadReg - Z8536 CIOCTL Register READ Function
;; inputs: A = register number to read (0...3F)
;; return: B = value from register
;;
CIO_ReadReg:
         LDB      CIOCTL                            ; read CIO control register to get to state 0
         ANDA     #$3F                              ; make sure register value is in range
         STA      CIOCTL                            ; set the address pointer to the desired register
         LDB      CIOCTL                            ; read the contents of the register
         RTS

;;
;; CIO_WriteReg - Z8536 CIOCTL register WRITE Function
;; inputs: A = register number to read (0...3F)
;;         B = value to write to register
;; return: none
;;
CIO_WriteReg:
         TST      CIOCTL                            ; read CIO control register to get to state 0
         ANDA     #$3F                              ; make sure it's in range
         STA      CIOCTL                            ; set the address pointer to the desired register
         STB      CIOCTL
         RTS

;;======================================================================
;; PLATFORM DEPENDENT Z85C30 CHARACTER INPUT AND OUTPUT FUNCTIONS
;;======================================================================

;; Map the CONSOLE functions to the appropriate SCC channel
            IFEQ (CONSOLE_CH-SCC_CHA)
CONSOLE_CMD    EQU  ZSCCAC
CONSOLE_DAT    EQU  ZSCCAD
CONSOLE_INIT   EQU  SCC_InitA
            ELSE
CONSOLE_CMD    EQU  ZSCCBC
CONSOLE_DAT    EQU  ZSCCBD
CONSOLE_INIT   EQU  SCC_InitB
            ENDC                  

;; Map the DEBUG functions to the appropriate SCC channel
            IFEQ (DEBUG_CH-SCC_CHA)
DEBUG_CMD      EQU  ZSCCAC
DEBUG_DAT      EQU  ZSCCAD
DEBUG_INIT     EQU  SCC_InitA
            ELSE
DEBUG_CMD      EQU  ZSCCBC
DEBUG_DAT      EQU  ZSCCBD
DEBUG_INIT     EQU  SCC_InitB
            ENDC                  

;;
;; SCC_InitA - Initialize SCC channel A to default
;; return: all registers preserved
;;
SCC_InitA:
         PSHS     A,X,Y                             ; preserve A,X,Y
         LDY      #ZSCCAC                           ; Y points to channel A command reg
         LDX      #SCCATBL                          ; X points to channel A config table
         BRA      IS0                               ; perform channel init

;;
;; SCC_InitB - Initialize SCC channel B to default
;; return: all registers preserved
;;
SCC_InitB:
         PSHS     A,X,Y                             ; preserve A,X,Y
         LDY      #ZSCCBC                           ; Y points to channel B command reg 
         LDX      #SCCBTBL                          ; X points to channel B config table
IS0      LDA      ,Y                                ; reset register pointer to WR0/RR0
IS1?     LDA      ,X+                               ; load address from table
         CMPA     #$FF                              ; is it $FF? (end of table)
         BEQ      IS2?                              ;    yes, done with init of channel
         STA      ,Y                                ;    no, write the register pointer to WR0
         LDA      ,X+                               ; get data byte from table
         STA      ,Y                                ; write data to SCC command register
         BRA      IS1?                              ; repeat until EOT reached..
IS2?     PULS     A,X,Y,PC                          ; restore registers and return

; Initialization table for SCC Channel A in ASYNC mode, external 16x clock
; ACLK from CPLD is 1.843 MHz. 1.843 / 16 = 115.2kbps (USB VCP interface)
SCCATBL:
         FCB      $09,$80                           ; Point to WR9; Reset Ch A
         FCB      $09,$00                           ; Point to WR9; un-reset CH A
         FCB      $04,$44                           ; Point to WR4; X16 clock,1 Stop,NP
         FCB      $03,$C1                           ; Point to WR3; Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
         FCB      $05,$EA                           ; Point to WR5; Enable, Transmit 8 bits RTS,DTR, Enable
         FCB      $0B,$05                           ; Point to WR11; RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
         FCB      $0F,$00                           ; Point to WR15; no INT from hardware CTS/RTS
         FCB      $FF,$FF                           ; EOT marker         

; Initialization table for SCC Channel B in ASYNC mode, external 32x clock
; BCLK from CPLD is 3.686 MHz. 3.686M / 32 = 115.2kbps (CH B Header)
SCCBTBL:
         FCB      $09,$40                           ; WR9, reset channel B
         FCB      $09,$00                           ; WR9, un-reset channel B
         FCB      $04,$84                           ; WR4, X32 clock,1 Stop,NP
         FCB      $03,$C1                           ; WR3, Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
         FCB      $05,$EA                           ; WR5, Enable transmitter, Transmit 8 bits RTS,DTR
         FCB      $0B,$05                           ; WR11, RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
         FCB      $0F,$00                           ; WR15, No INT from hardware CTS/RTS
         FCB      $FF,$FF                           ; EOT marker

;;
;; GETCH - wait forever for a character from CONSOLE channel
;; GETCHT - as GETCH, but also toggle LED1 each timeout
;; GETCH1 - one attempt to get a character from CONSOLE channel
;; GETCH2 - attempt for ~500ms to get a character from CONSOLE channel
;; inputs:  none
;; return:  A=character received
;;          V=0 if data received
;;          V=1 if timeout (0.5 seconds)
;;
; GETCH entry point - infinite retry duration
GETCH:
         BSR      GETCH2                            ; process as GETCH2
         BVS      GETCH                             ;  if no character, keep trying
         RTS                                        ;  otherwise, return with char in A
; GETCHT entry point - infinite retry duration with LED1 toggle each timeout
GETCHT:
         OnLED1                                     ; turn on LED1 while attempting input
G?T      BSR      GETCH2                            ; go try to get a character
         BVC      G?X                               ;   got one, return
         ToggleLED1                                 ; toggle LED1 each timeout
         BRA      G?T                               ; and try again
G?X      OnLED1                                     ; got a character, turn LED1 back on
         RTS
; GETCH1 entry point - one attempt
GETCH1:
         PSHS     Y                                 ; preserve Y
         LDY      #2                                ; only check once for a character in channel A
         BRA      GC10?                             ; process as GETCH2
; GETCH2 entry point - standard timeout
GETCH2:
         PSHS     Y                                 ; preserve Y
         LDY      #0                                ; clear Y for longest timeout (~450ms)
GC10?    ORCC     #CC_V                             ; set V flag ahead of decrement
         LEAY     -1,Y                              ; decrement timeout counter (V unaffected)
         BEQ      GC90?                             ;  EXIT IF TIMEOUT (with V=1)
         LDA      CONSOLE_CMD                       ; reset register pointer to WR0/RR0
         LDA      CONSOLE_CMD                       ; read RR0
         ANDA     #ZSCC.RXBF                        ; examine the RX char available bit
         BEQ      GC10?                             ;  LOOP UNTIL CHARACTER AVAILABLE
         LDA      CONSOLE_DAT                       ; read character
         ORA      #0                                ; clear V flag
GC90?    PULS     Y,PC                              ; restore Y and return

;;
;; PUTCH - output character in A to CONSOLE channel
;; inputs: character in A
;; return: all registers preserved
;;
PUTCH:
         PSHS     A
PC10?    LDA      CONSOLE_CMD                       ; reset SCC register pointer to WR0/RR0
         LDA      CONSOLE_CMD                       ; read RR0
         ANDA     #ZSCC.TXBE                        ;  examine the TX buffer empty bit
         BEQ      PC10?                             ;  LOOP UNTIL EMPTY
         PULS     A
         STA      CONSOLE_DAT                       ; write character to SCC A data reg
         RTS

;;======================================================================
;; PLATFORM DEPENDENT Z85C30 CONSOLE UTILITY FUNCTIONS
;;======================================================================

;;
;; PUTCR - output CRLF to CONSOLE channel
;; return: all registers preserved
;;
PUTCR:
         PSHS     A                                 ; save A value
PUTCR1   LDA      #CR                               ; output a carriage return
         BSR      PUTCH                             ;
         LDA      #LF                               ; output a line feed
         BSR      PUTCH                             ;
         PULS     A,PC                              ; restore A and PC and return

;;
;; PUTSPACE - output a SPACE to CONSOLE channel
;; return: all registers preserved
;;
PUTSPACE:
         PSHS     A
         LDA      #SPACE
         BSR      PUTCH
         PULS     A,PC

;;
;; PUTWORD - output ASCII HEX WORD to CONSOLE channel
;; inputs: D = value to output
;; return: all registers preserved
;;
PUTWORD:
         BSR      PUTBYTE                           ; A is MSB, output it first
         EXG      B,A                               ; swap bytes
         BSR      PUTBYTE                           ; now output LSB
         EXG      B,A                               ; restore A and B
         RTS

;;
;; PUTBYTE - output ASCII HEX BYTE to CONSOLE channel
;; inputs: A = value to output
;; return: all registers preserved
;;
PUTBYTE:
         PSHS     A                                 ; Save low nibble
         LSRA                                       ; Rotate
         LSRA                                       ; upper nibble
         LSRA                                       ; into
         LSRA                                       ; lower nibble
         BSR      PUTHEX                            ; Output high nibble
         PULS     A                                 ; Restore low nibble
; fall into PUTHEX...

;;
;; PUTHEX - output ASCII HEX NIBBLE to CONSOLE channel
;; inputs: A = value to output
;; return: all registers preserved
;;
PUTHEX:
         PSHS     A                                 ; preserve A
         ANDA     #$0F                              ; Remove upper half
         ADDA     #'0'                              ; Convert to printable
         CMPA     #'9'                              ; In range?
         BLS      P?H0                              ;   yes, skip alpha adjust
         ADDA     #7                                ; Convert to alpha
P?H0     BSR      PUTCH                             ; output via PUTCH
         PULS     A,PC                              ; restore A and return

;;
;; PUTCONST - output character at PC to CONSOLE channel.
;; inputs:  PC = address of character to output
;; return:  all registers preserved
;;
PUTCONST:
         PSHS     A,X                               ; preserve A,X
         LDX      3,S                               ; get old PC
         LDA      ,X+                               ; get character, increment past it (new PC)
         BSR      PUTCH                             ; output character
         STX      3,S                               ; store new PC
         PULS     A,X,PC

;;
;; PUTMSG - output NULL/FF terminated string at PC to CONSOLE channel
;; terminate with either 0, or $FF (CRLF before terminates)
;; inputs: PC = address of string to output
;; return: all registers intact
;;
PUTMSG:
         PSHS	  X			                        ; save old x                                     
         LDX      2,S                               ; get old pc
         BSR      PUTSTR                            ; output string
         STX      2,S                               ; update old pc
         PULS     X,PC                              ; restore X and return
         
;;
;; PUTSTR - output NULL/FF terminated string at X to CONSOLE channel
;; terminate with either 0, or $FF (CRLF before terminates)
;; inputs: X = address of string to output
;; return: X = terminator byte of string+1
;;
PUTSTR:
         PSHS     A                                 ; preserve A
P?S1     LDA      ,X+                               ; get char from message
         BEQ      PSTRX?                            ;  0 = end
         CMPA     #$FF                              ; FF = newline end?
         BEQ      PUTCR1                            ;  yes, new line, exit via PUTCR
         JSR      PUTCH                             ; output character to term
         BRA      P?S1                              ; keep going
PSTRX?   PULS     A,PC                              ; restore A and return

;;
;; GETBYTE - acquire an ASCII HEX byte from CONSOLE channel and return in A
;; inputs: none
;; return: V=0 means input was valid, byte value in A
;;         V=1 means input was non-ASII HEX, A is destroyed
;;
GETBYTE:
         BSR      GETNIB                            ; Get FIRST nibble
         BVS      GETB1?                            ; Invalid, abort (V=1)
         LSLA                                       ; Rotate
         LSLA                                       ; into
         LSLA                                       ; high
         LSLA                                       ; nibble
         PSHS     A                                 ; Save for later
         BSR      GETNIB                            ; Get SECOND nibble
         BVS      GETB2?                            ;  bad, release storage and return with V=1
         ORA      ,S                                ; Include high (and clear V)
GETB2?   LEAS     1,S                               ; release stack storage (V unaffected)
GETB1?   RTS

;;
;; GETNIB - acquire an ASCII HEX nibble from CONSOLE channel and return in A
;; inputs: none
;; return: V=0 means input was valid, nibble value in A
;;         V=1 means input was non-ASII HEX, A is preserved
;;
GETNIB:
         JSR      GETCHT                             ; get a character
         SUBA     #'0'                              ; Convert numbers
         CMPA     #9                                ; Numeric?
         BLS      G?N1                              ; Yes, OK
         SUBA     #7                                ; Convert alphas
         CMPA     #10                               ; Under?
         BLO      G?N2                              ; Yes, error
         CMPA     #15                               ; Over?
         BHI      G?N2                              ; Yes, error
G?N1     ANDA     #$0F                              ; V=0 indicates good input
         RTS
G?N2     ADDA     #$37                              ; Normalize character
         ORCC     #CC_V                             ; V=1 indicates non-hex input
         RTS

;;
;; GETBDIG - acquire a bounded ASCII digit from CONSOLE channel and return in A
;; inputs: B = upper bound of valid digit ($00...$0F)
;; return: V=0 means input was valid, nibble value in A
;;         V=1 means input was invalid, A holds entry digit
;;         B is preserved
;;
GETBDIG:
         ANDB     #$0F                              ; strip bound to 0-F
         BSR      GETNIB                            ; get a nibble from CONSOLE channel
         BVS      G?D1                              ; exit with V=1 on error
         CMPR     A,B                               ; compare input value with bound
         BLO      G?D1                              ; input exceeded bound
         RTS                                        ; exit with V=0
G?D1     ORCC     #CC_V                             ; V=1 indicates non-hex input
         RTS

;;
;; GETPATT - Pattern input function (with echo)
;;         Get numeric input, each digit with upper bound. Values
;;         can be shifted/rotated, and then OR'd or STORED into
;;         a RAM array. This is all controlled via a PATTERN TABLE.
;; inputs: X = pointer to RAM array (typ. RTC regs 0-15)
;;         Y = pointer to PATTERN TABLE (see below)
;; return: V = 0 no error
;;         V = 1 error occurred
;;         Y is advanced to end of pattern table
;;         A,B are destroyed
;;
;; Time/Date Pattern Table conists of 3-byte tuples
;; and must be terminated by a NEGATIVE postbyte
;;
;; [SHIFT/BOUND],[OPER/OFFSET],[POSTBYTE]
;; SHIFT/BOUND
;; SSxxBBBB
;;  |    |
;;  |    +--- upper bound value (hex)
;;  +-------- 00 = no SHIFT of nybble
;;            01 = SHIFT nybble left by 4 (+$40)
;;            1x = ROTATE nybble right by 2 through carry (+$80)
;;
;; OPER/OFFSET
;; PPxxTTTT
;;  |    |
;;  |    +--- RTC array offset
;;  +-------- 00 = discard value
;;            01 = OR value into array (+$40)
;;            1x = STORE value into array (+$80)
;;
;; POSTBYTE
;;     > 127 = TERMINATE
;;     0 = No postbyte
;;     <x> = output ASCII character
;;
GETPATT:
         LDB      ,Y                                ; get bounds/shift/rotate op
         ANDB     #$0F                              ; mask off shift/rot info
         JSR      GETBDIG                           ; get the bounded digit
         BVS      P?ONE                             ; exit if error
         JSR      PUTHEX                            ; echo character
         LDB      ,Y+                               ; get bounds/shift/rotate op
         ANDB     #$C0                              ; isolate shift/rotate bits
         BPL      P?NOROT                           ;   if bit7 clear, not a rotate operation
         CLRB                                       ; clear carry and shift op bit prior to rotate
         RORA                                       ; rotate lsb into CF
         RORA                                       ; rotate CF into msb
P?NOROT  TSTB                                       ; check bit6 (if b7 was set, it's cleared already)
         BEQ      P?NOOP                            ;   no shift required
         ASLA                                       ; shift A LSD into MSD
         ASLA     
         ASLA     
         ASLA     
P?NOOP   LDB      ,Y+                               ; get operation/offset
         BMI      P?STOR                            ; if bit7 is set, STORE operation
         BITB     #$40                              ; bit7 clear, check bit6
         BEQ      P?POST                            ;   bit76=00 means discard value
         ANDB     #$0F                              ; isolate offset info
         ORA      B,X                               ; OR old value into A
P?STOR   ANDB     #$0F                              ; isolate offset info
         STA      B,X                               ; store value at offset
P?POST   LDA      ,Y+                               ; get postbyte
         BEQ      GETPATT                           ;   if null, continue to next entry
         BMI      P?ONE                             ;   if neg, end of table
         JSR      PUTCH                             ; otherwise, echo post character
         BRA      GETPATT                           ; continue to next entry
P?ONE    RTS

;;======================================================================
;; PLATFORM DEPENDENT TIME DELAY FUNCTIONS
;;======================================================================

;;
;; DELAYMS - software loop time delay function (ms)
;; inputs: X = number of ms to delay
;; output: X = 0, Z flag set
;;
TIM1M             EQU  (CPU_FREQ_MHZ*1000)/5        ; TIM1M such that (5*TIMCON*CYCLE TIME)=1ms
DELAYMS:
         PSHS     D
D?LY0    LDD      #TIM1M
D?LY1    DECD                                       ;(2 cyc)
         BNE      D?LY1                             ;(3 cyc) = 5 cycle inner loop
         LEAX     -1,X                              ;(5 cyc)
         BNE      D?LY0                             ;(3 cyc) = TIMCON*5 + 8 outer loop
         PULS     D,PC

;;
;; DELAYUS - software loop time delay function (10us)
;; inputs: X = number of 10us to delay
;; output: X = 0, Z flag set
;;
TIM10U            EQU  (CPU_FREQ_MHZ*10)/5          ; TIM10U such that (5*TIMCON*CYCLE TIME)=1ms
DELAYUS:
         PSHS     D
D?LY0    LDD      #TIM10U
D?LY1    DECD                                       ;(2 cyc)
         BNE      D?LY1                             ;(3 cyc) = 5 cycle inner loop
         LEAX     -1,X                              ;(5 cyc)
         BNE      D?LY0                             ;(3 cyc) = TIMCON*5 + 8 outer loop
         PULS     D,PC

;;======================================================================
;; PLATFORM DEPENDENT SOFT I2C FUNCTIONS - LOW LEVEL DRIVER
;;======================================================================

;; I2C status flags
I2C_Success       EQU  0
I2C_NoSlaveAck    EQU  1
I2C_BusError      EQU  2

;; I2C Acknowledge Constants
I2C_ACKNOWLEDGE   EQU  1
I2C_NOTACKNOWLEDGE EQU 0

;;
;; I2C_Initialize - cycle SCK until SDA goes high, up to 255 times
;; This is per the DS3232M datasheet to re-sync communication.
;; inputs:  none
;; return:  V=0 if SDA went high during init
;;          V=1 if SDA remained low
;;
I2C_Initialize:
         LDA      #$80                              ; init cycle counter to $80
IN0?     JSR      I2C_SendNAK                       ; do a NAK cycle (toggles SCL with SDA high), SDA status in Z
         BNE      I2C_SendStop                      ; SDA is high, so all is well, return via SendStop
         INCA                                       ; increment cycle counter
         BVC      IN0?                              ; not wrapped around to $80 yet, keep trying
         RTS

;;
;; I2C_SendByte - sends one byte of data to an I2C slave device and check for Slave ACK
;; inputs:  A = byte to send to slave
;; return:  A = byte sent to slave
;;          Z = 1 if slave ACK'd byte
;;          Z = 0 if no slave ACK
;;
I2C_SendByte:
         PSHS     A,B,X                             ; preserve ACC A, B and X
         LDX      #8                                ; init X as loop counter
SB0?     LDB      I2CPORT                           ; move I2C.DSDA [6] to B[7]
         ASLB
         EORR     A,B                               ; EOR A[7] with I2C.DSDA
         BPL      SB1?                              ;   B[7]=0 means drive is correct
         EIM      #(I2C.DSDA),I2CPORT               ; change drive output polarity
SB1?     I2C_ReleaseSCL                             ; release SCL
         I2C_BitDelay                               ; half-bit delay
         I2C_SinkSCL                                ; drive SCL low
         I2C_BitDelay                               ; half-bit delay
         ASLA                                       ; shift ACC A to expose next bit to send
         LEAX     -1,X                              ; decrement loop counter
         BNE      SB0?                              ;   repeat until all bits are sent
         PULS     A,B,X                             ; restore ACC A,B and X 
         BRA      I2C_SendNAK                       ; exit via SendNAK (to check for slave ACK)

;;
;; I2C_SendStop - send a STOP condition
;; return: all registers preserved
;;
I2C_SendStop:
         I2C_SinkSDA                                ; SCL high followed by SDA high is STOP condition
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
         PSHS     B,X                               ; preserve B and X
         TFR      A,B                               ; copy ACC A to B (to save ACK/NAK status)
         LDX      #8                                ; init X as loop counter
         CLRA                                       ; clear A before shifting in bits
         I2C_ReleaseSDA                             ; allow SDA to be asserted by slave
RB0?     LSLA                                       ; shift A left each loop iteration
         I2C_ReleaseSCL                             ; release SCL, wait for stretch
         I2C_BitDelay                               ; half-bit delay
         I2C_StatSDA                                ; check SDA pin (Z = 1 if low)
         BEQ      RB1?                              ; if SDA is low, leave ACC A alone
         ORA      #$01                              ; otherwise, set lsb
RB1?     I2C_SinkSCL                                ; clear SCL to end bit
         I2C_BitDelay                               ; half-bit delay
         LEAX     -1,X                              ; decrement loop counter
         BNE      RB0?                              ; loop back until all bits are received
         TSTB                                       ; examine ACK/NAK status (set/clear Z)
         PULS     B,X                               ; restore B and X (flags unaffected)
         BEQ      I2C_SendNAK                       ;   input parameter = 0, send a NAK
         ; ..otherwise, fall into I2C_SendACK
                                                    
;;
;; I2C_SendACK - send ACK to I2C slave device
;; inputs: none
;; return: ACK/NAK status in Z (Z = 1 if either slave or master ACK)
;;
I2C_SendACK:
         I2C_SinkSDA                                ; assert SDA for MASTER ACK
         BRA      I2C_SN0                           ; the rest is just like a NAK                                                   
         
;;
;; I2C_SendNAK & SendACK - send a NAK or ACK to I2C slave device
;; inputs: none
;; return: ACK/NAK status in Z (Z = 1 if either slave or master ACK)
;;
I2C_SendNAK:
         I2C_ReleaseSDA                             ; release SDA line for MASTER NAK / or query slave ACK
I2C_SN0  I2C_ReleaseSCL                             ; send clock for NAK
         I2C_BitDelay                               ; half-bit delay
         I2C_StatSDA                                ; check of ACK bit
         PSHS     CC                                ; save CC bits                                                    
         I2C_SinkSCL                                ; finish the NAK bit
         I2C_BitDelay                               ; half-bit delay
         PULS     CC,PC                             ; restore CC bits and return

;;
;; I2C_GoMaster - sends an I2C start and slave address and check for acknowledge
;; inputs:  A = slave address A[7:1] + R/W A[0]
;; return:  A = I2C.Success(0) or I2C_NoSlaveAck(1) or I2C.BusError(2)
;;          Z = 0 when I2C.Success, otherwise Z = 0
;;
I2C_GoMaster:
         I2C_ReleaseBoth                            ; release SDA and SCL
         I2C_BitDelay                               ; allow SDA to float high
         I2C_StatSDA                                ; check SDA state
         BEQ      GMBERR?                           ; if SDA is still low, return with fBusError
         I2C_SinkSDA                                ; begin I2C START by bringing SDA low first
         I2C_BitDelay                               ; half-bit delay
         I2C_SinkSCL                                ; complete I2C START by bringing SCL low
         I2C_BitDelay                               ; half-bit delay
         JSR      I2C_SendByte                      ; now send the byte in A, Z = 1 means sent OK
         BNE      GMSNAK?                           ; if no slave ACK, then return with fNoSlaveAck
         LDA      #I2C_Success                      ; send a fSuccess code (0)
         RTS
GMBERR?  LDA      #I2C_BusError                     ; return a fBusError code (2)
         RTS
GMSNAK?  LDA      #I2C_NoSlaveAck                   ; send a fNoSlaveAck code (1)
         RTS

;;======================================================================
;; PLATFORM DEPENDENT SOFT I2C FUNCTIONS - HIGH LEVEL SLAVE R/W
;;======================================================================
RTC.ADDRESS       EQU   $D0
RTC.SECONDS       EQU   0
RTC.MINUTES       EQU   1
RTC.HOURS         EQU   2
RTC.WEEKDAY       EQU   3
RTC.DAY           EQU   4
RTC.MONTH         EQU   5
RTC.YEAR          EQU   6
RTC.CONTROL       EQU   14

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
         LDB      #RTC.STATUS                       ; RTC status addr into B      
RTC_ReadByte:
         LDE      #RTC.ADDRESS                      ; RTC address into E
I2C_ReadByte:
         TFR      E,A                               ; slave address into A
         ANDA     #$FE                              ; send START and slave address (WRITE)
         JSR      I2C_GoMaster                      ; try to send slave address
         BNE      I_ERR                             ; error, return with status!
         TFR      B,A                               ; register address into A
         JSR      I2C_SendByte                      ; try to send register address
         BNE      I_ERR                             ; error, return with status!
         TFR      E,A                               ; slave address back into A
         ORA      #$01                              ; send START and slave address (READ)
         JSR      I2C_GoMaster                      ; try to send slave address
         BNE      I_ERR                             ; error, return with status!
         LDA      #I2C_NOTACKNOWLEDGE               ; only one byte, so NAK it
         JSR      I2C_RcvByte                       ; read the data byte
         TFR      A,B                               ; copy byte value to B
         BRA      I_OK

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
         CLRA                                       ; clear OSF, 32KHz, BSY, A1F, A2F
         LDB      #RTC.STATUS                       ; RTC status addr into B      
RTC_WriteByte:
         LDE      #RTC.ADDRESS                      ; RTC address into E
I2C_WriteByte:
         EXG      A,E                               ; slave address in A, data in E
         ANDA     #$FE                              ; send START and slave address (WRITE)
         BSR      I2C_GoMaster                      ; try to send slave address
         BNE      I_ERR                             ; error, return with status!
         TFR      B,A                               ; copy register address into A
         JSR      I2C_SendByte                      ; try to send register address
         BNE      I_ERR                             ; error, return with status!
         TFR      E,A                               ; copy data byte to be written into A
         JSR      I2C_SendByte                      ; try to send data byte
         BNE      I_ERR                             ; error, return with status!
         BEQ      I_OK                              ; send stop and return with success

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
         CLRB                                       ; start at Reg 0
         LDX      #15                               ; end at Reg 15
RTC_WriteBlock:         
         LDE      #RTC.ADDRESS                      ; RTC address into E                  
I2C_WriteBlock:
         PSHS     Y                                 ; preserve write buffer address
         TFR      E,A                               ; slave address in A
         ANDA     #$FE                              ; send START and slave address (WRITE)
         BSR      I2C_GoMaster                      ; try to send slave address
         BNE      I_ERRX                            ; error, return with status!
         TFR      B,A                               ; copy register address into A
         JSR      I2C_SendByte                      ; try to send register address
         BNE      I_ERRX                            ; error, return with status!
WM0?     LEAX     0,X                               ; test the byte counter
         BEQ      I_OKX                             ; all done, send a STOP
WM1?     LDA      ,Y+                               ; copy byte from write buffer to A
         JSR      I2C_SendByte                      ; try to send data byte
         BNE      I_ERRX                            ; error, return with status!
         LEAX     -1,X                              ; decrement the byte counter
         BNE      WM1?                              ; repeat until finished
I_OKX    PULS     Y                                 ; restore buffer start address
I_OK     JSR      I2C_SendStop                      ; send a STOP condition
         LDA      #I2C_Success                      ; send a fSuccess code (0) and set Z = 1
         RTS
I_ERRX   PULS     Y                                 ; restore buffer start address
I_ERR    JSR      I2C_SendStop                      ; send a STOP condition
         LDA      #I2C_NoSlaveAck                   ; send a fNoSlaveAck code (1) and set Z = 0
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
         CLRB                                       ; start at Reg 0
         LDX      #15                               ; end at Reg 15
RTC_ReadBlock:         
         LDE      #RTC.ADDRESS                      ; RTC address into E                  
I2C_ReadBlock:
         PSHS     Y                                 ; preserve buffer start address
         TFR      E,A                               ; slave address in A
         ANDA     #$FE                              ; send START and slave address (WRITE)
         JSR      I2C_GoMaster                      ; try to send slave address
         BNE      I_ERRX                            ; error, return with status!
         TFR      B,A                               ; register address into A
         JSR      I2C_SendByte                      ; try to send register address
         BNE      I_ERRX                            ; error, return with status!
         TFR      E,A                               ; slave address back into A
         ORA      #$01                              ; send START and slave address (READ)
         JSR      I2C_GoMaster                      ; try to send slave address
         BNE      I_ERRX                            ; error, return with status!
RM0?     LEAX     0,X                               ; test the byte counter
         BEQ      I_OKX                             ; all done, send a STOP
RM1?     LDA      #I2C_ACKNOWLEDGE                  ; assume ACK (1)
         LEAX     -1,X                              ; decrement the byte counter
         BNE      RM2?                              ; not the last byte to read
         CLRA                                       ; yes, last byte, respond with NAK (0)
RM2?     JSR      I2C_RcvByte                       ; read the data byte
         STA      ,Y+                               ; store in buffer
         TFR      A,B                               ; copy read byte to B
         BRA      RM0?                              ; repeat until finished         
         
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
         JSR      I2C_Initialize                    ; try to initialize the I2C
         BVS      R?NORTC                           ; SDA stuck low, abort
         JSR      RTC_ReadRegs                      ; read RTC registers 0-15
         BNE      R?NORTC                           ; error return from read, abort
         LDA      RTC.YEAR,Y                        ; get the year (6)
         BSR      FMTBCD                            ; convert year to ASCII
         STD      8,Y                               ; store in buffer (8,9)
         LDA      #$20                              ; Assume 21st century
         LDB      RTC.MONTH,Y                       ; get the month/century (5)         
         ASLB                                       ; shift CENTURY bit into C
         ADCA     #0                                ; add CENTURY bit to $20 (= $20 or $21)
R?DCEN   BSR      FMTBCD                            ; convert century to ASCII
         STD      6,Y                               ; store in buffer (6,7)
         LDA      RTC.MONTH,Y                       ; get the month/century (5)
         ANDB     #$1F                              ; strip off the century info
         BSR      FMTBCD                            ; convert BCD to ASCII
         STD      ,Y                                ; store in buffer (0,1)
         LDA      RTC.DAY,Y                         ; get the day of month (4)
         BSR      FMTBCD                            ; convert BCD to ASCII
         STD      3,Y                               ; store in buffer (3,4)
         LDA      #'/'                              ; separator character
         STA      2,Y                               ; month/date
         STA      5,Y                               ; date/year
         CLRD
         STD      10,Y                              ; null terminate the string (even with *) (10,11)
         LDA      RTC.STATUS,Y                      ; get status register
         BPL      R?NOOSF                           ; OSF in b7, if clear no OSF events occurred
         OIM      #'*',10,Y                         ; put OSF event indicator after date
R?NOOSF  RTS                                        ; return with overflow clear
R?NORTC  ORCC     #CC_V                             ; set the overflow flag for RTC read error
         RTS
         
;;
;; FMTBCD - convert a BCD value in A to ASCII characters in D
;; inputs: A = BCD input value
;; output: D = ASCII character pairs (MSD in A, LSD in B)
;;
FMTBCD:
         TFR      A,B                               ; copy A to B
         LSRA                                       ; move MSD down to lower nybble
         LSRA
         LSRA
         LSRA
         ANDB     #$0F                              ; clear upper bits in LSD         
         ORD      #$3030                            ; convert to ASCII 00-99
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
         JSR      I2C_Initialize                    ; try to initialize the I2C
         BVS      R?NORTC                           ; SDA stuck low, abort
         JSR      RTC_ReadRegs                      ; read RTC registers 0-15
         BNE      R?NORTC                           ; error return from read, abort
         LDA      RTC.SECONDS,Y                     ; get the seconds (0)
         BSR      FMTBCD                            ; convert seconds to ASCII
         STD      6,Y                               ; store in buffer (6,7)
         LDA      RTC.MINUTES,Y                     ; get the minutes (1)
         BSR      FMTBCD                            ; convert BCD to ASCII
         STD      3,Y                               ; store in buffer (3,4)
         LDA      RTC.HOURS,Y                       ; get the hours (2)
         TFR      A,B                               ; copy hours to B (for LSD)
         BITA     #$40                              ; test the 12/24 bit (1 = 12, 0 = 24)
         BEQ      R?T24                             ;  24HR time already
         BITA     #$20                              ; is it AM or PM (0 = AM, 1 = PM)
         BEQ      R?T24                             ;   AM, so leave it alone
         ANDA     #$1F                              ; start with BCD 12H time
         ADDA     #$12                              ; add BCD 12 hours
         DAA                                        ; adjust decimal result
R?T24    ANDA     #$3F                              ; retain only the 24 hour time
         BSR      FMTBCD                            ; convert BCD to ASCII
         STD      0,Y                               ; store in buffer (0,1)
         LDA      #':'                              ; separator character
         STA      2,Y                               ; month/date
         STA      5,Y                               ; date/year
         CLRD
         STD      8,Y                               ; null terminate the string (even with *) (8,9)
         LDA      RTC.STATUS,Y                      ; get status register
         BPL      R?NOOSF                           ; OSF in b7, if clear no OSF events occurred
         OIM      #'*',8,Y                          ; put OSF event indicator after time
R?NOOSF  RTS                                        ; return with overflow clear
R?NORTC  ORCC     #CC_V                             ; set the overflow flag for RTC read error
         RTS
         
;;
;; RTC_NMIEnable - enable the RTC NMI output, set source to 1Hz
;; inputs:  none
;; output:  V = 1 if I2C bus error or RTC communication error
;;          V = 0 if successful read
;;
RTC_NMIEnable:
         JSR      I2C_Initialize                    ; try to initialize the I2C
         BVS      R?NORTC                           ; SDA stuck low, abort
         LDY      #RTCISR                           ; address of simple NMI service routine
         STY      RV_NMI                            ; assign to NMI vector
         LDB      #RTC.CONTROL                      ; write register 14 (CONTROL)
         CLRA                                       ; data to write is 0
                                                    ;   ENOSC=0, INTCN=0, A1E & A2E=0
                                                    ;   This enables 1HZ SQ wave on INT pin
         JSR      RTC_WriteByte                     ; write the CONTROL register
         BEQ      R?NORTC                           ; error return from read, abort
         TSTA                                       ; clear the overflow flag
R?NOOSF  RTS                                        ; return with overflow clear
R?NORTC  ORCC     #CC_V                             ; set the overflow flag for RTC read error
         RTS
         
;;
;; RTC_NMIDisable - disable the RTC NMI output
;; inputs:  none
;; output:  V = 1 if I2C bus error or RTC communication error
;;          V = 0 if successful read
;;
RTC_NMIDisable:
         JSR      I2C_Initialize                    ; try to initialize the I2C
         BVS      R?NORTC                           ; SDA stuck low, abort
         LDB      #RTC.CONTROL                      ; write register 14 (CONTROL)
         LDA      #4                                ; data to write is 4
                                                    ;   ENOSC=0, INTCN=1, A1E & A2E=0
                                                    ;   This disables 1HZ, A1, and A2 ints
         JSR      RTC_WriteByte                     ; write the CONTROL register
         BEQ      R?NORTC                           ; error return from read, abort
         TSTA                                       ; clear the overflow flag
R?NOOSF  RTS                                        ; return with overflow clear
R?NORTC  ORCC     #CC_V                             ; set the overflow flag for RTC read error
         RTS
;
; LED blinking NMI/IRQ service routine
;
RTCISR:
         EIM      #%00000010,IOPORT                 ; toggle IOPORT bit 1 (LED #2)
         RTI

;;======================================================================
;; PLATFORM DEPENDENT SPI MASTER FUNCTIONS - LOW LEVEL
;;======================================================================
;; CPOL=0 the base value of the clock is zero
;; CPHA=0, data is propagated on a falling edge (high->low clock transition)
;;
;; SPI_Write - write a byte via HW SPI master
;; inputs: A = byte to send
;; return: A is preserved
;;
SPI_Write:
         SPI_Status                                 ; make sure SPI is ready
         BNE      SPI_Write
         STA      SDPORT                            ; send A via SPI
RW?0     SPI_Status                                 ; wait for transaction to end
         BNE      RW?0
         RTS

;;
;; SPI_Read - read a byte via HW SPI master (send $FF)
;; inputs: none
;; return: A = byte received
;;
SPI_Read:
         CLRA
         COMA                                       ; load dummy byte value
; fall into SPI_Xcg...

;;
;; SPI_Xcg - write/read (exchange) a byte via HW SPI master
;; inputs: A = byte to send
;; return: A = byte received
;;
SPI_Xcg:
         BSR      SPI_Write                         ; send the byte in A
         LDA      SDPORT                            ; load received byte into A
         RTS

;;
;; SPI_ReadBlock - read multiple bytes via SPI master
;; inputs: Y = addr of destination block
;;         X = number of bytes to read
;; return: X = 0
;;
SPI_ReadBlock:
         PSHS     Y                                 ; preserve Y
         LEAX     0,X                               ; test X for 0 before reading anything!
         BEQ      R?MX                              ;    entered with X=0, so exit
R?M0     BSR      SPI_Read                          ; send a dummy and read a data byte
         STA      ,Y+                               ; store in buffer
         LEAX     -1,X                              ; decrement byte counter
         BNE      R?M0                              ;    not done yet, keep reading
R?MX     PULS     Y,PC                              ; restore Y and return

;;
;; SPI_WriteBlock - send multiple bytes via SPI master
;; inputs: Y = pointer to source block
;;         X = number of bytes to write
;; return: X = 0
;;
SPI_WriteBlock:
         PSHS     A,Y                               ; preserve A and Y
         LEAX     0,X                               ; test X for 0 before writing anything!
         BEQ      W?MX                              ;    entered with X=0, so exit
W?M0     LDA      ,Y+                               ; get byte to send from source block
         BSR      SPI_Write                         ; send data byte
         LEAX     -1,X                              ; decrement byte counter
         BNE      W?M0                              ;    not done yet, keep reading
W?MX     PULS     A,Y,PC                            ; restore A and Y and return

;;======================================================================
;; PLATFORM DEPENDENT SD CARD FUNCTIONS (USING SPI MASTER)
;;======================================================================

; https://electronics.stackexchange.com/questions/77417/what-is-the-correct-command-sequence-for-microsd-card-initialization-in-spi

; Definitions for MMC/SDC command
SD_CMD0           EQU  ($40+0)                      ; GO_IDLE_STATE
SD_CMD8           EQU  ($40+8)                      ; SEND_IF_COND
SD_CMD16          EQU  ($40+16)                     ; SET_BLOCKLEN
SD_CMD17          EQU  ($40+17)                     ; READ_SINGLE_BLOCK
SD_CMD24          EQU  ($40+24)                     ; WRITE_BLOCK
SD_ACMD41         EQU  ($40+41)                     ; SEND_OP_COND (SDC)
SD_CMD55          EQU  ($40+55)                     ; APP_CMD
SD_CMD58          EQU  ($40+58)                     ; READ_OCR
SD_CMD0CRC        EQU  $95
SD_CMD8CRC        EQU  $87
SD_CMD41CRC       EQU  $77
SD_CMD55CRC       EQU  $65
SD_CMD58CRC       EQU  $FD
SD_NOCRC          EQU  $01

; SD CMD0 GO_IDLE_STATE --> R1
SD_XCMD0          FCB  SD_CMD0,$00,$00,$00,$00,SD_CMD0CRC

; SD CMD8 SEND_IF_COND --> R7
SD_XCMD8          FCB  SD_CMD8,$00,$00,$01,$AA,SD_CMD8CRC

; SD ACMD41 SEND_OP_COND (SDC)--> R1
SD_XCMD41         FCB  SD_ACMD41,$40,$00,$00,$00,SD_CMD41CRC

; SD CMD55 APP_CMD --> R1
SD_XCMD55         FCB  SD_CMD55,$00,$00,$00,$00,SD_CMD55CRC

; SD CMD58 READ_OCR --> R7
SD_XCMD58         FCB  SD_CMD58,$00,$00,$00,$00,SD_CMD58CRC

; Definitions of command fields
SD.CMD            EQU  0                            ; command byte
SD.A3             EQU  1                            ; A3
SD.A2             EQU  2                            ; A2
SD.A1             EQU  3                            ; A1
SD.A0             EQU  4                            ; A0 offset
SD.CRC            EQU  5                            ; CRC offset

; Definitions of response fields
SD.R1             EQU  0                            ; response
SD.OCR0           EQU  1
SD.OCR1           EQU  2
SD.OCR2           EQU  3
SD.OCR3           EQU  4

; Card type flags (CardType)
CT_MMC            EQU  $01                          ; MMC ver 3
CT_SD1            EQU  $02                          ; SD ver 1
CT_SD2            EQU  $04                          ; SD ver 2
CT_BLOCK          EQU  $08                          ; Block addressing

;;
;; SD_NativeMode - if card present bring it to NATIVE mode
;; inputs: none
;; return: V=1, no SD CARD present
;;         V=0, SD CARD present and selected
;;
SD_NativeMode:
         PSHS     A,B,X                             ; preserve regs
         SD_NegateCS                                ; start by negating CS
         SD_CardPresent                             ; check for a card         
         ORCC     #CC_V                             ; set the V flag (assume failure)
      IF (IGNORE_SD_SWITCH)
         BRN      S?I0                              ;    ignore the CS switch input
      ELSE
         BEQ      S?I0                              ;    if no card, leave CS negated and return
      ENDC
         SPI_SlowMode                               ; set SPI to slow mode
         LDB      #10                               ; send 80 bits of 1's
S?I1     JSR      SPI_Read                          ;  (10 bytes of $FF)
         DECB                                       ; decrement counter
         BNE      S?I1                              ; loop until all pulses sent
         SPI_FastMode                               ; set SPI to fast mode (clears V)
S?I0     PULS     A,B,X,PC                          ; restore regs and return

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
         PSHS     A,B,U                             ; preserve registers
         TSTF                                       ; check output specifier
         BEQ      O?C1A                             ; no status output
         JSR      PUTMSG
         FCB      CR,LF
         FCN      "SD:Reset"
O?C1A    CLRE                                       ; indicate step 0 (reset)
         BSR      SD_NativeMode                     ; put card into Native mode
         LBVS     O?SDE                             ;  V=1 means no card, so exit
; attempt repeated CMD0 to put the SD card into IDLE state (R1 = 01)
         LDB      #11                               ; init attempts counter         
O?C2     DECB                                       ; decrement attempt counter
         LBEQ     O?SDE                             ;   no more attempts; terminate
         TSTF                                       ; check output specifier
         BEQ      O?C3A                             ; no status output
         JSR      PUTMSG
         FCB      CR,LF
         FCN      "SD:CMD0"
O?C3A    LDU      #SD_XCMD0                         ; point to CMD0 string
         LDE      ,U                                ; put command byte into E
         JSR      SD_SendCmd                        ; send it
         SD_NegateCS                                ; negate CS after command
         JSR      SD_DisplayR1                      ; display response if enabled
O?C4     CMPA     #1                                ; R1 = 1?
         LBNE     O?C2                              ;   no = retry
; send a CMD8 to query the card for SD V2
         TSTF                                       ; check output specifier
         BEQ      O?C5                              ; no status output
         JSR      PUTMSG                            ; output status to console
         FCB      CR,LF
         FCN      "SD:CMD8"
O?C5     LDU      #SD_XCMD8                         ; point to CMD8 string
         LDE      ,U                                ; put command byte into E
         JSR      SD_SendCmd                        ; send the command, return R1 in A
         SD_NegateCS                                ; negate CS after command         
         JSR      SD_GetR7                          ; get R7 response type (R1 + 32bits of data)
         JSR      SD_DisplayR7                      ; display R7 response if enabled (Acc F)
         LBMI     O?SDE                             ; if R1 is negative, init failed, not SD V2
; IDLE period (send four $FF bytes)
         JSR      SPI_Read
         JSR      SPI_Read
         JSR      SPI_Read
         JSR      SPI_Read
; attempt repeated ACMD41 to bring card out of IDLE state (can take a while)         
         LDB      #11                               ; init attempts counter         
O?C7A    DECB                                       ; decrement attempt counter
         BEQ      O?SDE                             ;   no more attempts; terminate
         TSTF                                       ; check output specifier
         BEQ      O?C7B                             ; no status output
         JSR      PUTMSG
         FCB      CR,LF
         FCN      "SD:CMD55"
O?C7B    LDU      #SD_XCMD55                        ; point to CMD55 string
         LDE      ,U                                ; put command byte into E
         JSR      SD_SendCmd                        ; send the command, return R1 in A
         SD_NegateCS                                ; negate CS after command         
         JSR      SD_DisplayR1                      ; display response if enabled         
         TSTF                                       ; check output specifier
         BEQ      O?C7C                             ; no status output
         JSR      PUTMSG
         FCB      CR,LF
         FCN      "SD:CMD41"
O?C7C    LDU      #SD_XCMD41                        ; point to CMD41 string
         LDE      ,U                                ; put command byte into E
         JSR      SD_SendCmd                        ; send the command, return R1 in A
         SD_NegateCS                                ; negate CS after command         
         JSR      SD_DisplayR1                      ; display response if enabled                  
         ANDA     #1                                ; desired R1 lsb is 0
         BNE      O?C7A                             ; loop until init is complete
; send CMD58 to and check CCS bit in OCR block addressing is in effect
         TSTF                                       ; check output specifier
         BEQ      O?C12                             ; no status output
         JSR      PUTMSG
         FCB      CR,LF
         FCN      "SD:CMD58"
O?C12    LDU      #SD_XCMD58                        ; point to CMD58 string
         LDE      ,U                                ; put command byte into E
         JSR      SD_SendCmd                        ; send the command
         SD_NegateCS                                ; negate CS after command         
         JSR      SD_GetR7                          ; get R7 response type (R1 + 32bits of data)
         JSR      SD_DisplayR7                      ; display response if enabled (Acc F)
         BMI      O?SDE                             ; if R1 is negative, init failed, so terminate
         LDA      SD.OCR0,X                         ; examine OCR0 in response
         ANDA     #$C0                              ; mask all but CCS bit (bit 30) and Powerup bit (bit 31)
         CMPA     #$C0                              ; these need to both be set
         BEQ      O?CX                              ;    if CCS=1 the SD card uses LBA, which clears V (success)
; SD Card Access ERROR handler
O?SDE    TSTF                                       ; check output specifier
         BEQ      O?C13                             ; no status output
         JSR      PUTMSG                            ; output FAIL status to console
         FCB      CR,LF
         FCC      "SD:FAIL"
         FCB      $FF
O?C13    SD_NegateCS                                ; negate SD csel
         JSR      SPI_Read                          ; flush SD output buffer
         ORCC     #CC_V                             ; set the V flag
         PULS     A,B,U,PC                          ; restore registers and return
O?CX     TSTF                                       ; check output specifier
         BEQ      O?C14                             ; no status output
         JSR      PUTMSG                            ; output FAIL status to console
         FCB      CR,LF
         FCC      "SD:SUCCESS"
         FCB      $FF
O?C14    SD_NegateCS                                ; negate CS after command             
         JSR      SPI_Read                          ; flush SD output buffer
         CLRB                                       ; clear V flag
         PULS     A,B,U,PC                          ; restore registers and return
;;
;; SD_SendCmd - sends a command to MMC/SD card, get R1 response byte
;;              Negates and flus
;; inputs:  U = address of 6 byte command sequence
;; return:  A is R1 response byte
;;          N & Z reflect A value
;;          CS is left asserted after command is sent
;;
SD_SendCmd:
         PSHS     U,B                               ; preserve U and B
         SD_NegateCS                                ; de-Select the card
         JSR      SPI_Read                          ; send 8 idle clocks
         SD_AssertCS                                ; Select the card
         JSR      SPI_Read                          ; send 8 idle clocks
         LDB      #6                                ; init byte counter
S?SC1    LDA      ,U+                               ; command + addr + crc
         JSR      SPI_Write                         ; send the byte
         DECB                                       ; decrement byte counter
         BNE      S?SC1                             ;    loop until all 6 bytes sent
         LDB      #10                               ; init attempt counter
S?SC2    JSR      SPI_Read                          ; read the response
         TSTA                                       ; examine the received byte
         BPL      S?SC3                             ;    non-negative, got a response!
         DECB                                       ; negative, decrement attempt counter
         BNE      S?SC2                             ;    keep trying for 10 attempts
S?SC3    TSTA                                       ; reflect error status in N and Z flags
         PULS     U,B,PC                            ; restore registers and return

;;
;; SD_GetR7 - get remainder of R7 type command response
;;            (R1 was already fetched by SD_SendCmd)
;; inputs:  X = address of 5 byte result buffer
;;          A = R1 response (from SD_SendCmd)
;; return:  all registers preserved
;;          N & Z reflect A value
;;
SD_GetR7:
         STA      SD.R1,X                           ; move R1 to result buffer
         JSR      SPI_Read                          ; read next byte from card
         STA      SD.OCR0,X                         ; move OCR0 to result buffer
         JSR      SPI_Read                          ; read next byte from card
         STA      SD.OCR1,X                         ; move OCR1 to result buffer
         JSR      SPI_Read                          ; read next byte from card
         STA      SD.OCR2,X                         ; move OCR2 to result buffer
         JSR      SPI_Read                          ; read next byte from card
         STA      SD.OCR3,X                         ; move OCR3 to result buffer
         LDA      SD.R1,X                           ; restore R1 to A (and set flags)
         RTS

;;
;; SD_DisplayR1 - display R1 results (per ACC F)
;; inputs:  A = R1 result value
;;          F > 127 display info, otherwise exit
;; return:  A = R1 value
;;          N & Z reflect A value
;;
SD_DisplayR1:
         PSHS     A                                 ; save A (destroyed by PUTBYTE)
         TSTF                                       ; check output specifier
         BPL      O?P0                              ; if <127, do not display verbose output
         JSR      PUTMSG
         FCN      "...R1="
         JSR      PUTBYTE
O?P0     LDA      ,S+                               ; restore A and set flags
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
         TSTF                                       ; check output specifier
         BPL      O?P1                              ;  if <127, do not display verbose output
         JSR      PUTMSG
         FCN      "...R="
         PSHS     B,X                               ; preserve B and X
         LDB      #5                                ; init loop counter
O?P0     LDA      ,X+                               ; get byte from result buffer
         JSR      PUTBYTE                           ; output it
         JSR      PUTSPACE                          ;   and a space
         DECB
         BNE      O?P0                              ; loop until finished
         PULS     B,X                               ; restore B and X
         LDA      ,X                                ; restore R1 and flags
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
         PSHSW                                      ; preserve E and F
         PSHS     U                                 ; preserve U
         LDQ      ,X                                ; copy LBA block value
         STQ      SD.A3,X                           ; to A3...A0 of command string
         PULSW                                      ; restore E and F
         CLR      SD.CRC,X                          ; clear the CRC byte of string
         LDA      #SD_CMD17                         ; READ_SINGLE_BLOCK command (17)
         STA      SD.CMD,X                          ; put it in the command byte
         TFR      X,U                               ; put command buffer address in U
         JSR      SD_SendCmd                        ; send the command to SD Card
         PULS     U                                 ; restore U         
         BNE      R?DERR                            ;   R1 is negative, terminate!
R?D1     JSR      SPI_Read                          ; get token value from card
         BPL      R?DERR                            ;   positive: error token
         CMPA     #$FE                              ; is it the $FE start token?
         BNE      R?D1                              ;   no, loop until we get one
         LDX      #512                              ; put transfer count (512) into X
         JSR      SPI_ReadBlock                     ; transfer 512 bytes to buffer at Y
         JSR      SPI_Read                          ; read the CRC MSB
         TFR      A,B                               ; copy MSB to B
         JSR      SPI_Read                          ; read the CRC LSB into A (V=0 always)
         EXG      A,B                               ; put MSB in A, LSB in B
         SD_NegateCS                                ; negate CS after command                           
         RTS                                        ; return with CRC in D and Z clear
R?DERR   SD_NegateCS                                ; negate CS on error return
         ORCC     #CC_V                             ; set the V flag
         RTS                                        ; return with error info in A and V set

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
         PSHSW                                      ; preserve E and F
         PSHS     U                                 ; preserve U
         LDQ      ,X                                ; copy LBA block value
         STQ      SD.A3,X                           ; to A3...A0 of command string
         PULSW                                      ; restore E and F
         CLR      SD.CRC,X                          ; clear the CRC byte of string
         LDA      #SD_CMD24                         ; WRITE_SINGLE_BLOCK command (24)
         STA      SD.CMD,X                          ; put it in the command byte
         TFR      X,U                               ; put command buffer address in U
         JSR      SD_SendCmd                        ; send the command to SD Card
         PULS     U
         BNE      W?ERR                             ;   R1 is negative, terminate!
         JSR      SPI_Read                          ; send two $FF bytes
         JSR      SPI_Read
         LDA      #$FE                              ; send the $FE start token
         JSR      SPI_Write
         LDX      #512                              ; init transfer counter
         JSR      SPI_WriteBlock                    ; transfer 512 bytes from buffer at Y
         JSR      SPI_Read                          ; write a dummy CRC value to card
         JSR      SPI_Read
         JSR      SPI_Read                          ; get data response
         BSR      SD_WaitReady                      ; wait for card to do the write
         ANDA     #$1F                              ; mask off unused bits
         CMPA     #$05                              ; $15 = data accepted?
         BNE      W?ERR                             ;    no, so return with error
         SD_NegateCS                                ; negate CS after command                           
         RTS
W?ERR    SD_NegateCS                                ; negate CS on error return
         ORCC     #CC_V                             ; set the V flag
         RTS                                        ; return with error info in A and V set

;;
;; SD_WaitReady - wait for the SD card to become ready
;;                   (e.g. after WriteBlock)
;; return:  Z=1, timeout error
;;          Z=0, card is ready
;;
SD_WaitReady:
         PSHS     A,Y,X                             ; preserve A,Y,X
         LDY      #25000                            ; 25,000 attempts
S?W0     LDX      #2                                ; 20us in between attempts = 500ms
         JSR      DELAYUS
         LEAY     -1,Y
         BEQ      S?W1                              ; timeout (Y=0 -> Z=1)
         JSR      SPI_Read                          ; send an FF over SPI
         COMA                                       ; $FF -> $00?
         BNE      S?W0                              ;    nope, next attempt
         COMA                                       ; $00 -> $FF (Z=0)
S?W1     PULS     A,Y,X,PC

;======================================================================
;
;  6309 Debug monitor for use with NOICE09
;  Adapted for HD6309 SBC April 2020
;
;  Copyright (c) 1992-2006 by John Hartman
;
;  Modification History:
;    13-Mar-2006 JLH ported from 6809 version with assistance from Robert Gault
;     8-Mar-2016 TJL corrected bug in the RUN_TARGET handler
;    11-Mar-2020 TJL ported to HD6309 SBC platform, lwasm assembler
;
;======================================================================

;===========================================================================
; PLATFORM DEPENDENT INPUT/OUTPUT CODE
;===========================================================================

;===========================================================================
;  DBGETCH Get a character to A from SCC DEBUG CHANNEL
;
;return: character in A
;        V=0 if data received
;        V=1 if timeout (0.5 seconds)
;
;  Uses 4 bytes of stack including return address
;
; DBGETCH1 entry point - one attempt
DBGETCH1:
         PSHS     Y                                 ; preserve Y
         LDY      #2                                ; only check once for a character in channel A
         BRA      GC11?                             ; process as DBGETCH
DBGETCH:
         PSHS     Y                                 ; preserve Y
         LDY      #0                                ; clear Y for longest timeout (~450ms)
GC11?    ORCC     #CC_V                             ; set V flag ahead of decrement
         LEAY     -1,Y                              ; decrement timeout counter (V unaffected)
         BEQ      GC91?                             ;  EXIT IF TIMEOUT (with V=1)
         LDA      DEBUG_CMD                            ; reset register pointer to WR0/RR0
         LDA      DEBUG_CMD                            ; read RR0
         ANDA     #ZSCC.RXBF                        ; examine the RX char available bit
         BEQ      GC11?                             ;  LOOP UNTIL CHARACTER AVAILABLE
         LDA      DEBUG_DAT                            ; read character
         ORA      #0                                ; clear V flag
GC91?    PULS     Y,PC                              ; restore Y and return


;===========================================================================
;  DBPUTCH Output character to SCC DEBUG CHANNEL
;
;  Uses 2 bytes of stack including return address
;
; inputs: character in A
; return: character in A
;
DBPUTCH:
         PSHS     A
PC10?    LDA      DEBUG_CMD                            ; reset SCC register pointer to WR0/RR0
         LDA      DEBUG_CMD                            ; read RR0
         ANDA     #ZSCC.TXBE                        ;  examine the TX buffer empty bit
         BEQ      PC10?                             ;  LOOP UNTIL EMPTY
         PULS     A
         STA      DEBUG_DAT                            ; write character to SCC B data reg
         RTS
;
;======================================================================
;  Response string for GET TARGET STATUS request
;  Reply describes target:
TSTG              FCB   17                          ; 2: PROCESSOR TYPE = 6309
                  FCB   COMBUF_SIZE                 ; 3: SIZE OF COMMUNICATIONS BUFFER
                  FCB   0                           ; 4: NO TASKING SUPPORT
                  FDB   0,0                         ; 5-8: LOW AND HIGH LIMIT OF MAPPED MEM (NONE)
                  FCB   B1-B0                       ; 9:  BREAKPOINT INSTR LENGTH
B0                SWI                               ; 10: BREAKPOINT INSTRUCTION
B1                FCC   'HD6309 SBC V1.41'          ; DESCRIPTION TEXT
                  FCB   0                           ; DESCRIPTION NULL TERMINATOR
TSTG_SIZE         EQU   *-TSTG                      ; SIZE OF STRING

;======================================================================
;  HARDWARE PLATFORM INDEPENDENT EQUATES AND CODE
;
;  Communications function codes.
FN_GET_STAT       EQU   $FF                         ; reply with device info
FN_READ_MEM       EQU   $FE                         ; reply with data
FN_WRITE_M        EQU   $FD                         ; reply with status (+/-)
FN_READ_RG        EQU   $FC                         ; reply with registers
FN_WRITE_RG       EQU   $FB                         ; reply with status
FN_RUN_TARG       EQU   $FA                         ; reply (delayed) with registers
FN_SET_BYTE       EQU   $F9                         ; reply with data (truncate if error)
FN_IN             EQU   $F8                         ; input from port
FN_OUT            EQU   $F7                         ; output to port
;                                       ;
FN_MIN            EQU   $F7                         ; MINIMUM RECOGNIZED FUNCTION CODE
FN_ERROR          EQU   $F0                         ; error reply to unknown op-code
;

;  Set CPU mode to safe state, configure hardware
;
NOICE:   ORCC     #CC_I+CC_F                        ; INTERRUPTS OFF
         LDS      #MONSTACK                         ; CLEAN STACK IS HAPPY STACK
         JSR      DEBUG_INIT                        ; init debug SCC channel for 115.2kbps
;
;  Initialize RAM interrupt vectors
         LDY      #INT_ENTRY                        ; ADDRESS OF DEFAULT HANDLER
         LDX      #RAMVEC                           ; POINTER TO RAM VECTORS
         LDB      #NVEC                             ; NUMBER OF VECTORS
RES10    STY      ,X++                              ; SET VECTOR
         DECB
         BNE      RES10
;
;  Initialize user registers
         LDD      #INITSTACK
         STA      REG_SP+1                          ; INIT USER'S STACK POINTER MSB
         STB      REG_SP                            ; LSB
;
         CLRD
         STD      REG_PC
         STA      REG_A
         STA      REG_B
         STA      REG_E
         STA      REG_F
         STA      REG_DP
         STA      REG_MD
         STD      REG_X
         STD      REG_Y
         STD      REG_U
         STD      REG_V
         STA      REG_STATE                         ; initial state is "RESET"
;
         LDA      #CC_E+CC_I+CC_F                   ; state "all regs pushed", no ints
         STA      REG_CC
;
;  Set function code for "GO".  Then if we reset after being told to
;  GO, we will come back with registers so user can see the crash
         LDA      #FN_RUN_TARG
         STA      COMBUF
         JMP      RETURN_REGS                       ; DUMP REGS, ENTER MONITOR

;===========================================================================
;  Common handler for default interrupt handlers
;  Enter with A=interrupt code = processor state
;  All registers stacked, PC=next instruction
;
;  If 6809 mode, stack has CC A B DP XH XL YH YL UH UL PCH PCL
;  If 6309 mode, stack has CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
;
INT_ENTRY
         STA      REG_STATE                         ; SAVE STATE
;
;  Save registers from stack to reg block for return to master
;  Host wants least significant bytes first, so flip as necessary
         PULS     A
         STA      REG_CC                            ; CONDITION CODES
         PULS     A
         STA      REG_A                             ; A
         PULS     A
         STA      REG_B                             ; B

;  If native mode, E and F are on stack
;  If 6809 mode, E and F are in registers, unchanged from interrupt til here
         JSR      MD_TEST
         BNE      IE_10                             ; Jump if 6809 mode
         PULSW                                      ; else native: get from stack
IE_10    STE      REG_E
         STF      REG_F

;  V isn't on the stack, but we haven't touched it.  Copy to RAM
         TFR      V,D
         STA      REG_V+1                           ; MSB V
         STB      REG_V                             ; LSB V

;  There seems to be no way to store MD, and no way to load it except immediate
;  Thus we have to construct it by BITMD
         LDA      REG_MD
         ANDA     #$03                              ; save only bits 1 and 0 (set by MD_TEST)
         BITMD    #$40
         BEQ      IE_11
         ORA      #$40
IE_11    BITMD    #$80
         BEQ      IE_12
         ORA      #$80
IE_12    STA      REG_MD

         PULS     A
         STA      REG_DP                            ; DP
         PULS     D
         STA      REG_X+1                           ; MSB X
         STB      REG_X                             ; LSB X
         PULS     D
         STA      REG_Y+1                           ; MSB Y
         STB      REG_Y                             ; LSB Y
         PULS     D
         STA      REG_U+1                           ; MSB U
         STB      REG_U                             ; LSB U
;
;  If this is a breakpoint (state = 1), then back up PC to point at SWI
         PULS     X                                 ; PC AFTER INTERRUPT
         LDA      REG_STATE
         CMPA     #1
         BNE      NOTBP                             ; BR IF NOT A BREAKPOINT
         LEAX     -1,X                              ; ELSE BACK UP TO POINT AT SWI LOCATION
NOTBP    TFR      X,D                               ; TRANSFER PC TO D
         STA      REG_PC+1                          ; MSB
         STB      REG_PC                            ; LSB
         JMP      ENTER_MON                         ; REG_PC POINTS AT POST-INTERRUPT OPCODE
;
;===========================================================================
;  Main loop  wait for command frame from master
;
;  Uses 6 bytes of stack including return address
;
MAIN     LDS      #MONSTACK                         ; CLEAN STACK IS HAPPY STACK
         LDX      #COMBUF                           ; BUILD MESSAGE HERE
;
;  First byte is a function code
MA05     JSR      DBGETCH                           ; GET A FUNCTION (6 bytes of stack)
         BVS      MAIN                              ; JIF TIMEOUT: RESYNC
         CMPA     #FN_MIN
         BLO      MAIN                              ; JIF BELOW MIN: ILLEGAL FUNCTION
         STA      ,X+                               ; SAVE FUNCTION CODE
;
;  Second byte is data byte count (may be zero)
         JSR      DBGETCH                           ; GET A LENGTH BYTE
         BVS      MAIN                              ; JIF TIMEOUT: RESYNC
         CMPA     #COMBUF_SIZE
         BHI      MAIN                              ; JIF TOO LONG: ILLEGAL LENGTH
         STA      ,X+                               ; SAVE LENGTH
         CMPA     #0
         BEQ      MA80                              ; SKIP DATA LOOP IF LENGTH = 0
;
;  Loop for data
         TFR      A,B                               ; SAVE LENGTH FOR LOOP
MA10     JSR      DBGETCH                           ; GET A DATA BYTE
         BVS      MAIN                              ; JIF TIMEOUT: RESYNC
         STA      ,X+                               ; SAVE DATA BYTE
         DECB
         BNE      MA10
;
;  Get the checksum
MA80     JSR      DBGETCH                           ; GET THE CHECKSUM
         BVS      MAIN                              ; JIF TIMEOUT: RESYNC
         PSHS     A                                 ; SAVE CHECKSUM
;
;  Compare received checksum to that calculated on received buffer
;  (Sum should be 0)
         JSR      CHECKSUM
         ADDA     ,S+                               ; ADD SAVED CHECKSUM TO COMPUTED
         BNE      MAIN                              ; JIF BAD CHECKSUM
;
;  Process the message.
         LDX      #COMBUF
         LDA      ,X+                               ; GET THE FUNCTION CODE
         LDB      ,X+                               ; GET THE LENGTH
         CMPA     #FN_GET_STAT
         BEQ      TARGET_STAT
         CMPA     #FN_READ_MEM
         BEQ      JREAD_MEM
         CMPA     #FN_WRITE_M
         BEQ      JWRITE_MEM
         CMPA     #FN_READ_RG
         BEQ      JREAD_REGS
         CMPA     #FN_WRITE_RG
         BEQ      JWRITE_REGS
         CMPA     #FN_RUN_TARG
         BEQ      JRUN_TARGET
         CMPA     #FN_SET_BYTE
         BEQ      JSET_BYTES
         CMPA     #FN_IN
         BEQ      JIN_PORT
         CMPA     #FN_OUT
         BEQ      JOUT_PORT
;
;  Error: unknown function.  Complain
         LDA      #FN_ERROR
         STA      COMBUF                            ; SET FUNCTION AS "ERROR"
         LDA      #1
         JMP      SEND_STATUS                       ; VALUE IS "ERROR"
;
;  long jumps to handlers
JREAD_MEM         JMP  READ_MEM
JWRITE_MEM        JMP  WRITE_MEM
JREAD_REGS        JMP  READ_REGS
JWRITE_REGS       JMP  WRITE_REGS
JRUN_TARGET       JMP  RUN_TARGET
JSET_BYTES        JMP  SET_BYTES
JIN_PORT          JMP  IN_PORT
JOUT_PORT         JMP  OUT_PORT

;===========================================================================
;
;  Target Status:  FN, len
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
TARGET_STAT
         LDX      #TSTG                             ; DATA FOR REPLY
         LDY      #COMBUF+1                         ; POINTER TO RETURN BUFFER
         LDB      #TSTG_SIZE                        ; LENGTH OF REPLY
         STB      ,Y+                               ; SET SIZE IN REPLY BUFFER
TS10     LDA      ,X+                               ; MOVE REPLY DATA TO BUFFER
         STA      ,Y+
         DECB
         BNE      TS10
;
;  Compute checksum on buffer, and send to master, then return
         JMP      SEND

;===========================================================================
;
;  Read Memory:  FN, len, page, Alo, Ahi, Nbytes
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
READ_MEM
;
;  Set map
;;;;    LDA     0,X
;;;;    STA     MAPIMG
;;;;    STA     MAPREG
;
;  Get address
         LDA      2,X                               ; MSB OF ADDRESS IN A
         LDB      1,X                               ; LSB OF ADDRESS IN B
         TFR      D,Y                               ; ADDRESS IN Y
;
;  Prepare return buffer: FN (unchanged), LEN, DATA
         LDB      3,X                               ; NUMBER OF BYTES TO RETURN
         STB      COMBUF+1                          ; RETURN LENGTH = REQUESTED DATA
         BEQ      GLP90                             ; JIF NO BYTES TO GET
;
;  Read the requested bytes from local memory
GLP      LDA      ,Y+                               ; GET BYTE
         STA      ,X+                               ; STORE TO RETURN BUFFER
         DECB
         BNE      GLP
;
;  Compute checksum on buffer, and send to master, then return
GLP90    JMP      SEND

;===========================================================================
;
;  Write Memory:  FN, len, page, Alo, Ahi, (len-3 bytes of Data)
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
;  Uses 6 bytes of stack
;
WRITE_MEM
;
;  Set map
         LDA      ,X+
;;;;    STA     MAPIMG
;;;;    STA     MAPREG
;
;  Get address
         LDB      ,X+                               ; LSB OF ADDRESS IN B
         LDA      ,X+                               ; MSB OF ADDRESS IN A
         TFR      D,Y                               ; ADDRESS IN Y
;
;  Compute number of bytes to write
         LDB      COMBUF+1                          ; NUMBER OF BYTES TO RETURN
         SUBB     #3                                ; MINUS PAGE AND ADDRESS
         BEQ      WLP50                             ; JIF NO BYTES TO PUT
;
;  Write the specified bytes to local memory
         PSHS     B,X,Y
WLP      LDA      ,X+                               ; GET BYTE TO WRITE
         STA      ,Y+                               ; STORE THE BYTE AT ,Y
         DECB
         BNE      WLP
;
;  Compare to see if the write worked
         PULS     B,X,Y
WLP20    LDA      ,X+                               ; GET BYTE JUST WRITTEN
         CMPA     ,Y+
         BNE      WLP80                             ; BR IF WRITE FAILED
         DECB
         BNE      WLP20
;
;  Write succeeded:  return status = 0
WLP50    LDA      #0                                ; RETURN STATUS = 0
         BRA      WLP90
;
;  Write failed:  return status = 1
WLP80    LDA      #1

;  Return OK status
WLP90    JMP      SEND_STATUS

;===========================================================================
;
;  Read registers:  FN, len=0
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
READ_REGS
;
;  Enter here from SWI after "RUN" and "STEP" to return task registers
RETURN_REGS
         LDY      #TASK_REGS                        ; POINTER TO REGISTERS
         LDB      #TASK_REG_SZ                      ; NUMBER OF BYTES
         LDX      #COMBUF+1                         ; POINTER TO RETURN BUFFER
         STB      ,X+                               ; SAVE RETURN DATA LENGTH
;
;  Copy the registers
GRLP     LDA      ,Y+                               ; GET BYTE TO A
         STA      ,X+                               ; STORE TO RETURN BUFFER
         DECB
         BNE      GRLP
;
;  Compute checksum on buffer, and send to master, then return
         JMP      SEND

;===========================================================================
;
;  Write registers:  FN, len, (register image)
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
WRITE_REGS
;
         TSTB                                       ; NUMBER OF BYTES
         BEQ      WRR80                             ; JIF NO REGISTERS
;
;  Copy the registers
         LDY      #TASK_REGS                        ; POINTER TO REGISTERS
WRRLP    LDA      ,X+                               ; GET BYTE TO A
         STA      ,Y+                               ; STORE TO REGISTER RAM
         DECB
         BNE      WRRLP
;
;  Return OK status
WRR80    CLRA
         JMP      SEND_STATUS

;===========================================================================
;
;  Run Target:  FN, len
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
RUN_TARGET
;
;  Restore user's map
;*      LDA     REG_PAGE                ; USER'S PAGE
;*      STA     MAPIMG                  ; SET IMAGE
;*      STA     MAPREG                  ; SET MAPPING REGISTER
;
;  Switch to user stack
         LDA      REG_SP+1                          ; BACK TO USER STACK
         LDB      REG_SP
         TFR      D,S                               ; TO S
;
;  Restore MD, as it affects stack building and RTI
;  Only bits 1 and 0 can be written, and only using LDMD #
;  It's time for some self-modifying code!  Build LDMD #xxx, RTS in RAM and call it.
         LDD      #$113D                            ; LDMD #imm
         STD      COMBUF+30                         ; Start code string
         LDA      REG_MD                            ; #imm is desired MD value
         STA      COMBUF+32
         LDA      #$39                              ; RTS
         STA      COMBUF+33
         JSR      COMBUF+30
;
;  Restore V, which isn't on the stack
         LDA      REG_V+1
         LDB      REG_V
         TFR      D,V
;
;  Restore registers
         LDA      REG_PC+1                          ; MS USER PC FOR RTI
         LDB      REG_PC                            ; LS USER PC FOR RTI
         PSHS     D
;
         LDA      REG_U+1
         LDB      REG_U
         PSHS     D
;
         LDA      REG_Y+1
         LDB      REG_Y
         PSHS     D
;
         LDA      REG_X+1
         LDB      REG_X
         PSHS     D
;
         LDA      REG_DP
         PSHS     A
;
;  Restore W from memory (not used between here and RTI)
         LDE      REG_E
         LDF      REG_F
         LDA      REG_MD
         BITA     #1
         BEQ      RT_10                             ; jump if 6809 mode
         PSHSW                                      ; else push W on stack for RTI
RT_10
;
         LDA      REG_B
         PSHS     A
;
         LDA      REG_A
         PSHS     A
;
         LDA      REG_CC                            ; SAVE USER CONDITION CODES FOR RTI
         ORA      #CC_E                             ; _MUST_ BE "ALL REGS PUSHED"
         PSHS     A
;
;  Return to user (conditioned by MD.0)
         RTI
;
;===========================================================================
;
;  Common continue point for all monitor entrances
;  SP = user stack
ENTER_MON
         TFR      S,D                               ; USER STACK POINTER
         STA      REG_SP+1                          ; SAVE USER'S STACK POINTER (MSB)
         STB      REG_SP                            ; LSB
;
;  Change to our own stack
         LDS      #MONSTACK                         ; AND USE OURS INSTEAD
;
;  Operating system variables
;*      LDA     MAPIMG                  ; GET CURRENT USER MAP
         LDA      #0                                ; ... OR ZERO IF UNMAPPED TARGET
         STA      REG_PAGE                          ; SAVE USER'S PAGE
;
;  Return registers to master
         JMP      RETURN_REGS

;===========================================================================
;
;  Set target byte(s):  FN, len { (page, alow, ahigh, data), (...)... }
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
;  Return has FN, len, (data from memory locations)
;
;  If error in insert (memory not writable), abort to return short data
;
;  This function is used primarily to set and clear breakpoints
;
;  Uses 1 byte of stack
;
SET_BYTES
         LDU      #COMBUF+1                         ; POINTER TO RETURN BUFFER
         LDA      #0
         STA      ,U+                               ; SET RETURN COUNT AS ZERO
         LSRB
         LSRB                                       ; LEN/4 = NUMBER OF BYTES TO SET
         BEQ      SB99                              ; JIF NO BYTES (COMBUF+1 = 0)
;
;  Loop on inserting bytes
SB10     PSHS     B                                 ; SAVE LOOP COUNTER
;
;  Set map
;;;;    LDA     0,X
;;;;    STA     MAPIMG
;;;;    STA     MAPREG
;
;  Get address
         LDA      2,X                               ; MSB OF ADDRESS IN A
         LDB      1,X                               ; LSB OF ADDRESS IN B
         TFR      D,Y                               ; MEMORY ADDRESS IN Y
;
;  Read current data at byte location
         LDA      0,Y
;
;  Insert new data at byte location
         LDB      3,X                               ; GET BYTE TO STORE
         STB      0,Y                               ; WRITE TARGET MEMORY
;
;  Verify write
         CMPB     0,Y                               ; READ TARGET MEMORY
         PULS     B                                 ; RESTORE LOOP COUNT, CC'S INTACT
         BNE      SB90                              ; BR IF INSERT FAILED: ABORT
;
;  Save target byte in return buffer
         STA      ,U+
         INC      COMBUF+1                          ; COUNT ONE RETURN BYTE
;
;  Loop for next byte
         LEAX     4,X                               ; STEP TO NEXT BYTE SPECIFIER
         CMPB     COMBUF+1
         BNE      SB10                              ; *LOOP FOR ALL BYTES
;
;  Return buffer with data from byte locations
SB90
;
;  Compute checksum on buffer, and send to master, then return
SB99     JMP      SEND

;===========================================================================
;
;  Input from port:  FN, len, PortAddressLo, PAhi (=0)
;
;  While the 6809 has no input or output instructions, we retain these
;  to allow write-without-verify
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
IN_PORT
;
;  Get port address
         LDA      1,X                               ; MSB OF ADDRESS IN A
         LDB      0,X                               ; LSB OF ADDRESS IN B
         TFR      D,Y                               ; MEMORY ADDRESS IN Y
;
;  Read the requested byte from local memory
         LDA      0,Y
;
;  Return byte read as "status"
         JMP      SEND_STATUS

;===========================================================================
;
;  Output to port  FN, len, PortAddressLo, PAhi (=0), data
;
;  Entry with A=function code, B=data size, X=COMBUF+2
;
OUT_PORT
;
;  Get port address
         LDA      1,X                               ; MSB OF ADDRESS IN A
         LDB      0,X                               ; LSB OF ADDRESS IN B
         TFR      D,Y                               ; MEMORY ADDRESS IN Y
;
;  Get data
         LDA      2,X
;
;  Write value to port
         STA      0,Y
;
;  Do not read port to verify (some I/O devices don't like it)
;
;  Return status of OK
         CLRA
         JMP      SEND_STATUS

;===========================================================================
;  Build status return with value from "A"
;
SEND_STATUS
         STA      COMBUF+2                          ; SET STATUS
         LDA      #1
         STA      COMBUF+1                          ; SET LENGTH
         BRA      SEND

;===========================================================================
;  Append checksum to COMBUF and send to master
;
SEND     JSR      CHECKSUM                          ; GET A=CHECKSUM, X->checksum location
         NEGA
         STA      0,X                               ; STORE NEGATIVE OF CHECKSUM
;
;  Send buffer to master
         LDX      #COMBUF                           ; POINTER TO DATA
         LDB      1,X                               ; LENGTH OF DATA
         ADDB     #3                                ; PLUS FUNCTION, LENGTH, CHECKSUM
SND10    LDA      ,X+
         JSR      DBPUTCH                           ; SEND A BYTE
         DECB
         BNE      SND10
         JMP      MAIN                              ; BACK TO MAIN LOOP

;===========================================================================
;  Compute checksum on COMBUF.  COMBUF+1 has length of data,
;  Also include function byte and length byte
;
;  Returns:
;       A = checksum
;       X = pointer to next byte in buffer (checksum location)
;       B is scratched
;
CHECKSUM
         LDX      #COMBUF                           ; pointer to buffer
         LDB      1,X                               ; length of message
         ADDB     #2                                ; plus function, length
         LDA      #0                                ; init checksum to 0
CHK10    ADDA     ,X+
         DECB
         BNE      CHK10                             ; loop for all
         RTS                                        ; return with checksum in A

;**********************************************************************
;
;  Interrupt handlers to catch unused interrupts and traps
;  Registers are stacked.  Jump through RAM vector using X, type in A
;
;  This will affect only interrupt routines looking for register values!
;
;  Our default handler uses the code in "A" as the processor state to be
;  passed back to the host.
;

;  This is "reserved" on 6809
;  Used for Divide-by-zero and Illegal-instruction on 6309
TRAP_ENT LDA      #7
         LDX      RAMVEC+0
         JMP      0,X
;
SWI3_ENT LDA      #6
         LDX      RAMVEC+2
         JMP      0,X
;
SWI2_ENT LDA      #5
         LDX      RAMVEC+4
         JMP      0,X
;
;  Will have only PC and CC's pushed unless we were waiting for an interrupt
;  or MD.1 is true.  Use CC's E bit to distinguish.
;  Push all registers here for common entry (else we can't use our RAM vector)
FIRQ_ENT STA      REG_A                             ; SAVE A REG
         PULS     A                                 ; GET CC'S FROM STACK
         BITA     #CC_E
         BNE      FIRQ9                             ; BR IF ALL REGISTERS PUSHED ALREADY

; CC.E was not set which means that regMD bit2 was not set and that bit in
; the image should be cleared. If CC.E is set, we can't tell what set it, a
; direct command, CWAI, or bit 1 of regMD.
;
; Push registers as if CC.E had been set
;  If 6809 mode, stack needs CC A B DP XH XL YH YL UH UL PCH PCL
;  If 6309 mode, stack needs CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
;
         CLR      E_FLAG
         LDA      REG_MD
         ANDA     #$FD                              ; BIT1 must be clear, else all regs would have been pushed
         STA      REG_MD
         PSHS     U,Y,X,DP                          ; push regs next below PC

         STW      REG_F                             ; MD_TEST will not preserve regW
         JSR      MD_TEST
         PSHS     CC                                ; Save result
         LDW      REG_F                             ; Recover regW
         PULS     CC                                ; Recover result of test
         BNE      FE1
         PSHSW
FE1      PSHS     B
         LDB      REG_A
         PSHS     B
         ORA      #CC_E                             ; SET AS "ALL REGS PUSHED"

FIRQ9    TST      E_FLAG
         BNE      FIRQ9B
         LDB      REG_MD                            ; We got here with E_FLAG clear and CC.E set which
         ORB      #2                                ; means regMD bit2 must be set.
         STB      REG_MD
FIRQ9B   PSHS     A                                 ; REPLACE CC'S
         LDA      #4
         LDX      RAMVEC+6
         JMP      0,X
;
IRQ_ENT  LDA      #3
         LDX      RAMVEC+8
         JMP      0,X
;
NMI_ENT  LDA      #2
         LDX      RAMVEC+12
         JMP      0,X
;
SWI_ENT  LDA      #1
         JMP      INT_ENTRY
;
;============================================================================
; TEST FOR BIT0 OF regMD:
; Exit emulation mode: regW=$1234
;      native    mode: regW=$0000
;
; Preserves W and V.  Other registers destroyed.
;
MD_TEST
         PSHSW
;
; If 6809 mode, RTI will pop 12 bytes: CC A B DP XH XL YH YL UH UL PCH PCL
; If 6309 mode, RTI will pop 14 bytes: CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
;
; Initialize TEST_STACK used for fake RTI. The return address will be MD_RETURN
; in both emulation and native modes. If native mode, regW will be cleared.
;
         LDX      #TEST_STACK

         LDA      #$80
         STA      ,X+                               ; CC with E set

         LDB      #9
RES11    CLR      ,X+                               ; zeros for other registers, including W
         DECB
         BNE      RES11

         LDD      #MD_RETURN
         STD      ,X++                              ; 6809 return address, or 6309 U
         STD      ,X++                              ; 6309 return address, or past 6809 stack

         STS      S_IMAGE
         LDS      #TEST_STACK
         LDW      #$1234
         RTI                                        ; if 6309 mode, W gets 0; else unchanged

MD_RETURN
         LDS      S_IMAGE
         TSTW                                       ; adjust CC.Z: set if 6309 mode
         PULSW
         RTS
         
;======================================================================
;  END OF 6309 Debug monitor for use with NOICE09
;  Copyright (c) 1992-2006 by John Hartman
;======================================================================


;;======================================================================
;; WOZMON RESIDENT MONITOR
;;======================================================================
; This is adapted from Jeff Tranter's work, and is a port of WOZMON to
; my HD6309 SBC. Jeff's work can be found here:
; https://github.com/jefftranter/6809/blob/master/sbc/wozmon/wozmon.asm
;
; This code uses SCC UART functions that are already present elsewhere
; in this ROM. I've tweaked it a bit in terms of cleanup and taking
; advantage of 6809/6309 architecture. I've added an "X" command to
; invoke an S-Record/Intel Hex loader (inspired by Dave Dunfield's
; 6809 monitor), an "N" command to invoke the ROM resident
; NoICE debugger, and an "M" command to invoke MSBASIC (resident in the
; alternate ROM bank). Finally, I added a crude 'flow control' to the
; NXTPRNT function, to allow pausing (^S), exit to newline (^C), and
; line-by-line (SPACE) during the dump. As such, the code is now much
; larger than the 256 bytes that Woz's original 6502 occupied!
;
; It was fun to study this old code, and I added some more comments to
; it to help w/ readability. I've migrated the syntax to that of William
; Astle's LWTOOLS 6809/6309 toolchain, which can be found here:
; http://www.lwtools.ca/
;
;***********************************************************************
;
; Following are notes from Jeff Tranter on this:
;
; This is a port of the 6800 version of Woz Mon to my 6809-based Single
; Board Computer. It was converted to 6809 instructions as well as
; ported to use the 6850 ACIA for input/output.
;
; The original 6800 port came from here: https://pastebin.com/TSM2DdRL
;
; Note: The code internally converts all characters to high ASCII (bit
; 7 = 1) because the Apple 1 used this format and the program logic is
; dependent on it in several places.
;
; The code is not quite small enough to fit in 256 bytes as the
; original 6502 and 6800 versions did.
;
;***********************************************************************
;
; This is a rewrite of the Apple 1 monitor to run on an MC6800
; microprocessor, rather than the MCS6502 microprocessor that
; was standard.  This source code will assemble with the
; AS Macro Assembler; with minor changes it should assemble
; with any MC6800 assembler.

; Copyright 2011 Eric Smith <eric@brouhaha.com>
;
; This program is free software; you can redistribute and/or modify it
; under the terms of the GNU General Public License version 3 as
; published by the Free Software Foundation.
;
; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.
;
; The text of the license may be found online at:
;     http://www.brouhaha.com/~eric/software/GPLv3
; or:
;     http://www.gnu.org/licenses/gpl-3.0.txt

; relative addresses of program variables

; first, determine WOZ_RAM absolute offset
W_OFFS   EQU      WOZ_RAM % 256

; next, establish the amount of line input buffer to allocate
W_INLEN  EQU      120                               ; line input buffer length

; then, determine xx,U offset for XAM variable, because this gets used w/o DP reg, also
W_XAM    EQU      W_INLEN                           

; finally, determine DP offset pointers to temporary variables
W_dXAM   EQU      W_OFFS+W_INLEN                    ; XAM address (+120/121)
W_dST    EQU      W_OFFS+W_INLEN+2                  ; STOR address  (+122/+123)   [A3 in new monitor]
W_dMODE  EQU      W_OFFS+W_INLEN+4                  ; 'mode' is XAM, STOR, BLOCK XAM (+124)
W_dTEMP  EQU      W_OFFS+W_INLEN+5                  ; temporary storage (+125)
DOT      EQU      '.'
HI_COL   EQU      ':'+$80                           ; msb set Colon
HI_R     EQU      'R'+$80                           ; msb set "R" - RUN command
HI_X     EQU      'X'+$80                           ; msb set "X" - HEX LOAD command
HI_M     EQU      'M'+$80                           ; msb set "M" - MS BASIC command
HI_N     EQU      'N'+$80                           ; msb set "N" - NOICE command
CTL_C    EQU      'C'-$40                           ; control-C
CTL_S    EQU      'S'-$40                           ; control-S
CTL_H    EQU      'H'-$40                           ; control-H
CTL_X    EQU      'X'-$40                           ; control-X
DEL      EQU      127                               ; "Delete"
ESC      EQU      '['-$40                           ; ESCape

;; WOZMON - primary entry point
WOZMON:
         LDS      #INITSTACK                        ; grow stack downward from reserved RAM
         LDU      #WOZ_RAM                          ; point U at beginning of WOZ_RAM block
W?Z1     LEAX     W_INLEN,U                         ; absolute address of FIRST variable in X
         TFR      X,DP                              ; copy the MSB of the address to DP register
         CLRW                                       ; reset WORD value
         STW      <W_dXAM                           ; reset XAM address
         STW      <W_dST                            ; reset STORE address
         BRA      WOZ3                              ; enter monitor main loop
WOZ3:
         BSR      W_GETLINE                         ; get an input line
         BVS      WOZ3                              ;   CANCEL - repeat input
         BSR      W_PARSE                           ; parse it
         BRA      WOZ3                              ; loop forever

; Get a line of input from the keyboard, echoing to display.
; Normally enter at ESCAPE or GETLINE. Handle ^H and DEL as
; 'backspace' and ^X and ESC as 'cancel'. Otherwise accumulate 
; characters in the buffer. Exit when a CR is received, and
; auto-cancel and resrtart when buffer length exceeds W_INLEN.
;
; inputs: U is pointer to line buffer 
; return: B is the index into the buffer at last character position
;         A is the last character received (either CR or \)
;         V = 0 CR received
;         V = 1 CANCEL or >W_INLEN characters received

W_NOTCR:
         CMPA     #CTL_H                            ; CTRL-H? ["backspace"]
         BEQ      W_BACKSPC                         ;   yes, back up a character
         CMPA     #DEL                              ; DEL? ["delete"]
         BEQ      W_BACKSPC                         ;   yes, back up a character
         CMPA     #CTL_X                            ; CTRL-X? ["cancel"]
         BEQ      W_CANCEL                          ;   yes, abort line
         CMPA     #ESC                              ; ESC? ["escape"]
         BEQ      W_CANCEL
         INCB                                       ; leave in buffer and advance text index.
         CMPB     #W_INLEN                          ; are we at end of buffer?
         BLO      W_NEXTCHR                         ;   no, get another character
W_CANCEL:
         LDA      #'\'                              ; in case of CANCEL or end-of-buffer
         JSR      PUTCH                             ; output a \
         ORCC     #CC_V                             ; set V flag (too long or cancel)
         RTS                                        ; and return
W_GETLINE:
         LDA      #'*'                              ; put prompt character in A
W_GETLNZ:                                           ; alternate entry point           
         JSR      PUTCR                             ; start a new line (A is preserved)
         JSR      PUTCH                             ; output the prompt char
         LDB      #1                                ; Set offset to 1 (decremented next line)
W_BACKSPC:
         DECB                                       ; Back up text index.
         BMI      W_GETLINE                         ; index<0 (start of line), reinitialize
W_NEXTCHR:
         JSR      GETCHT                            ; get a character from UART Ch A
         STA      B,U                               ; Add to text buffer.
         JSR      PUTCH                             ; Display character.
         CMPA     #CR                               ; CR?
         BNE      W_NOTCR                           ;   not a CR, keep getting input chars
         RTS                                        ;   return with V=0 (no error)

; Process an input line. Examine each character in the buffer. Handle
; CR (end of line), and "." (block mode) and ":" (store mode) cases. Character
; codes less than "." are treated as delimiters. The "R" character executes the
; RUN command, and the "X" character executes the S-Record download function.
; The "N" command jumps to NoICE debugger. The "M" command jumps to BASIC
; All other characters are assumed to be a hex input 'item' and parsed into
; W register.
;
; U is pointer to line buffer and work variables
; W is the WORD parsed from input line
; B is the index into the line buffer
; A is work register
; W_TEMP is used as part of zero-digit-length argument check

W_PARSE:
         CLRD                                       ; clear both A and B (A used to set XAM mode soon)
         DECB                                       ; (B) text index -1, to become zero at BLSKIP
W_SETMODE:
         STA      <W_dMODE                          ; $00=XAM (0), $BA=STORE (-), $2E=BLOK XAM (+)
W_BLSKIP:
         INCB                                       ; advance text index (B,U allows only 0...127)
W_NEXTITEM:
         LDA      B,U                               ; Get character
         CMPA     #CR                               ; is it a CR?
         BEQ      W_XRET                            ;  yes, done this line.
         CMPA     #DOT                              ; is it a period?
         BEQ      W_SETMODE                         ; yes, set BLOCK XAM mode ($2E)
         BLS      W_BLSKIP                          ;  less than periods are treated as delimiters
         ORA      #$80                              ; convert high-bit set (for MODE stuff)
         CMPA     #HI_COL                           ; is it a colon?
         BEQ      W_SETMODE                         ;  yes, set STORE mode ($BA)
         CMPA     #HI_M                             ; is it an "M"?  ("MS Basic")
         LBEQ     GOBASIC                           ;   yes, jump to MS BASIC
         CMPA     #HI_N                             ; is it an "N"?  ("NoICE")
         LBEQ     GONOICE                           ;   yes, start NoICE debugger
         CMPA     #HI_R                             ; is it an "R"?  ("Run")
         BEQ      W_RUN                             ;   Yes, jump to current XAM index.
         CMPA     #HI_X                             ; is it an "X"?  ("Hex")
         BEQ      W_XLOAD                           ;   yes, try to load hexfile from console
W_NEWHEX:
         CLRW                                       ; clear W (HI = E, LO = F)
         STB      <W_dTEMP                          ; make a copy of text buffer index
W_NEXTHEX:
         LDA      B,U                               ; Get character for hex test.
         EORA     #$30                              ; Map digits to $0-9.
         CMPA     #$09                              ; Digit?
         BLS      W_ADDDIG                          ; Yes.
         ORA      #$20                              ; neutralize case
         ADDA     #$89                              ; Map letter "a"-"f" to $FA-FF.
         CMPA     #$F9                              ; Hex letter?
         BLS      W_NOTHEX                          ; No, character not hex.
W_ADDDIG:
         ANDA     #$0F                              ; isolate the hex digit value ($0-$F)
         EXG      D,W                               ; digit in 4lsb of E, WORD in D, buffer ptr in F
         ASLD                                       ; shift WORD left 4 bits to make room
         ASLD                                       ;   for the new hex nybble
         ASLD
         ASLD
         ORR      E,B                               ; OR the new digit in WORD
         EXG      D,W                               ; WORD back in W, buffer pointer back in B
         INCB                                       ; advance text index
         BRA      W_NEXTHEX                         ; Always taken. Check next character for hex.
W_RUN:
         LEAS     2,S                               ; free up return address on stack
         JMP      [W_XAM,U]                         ; RUN command, jump to address in XAM index
W_XLOAD:
         JSR      PUTMSG
         FCB      CR,LF
         FCN      "Hex Download "
         JSR      DL_START                          ; yes, try to download from host
W_XRET:         
         RTS         

; A non-hex, non-command character has been encountered. We may have a new
; hex argument in WORD (if W_TEMP = B, we do NOT) and if so, we need to figure
; out what to do with depending on MODE. If we are already in STOR mode, then
; we simply store the LSB of the WORD at address in ST, then increment ST.
; If we are in XAM mode (which includes the address entered prior to the ':' in
; the command line) then WORD argument is copied to XAM and ST addresses, and we
; fall into the NXTPRT loop. If we're already in BLOCK XAM mode, then we take the
; WORD argument as the end of the block, and fall in the NXTPRT loop.
;
; U is pointer to line buffer and work variables
; X is work pointer
; W is the WORD parsed from input line (A2 in new monitor)
; B is the index into the line buffer
; A is work register
; W_TEMP is copy of line buffer index upon entry, but after this is
;        complete, it is the flow-control byte for XAM/BLOCK XAM output

W_NOTHEX:
         CMPB     <W_dTEMP                          ; Check if W empty (no hex digits parsed).
         BEQ      W_XERR                            ;  yes, bad input so return via ERROR
         CLR      <W_dTEMP                          ; clear the 'flow control' byte
         TST      <W_dMODE                          ; Test MODE byte.
         BPL      W_NOTSTOR                         ; B7=1 for STOR, 0 for XAM and BLOCK XAM
; STOR mode
         LDX      <W_dST                            ; use X to hold 'store index'
         STF      ,X+                               ; store LSB of WORD at 'store index'
         STX      <W_dST                            ; save the incremented 'store index'
         BRA      W_NEXTITEM                        ; Get next command item.
W_NOTSTOR:
         BNE      W_XAMNEXT                         ; mode = $00 for XAM, $56 for BLOCK XAM.
; non BLOCK XAM
         STW      <W_dST                            ; copy word parsed into 'store index'
         STW      <W_dXAM                           ; copy word parsed into 'XAM index'
         CLRA                                       ; set Z=1 to cause address display to occur
         ; fall into NXTPRNT loop...
W_NXTPRNT:
         BNE      W_PRDATA                          ; Z=0 means skip displaying address
         LDA      <W_dTEMP                          ; check flow control byte
         BEQ      W?NXT1                            ;  if zero, skip waiting for character
         JSR      GETCHT                             ; yes, flow control in effect, wait for character
         CMPA     #CTL_X                            ; did we get a ^X?
         BEQ      W_XRET                            ;  yes, exit and get new input line
         CMPA     #SPACE                            ; did we get a SPACE
         BEQ      W?NXT1                            ;  yes, set flow control to $20
         CLRA                                       ; any other character, clear flow control
W?NXT1   STA      <W_dTEMP                          ; update flow control byte
         JSR      GETCH1                             ; attempt to read a character (A=0 if none)
         CMPA     #SPACE                            ; is it a SPACE?
         BEQ      W?NXT2                            ;   yes, set flow control to $20
         CMPA     #CTL_X                            ; is it a ^X?
         BEQ      W_XRET                            ;  yes, exit and get new input line
         LDA      <W_dTEMP                          ; flow unaffected by other characters
W?NXT2   STA      <W_dTEMP                          ; update flow control byte
W?NXT3   JSR      PUTCR                             ; CR for a new line
         LDA      <W_dXAM                           ; 'XAM index' high-order byte.
         JSR      PUTBYTE
         LDA      <W_dXAM+1                         ; Low-order 'Examine index' byte.
         JSR      PUTBYTE
         LDA      #':'                              ; ":".
         JSR      PUTCH                              ; Output it.
W_PRDATA:
         JSR      PUTSPACE                          ; output a space
         LDA      [W_XAM,U]                         ; Get data byte at 'examine index'.
         JSR      PUTBYTE                           ; display it
W_XAMNEXT:
         LDX      <W_dXAM                           ; use X to hold XAM index
         CMPR     W,X                               ; compare XAM index to parsed address WORD
         LBEQ     W_NEXTITEM                        ;  same, done examining memory
         LEAX     1,X                               ; increment XAM index
         STX      <W_dXAM                           ;  and save it
         LDA      <(W_dXAM+1)                       ; Check low-order 'examine index' byte
         ANDA     #$07                              ; set Z when 'examine index' MOD 8 = 0
         BRA      W_NXTPRNT                         ; always taken
W_XERR:
         LDA      #'?'                              ; parse ERROR
         JMP      PUTCH                             ; output a ? and return

;;======================================================================
;; S-RECORD AND INTEL HEX CONSOLE DOWNLOAD FUNCTION
;;======================================================================

;;
;; DL_START - try to download a HEX file (either S9 or IHEX) from console
;; inputs: none
;; return: V=0 : successful load (A=0)
;;         V=1 : error during load (A=$FF)
;;
DL_START:
         BSR      DL_REC                            ; DOWNLOAD RECORD (A=00 ready for more)
         BNE      D?LO2                             ;  if Z=0 then stop reading records
         JSR      PUTCONST                          ; OUTPUT ONE DOT PER RECORD
         FCC      '.'
         BRA      DL_START                          ; CONTINUE
D?LO2    BPL      D?LO3                             ;  if N=0, no error occurred (A=01 means EOF)
         JSR      PUTMSG
         FCN      "ERR"
         ORCC     #CC_V                             ; set V (error)         
         RTS
D?LO3    JSR      PUTMSG
         FCN      "OK"
         RTS

; Download a record in either MOTOROLA or INTEL hex format
DL_REC   JSR      GETCH                             ; Get a character
         CMPA     #CTL_X                            ; Check for ^X (CANCEL)
         BEQ      DL_ERR                            ; yes, abort with error
         CMPA     #':'                              ; Start of INTEL record?
         LBEQ     DL_INT                            ; Yes, download INTEL
         CMPA     #'S'                              ; Start of MOTOROLA record?
         BNE      DL_REC                            ; No, keep looking

; Download a record in MOTOROLA hex format
DL_MOT   JSR      GETCH                              ; get record type
         CMPA     #'0'                              ; S0 header record?
         BEQ      DL_REC                            ;    skip it
         CMPA     #'5'                              ; S5 count record?
         BEQ      DL_REC                            ;    skip it
         CMPA     #'9'                              ; S9 end of file?
         BEQ      DL_MOT9                           ;    end of file
         CMPA     #'1'                              ; should be a data record (S1) then!
         BNE      DL_ERR                            ;  none of these = load error
         JSR      GETBYTE                           ; get length
         BVS      DL_ERR                            ; report error
         TFR      A,E                               ; start checksum in E
         SUBA     #3                                ; adjust length (omit address and checksum)
         TFR      A,F                               ; set length in F
; Get address         
         JSR      GETBYTE                           ; get first byte of address
         BVS      DL_ERR                            ; report error
         TFR      A,B                               ; save for later
         ADDR     A,E                               ; include in checksum
         JSR      GETBYTE                           ; get next byte of address
         BVS      DL_ERR                            ; report error
         EXG      A,B                               ; swap address halves (endian stuff)
         TFR      D,X                               ; set pointer
         ADDR     B,E                               ; include in checksum
; Get data bytes         
         BSR      DL_BYTES
         BVS      DL_ERR
; get checksum byte
         JSR      GETBYTE                           
         BVS      DL_ERR                            ; report error
         ADDR     A,E                               ; add to computed checksum
         INCE                                       ; test for success
         BEQ      DL_RTS                            ; download ok

; Error occurred on loading
DL_ERR   LDA      #$FF                              ; A=$FF if an error occurred (N is set, Z is clear)
         RTS

; properly handle S9 end record (just eat it)
DL_MOT9  JSR      GETBYTE                           ; get length byte
         BVS      DL_ERR                            ; report error
         TFR      A,F                               ; save length
DL_MOT10 JSR      GETBYTE                           ; get next byte (ignore it)
         DECF                                       ; reduce length
         BNE      DL_MOT10                          ; get all the bytes
; fall into DLEOF...

; Record download successful, EOF marker encountered
DL_EOF   LDA      #$01                              ; A=$01 if EOF is reached (N and Z both clear)
         RTS

; Record download successful, expecting another record
DL_RTS   CLRA                                       ; A=$00 if another record is needed (Z set, N clear)
         RTS

; Download F number of bytes from console, storing in memory at X, and 
; maintaining running checksum in E. Exit with V=1 on error.
DL_BYTES TSTF                                       ; examine # of bytes to get
         BEQ      D?LBX                             ;   zero, nothing to do!
         JSR      GETBYTE                           ; get data byte
         BVS      D?LBX                             ; exit with V=1 on error
         STA      ,X+                               ; Write to memory
         ADDR     A,E                               ; include in checksum
         DECF                                       ; reduce length
         BNE      DL_BYTES                          ; Do them all
D?LBX    RTS

; Download record in INTEL format
DL_INT   JSR      GETBYTE                           ; get count
         BVS      DL_ERR                            ; report error
         TFR      A,E                               ; start checksum in E
         TFR      A,F                               ; set length in F
; Get address
         JSR      GETBYTE                           ; get first byte of address
         BVS      DL_ERR                            ; report error
         TFR      A,B                               ; Save for later
         ADDR     A,E                               ; include in checksum
         JSR      GETBYTE                           ; get next byte of address
         BVS      DL_ERR                            ; report error
         EXG      A,B                               ; Swap
         TFR      D,X                               ; Set pointer
         ADDR     B,E                               ; include in checksum
; Get record type
         INCF                                       ; temporarily increment length (EOF 0->1)
         JSR      GETBYTE                           ; get type value
         BVS      DL_ERR                            ; report error
         CMPA     #1                                ; EOF record?
         BEQ      DL_MOT10                          ;   yes, eat 1 byte and return with EOF status
         ADDR     A,E                               ; include type in checksum
         DECF                                       ; back to correct length 
; Get data bytes
         BSR      DL_BYTES                          ; get F# of data bytes (return with zero length)
         BVS      DL_ERR                            ; report error
; Get checksum
         JSR      GETBYTE                           ; Read checksum byte
         BVS      DL_ERR                            ; Report error
         ADDR     A,E                               ; add to computed checksum
         BEQ      DL_RTS                            ; Report success
         BRA      DL_ERR                            ; Report failure

         ORG      JUMP_TABLE
         FDB      SCC_InitA                         ; initialize SCC channel A
         FDB      SCC_InitB                         ; initialize SCC channel B
         FDB      GETCH                             ; wait for character from CONSOLE
         FDB      GETCH1                            ; attempt to get character from CONSOLE
         FDB      GETNIB                            ; get a HEX NYBBLE from CONSOLE
         FDB      GETBYTE                           ; get a HEX BYTE from CONSOLE
         FDB      GETBDIG                           ; get a bounded hex digit from CONSOLE
         FDB      W_GETLNZ                          ; get a ^X/CR terminated line from CONSOLE
         FILL $00,(4*2)                             ; room for future expansion                  
         FDB      PUTCH                             ; output character to CONSOLE
         FDB      PUTHEX                            ; output HEX NYBBLE to CONSOLE
         FDB      PUTBYTE                           ; output HEX BYTE to CONSOLE
         FDB      PUTWORD                           ; output HEX WORD to CONSOLE
         FDB      PUTMSG                            ; output ASCIIZ message at PC to CONSOLE
         FDB      PUTSTR                            ; output ASCIIZ message at X to CONSOLE
         FDB      PUTCR                             ; output a CR+LF to CONSOLE
         FILL $00,(4*2)                             ; room for future expansion         
         FDB      DBGETCH1                          ; attempt to get character from DEBUG
         FDB      DBPUTCH                           ; output character to DEBUG
         FDB      CIO_Initialize                    ; initialize CIO to default state
         FDB      CIO_ReadReg                       ; read CIO register
         FDB      CIO_WriteReg                      ; write CIO register
         FILL $00,(2*2)                             ; room for future expansion
         FDB      RTC_ReadByte                      ; read byte from I2C RTC
         FDB      RTC_ReadBlock                     ; read block of bytes from I2C RTC
         FDB      RTC_ReadRegs                      ; read I2C RTC registers 0-15
         FDB      RTC_WriteByte                     ; write byte to I2C RTC
         FDB      RTC_WriteBlock                    ; write block of bytes to I2C RTC
         FDB      RTC_WriteRegs                     ; write I2C RTC registers 0-15
         FDB      RTC_FmtTime                       ; create formatted ASCII time string
         FDB      RTC_FmtDate                       ; create formatted ASCII date string
         FILL $00,(4*2)                             ; room for future expansion         
         FDB      SPI_Read                          ; SPI read byte (send $FF)
         FDB      SPI_ReadBlock                     ; SPI read block (send $FF)
         FDB      SPI_Write                         ; SPI write byte
         FDB      SPI_WriteBlock                    ; SPI write block         
         FILL $00,(4*2)                             ; room for future expansion                  
         FDB      SD_Initialize                     ; initialize SD card
         FDB      SD_SendCmd                        ; send command to SD card, get R1 response
         FDB      SD_GetR7                          ; get R7 response after command
         FDB      SD_ReadBlock                      ; read LBA block from SD card
         FDB      SD_WriteBlock                     ; write LBA block to SD card
         FDB      SD_WaitReady                      ; wait for SD card to complete write operation
         FILL $00,(4*2)                             ; room for future expansion
         FDB      DELAYMS                           ; delay X * ms
         FDB      DELAYUS                           ; delay X * 10us
         FDB      MOVEMON                           ; move MONITOR to RAM, select RAM
         FDB      DL_START                          ; HEXFILE DOWNLOAD via CONSOLE port
         FDB      W_GETLINE                         ; get CR/^X terminated ASCII input line
         FILL $00,(HARD_VECT-*-2)         
         FDB      _MONITOR_REV                      ; monitor revision (e.g. $01,$41)

; VECTORS THROUGH RAM
         ORG      HARD_VECT
         FDB      TRAP_ENT                          ; fff0 (reserved/trap)
         FDB      SWI3_ENT                          ; fff2 (SWI3)
         FDB      SWI2_ENT                          ; fff4 (SWI2)
         FDB      FIRQ_ENT                          ; fff6 (FIRQ)
         FDB      IRQ_ENT                           ; fff8 (IRQ)
         FDB      SWI_ENT                           ; fffa (SWI/breakpoint)
         FDB      NMI_ENT                           ; fffc (NMI)
V_RESET
         FDB      RESET                             ; fffe reset
;
         END      RESET
