; imports
GETA        EXTERN		
PUTA        EXTERN

; exports
DLOAD       EXTERN		
CIO_INIT    EXTERN
CIO_READ	EXTERN
CIO_WRITE	EXTERN
GETBYTE		EXTERN
GETHEX		EXTERN
PUTSPACE	EXTERN
PUTWORD		EXTERN
PUTBYTE     EXTERN		
PUTHEX		EXTERN
PUTCR       EXTERN		
PUTMSG		EXTERN
PUTSTR		EXTERN

			SECTION     _utils

;;======================================================================		
;; S-RECORD AND INTEL HEX DOWNLOAD FUNCTION                             
;;======================================================================
;;                                                                      
DLOAD       JSR     PUTCR           ; NEW LINE                          
DLO1?       BSR     DLREC           ; DOWNLOAD RECORD                   
            BCC     DLO2?           ; END                               
            LDA     #'.'            ; OUTPUT ONE DOT PER RECORD         
            JSR     PUTA            ; OUTPUT                            
            BRA     DLO1?           ; CONTINUE                          
DLO2?       BEQ     DLO3?           ; if Z is clear, all went ok        
            JMP     PUTMSG          ; error occurred                    
            FCB     $0D,$0A                                             
            FCC     "ERR"                                               
            FCB     $FF                                                 
DLO3?       JMP     PUTMSG          ; load successful                   
            FCB     $0D,$0A                                             
            FCC     "OK"                                                
            FCB     $FF                                                 
                                                                        
; Download a record in either MOTOROLA or INTEL hex format              
DLREC   JSR     GETA            ; Get a character                       
        CMPA    #$03            ; Check for ^C (Break)                  
        BEQ     LODERR          ; yes, abort with error                 
        CMPA    #':'            ; Start of INTEL record?                
        LBEQ    DLINT           ; Yes, download INTEL                   
        CMPA    #'S'            ; Start of MOTOROLA record?             
        BNE     DLREC           ; No, keep looking                      
                                                                        
; Download a record in MOTOROLA hex format                              
DLMOT   JSR     GETA            ; get next char                         
        CMPA    #'0'            ; header record?                        
        BEQ     DLOAD           ;    skip it                            
        CMPA    #'5'            ; count record?                         
        BEQ     DLOAD           ;    skip it                            
        CMPA    #'9'            ; end of file?                          
        BEQ     DLMOT9          ;    end of file                        
        CMPA    #'1'            ; should be a data record (S1) then!    
        BNE     LODERR          ;   none of these = load error          
        JSR     GETBYTE         ; get length                            
        BCC     LODERR          ; report error                          
        STA     TEMP            ; start checksum                        
        SUBA    #3              ; adjust length (omit address and checks
        STA     TEMP+1          ; set length                            
        JSR     GETBYTE         ; get first byte of address             
        BCC     LODERR          ; report error                          
        TFR     A,B             ; save for later                        
        ADDA    TEMP            ; include in checksum                   
        STA     TEMP            ; resave                                
        JSR     GETBYTE         ; get next byte of address              
        BCC     LODERR          ; report error                          
        EXG     A,B             ; swap address halves (endian stuff)    
        TFR     D,X             ; set pointer                           
        ADDB    TEMP            ; include in checksum                   
        STB     TEMP            ; resave checksum                       
DLMOT1  JSR     GETBYTE         ; get a data byte                       
        BCC     LODERR          ; report error                          
        STA     ,X+             ; Save in RAM                           
        ADDA    TEMP            ; Include checksum                      
        STA     TEMP            ; Resave                                
        DEC     TEMP+1          ; Reduce length                         
        BNE     DLMOT1          ; do them all                           
        JSR     GETBYTE         ; get checksum byte                     
        BCC     LODERR          ; report error                          
        ADDA    TEMP            ; add computed checksum                 
        INCA                    ; test for success                      
        BEQ     DLRTS           ; download ok                           
                                                                        
; Error occured on loading                                              
LODERR  ORCC    #Z              ; set the Z flag to indicate an error oc
        ANDCC   #~C             ; clear the 'c' flag to indicate end of 
        RTS                                                             
                                                                        
; properly handle S9 end record (just eat it)                           
DLMOT9  JSR     GETBYTE         ; get length byte                       
        BCC     LODERR          ; report error                          
        STA     TEMP+1          ; save length                           
DLM91?  JSR     GETBYTE         ; get next byte                         
        DEC     TEMP+1          ; Reduce length                         
        BNE     DLM91?          ; get all the bytes                     
                                ; fall into DLEOF                       
                                                                        
