*  6309 Debug monitor for use with NOICE09
*
*  This is intended as a generic 6309 monitor.
*  If your target is a Tandy Color Computer, see moncoco.asm
*
*  Copyright (c) 1992-2006 by John Hartman
*
*  Modification History:
*    13-Mar-2006 JLH ported from 6809 version with assistance from Robert Gault
*     8-Mar-2016 TJL corrected bug in the RUN_TARGET handler 
*
*============================================================================
*
*  To customize for a given target, you must change code in the
*  hardware equates, the string TSTG, and the routines RESET and REWDT.
*  You may or may not need to change GETCHAR, PUTCHAR, depending on
*  how peculiar your UART is.
*
*  This file has been assembled with the Motorola Freeware assembler
*  available from the Motorola Freeware BBS and elsewhere.
*   BUT:  you must first "comment out" the conditionals as required,
*   because the Motorola assemblers do not have any IFEQ/ELSE/ENDIF
*
*  This file may also be assembled with the Dunfield assembler
*
*  To add mapped memory support:
*       1) Define map port MAPREG here
*       2) Define or import map port RAM image MAPIMG here if MAPREG is
*          write only.  (The application code must update MAPIMG before
*          outputing to MAPREG)
*       3) Search for and modify MAPREG, MAPIMG, and REG_PAGE usage below
*       4) In TSTG below edit "LOW AND HIGH LIMIT OF MAPPED MEM"
*          to appropriate range (typically 4000H to 07FFFH for two-bit MMU)
*
*============================================================================
*
*  I/O equates for Heng's ROM emulator (set true if used)
***ROMEM   SET     1
*
*============================================================================
*  HARDWARE PLATFORM CUSTOMIZATIONS
*
RAM_START       EQU     $D800           START OF MONITOR RAM
ROM_START       EQU     $FC00           START OF MONITOR CODE
HARD_VECT       EQU     $FFF0           START OF HARDWARE VECTORS

*============================================================================
*  Equates for memory mapped 16450 serial port on Heng's ROM emulator board
*;*        IFEQ ROMEM,1
*
S16450  equ     $A000           base of 16450 UART
RXR     equ     0                 Receiver buffer register
TXR     equ     0                 Transmitter buffer register
IER     equ     1                 Interrupt enable register
LCR     equ     3                 Line control register
MCR     equ     4                 Modem control register
DTR     equ     1                 Bit equate used to control status LED
LSR     equ     5                 Line status register
*
*  Define monitor serial port
SER_STATUS      EQU     S16450+LSR
SER_RXDATA      EQU     S16450+RXR
SER_TXDATA      EQU     S16450+TXR
RXRDY           EQU     $01              BIT MASK FOR RX BUFFER FULL
TXRDY           EQU     $20              BIT MASK FOR TX BUFFER EMPTY

*;*        ELSE
*
*  Put you UART equates here
*;*SER_STATUS      EQU     $301
*;*SER_RXDATA      EQU     $300
*;*SER_TXDATA      EQU     $300
*;*RXRDY           EQU     $08
*;*TXRDY           EQU     $10
*
*;*        ENDIF
*
*  Watchdog timer (if any)  See REWDT for use
WDT             EQU     $207
*
*  Condition code bits
C       EQU     1
I       EQU     10H
F       EQU     40H
E       EQU     80H
*
*============================================================================
*  RAM definitions:
        ORG     RAM_START
*
*  RAM interrupt vectors (first in SEG for easy addressing, else move to
*  their own SEG)
NVEC            EQU     8               number of vectors
RAMVEC          RMB     2*NVEC
*
*  Initial user stack
*  (Size and location is user option)
                RMB     64
INITSTACK
*
*  Monitor stack
*  (Calculated use is at most 7 bytes.  Leave plenty of spare)
                RMB     16
