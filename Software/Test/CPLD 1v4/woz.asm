        INCLUDE "hd6309_hardware.inc"

 ;  Condition Code Register bits
CC_C    EQU     $01
CC_V    EQU     $02
CC_Z    EQU     $04
CC_N    EQU     $08
CC_I    EQU     $10
CC_H    EQU     $20
CC_F    EQU     $40
CC_E    EQU     $80

 ;  Other defines
TRUE    EQU     1
FALSE   EQU     0
CR      EQU     $0D
LF      EQU     $0A
SPACE   EQU     ' '

 ;  ROM Monitor 1v4 jump points
GOWOZ   EQU     $E203
GONOICE EQU     $E206
GOBASIC EQU     $E209

 ;======================================================================
 ;         RAM STORAGE for WOZMON (RAM Based)
 ;======================================================================
        ORG     $0F80
 ;
 ;  Initial user stack
INITSTACK EQU   *               ; user stack starts below monitor stack
WOZ_RAM EQU     *               ; storage for WOZMON input buffer, vars (on $80 bounardy)

        ORG     $1000
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
W_OFFS  EQU     WOZ_RAM % 256

 ; next, establish the amount of line input buffer to allocate
W_INLEN EQU     120             ; line input buffer length

 ; then, determine xx,U offset for XAM variable, because this gets used w/o DP reg, also
W_XAM   EQU     W_INLEN

 ; finally, determine DP offset pointers to temporary variables
W_dXAM  EQU     W_OFFS+W_INLEN  ; XAM address (+120/121)
W_dST   EQU     W_OFFS+W_INLEN+2 ; STOR address  (+122/+123)   [A3 in new monitor]
W_dMODE EQU     W_OFFS+W_INLEN+4 ; 'mode' is XAM, STOR, BLOCK XAM (+124)
W_dTEMP EQU     W_OFFS+W_INLEN+5 ; temporary storage (+125)
DOT     EQU     '.'
HI_COL  EQU     ':'+$80         ; msb set Colon
HI_Q    EQU     'Q'+$80         ; msb set "Q" - QUIT to ROM monitor command
HI_R    EQU     'R'+$80         ; msb set "R" - RUN command
HI_X    EQU     'X'+$80         ; msb set "X" - HEX LOAD command
HI_M    EQU     'M'+$80         ; msb set "M" - MS BASIC command
HI_N    EQU     'N'+$80         ; msb set "N" - NOICE command
CTL_S   EQU     'S'-$40         ; control-S
CTL_H   EQU     'H'-$40         ; control-H
CTL_X   EQU     'X'-$40         ; control-X
DEL     EQU     127             ; "Delete"
ESC     EQU     '['-$40         ; ESCape

 ;; WOZMON - primary entry point
WOZMON:
        LDS     #INITSTACK      ; grow stack downward from reserved RAM
        LDU     #WOZ_RAM        ; point U at beginning of WOZ_RAM block

 ;; WOZMON2 - alternate entry point
 ;; inputs:  U = pointer to beginning of 128 bytes of RAM on same page boundary
 ;;          S = stack pointer already established!
WOZMON2:
        LEAX    W_INLEN,U       ; absolute address of FIRST variable in X
        TFR     X,DP            ; copy the MSB of the address to DP register
        JSR     SCC_InitA       ; init SCC channel A for 115.2kbps
        CLRW                    ; reset WORD value
        STW     <W_dXAM         ; reset XAM address
        STW     <W_dST          ; reset STORE address
        BRA     W_GETLINE       ; enter WOZMON

 ; Get a line of input from the keyboard, echoing to display.
 ; Normally enter at ESCAPE or GETLINE. Handle ^H and DEL as
 ; 'backspace' and ^X and ESC as 'cancel'. Otherwise accumulate
 ; characters in the buffer. Exit when a CR is received, and
 ; auto-cancel and resrtart when buffer length exceeds W_INLEN.
 ;
 ; U is pointer to line buffer and work variables
 ; B is the index into the buffer