; set C flag to signal another record needed / clear if end of file     
DLEOF   ANDCC   #~Z             ; clear the 'z' flag to indicate no erro
        ANDCC   #~C             ; clear the 'c' flag to indicate end of 
        RTS                                                             
DLRTS   ANDCC   #~Z             ; clear the 'z' flag to indicate no erro
        ORCC    #C              ; set 'c' flag to indicate another recor
        RTS                                                             
                                                                        
; Download record in INTEL format                                       
DLINT   JSR     GETBYTE         ; get count                             
        BCC     LODERR          ; report error                          
        STA     TEMP            ; Start checksum                        
        STA     TEMP+1          ; Record length                         
        CMPA    #0              ; Test & clear C                        
        BEQ     DLEOF           ; End of file                           
; Get address                                                           
        JSR     GETBYTE         ; get first byte of address             
        BCC     LODERR          ; report error                          
        TFR     A,B             ; Save for later                        
        ADDA    TEMP            ; Include in checksum                   
        STA     TEMP            ; Resave                                
        JSR     GETBYTE         ; get next byte of address              
        BCC     LODERR          ; report error                          
        EXG     A,B             ; Swap                                  
        TFR     D,X             ; Set pointer                           
        ADDB    TEMP            ; Include in checksum                   
        STB     TEMP            ; Resave checksum                       
; Get record type                                                       
        JSR     GETBYTE         ; get type value                        
        BCC     LODERR          ; report error                          
        ADDA    TEMP            ; Include checksum                      
        STA     TEMP            ; Resave checksum                       
; Get data bytes                                                        
DLINT1  JSR     GETBYTE         ; get data byte                         
        BCC     LODERR          ; report error                          
        STA     ,X+             ; Write to memory                       
        ADDA    TEMP            ; Include checksum                      
        STA     TEMP            ; Resave checksum                       
        DEC     TEMP+1          ; Reduce length                         
        BNE     DLINT1          ; Do them all                           
; Get checksum                                                          
        JSR     GETBYTE         ; Read checksum byte                    
        BCC     LODERR          ; Report error                          
        ADDA    TEMP            ; add into checksum                     
        BEQ     DLRTS           ; Report success                        
        JMP     LODERR          ; Report failure                        
                                                                        
                                                                        
;;======================================================================
;; BEGINNING OF PLATFORM DEPENDENT UTILITY FUNCTIONS                    
;;======================================================================
                                                                        
;; ZILOG CIO INIT Function                                              
;; necessary to put the Z8536 CIO into a known state                    
CIO_INIT                                                                
        LDA     CIOCTL          ; reset the chip to a known state and th
        BSR     ZI?             ; a read will force the z8536 into state
                                ; not cause any changes                 
        CLRA                    ; if the z8536 was reset, writing a 0 wi
        STA     CIOCTL          ; state 0, this will set the pointer to 
        BSR     ZI?                                                     
        LDA     CIOCTL          ; another read operation will force the 
        BSR     ZI?             ; instructions can be done              
        CLRA                    ; set address pointer to master interrup
        STA     CIOCTL                                                  
        BSR     ZI?                                                     
        LDA     #1              ; reset the z8536 by enabling the reset 
        STA     CIOCTL                                                  
        BSR     ZI?             ; next, by writing a 0 to register 0 dur
        CLRA                    ; successive writes can only be done dur
        STA     CIOCTL          ; successive writes will change the addr
ZI?     NOP                                                             
        NOP                                                             
        NOP                                                             
        RTS                                                             
;;                                                                      
;; ZILOG CIOCTL READ Function                                           
;; On Entry:    A = register number to read (0...3F)                    
;; On exit: B = value from register                                     
;;                                                                      
CIO_READ                                                                
        LDB     CIOCTL          ; read CIO control register to get to st
        ANDA    #$3F            ; make sure register value is in range  
        STA     CIOCTL          ; set the address pointer to the desired
        LDB     CIOCTL          ; read the contents of the register     
        RTS                                                             
;;                                                                      
;; ZILOG CIOCTL WRITE Function                                          
;; On Entry:    A = register number to read (0...3F)                    
;;          B = value to write to register                              
;;                                                                      
CIO_WRITE                                                               
        PSHS    B               ; preserve value to write               
        LDB     CIOCTL          ; read CIO control register to get to st
        ANDA    #$3F            ; make sure it's in range               
        STA     CIOCTL          ; set the address pointer to the desired
        PULS    B               ; restore value to write                
        STB     CIOCTL                                                  
        RTS                                                             
                                                                        
;;                                                                      
;; SCC CHANNEL A I/O FUNCTIONS                                          
;; These are hardcoded to channel A, intended for console use           
                                                                        