MONSTACK
*
TEST_STACK      RMB     14
* It is not possible to read bits 0&1 of regMD so the next three lines enable
* testing of these bits.
E_FLAG          RMB     1               0=not set $80=set
S_IMAGE         RMB     2               temporary store for regS
*  Target registers:  order must match that in TRGHC11.C
TASK_REGS
REG_STATE       RMB     1
REG_PAGE        RMB     1
REG_SP          RMB     2
REG_U           RMB     2
REG_Y           RMB     2
REG_X           RMB     2
REG_F           RMB     1               F BEFORE E, SO W IS LEAST SIG. FIRST
REG_E           RMB     1
REG_B           RMB     1               B BEFORE A, SO D IS LEAST SIG. FIRST
REG_A           RMB     1
REG_DP          RMB     1
REG_CC          RMB     1
REG_MD          RMB     1
REG_V           RMB     2
REG_PC          RMB     2
TASK_REG_SZ     EQU     *-TASK_REGS
*
*  Communications buffer
*  (Must be at least as long as TASK_REG_SZ.  At least 19 bytes recommended.
*  Larger values may improve speed of NoICE memory move commands.)
COMBUF_SIZE     EQU     128             DATA SIZE FOR COMM BUFFER
COMBUF          RMB     2+COMBUF_SIZE+1 BUFFER ALSO HAS FN, LEN, AND CHECK
*
RAM_END         EQU     *               ADDRESS OF TOP+1 OF RAM
*
*===========================================================================
        ORG     ROM_START
*
*  Power on reset
RESET
*
*  Set CPU mode to safe state
        ORCC    #I+F            INTERRUPTS OFF
        LDS     #MONSTACK       CLEAN STACK IS HAPPY STACK
*
*----------------------------------------------------------------------------
*;*        IFEQ ROMEM,1
*
*  Initialize S16450 UART on ROM emulator
*
*  Delay here in case the UART has not come out of reset yet.
        LDX     #0
LOP     LEAX    -1,X                    DELAY FOR SLOW RESETTING UART
        NOP
        NOP
        BNE     LOP
*
*  access baud generator, no parity, 1 stop bit, 8 data bits
        LDA     #$83
        STA     S16450+LCR
*
*  fixed baud rate of 19200:  crystal is 3.686400 Mhz.
*  Divisor is 3,686400/(16*baud)
        LDA     #12                     fix at 19.2 kbaud
        STA     S16450+RXR              lsb
        LDA     #0
        STA     S16450+RXR+1            msb=0
*
*  access data registers, no parity, 1 stop bits, 8 data bits
        LDA     #$03
        STA     S16450+LCR
*
*  no loopback, OUT2 on, OUT1 on, RTS on, DTR (LED) on
        LDA     #$0F
        STA     S16450+MCR
*
*  disable all interrupts: modem, receive error, transmit, and receive
        LDA     #$00
        STA     S16450+IER

*;*        ELSE
*
*  Initialize your UART here

*;*        ENDIF
*
*----------------------------------------------------------------------------
*
*  Initialize RAM interrupt vectors
        LDY     #INT_ENTRY      ADDRESS OF DEFAULT HANDLER
        LDX     #RAMVEC         POINTER TO RAM VECTORS
        LDB     #NVEC           NUMBER OF VECTORS
RES10   STY     ,X++            SET VECTOR
        DECB
        BNE     RES10
*
*  Initialize user registers
        LDD     #INITSTACK
        STA     REG_SP+1                INIT USER'S STACK POINTER MSB
        STB     REG_SP                  LSB
*
        LDD     #0
        STD     REG_PC
        STA     REG_A
        STA     REG_B
        STA     REG_E
        STA     REG_F
        STA     REG_DP
        STA     REG_MD
        STD     REG_X
        STD     REG_Y
        STD     REG_U
        STD     REG_V
        STA     REG_STATE               initial state is "RESET"
*
*  Initialize memory paging variables and hardware (if any)
        STA     REG_PAGE                initial page is zero
*;;;    STA     MAPIMG
*;;;    STA     MAPREG                  set hardware map
*
        LDA     #E+I+F                  state "all regs pushed", no ints
        STA     REG_CC
*
*  Set function code for "GO".  Then if we reset after being told to
*  GO, we will come back with registers so user can see the crash
        LDA     #FN_RUN_TARG
        STA     COMBUF
        JMP     RETURN_REGS             DUMP REGS, ENTER MONITOR
*
*===========================================================================
*  Get a character to A
*
*  Return A=char, CY=0 if data received
*         CY=1 if timeout (0.5 seconds)
*
*  Uses 6 bytes of stack including return address
*
GETCHAR
        PSHS    X
        LDX     #0              LONG TIMEOUT