W_NOTCR:
        CMPA    #CTL_H          ; CTRL-H? ["backspace"]
        BEQ     W_BACKSPC       ;   yes, back up a character
        CMPA    #DEL            ; DEL? ["delete"]
        BEQ     W_BACKSPC       ;   yes, back up a character
        CMPA    #CTL_X          ; CTRL-X? ["cancel"]
        BEQ     W_CANCEL        ;   yes, abort line
        CMPA    #ESC            ; ESC? ["escape"]
        BEQ     W_CANCEL
        INCB                    ; leave in buffer and advance text index.
        CMPB    #W_INLEN        ; are we at end of buffer?
        BLO     W_NEXTCHR       ;   no, get another character
W_CANCEL:
        LDA     #'\'
        JSR     PUTCH           ; output a \
W_GETLINE:
        JSR     PUTCR           ; start a new line
        LDA     #'!'
        JSR     PUTCH           ; output a * prompt
        LDB     #1              ; Set offset to 1 (decremented next line)
W_BACKSPC:
        DECB                    ; Back up text index.
        BMI     W_GETLINE       ; index<0 (start of line), reinitialize
W_NEXTCHR:
        JSR     GETCHT          ; get a character from UART Ch A
        STA     B,U             ; Add to text buffer.
        JSR     PUTCH           ; Display character.
        CMPA    #CR             ; CR?
        BNE     W_NOTCR         ;   not a CR, keep getting input chars
        ; fall into W_PARSE...

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
        CLRD                    ; clear both A and B (A used to set XAM mode soon)
        DECB                    ; (B) text index -1, to become zero at BLSKIP
W_SETMODE:
        STA     <W_dMODE        ; $00=XAM (0), $BA=STORE (-), $2E=BLOK XAM (+)
W_BLSKIP:
        INCB                    ; advance text index (B,U allows only 0...127)
W_NEXTITEM:
        LDA     B,U             ; Get character
        CMPA    #CR             ; is it a CR?
        BEQ     W_GETLINE       ;  yes, done this line.
        CMPA    #DOT            ; is it a period?
        BEQ     W_SETMODE       ; yes, set BLOCK XAM mode ($2E)
        BLS     W_BLSKIP        ;  less than periods are treated as delimiters
        ORA     #$80            ; convert high-bit set (for MODE stuff)
        CMPA    #HI_COL         ; is it a colon?
        BEQ     W_SETMODE       ;  yes, set STORE mode ($BA)
        CMPA    #HI_M           ; is it an "M"?  ("MS Basic")
        LBEQ    GOBASIC         ;   yes, jump to MS BASIC
        CMPA    #HI_N           ; is it an "N"?  ("NoICE")
        LBEQ    GONOICE         ;   yes, start NoICE debugger
        CMPA    #HI_Q           ; is it a "Q"? ("Quit")
        LBEQ    GOWOZ           ;   yes, exit to WOZMON (ROM)
        CMPA    #HI_R           ; is it an "R"?  ("Run")
        BEQ     W_RUN           ;   Yes, jump to current XAM index.
        CMPA    #HI_X           ; is it an "X"?  ("Hex")
        BEQ     W_XLOAD         ;   yes, try to load hexfile from console
W_NEWHEX:
        CLRW                    ; clear W (HI = E, LO = F)
        STB     <W_dTEMP        ; make a copy of text buffer index
W_NEXTHEX:
        LDA     B,U             ; Get character for hex test.
        EORA    #$30            ; Map digits to $0-9.
        CMPA    #$09            ; Digit?
        BLS     W_ADDDIG        ; Yes.
        ORA     #$20            ; convert lower to uppercase
        ADDA    #$89            ; Map letter "A"-"F" to $FA-FF.
        CMPA    #$F9            ; Hex letter?
        BLS     W_NOTHEX        ; No, character not hex.
W_ADDDIG:
        ANDA    #$0F            ; isolate the hex digit value ($0-$F)
        EXG     D,W             ; digit in 4lsb of E, WORD in D, buffer ptr in F
        ASLD                    ; shift WORD left 4 bits to make room
        ASLD                    ;   for the new hex nybble
        ASLD
        ASLD
        ORR     E,B             ; OR the new digit in WORD
        EXG     D,W             ; WORD back in W, buffer pointer back in B
        INCB                    ; advance text index
        BRA     W_NEXTHEX       ; Always taken. Check next character for hex.
