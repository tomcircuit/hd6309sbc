;
; MONITOR 1V4 ENTRY POINTS
;

CIO_Initialize        EQU        $E55B          ; Initialize CIO
CIO_ReadReg           EQU        $E580          ; Read CIO register
CIO_WriteReg          EQU        $E58C          ; Write CIO register
DELAYMS               EQU        $E700          ; Delay X number of ms
DELAYUS               EQU        $E70F          ; Delay X number of us
GETBDIG               EQU        $E6B9          ; Get bounded digit from console
GETBYTE               EQU        $E68B          ; Get HEX byte from console
GETCH                 EQU        $E5DE          ; Wait for character from console
GETCH1                EQU        $E5F6          ; Attempt to read character from console
GETCH2                EQU        $E5FE          ; Attempt for 500ms to read character
GETCHT                EQU        $E5E3          ; Wait for character, flash LED1
GETNIB                EQU        $E69E          ; Get HEX nibble from console
GETPATT               EQU        $E6C8          ; Pattern Input from console
GOBASIC               EQU        $E504          ; ENTER MS BASIC (Coldstart)
GONOICE               EQU        $E267          ; ENTER NoICE DEBUGGER
GORTC                 EQU        $E352          ; ENTER RTC INTERACTIVE UTILITY
GOWOZ                 EQU        $E30E          ; ENTER WOZMON
I2C_GoMaster          EQU        $E7CF          ; Send I2C START and slave address
I2C_Initialize        EQU        $E71E          ; Init I2C pins, check for stuck
I2C_ReadBlock         EQU        $E878          ; Block Read I2C
I2C_ReadByte          EQU        $E7FA          ; Byte Read I2C
I2C_SendStop          EQU        $E758          ; Send I2C STOP 
I2C_WriteBlock        EQU        $E841          ; Block Write I2C
I2C_WriteByte         EQU        $E822          ; Byte Write I2C
MOVEMON               EQU        $E54A          ; Move MONITOR 1V4 to RAM
PUTBYTE               EQU        $E64A          ; Output HEX byte in A to console
PUTCH                 EQU        $E61B          ; Output character to console
PUTCONST              EQU        $E664          ; Output character following JSR to console
PUTCR                 EQU        $E62D          ; Output a CR to console
PUTHEX                EQU        $E654          ; Output a HEX digit to console
PUTMSG                EQU        $E670          ; Output string following JSR to console
PUTSPACE              EQU        $E639          ; Output space to console
PUTSTR                EQU        $E67A          ; Output string at X to console
PUTWORD               EQU        $E641          ; Output HEX word in D to console
RTC_ClearStatus       EQU        $E81C          ; Clear RTC status register (reset AxF)
RTC_FmtDate           EQU        $E8A8          ; Create formatted ASCII date string
RTC_FmtTime           EQU        $E8F3          ; Create formatted ASCII time string
RTC_NMIDisable        EQU        $E94F          ; Disable RTC 1Hz NMI
RTC_NMIEnable         EQU        $E935          ; Enable RTC 1Hz NMI
RTC_ReadByte          EQU        $E7F7          ; Read single RTC byte
RTC_ReadRegs          EQU        $E871          ; Read RTC registers 0-15
RTC_ReadStatus        EQU        $E7F5          ; Write RTC status byte
RTC_WriteByte         EQU        $E81F          ; Write single RTC byte
RTC_WriteRegs         EQU        $E83A          ; Write RTC registers 0-15
SCC_InitA             EQU        $E598          ; Initialize SCC channel A
SCC_InitB             EQU        $E5A3          ; Initialize SCC channel B
SD_DisplayR1          EQU        $EB0D          ; Display SD Response R1
SD_DisplayR7          EQU        $EB23          ; Display SD Response R7
SD_GetR7              EQU        $EAF4          ; Get SD Response R7
SD_Initialize         EQU        $E9E5          ; Initialize SD card
SD_NativeMode         EQU        $E9BD          ; Set SD Native Mode access
SD_ReadBlock          EQU        $EB44          ; Read LBA block from SD card
SD_SendCmd            EQU        $EAB8          ; Send SD command
SD_WaitReady          EQU        $EBB7          ; Wait for SD to become available
SD_WriteBlock         EQU        $EB78          ; Write LBA block to SD card
SPI_Xcg               EQU        $E979          ; SPI byte exchange (R+W)