GC10    JSR     REWDT           PREVENT WATCHDOG TIMEOUT
        LEAX    -1,X
        BEQ     GC90            EXIT IF TIMEOUT
        LDA     SER_STATUS      READ DEVICE STATUS
        ANDA    #RXRDY
        BEQ     GC10            NOT READY YET.
*
*  Data received:  return CY=0. data in A
        CLRA                    CY=0
        LDA     SER_RXDATA      READ DATA
        PULS    X,PC
*
*  Timeout:  return CY=1
GC90    ORCC    #C              CY=1
        PULS    X,PC
*
*===========================================================================
*  Output character in A
*
*  Uses 5 bytes of stack including return address
*
PUTCHAR
        PSHS    A
PC10    JSR     REWDT           PREVENT WATCHDOG TIMEOUT
        LDA     SER_STATUS      CHECK TX STATUS
        ANDA    #TXRDY          RX READY ?
        BEQ     PC10
        PULS    A
        STA     SER_TXDATA      TRANSMIT CHAR.
        RTS
*
*======================================================================
*
*  RESET WATCHDOG TIMER.  MUST BE CALLED AT LEAST ONCE EVERY LITTLE WHILE
*  OR COP INTERRUPT WILL OCCUR
*
*  Uses 2 bytes of stack including return address
*
REWDT   CLRA
        STA     WDT
        INCA
        STA     WDT             CU-style WDT:  must leave bit high
        RTS
*
*======================================================================
*  Response string for GET TARGET STATUS request
*  Reply describes target:
TSTG    FCB     17                      2: PROCESSOR TYPE = 6309
        FCB     COMBUF_SIZE             3: SIZE OF COMMUNICATIONS BUFFER
        FCB     0                       4: NO TASKING SUPPORT
        FDB     0,0                     5-8: LOW AND HIGH LIMIT OF MAPPED MEM (NONE)
        FCB     B1-B0                   9:  BREAKPOINT INSTR LENGTH
B0      SWI                             10: BREAKPOINT INSTRUCTION
B1      FCC     '6309 monitor V1.0'     DESCRIPTION, ZERO
        FCB     0
TSTG_SIZE       EQU     *-TSTG          SIZE OF STRING
*
*======================================================================
*  HARDWARE PLATFORM INDEPENDENT EQUATES AND CODE
*
*  Communications function codes.
FN_GET_STAT     EQU     $FF    reply with device info
FN_READ_MEM     EQU     $FE    reply with data
FN_WRITE_M      EQU     $FD    reply with status (+/-)
FN_READ_RG      EQU     $FC    reply with registers
FN_WRITE_RG     EQU     $FB    reply with status
FN_RUN_TARG     EQU     $FA    reply (delayed) with registers
FN_SET_BYTE     EQU     $F9    reply with data (truncate if error)
FN_IN           EQU     $F8    input from port
FN_OUT          EQU     $F7    output to port
*
FN_MIN          EQU     $F7    MINIMUM RECOGNIZED FUNCTION CODE
FN_ERROR        EQU     $F0    error reply to unknown op-code
*
*===========================================================================
*  Common handler for default interrupt handlers
*  Enter with A=interrupt code = processor state
*  All registers stacked, PC=next instruction
*
*  If 6809 mode, stack has CC A B DP XH XL YH YL UH UL PCH PCL
*  If 6309 mode, stack has CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
*
INT_ENTRY
        STA     REG_STATE       SAVE STATE
*
*  Save registers from stack to reg block for return to master
*  Host wants least significant bytes first, so flip as necessary
        PULS    A
        STA     REG_CC          CONDITION CODES
        PULS    A
        STA     REG_A           A
        PULS    A
        STA     REG_B           B

*  If native mode, E and F are on stack
*  If 6809 mode, E and F are in registers, unchanged from interrupt til here
        JSR     MD_TEST
        BNE     IE_10           Jump if 6809 mode
        PULSW                   else native: get from stack
IE_10   STE     REG_E
        STF     REG_F

*  V isn't on the stack, but we haven't touched it.  Copy to RAM
        TFR     V,D
        STA     REG_V+1         MSB V
        STB     REG_V           LSB V

*  There seems to be no way to store MD, and no way to load it except immediate
*  Thus we have to construct it by BITMD
        LDA     REG_MD
        AND     #$03            save only bits 1 and 0 (set by MD_TEST)
        BITMD   #$40
        BEQ     IE_11
        ORA     #$40