W_RUN:
        JMP     [W_XAM,U]       ; RUN command, jump to address in XAM index
W_XLOAD:
        JSR     DL_START0       ; yes, try to download from host
        BRA     W_GETLINE       ; get a new input line

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
        CMPB    <W_dTEMP        ; Check if W empty (no hex digits parsed).
        LBEQ    W_CANCEL        ;  yes, bad input so handle as CANCEL
        CLR     <W_dTEMP        ; clear the 'flow control' byte
        TST     <W_dMODE        ; Test MODE byte.
        BPL     W_NOTSTOR       ; B7=1 for STOR, 0 for XAM and BLOCK XAM
        ; STOR mode
        LDX     <W_dST          ; use X to hold 'store index'
        STF     ,X+             ; store LSB of WORD at 'store index'
        STX     <W_dST          ; save the incremented 'store index'
        BRA     W_NEXTITEM      ; Get next command item.
W_NOTSTOR:
        BNE     W_XAMNEXT       ; mode = $00 for XAM, $56 for BLOCK XAM.
        ; non BLOCK XAM
        STW     <W_dST          ; copy word parsed into 'store index'
        STW     <W_dXAM         ; copy word parsed into 'XAM index'
        CLRA                    ; set Z=1 to cause address display to occur
        ; fall into NXTPRNT loop...
W_NXTPRNT:
        BNE     W_PRDATA        ; Z=0 means skip displaying address
        LDA     <W_dTEMP        ; check flow control byte
        BEQ     W?NXT1          ;  if zero, skip waiting for character
        JSR     GETCHT          ; yes, flow control in effect, wait for character
        CMPA    #CTL_X          ; did we get a ^X?
        LBEQ    W_GETLINE       ;  yes, exit and get new input line
        CMPA    #SPACE          ; did we get a SPACE
        BEQ     W?NXT1          ;  yes, set flow control to $20
        CLRA                    ; any other character, clear flow control
W?NXT1  STA     <W_dTEMP        ; update flow control byte
        JSR     GETCH1          ; attempt to read a character (A=0 if none)
        CMPA    #SPACE          ; is it a SPACE?
        BEQ     W?NXT2          ;   yes, set flow control to $20
        CMPA    #CTL_S          ; is it a ^S?
        BEQ     W?NXT2          ;  yes, set flow control as $13
        CMPA    #CTL_X          ; is it a ^X?
        LBEQ    W_GETLINE       ;  yes, exit and get new input line
        LDA     <W_dTEMP        ; flow unaffected by other characters
W?NXT2  STA     <W_dTEMP        ; update flow control byte
W?NXT3  JSR     PUTCR           ; CR for a new line
        LDA     <W_dXAM         ; 'XAM index' high-order byte.
        JSR     PUTBYTE
        LDA     <W_dXAM+1       ; Low-order 'Examine index' byte.
        JSR     PUTBYTE
        LDA     #':'            ; ":".
        JSR     PUTCH           ; Output it.
W_PRDATA:
        JSR     PUTSPACE        ; output a space
        LDA     [W_XAM,U]       ; Get data byte at 'examine index'.
        JSR     PUTBYTE         ; display it
W_XAMNEXT:
        LDX     <W_dXAM         ; use X to hold XAM index
        CMPR    W,X             ; compare XAM index to parsed address WORD
        LBEQ    W_NEXTITEM      ;  same, done examining memory
        LEAX    1,X             ; increment XAM index
        STX     <W_dXAM         ;  and save it
        LDA     <(W_dXAM+1)     ; Check low-order 'examine index' byte
        ANDA    #$07            ; set Z when 'examine index' MOD 8 = 0
        BRA     W_NXTPRNT       ; always taken

 ;;======================================================================
 ;; S-RECORD AND INTEL HEX CONSOLE DOWNLOAD FUNCTION
 ;;======================================================================

 ;;
 ;; DL_START - try to download a HEX file (either S9 or IHEX) from console
 ;; inputs: none
 ;; return: V=0 : successful load (A=0)
 ;;         V=1 : error during load (A=$FF)
 ;;