;; GETBYTE - acquire an ASCII HEX byte from UART A and return in A      
;; CY=1 means input was valid, byte value in A                          
;; CY=0 means input was non-ASII HEX, A is destroyed                    
GETBYTE                                                                 
        BSR     GETHEX          ; Get FIRST nibble                      
        BCC     GETB1?          ; Invalid, abort (CY=0)                 
        LSLA                    ; Rotate                                
        LSLA                    ; into                                  
        LSLA                    ; high                                  
        LSLA                    ; nibble                                
        PSHS    A               ; Save for later                        
        BSR     GETHEX          ; Get SECOND nibble                     
        BCC     GETB2?          ; Report error (CY=0)                   
        ORA     ,S              ; Include high                          
        ORCC    #C              ; Indicate success (CY=1)               
GETB2?  LEAS    1,S             ; Skip saved value                      
GETB1?  RTS                                                             
                                                                        
;; GETBIN - acquire an ASCII HEX nibble from UART A and return in A     
;; CY=1 means input was valid, nibble value in A                        
;; CY=0 means input was non-ASII HEX, A is restored                     
GETHEX                                                                  
        JSR     GETA            ; get a character                       
        SUBA    #'0'            ; Convert numbers                       
        CMPA    #9              ; Numeric?                              
        BLS     GETN1?          ; Yes, OK                               
        SUBA    #7              ; Convert alphas                        
        CMPA    #$A             ; Under?                                
        BLO     GETN2?          ; Yes, error                            
        CMPA    #$F             ; Over?                                 
        BHI     GETN2?          ; Yes, error (C and Z both clear)       
GETN1?  ORCC    #C              ; SET 'C' FLAG, INDICATE OK             
        RTS                                                             
GETN2?  ADDA    #$37            ; Normalize character                   
        ANDCC   #~C             ; clear C to indicate non-hex input     
        RTS                                                             
                                                                        
;; PUTSPACE - output a SPACE to UART A                                  
PUTSPACE                                                                
        PSHS    A                                                       
        LDA     #' '            ; Output a space to console             
        JSR     PUTA                                                    
        PULS    A,PC            ; restore A value prior to return       
                                                                        
;; PUTWORD - output D as ASCII HEX WORD to UART A                       
PUTWORD                                                                 
        BSR     PUTBYTE         ; Output first byte                     
        TFR     B,A             ; Get second byte                       
                                ; fall into PUTBYTE                     
                                                                        
;; PUTBYTE - output A as ASCII HEX BYTE to UART A                       
PUTBYTE                                                                 
        PSHS    A               ; Save low nibble                       
        LSRA                    ; Rotate                                
        LSRA                    ; upper nibble                          
        LSRA                    ; into                                  
        LSRA                    ; lower nibble                          
        BSR     PUTHEX          ; Output high nibble                    
        PULS    A               ; Rertore low nibble                    
                                ; fall into PUTHEX                      
                                                                        
;; PUTHEX - output A as ASCII HEX NIBBLE to UART A                      
PUTHEX                                                                  
        ANDA    #$0F            ; Remove upper half                     
        ADDA    #'0'            ; Convert to printable                  
        CMPA    #'9'            ; In range?                             
        BLS     PH1             ; Yes, display                          
        ADDA    #7              ; Convert to alpha                      
PH1     JMP     PUTA            ; exit via PUTA                         
                                                                        
;; PUTCR - output CRLF to UART A                                        
PUTCR                                                                   
        LDA     #$0D            ; output a carriage return              
        JSR     PUTA            ;                                       
        LDA     #$0A            ; output a line feed                    
        BRA     PH1             ; exit via PUTA                         
                                                                        
;; PUTMSG - output NULL/FF terminated string at PC to UART A            
;; terminate with either 0, or $FF (CRLF before terminates)             
PUTMSG                                                                  
        PSHS    X               ; save x                                
        LDX     2,S             ; get old pc                            
        BSR     PUTSTR          ; output string                         
        STX     2,S             ; update old pc                         
        PULS    X,PC            ; restore x, return                     
                                                                        
;; PUTSTR - output NULL/FF terminated string at X to UART A             
;; terminate with either 0, or $FF (CRLF before terminates)             
PUTSTR                                                                  
        LDA     ,X+             ; get char from message                 
        BEQ     PSTRX?          ;   0 = end                             
        CMPA    #$FF            ; FF = newline end?                     
        BEQ     PUTCR           ;   yes, new line, exit via PUTCR       
        JSR     PUTA            ; output character to term              
        BRA     PUTSTR          ; keep going                            
PSTRX?  RTS                                                             

		ENDSECTION