IE_11   BITMD   #$80
        BEQ     IE_12
        ORA     #$80
IE_12   STA     REG_MD

        PULS    A
        STA     REG_DP          DP
        PULS    D
        STA     REG_X+1         MSB X
        STB     REG_X           LSB X
        PULS    D
        STA     REG_Y+1         MSB Y
        STB     REG_Y           LSB Y
        PULS    D
        STA     REG_U+1         MSB U
        STB     REG_U           LSB U
*
*  If this is a breakpoint (state = 1), then back up PC to point at SWI
        PULS    X               PC AFTER INTERRUPT
        LDA     REG_STATE
        CMPA    #1
        BNE     NOTBP           BR IF NOT A BREAKPOINT
        LEAX    -1,X            ELSE BACK UP TO POINT AT SWI LOCATION
NOTBP   TFR     X,D             TRANSFER PC TO D
        STA     REG_PC+1        MSB
        STB     REG_PC          LSB
        JMP     ENTER_MON       REG_PC POINTS AT POST-INTERRUPT OPCODE
*
*===========================================================================
*  Main loop  wait for command frame from master
*
*  Uses 6 bytes of stack including return address
*
MAIN    LDS     #MONSTACK               CLEAN STACK IS HAPPY STACK
        LDX     #COMBUF                 BUILD MESSAGE HERE
*
*  First byte is a function code
        JSR     GETCHAR                 GET A FUNCTION (6 bytes of stack)
        BCS     MAIN                    JIF TIMEOUT: RESYNC
        CMPA    #FN_MIN
        BLO     MAIN                    JIF BELOW MIN: ILLEGAL FUNCTION
        STA     ,X+                     SAVE FUNCTION CODE
*
*  Second byte is data byte count (may be zero)
        JSR     GETCHAR                 GET A LENGTH BYTE
        BCS     MAIN                    JIF TIMEOUT: RESYNC
        CMPA    #COMBUF_SIZE
        BHI     MAIN                    JIF TOO LONG: ILLEGAL LENGTH
        STA     ,X+                     SAVE LENGTH
        CMPA    #0
        BEQ     MA80                    SKIP DATA LOOP IF LENGTH = 0
*
*  Loop for data
        TFR     A,B                     SAVE LENGTH FOR LOOP
MA10    JSR     GETCHAR                 GET A DATA BYTE
        BCS     MAIN                    JIF TIMEOUT: RESYNC
        STA     ,X+                     SAVE DATA BYTE
        DECB
        BNE     MA10
*
*  Get the checksum
MA80    JSR     GETCHAR                 GET THE CHECKSUM
        BCS     MAIN                    JIF TIMEOUT: RESYNC
        PSHS    A                       SAVE CHECKSUM
*
*  Compare received checksum to that calculated on received buffer
*  (Sum should be 0)
        JSR     CHECKSUM
        ADDA    ,S+                     ADD SAVED CHECKSUM TO COMPUTED
        BNE     MAIN                    JIF BAD CHECKSUM
*
*  Process the message.
        LDX     #COMBUF
        LDA     ,X+                     GET THE FUNCTION CODE
        LDB     ,X+                     GET THE LENGTH
        CMPA    #FN_GET_STAT
        BEQ     TARGET_STAT
        CMPA    #FN_READ_MEM
        BEQ     JREAD_MEM
        CMPA    #FN_WRITE_M
        BEQ     JWRITE_MEM
        CMPA    #FN_READ_RG
        BEQ     JREAD_REGS
        CMPA    #FN_WRITE_RG
        BEQ     JWRITE_REGS
        CMPA    #FN_RUN_TARG
        BEQ     JRUN_TARGET
        CMPA    #FN_SET_BYTE
        BEQ     JSET_BYTES
        CMPA    #FN_IN
        BEQ     JIN_PORT
        CMPA    #FN_OUT
        BEQ     JOUT_PORT
*
*  Error: unknown function.  Complain
        LDA     #FN_ERROR
        STA     COMBUF          SET FUNCTION AS "ERROR"
        LDA     #1
        JMP     SEND_STATUS     VALUE IS "ERROR"