DL_START0:
        JSR     PUTMSG
        FCB     CR,LF
        FCN     "Hex Download"
        JSR     PUTCR           ; NEW LINE
DL_START:
        BSR     DL_REC          ; DOWNLOAD RECORD (A=00 ready for more)
        BNE     D?LO2           ;  if Z=0 then stop reading records
        JSR     PUTCONST        ; OUTPUT ONE DOT PER RECORD
        FCC     '.'
        BRA     DL_START        ; CONTINUE
D?LO2   BPL     D?LO3           ;  if N=0, no error occurred (A=01 means EOF)
        JSR     PUTMSG          ; error occurred
        FCB     CR,LF
        FCC     "ERR"
        FCB     $FF
        ORCC    #CC_V           ; set V (error)
        RTS
D?LO3   JSR     PUTMSG          ; load successful
        FCB     CR,LF
        FCC     "OK"
        FCB     $FF
        CLRA                    ; clear V (success)
        RTS

 ; Download a record in either MOTOROLA or INTEL hex format
DL_REC  JSR     GETCH           ; Get a character
        CMPA    #$03            ; Check for ^C (Break)
        BEQ     DL_ERR          ; yes, abort with error
        CMPA    #':'            ; Start of INTEL record?
        LBEQ    DL_INT          ; Yes, download INTEL
        CMPA    #'S'            ; Start of MOTOROLA record?
        BNE     DL_REC          ; No, keep looking

 ; Download a record in MOTOROLA hex format
DL_MOT  JSR     GETCH           ; get record type
        CMPA    #'0'            ; S0 header record?
        BEQ     DL_REC          ;    skip it
        CMPA    #'5'            ; S5 count record?
        BEQ     DL_REC          ;    skip it
        CMPA    #'9'            ; S9 end of file?
        BEQ     DL_MOT9         ;    end of file
        CMPA    #'1'            ; should be a data record (S1) then!
        BNE     DL_ERR          ;  none of these = load error
        JSR     GETBYTE         ; get length
        BVS     DL_ERR          ; report error
        TFR     A,E             ; start checksum in E
        SUBA    #3              ; adjust length (omit address and checksum)
        TFR     A,F             ; set length in F
        ; Get address
        JSR     GETBYTE         ; get first byte of address
        BVS     DL_ERR          ; report error
        TFR     A,B             ; save for later
        ADDR    A,E             ; include in checksum
        JSR     GETBYTE         ; get next byte of address
        BVS     DL_ERR          ; report error
        EXG     A,B             ; swap address halves (endian stuff)
        TFR     D,X             ; set pointer
        ADDR    B,E             ; include in checksum
        ; Get data bytes
        BSR     DL_BYTES
        BVS     DL_ERR
        ; get checksum byte
        JSR     GETBYTE
        BVS     DL_ERR          ; report error
        ADDR    A,E             ; add to computed checksum
        INCE                    ; test for success
        BEQ     DL_RTS          ; download ok

 ; Error occurred on loading
DL_ERR  LDA     #$FF            ; A=$FF if an error occurred (N is set, Z is clear)
        RTS

 ; properly handle S9 end record (just eat it)
DL_MOT9 JSR     GETBYTE         ; get length byte
        BVS     DL_ERR          ; report error
        TFR     A,F             ; save length
DL_MOT10 JSR    GETBYTE         ; get next byte (ignore it)
        DECF                    ; reduce length
        BNE     DL_MOT10        ; get all the bytes
        ; fall into DLEOF...

 ; Record download successful, EOF marker encountered
DL_EOF  LDA     #$01            ; A=$01 if EOF is reached (N and Z both clear)
        RTS

 ; Record download successful, expecting another record
