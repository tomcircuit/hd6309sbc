SECTION _wozmon

EXTERN RAM_WOZMON
EXTERN STARTUP
EXTERN PUTA
EXTERN PUTCH
EXTERN PUTCR
EXTERN PUTBYTE
EXTERN DLOAD


;;======================================================================
;; BEGINNING OF WOZMON RESIDENT MONITOR
;;======================================================================
		
; This is adapted from Jeff Tranter's port of Woz Mon to my HD6309 SBC
; Jeff's work can be found here:
; https://github.com/jefftranter/6809/blob/master/sbc/wozmon/wozmon.asm
;
; It now fits easily < 256 bytes, thanks to the SCC UART functions that
; are already present elsewhere in this ROM. I've tweaked it a bit in
; terms of adding the "G" synonym for "R", and an "S" command to invoke
; a nice S-Record/Intel Hex loader (stolen from Dave Dunfield's 6809
; monitor). 
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

CR      EQU  	$8D     ; Carriage return
LF      EQU  	$8A     ; Line feed
ESC     EQU  	$9B		; Escape

INBUF	EQU		RAM_WOZMON  		; input buffer (128 chars long)

XAM		EQU  	RAM_WOZMON+128		; two bytes
ST		EQU  	RAM_WOZMON+128+2	; two bytes
H		EQU		RAM_WOZMON+128+4	; word access with just "H"
L		EQU		RAM_WOZMON+128+5
MODE	EQU		RAM_WOZMON+128+6
;YSAV	EQU 	RAM_WOZMON+128+7	; use Yreg instead
;INPTR	EQU		RAM_WOZMON+128+9    ; INPTR+1 is LSB - use Wreg instead (E is MSB, F is LSB)

WOZMON: 
	    JSR	 	STARTUP				; initialize the SCC and system regs
 		LDS	 	#INITSTACK			; use "user stack" already reserved by noICE
        BRA  	ESCAPE  

; Get a line of input from the keyboard, echoing to display.
; Normally enter at escape or getline.

NOTCR:
		CMPA 	#$88       			; ^H?  ["backspace"]
		BEQ  	BACKSPACE  			; Yes.
		CMPA 	#ESC       			; ESC?
		BEQ  	ESCAPE     			; Yes.
		LEAX 	1,X        			; Advance text index.
		INCB 	                	    	
		BPL  	NEXTCHAR   			; Auto ESC if > 127.
		                	
ESCAPE:
		LDA  	#'\'       			; "\".
		JSR  	ECHO       			; Output it.
                          
GETLINE:
		JSR  	PUTCR
        LDX  	#INBUF+1      		; Initialize text index.
        LDB  	#1       
BACKSPACE:  
		LEAX 	-1,X       			; Back up text index.
        DECB 	           			
        BMI  	GETLINE    			; Beyond start of line, reinitialize.
                            	
NEXTCHAR:   
		JSR  	GETA				; get a character from UART Ch A
		ORA  	#$80       			; Convert to high ASCII.
		STA  	,X         			; Add to text buffer.
		BSR  	ECHO       			; Display character.
		CMPA 	#CR        			; CR?
		BNE  	NOTCR      			; No.
                          
; Process an input line.

RETURN:        
;		LDX  	#INBUF+256-1  		; Reset text index to in-1, +256 so that
                            		;  'inc inptr+1' will result in $0200.
;		STX  	INPTR                  	
		LDW	 	#INBUF+256-1		; reset text index to in-1+256 so that
                            		;  'inc inptr+1' will result in $0200.			
		CLRA            			; For XAM mode. 0->B.
SETBLOK:    
		ASLA            			; Leaves $56 if setting BLOCK XAM mode.
SETMODE:                    		
		STA  	MODE       			; $00 = XAM, $BA = STOR, $56 = BLOK XAM.
BLSKIP:                     			
;		INC  	INPTR+1    			; Advance text index.
		INCF						; advance text index (LSB only, so modulo 256)
NEXTITEM:                   	
;		LDX  	INPTR              	
		TFR  	W,X					; copy text index to X
		LDA  	,X         			; Get character.
		CMPA 	#CR        			; CR?
		BEQ  	GETLINE    			; Yes, done this line.
		CMPA 	#$AE       			; "."?
		BEQ  	SETBLOK    			; Set BLOCK XAM mode.
		BLS  	BLSKIP     			; Skip delimiter.
		CMPA 	#$BA       			; ":"?
		BEQ  	SETMODE    			; Yes, set STOR mode.
		CMPA 	#$D2       			; "R"?  ("Run" - original WOZMON)
		BEQ  	RUN        			; Yes, run user program.
		CMPA 	#$C7       			; "G"?  ("Go" - applesoft ROM)
		BEQ  	RUN        			; Yes, run user program.
		CMPA 	#$D3				; "S"?  ("S-Record" - download)
		BNE  	N?EXT1				; no, so attempt to process numeric value
		JSR  	DLOAD				; yes, try to download from host
		BRA  	GETLINE				; get next 