*
*  long jumps to handlers
JREAD_MEM       JMP     READ_MEM
JWRITE_MEM      JMP     WRITE_MEM
JREAD_REGS      JMP     READ_REGS
JWRITE_REGS     JMP     WRITE_REGS
JRUN_TARGET     JMP     RUN_TARGET
JSET_BYTES      JMP     SET_BYTES
JIN_PORT        JMP     IN_PORT
JOUT_PORT       JMP     OUT_PORT

*===========================================================================
*
*  Target Status:  FN, len
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
TARGET_STAT
        LDX     #TSTG                   DATA FOR REPLY
        LDY     #COMBUF+1               POINTER TO RETURN BUFFER
        LDB     #TSTG_SIZE              LENGTH OF REPLY
        STB     ,Y+                     SET SIZE IN REPLY BUFFER
TS10    LDA     ,X+                     MOVE REPLY DATA TO BUFFER
        STA     ,Y+
        DECB
        BNE     TS10
*
*  Compute checksum on buffer, and send to master, then return
        JMP     SEND

*===========================================================================
*
*  Read Memory:  FN, len, page, Alo, Ahi, Nbytes
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
READ_MEM
*
*  Set map
*;;;    LDA     0,X
*;;;    STA     MAPIMG
*;;;    STA     MAPREG
*
*  Get address
        LDA     2,X                     MSB OF ADDRESS IN A
        LDB     1,X                     LSB OF ADDRESS IN B
        TFR     D,Y                     ADDRESS IN Y
*
*  Prepare return buffer: FN (unchanged), LEN, DATA
        LDB     3,X                     NUMBER OF BYTES TO RETURN
        STB     COMBUF+1                RETURN LENGTH = REQUESTED DATA
        BEQ     GLP90                   JIF NO BYTES TO GET
*
*  Read the requested bytes from local memory
GLP     LDA     ,Y+                     GET BYTE
        STA     ,X+                     STORE TO RETURN BUFFER
        DECB
        BNE     GLP
*
*  Compute checksum on buffer, and send to master, then return
GLP90   JMP     SEND

*===========================================================================
*
*  Write Memory:  FN, len, page, Alo, Ahi, (len-3 bytes of Data)
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
*  Uses 6 bytes of stack
*
WRITE_MEM
*
*  Set map
        LDA     ,X+
*;;;    STA     MAPIMG
*;;;    STA     MAPREG
*
*  Get address
        LDB     ,X+                     LSB OF ADDRESS IN B
        LDA     ,X+                     MSB OF ADDRESS IN A
        TFR     D,Y                     ADDRESS IN Y
*
*  Compute number of bytes to write
        LDB     COMBUF+1                NUMBER OF BYTES TO RETURN
        SUBB    #3                      MINUS PAGE AND ADDRESS
        BEQ     WLP50                   JIF NO BYTES TO PUT
*
*  Write the specified bytes to local memory
        PSHS    B,X,Y
WLP     LDA     ,X+                     GET BYTE TO WRITE
        STA     ,Y+                     STORE THE BYTE AT ,Y
        DECB
        BNE     WLP
*
*  Compare to see if the write worked
        PULS    B,X,Y
WLP20   LDA     ,X+                     GET BYTE JUST WRITTEN
        CMPA    ,Y+
        BNE     WLP80                   BR IF WRITE FAILED
        DECB
        BNE     WLP20
*
*  Write succeeded:  return status = 0
WLP50   LDA     #0                      RETURN STATUS = 0
        BRA     WLP90
*
*  Write failed:  return status = 1
WLP80   LDA     #1

*  Return OK status
WLP90   JMP     SEND_STATUS

*===========================================================================
*
*  Read registers:  FN, len=0
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
READ_REGS
*
*  Enter here from SWI after "RUN" and "STEP" to return task registers
RETURN_REGS
        LDY     #TASK_REGS              POINTER TO REGISTERS
        LDB     #TASK_REG_SZ            NUMBER OF BYTES
        LDX     #COMBUF+1               POINTER TO RETURN BUFFER
        STB     ,X+                     SAVE RETURN DATA LENGTH
*
*  Copy the registers
GRLP    LDA     ,Y+                     GET BYTE TO A
        STA     ,X+                     STORE TO RETURN BUFFER
        DECB
        BNE     GRLP
*
*  Compute checksum on buffer, and send to master, then return
        JMP     SEND