DL_RTS  CLRA                    ; A=$00 if another record is needed (Z set, N clear)
        RTS

 ; Download F number of bytes from console, storing in memory at X, and
 ; maintaining running checksum in E. Exit with V=1 on error.
DL_BYTES TSTF                   ; examine # of bytes to get
        BEQ     D?LBX           ;   zero, nothing to do!
        JSR     GETBYTE         ; get data byte
        BVS     D?LBX           ; exit with V=1 on error
        STA     ,X+             ; Write to memory
        ADDR    A,E             ; include in checksum
        DECF                    ; reduce length
        BNE     DL_BYTES        ; Do them all
D?LBX   RTS

 ; Download record in INTEL format
DL_INT  JSR     GETBYTE         ; get count
        BVS     DL_ERR          ; report error
        TFR     A,E             ; start checksum in E
        TFR     A,F             ; set length in F
        ; Get address
        JSR     GETBYTE         ; get first byte of address
        BVS     DL_ERR          ; report error
        TFR     A,B             ; Save for later
        ADDR    A,E             ; include in checksum
        JSR     GETBYTE         ; get next byte of address
        BVS     DL_ERR          ; report error
        EXG     A,B             ; Swap
        TFR     D,X             ; Set pointer
        ADDR    B,E             ; include in checksum
        ; Get record type
        INCF                    ; temporarily increment length (EOF 0->1)
        JSR     GETBYTE         ; get type value
        BVS     DL_ERR          ; report error
        CMPA    #1              ; EOF record?
        BEQ     DL_MOT10        ;   yes, eat 1 byte and return with EOF status
        ADDR    A,E             ; include type in checksum
        DECF                    ; back to correct length
        ; Get data bytes
        BSR     DL_BYTES        ; get F# of data bytes (return with zero length)
        BVS     DL_ERR          ; report error
        ; Get checksum
        JSR     GETBYTE         ; Read checksum byte
        BVS     DL_ERR          ; Report error
        ADDR    A,E             ; add to computed checksum
        BEQ     DL_RTS          ; Report success
        BRA     DL_ERR          ; Report failure

 ;;
 ;; PUTCONST - ouptut character at PC to UART A.
 ;; inputs:  PC = address of character to output
 ;; return:  all registers preserved
 ;;
PUTCONST
        PSHS    A,X             ; preserve A,X
        LDX     3,S             ; get old PC
        LDA     ,X+             ; get character, increment past it (new PC)
        JSR     PUTCH           ; output character
        STX     3,S             ; store new PC
        PULS    A,X,PC

 ;;
 ;; PUTMSG - output NULL/FF terminated string at PC to SCC Channel A
 ;; terminate with either 0, or $FF (CRLF before terminates)
 ;; inputs: PC = address of string to output
 ;; return: all registers intact
 ;;
PUTMSG:
        PSHS    X               ; save old x
        LDX     2,S             ; get old pc
        BSR     PUTSTR          ; output string
        STX     2,S             ; update old pc
        PULS    X,PC            ; restore X and return

 ;;
 ;; PUTSTR - output NULL/FF terminated string at X to SCC Channel A
 ;; terminate with either 0, or $FF (CRLF before terminates)
 ;; inputs: X = address of string to output
 ;; return: X = terminator byte of string+1
 ;;
PUTSTR:
        PSHS    A               ; preserve A
P?S1    LDA     ,X+             ; get char from message
        BEQ     PSTRX?          ;  0 = end
        CMPA    #$FF            ; FF = newline end?
        LBEQ    PUTCR1          ;  yes, new line, exit via PUTCR
        JSR     PUTCH           ; output character to term
        BRA     P?S1            ; keep going
PSTRX?  PULS    A,PC            ; restore A and return

 ;;
 ;; GETBYTE - acquire an ASCII HEX byte from SCC Channel A and return in A
 ;; inputs: none
 ;; return: V=0 means input was valid, byte value in A
 ;;         V=1 means input was non-ASII HEX, A is destroyed
 ;;