N?EXT1:
		CLR  	L          			; $00->L.
		CLR  	H          			;  and H.
;		STX  	YSAV      	 		; Save Y for comparison.
		TFR  	X,Y					; copy text index (X) to Y (Y is used for 'YSAV' instead of RAM)
NEXTHEX:                    	
;		LDX  	INPTR       		       	
 		TFR  	W,X					; copy text index to X
 		LDA  	,X         			; Get character for hex test.
 		EORA 	#$B0       			; Map digits to $0-9.
 		CMPA 	#$09       			; Digit?
 		BLS  	DIG        			; Yes.
 		ADDA 	#$89       			; Map letter "A"-"F" to $FA-FF.
 		CMPA 	#$F9       			; Hex letter?
 		BLS  	NOTHEX     			; No, character not hex.
DIG:
		ASLA            			; Hex digit to MSD of A.
		ASLA            	
		ASLA            	
		ASLA            	
        LDB  	#$04       			; Shift count.
HEXSHIFT:   
		ASLA            			; Hex digit left, MSB to carry.
		ROL  	L          			; Rotate into LSD.
		ROL  	H          			; Rotate into MSD's.
		DECB 	           			; Done 4 shifts?
		BNE  	HEXSHIFT   			; No, loop.
                            	
;		INC 	INPTR+1   			; Advance text index.
 		INCF	   					; advance text index (LSB only, so modulo 256)
 		BRA 	NEXTHEX    			; Always taken. Check next character for hex.
                            	
NOTHEX:                     	
;		CMPX 	YSAV       			; Check if L, H empty (no hex digits).    CMPX ( X - YSAV )    
 		CMPR 	Y,X					; check if L, H empty (no hex digits)     CMPR ( X - Y)
 		BEQ  	ESCAPE     			; Yes, generate ESC sequence.
 		TST  	MODE       			; Test MODE byte.
 		BPL  	NOTSTOR    			; B7=0 for STOR, 1 for XAM and BLOCK XAM
                            	
; STOR mode                 	
		LDX  	ST         			
		LDA  	L          			; LSD's of hex data.
		STA  	,X         			; Store at current 'store index'.
		LEAX 	1,X        			
		STX  	ST         			
TONEXTITEM: 
		BRA  	NEXTITEM   			; Get next command item.
ECHO:
		ANDA 	#$7F       			; Convert to low ASCII.
		JSR	 	PUTA        		        	
		ORA  	#$80       			; Convert back to high ASCII.
		RTS             			; Return.
RUN:        
		JMP  	[XAM]      			; Run at current XAM index.  
NOTSTOR:
		BNE  	XAMNEXT    			; mode = $00 for XAM, $56 for BLOCK XAM.
		     	            		           	
		LDX  	H          			; Copy hex data to
		STX  	ST         			;  'store index'.
		STX  	XAM        			; And to 'XAM index'.
		CLRA 	           			; set Z flag to force following branch.
NXTPRNT:    
		BNE  	PRDATA     			; NE means no address to print.
		JSR  	PUTCR       		        	
		LDA  	XAM        			; 'Examine index' high-order byte.
		JSR  	PUTBYTE     		        	
		LDA  	XAM+1      			; Low-order 'Examine index' byte.
		JSR  	PUTBYTE						
		LDA  	#$BA       			; ":".
		BSR  	ECHO       			; Output it.
PRDATA:     
		LDA  	#$A0       			; Blank.
		BSR  	ECHO       			; Output it.
		     	           			
		LDX  	XAM        			
		LDA  	,X         			; Get data byte at 'examine index'.
		JSR	 	PUTBYTE     		        	
XAMNEXT:    
		CLR  	MODE       			; 0->MODE (XAM mode).
		LDX  	XAM        			; Compare 'examine index' to hex data.
		CMPX 	H         			 
		BEQ  	TONEXTITEM 			; Not less, so more data to output.
		LEAX 	1,X        			
		STX  	XAM        			
		LDA  	XAM+1      			; Check low-order 'examine index' byte
		ANDA 	#$07       			; For MOD 8 = 0
		BRA  	NXTPRNT    			; always taken

;;======================================================================
;; END OF WOZMON RESIDENT MONITOR
;;======================================================================

ENDSECTION