*===========================================================================
*
*  Write registers:  FN, len, (register image)
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
WRITE_REGS
*
        TSTB                            NUMBER OF BYTES
        BEQ     WRR80                   JIF NO REGISTERS
*
*  Copy the registers
        LDY     #TASK_REGS              POINTER TO REGISTERS
WRRLP   LDA     ,X+                     GET BYTE TO A
        STA     ,Y+                     STORE TO REGISTER RAM
        DECB
        BNE     WRRLP
*
*  Return OK status
WRR80   CLRA
        JMP     SEND_STATUS

*===========================================================================
*
*  Run Target:  FN, len
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
RUN_TARGET
*
*  Restore user's map
**      LDA     REG_PAGE                USER'S PAGE
**      STA     MAPIMG                  SET IMAGE
**      STA     MAPREG                  SET MAPPING REGISTER
*
*  Switch to user stack
        LDA     REG_SP+1                BACK TO USER STACK
        LDB     REG_SP
        TFR     D,S                     TO S
*
*  Restore MD, as it affects stack building and RTI
*  Only bits 1 and 0 can be written, and only using LDMD #
*  It's time for some self-modifying code!  Build LDMD #xxx, RTS in RAM and call it.
        LDD     #$113D                  LDMD #imm
        STD     COMBUF+30               Start code string
        LDA     REG_MD                  #imm is desired MD value
        STA     COMBUF+32
        LDA     #$39                    RTS
        STA     COMFUB+33
        JSR     COMBUF+30
*
*  Restore V, which isn't on the stack
        LDA     REG_V+1
        LDB     REG_V
        TFR     D,V
*
*  Restore registers
        LDA     REG_PC+1                MS USER PC FOR RTI
        LDB     REG_PC                  LS USER PC FOR RTI
        PSHS    D
*
        LDA     REG_U+1
        LDB     REG_U
        PSHS    D
*
        LDA     REG_Y+1
        LDB     REG_Y
        PSHS    D
*
        LDA     REG_X+1
        LDB     REG_X
        PSHS    D
*
        LDA     REG_DP
        PSHS    A
*
*  Restore W from memory (not used between here and RTI)
        LDE     REG_E
        LDF     REG_F
        LDA     REG_MD
        BITA    #1
        BEQ     RT_10                   jump if 6809 mode
        PUSHSW                          else push W on stack for RTI
RT_10
*
        LDA     REG_B
        PSHS    A
*
        LDA     REG_A
        PSHS    A
*
        LDA     REG_CC                  SAVE USER CONDITION CODES FOR RTI
        ORA     #E                      _MUST_ BE "ALL REGS PUSHED"
        PSHS    A
*
*  Return to user (conditioned by MD.0)
        RTI
*
*===========================================================================
*
*  Common continue point for all monitor entrances
*  SP = user stack
ENTER_MON
        TFR     S,D             USER STACK POINTER
        STA     REG_SP+1        SAVE USER'S STACK POINTER (MSB)
        STB     REG_SP          LSB
*
*  Change to our own stack
        LDS     #MONSTACK       AND USE OURS INSTEAD
*
*  Operating system variables
**      LDA     MAPIMG          GET CURRENT USER MAP
        LDA     #0              ... OR ZERO IF UNMAPPED TARGET
        STA     REG_PAGE        SAVE USER'S PAGE
*
*  Return registers to master
        JMP     RETURN_REGS

*===========================================================================
*
*  Set target byte(s):  FN, len { (page, alow, ahigh, data), (...)... }
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
*  Return has FN, len, (data from memory locations)
*
*  If error in insert (memory not writable), abort to return short data
*
*  This function is used primarily to set and clear breakpoints
*
*  Uses 1 byte of stack
*
SET_BYTES
        LDU     #COMBUF+1               POINTER TO RETURN BUFFER
        LDA     #0
        STA     ,U+                     SET RETURN COUNT AS ZERO
        LSRB
        LSRB                            LEN/4 = NUMBER OF BYTES TO SET
        BEQ     SB99                    JIF NO BYTES (COMBUF+1 = 0)