GETBYTE:
        BSR     GETNIB          ; Get FIRST nibble
        BVS     GETB1?          ; Invalid, abort (V=1)
        LSLA                    ; Rotate
        LSLA                    ; into
        LSLA                    ; high
        LSLA                    ; nibble
        PSHS    A               ; Save for later
        BSR     GETNIB          ; Get SECOND nibble
        BVS     GETB2?          ;  bad, release storage and return with V=1
        ORA     ,S              ; Include high (and clear V)
GETB2?  LEAS    1,S             ; release stack storage (V unaffected)
GETB1?  RTS

 ;;
 ;; GETNIB - acquire an ASCII HEX nibble from SCC Channel A and return in A
 ;; inputs: none
 ;; return: V=0 means input was valid, nibble value in A
 ;;         V=1 means input was non-ASII HEX, A is preserved
 ;;
GETNIB:
        JSR     GETCHT          ; get a character
        SUBA    #'0'            ; Convert numbers
        CMPA    #9              ; Numeric?
        BLS     G?N1            ; Yes, OK
        SUBA    #7              ; Convert alphas
        CMPA    #10             ; Under?
        BLO     G?N2            ; Yes, error
        CMPA    #15             ; Over?
        BHI     G?N2            ; Yes, error
G?N1    ANDA    #$0F            ; V=0 indicates good input
        RTS
G?N2    ADDA    #$37            ; Normalize character
        ORCC    #CC_V           ; V=1 indicates non-hex input
        RTS

 ;;
 ;; SCC_InitA - Initialize SCC channel A to default
 ;; return: all registers preserved
 ;;
SCC_InitA:
        PSHS    A,X,Y           ; preserve A,X,Y
        LDY     #ZSCCAC         ; Y points to channel A command reg
        LDX     #SCCATBL        ; X points to channel A config table
        LDA     ,Y              ; reset register pointer to WR0/RR0
IS1?    LDA     ,X+             ; load address from table
        CMPA    #$FF            ; is it $FF? (end of table)
        BEQ     IS2?            ;    yes, done with init of channel
        STA     ,Y              ;    no, write the register pointer to WR0
        LDA     ,X+             ; get data byte from table
        STA     ,Y              ; write data to SCC command register
        BRA     IS1?            ; repeat until EOT reached..
IS2?    PULS    A,X,Y,PC        ; restore registers and return

 ; Initialization table for SCC Channel A in ASYNC mode, external 16x clock
 ; ACLK from CPLD is 1.843 MHz. 1.843 / 16 = 115.2kbps (USB VCP interface)
SCCATBL:
        FCB     $09,$80         ; Point to WR9; Reset Ch A
        FCB     $09,$00         ; Point to WR9; un-reset CH A
        FCB     $04,$44         ; Point to WR4; X16 clock,1 Stop,NP
        FCB     $03,$C1         ; Point to WR3; Enable receiver, No Auto Enable (Hardware CTS), Receive 8 bits
        FCB     $05,$EA         ; Point to WR5; Enable, Transmit 8 bits RTS,DTR, Enable
        FCB     $0B,$05         ; Point to WR11; RX clock = TX clock = RTXC pin; TRXC pin = xmit clock
        FCB     $0F,$00         ; Point to WR15; no INT from hardware CTS/RTS
        FCB     $FF,$FF         ; EOT marker

 ;;
 ;; GETCH - wait forever for a character from SCC Channel A
 ;; GETCHT - as GETCH, but also toggle LED1 each timeout
 ;; GETCH1 - one attempt to get a character from SCC Channel A
 ;; GETCH2 - attempt for ~500ms to get a character from SCC Channel A
 ;; inputs:  none
 ;; return:  A=character received
 ;;          V=0 if data received
 ;;          V=1 if timeout (0.5 seconds)
 ;;
 ; GETCH entry point - infinite retry duration
GETCH:
        BSR     GETCH2          ; process as GETCH2
        BVS     GETCH           ;  if no character, keep trying
        RTS                     ;  otherwise, return with char in A
        ; GETCHT entry point - infinite retry duration with LED1 toggle each timeout
GETCHT:
        OnLED1                  ; turn on LED1 while attempting input