*
*  Loop on inserting bytes
SB10    PSHS    B                       SAVE LOOP COUNTER
*
*  Set map
*;;;    LDA     0,X
*;;;    STA     MAPIMG
*;;;    STA     MAPREG
*
*  Get address
        LDA     2,X                     MSB OF ADDRESS IN A
        LDB     1,X                     LSB OF ADDRESS IN B
        TFR     D,Y                     MEMORY ADDRESS IN Y
*
*  Read current data at byte location
        LDA     0,Y
*
*  Insert new data at byte location
        LDB     3,X                     GET BYTE TO STORE
        STB     0,Y                     WRITE TARGET MEMORY
*
*  Verify write
        CMPB    0,Y                     READ TARGET MEMORY
        PULS    B                       RESTORE LOOP COUNT, CC'S INTACT
        BNE     SB90                    BR IF INSERT FAILED: ABORT
*
*  Save target byte in return buffer
        STA     ,U+
        INC     COMBUF+1                COUNT ONE RETURN BYTE
*
*  Loop for next byte
        LEAX    4,X                     STEP TO NEXT BYTE SPECIFIER
        CMPB    COMBUF+1
        BNE     SB10                    *LOOP FOR ALL BYTES
*
*  Return buffer with data from byte locations
SB90
*
*  Compute checksum on buffer, and send to master, then return
SB99    JMP     SEND

*===========================================================================
*
*  Input from port:  FN, len, PortAddressLo, PAhi (=0)
*
*  While the 6809 has no input or output instructions, we retain these
*  to allow write-without-verify
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
IN_PORT
*
*  Get port address
        LDA     1,X                     MSB OF ADDRESS IN A
        LDB     0,X                     LSB OF ADDRESS IN B
        TFR     D,Y                     MEMORY ADDRESS IN Y
*
*  Read the requested byte from local memory
        LDA     0,Y
*
*  Return byte read as "status"
        JMP     SEND_STATUS

*===========================================================================
*
*  Output to port  FN, len, PortAddressLo, PAhi (=0), data
*
*  Entry with A=function code, B=data size, X=COMBUF+2
*
OUT_PORT
*
*  Get port address
        LDA     1,X                     MSB OF ADDRESS IN A
        LDB     0,X                     LSB OF ADDRESS IN B
        TFR     D,Y                     MEMORY ADDRESS IN Y
*
*  Get data
        LDA     2,X
*
*  Write value to port
        STA     0,Y