G?T     BSR     GETCH2          ; go try to get a character
        BVC     G?X             ;   got one, return
        ToggleLED1              ; toggle LED1 each timeout
        BRA     G?T             ; and try again
G?X     OnLED1                  ; got a character, turn LED1 back on
        RTS
        ; GETCH1 entry point - one attempt
GETCH1:
        PSHS    Y               ; preserve Y
        LDY     #2              ; only check once for a character in channel A
        BRA     GC10?           ; process as GETCH2
        ; GETCH2 entry point - standard timeout
GETCH2:
        PSHS    Y               ; preserve Y
        LDY     #0              ; clear Y for longest timeout (~450ms)
GC10?   ORCC    #CC_V           ; set V flag ahead of decrement
        LEAY    -1,Y            ; decrement timeout counter (V unaffected)
        BEQ     GC90?           ;  EXIT IF TIMEOUT (with V=1)
        LDA     ZSCCAC          ; reset register pointer to WR0/RR0
        LDA     ZSCCAC          ; read RR0
        ANDA    #ZSCC.RXBF      ; examine the RX char available bit
        BEQ     GC10?           ;  LOOP UNTIL CHARACTER AVAILABLE
        LDA     ZSCCAD          ; read character
        ORA     #0              ; clear V flag
GC90?   PULS    Y,PC            ; restore Y and return

 ;;
 ;; PUTCH - output character in A to SCC Channel A
 ;; inputs: character in A
 ;; return: all registers preserved
 ;;
PUTCH:  PSHS    A               ; save character pior to writing
PC10?   LDA     ZSCCAC          ; reset SCC register pointer to WR0/RR0
        LDA     ZSCCAC          ; read RR0
        ANDA    #ZSCC.TXBE      ;  examine the TX buffer empty bit
        BEQ     PC10?           ;  LOOP UNTIL EMPTY
        PULS    A
        STA     ZSCCAD          ; write character to SCC A data reg
        RTS

 ;;
 ;; PUTCR - output CRLF to SCC Channel A
 ;; return: all registers preserved
 ;;
PUTCR:
        PSHS    A               ; save A value
PUTCR1  LDA     #CR             ; output a carriage return
        BSR     PUTCH           ;
        LDA     #LF             ; output a line feed
        BSR     PUTCH           ;
        PULS    A,PC            ; restore A and PC and return

 ;;
 ;; PUTSPACE - output a SPACE to SCC Channel A
 ;; return: all registers preserved
 ;;
PUTSPACE:
        PSHS    A
        LDA     #SPACE
        BSR     PUTCH
        PULS    A,PC

 ;;
 ;; PUTWORD - output ASCII HEX WORD to SCC Channel A
 ;; inputs: D = value to output
 ;; return: all registers preserved
 ;;
PUTWORD:
        BSR     PUTBYTE         ; A is MSB, output it first
        EXG     B,A             ; swap bytes
        BSR     PUTBYTE         ; now output LSB
        EXG     B,A             ; restore A and B
        RTS

 ;;
 ;; PUTBYTE - output ASCII HEX BYTE to SCC Channel A
 ;; inputs: A = value to output
 ;; return: all registers preserved
 ;;
PUTBYTE:
        PSHS    A               ; Save low nibble
        LSRA                    ; Rotate
        LSRA                    ; upper nibble
        LSRA                    ; into
        LSRA                    ; lower nibble
        BSR     PUTHEX          ; Output high nibble
        PULS    A               ; Restore low nibble
        ; fall into PUTHEX...

 ;;
 ;; PUTHEX - output ASCII HEX NIBBLE to SCC Channel A
 ;; inputs: A = value to output
 ;; return: all registers preserved
 ;;
PUTHEX:
        PSHS    A               ; preserve A
        ANDA    #$0F            ; Remove upper half
        ADDA    #'0'            ; Convert to printable
        CMPA    #'9'            ; In range?
        BLS     P?H0            ;   yes, skip alpha adjust
        ADDA    #7              ; Convert to alpha
P?H0    BSR     PUTCH           ; output via PUTCH
        PULS    A,PC            ; restore A and return