*
*  Do not read port to verify (some I/O devices don't like it)
*
*  Return status of OK
        CLRA
        JMP     SEND_STATUS

*===========================================================================
*  Build status return with value from "A"
*
SEND_STATUS
        STA     COMBUF+2                SET STATUS
        LDA     #1
        STA     COMBUF+1                SET LENGTH
        BRA     SEND

*===========================================================================
*  Append checksum to COMBUF and send to master
*
SEND    JSR     CHECKSUM                GET A=CHECKSUM, X->checksum location
        NEGA
        STA     0,X                     STORE NEGATIVE OF CHECKSUM
*
*  Send buffer to master
        LDX     #COMBUF                 POINTER TO DATA
        LDB     1,X                     LENGTH OF DATA
        ADDB    #3                      PLUS FUNCTION, LENGTH, CHECKSUM
SND10   LDA     ,X+
        JSR     PUTCHAR                 SEND A BYTE
        DECB
        BNE     SND10
        JMP     MAIN                    BACK TO MAIN LOOP

*===========================================================================
*  Compute checksum on COMBUF.  COMBUF+1 has length of data,
*  Also include function byte and length byte
*
*  Returns:
*       A = checksum
*       X = pointer to next byte in buffer (checksum location)
*       B is scratched
*
CHECKSUM
        LDX     #COMBUF                 pointer to buffer
        LDB     1,X                     length of message
        ADDB    #2                      plus function, length
        LDA     #0                      init checksum to 0
CHK10   ADDA    ,X+
        DECB
        BNE     CHK10                   loop for all
        RTS                             return with checksum in A

***********************************************************************
*
*  Interrupt handlers to catch unused interrupts and traps
*  Registers are stacked.  Jump through RAM vector using X, type in A
*
*  This will affect only interrupt routines looking for register values!
*
*  Our default handler uses the code in "A" as the processor state to be
*  passed back to the host.
*

*  This is "reserved" on 6809
*  Used for Divide-by-zero and Illegal-instruction on 6309
RES_ENT     LDA     #7
            LDX     RAMVEC+0
            JMP     0,X
*
SWI3_ENT    LDA     #6
            LDX     RAMVEC+2
            JMP     0,X
*
SWI2_ENT    LDA     #5
            LDX     RAMVEC+4
            JMP     0,X
*
*  Will have only PC and CC's pushed unless we were waiting for an interrupt
*  or MD.1 is true.  Use CC's E bit to distinguish.
*  Push all registers here for common entry (else we can't use our RAM vector)
FIRQ_ENT    STA     REG_A       SAVE A REG
            PULS    A           GET CC'S FROM STACK
            BITA    #E
            BNE     FIRQ9       BR IF ALL REGISTERS PUSHED ALREADY

* CC.E was not set which means that regMD bit2 was not set and that bit in
* the image should be cleared. If CC.E is set, we can't tell what set it, a
* direct command, CWAI, or bit 1 of regMD.
*
* Push registers as if CC.E had been set
*  If 6809 mode, stack needs CC A B DP XH XL YH YL UH UL PCH PCL
*  If 6309 mode, stack needs CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
*
            CLR     E_FLAG
            LDA     REG_MD
            ANDA    #$FD        BIT1 must be clear, else all regs would have been pushed
            STA     REG_MD
            PSHS    U,Y,X,DP    push regs next below PC

            STW     REG_F       MD_TEST will not preserve regW
            JSR     MD_TEST
            PSHS    CC          Save result
            LDW     REG_F       Recover regW
            PULS    CC          Recover result of test
            BNE     FE1
            PSHSW
FE1         PSHS    B
            LDB     REG_A
            PSHS    B
            ORA     #E          SET AS "ALL REGS PUSHED"

FIRQ9       TST     E_FLAG
            BNE     FIRQ9B
            LDB     REG_MD      We got here with E_FLAG clear and CC.E set which
            ORB     #2          means regMD bit2 must be set.
            STB     REG_MD
FIRQ9B      PSHS    A           REPLACE CC'S
            LDA     #4
            LDX     RAMVEC+6
            JMP     0,X
*
IRQ_ENT     LDA     #3
            LDX     RAMVEC+8
            JMP     0,X
*
NMI_ENT     LDA     #2
            LDX     RAMVEC+12
            JMP     0,X
*
SWI_ENT     LDA     #1
            JMP     INT_ENTRY
*
*============================================================================
* TEST FOR BIT0 OF regMD:
* Exit emulation mode: regW=$1234
*      native    mode: regW=$0000
*
* Preserves W and V.  Other registers destroyed.
*
MD_TEST     
        PSHS    W
*
* If 6809 mode, RTI will pop 12 bytes: CC A B DP XH XL YH YL UH UL PCH PCL
* If 6309 mode, RTI will pop 14 bytes: CC A B E  F  DP XH XL YH YL UH  UL  PCH PCL
*
* Initialize TEST_STACK used for fake RTI. The return address will be MD_RETURN
* in both emulation and native modes. If native mode, regW will be cleared.
        LDX     #TEST_STACK

        LDA     #$80
        STA     ,X+                     CC with E set

        LDB     #9
RES11   CLR     ,X+                     zeros for other registers, including W
        DECB
        BNE     RES11

        LDD     #MD_RETURN
        STD     ,X++                    6809 return address, or 6309 U
        STD     ,X++                    6309 return address, or past 6809 stack

        STS     S_IMAGE
        LDS     #TEST_STACK
        LDW     #$1234
        RTI				if 6309 mode, W gets 0; else unchanged

MD_RETURN   
        LDS     S_IMAGE
        TSTW                            adjust CC.Z: set if 6309 mode
        PULS    W
        RTS
            
* VECTORS THROUGH RAM
        ORG     HARD_VECT

        FDB     RES_ENT                 fff0 (reserved/trap)
        FDB     SWI3_ENT                fff2 (SWI3)
        FDB     SWI2_ENT                fff4 (SWI2)
        FDB     FIRQ_ENT                fff6 (FIRQ)
        FDB     IRQ_ENT                 fff8 (IRQ)
        FDB     SWI_ENT                 fffa (SWI/breakpoint)
        FDB     NMI_ENT                 fffc (NMI)
        FDB     RESET                   fffe reset
*
        END     RESET
