SCC_InitA                    EQU $FF40     ; initialize SCC channel A
SCC_InitB                    EQU $FF42     ; initialize SCC channel B
GETCH                        EQU $FF44     ; wait for character from CONSOLE
GETCH1                       EQU $FF46     ; attempt to get character from CONSOLE
GETNIB                       EQU $FF48     ; get a HEX NYBBLE from CONSOLE
GETBYTE                      EQU $FF4A     ; get a HEX BYTE from CONSOLE
GETBDIG                      EQU $FF4C     ; get a bounded hex digit from CONSOLE
W_GETLNZ                     EQU $FF4E     ; get a ^X/CR terminated line from CONSOLE

PUTCH                        EQU $FF58     ; output character to CONSOLE
PUTHEX                       EQU $FF5A     ; output HEX NYBBLE to CONSOLE
PUTBYTE                      EQU $FF5C     ; output HEX BYTE to CONSOLE
PUTWORD                      EQU $FF5E     ; output HEX WORD to CONSOLE
PUTMSG                       EQU $FF60     ; output ASCIIZ message at PC to CONSOLE
PUTSTR                       EQU $FF62     ; output ASCIIZ message at X to CONSOLE
PUTCR                        EQU $FF64     ; output a CR+LF to CONSOLE

DBGETCH1                     EQU $FF6E     ; attempt to get character from DEBUG
DBPUTCH                      EQU $FF70     ; output character to DEBUG
CIO_Initialize               EQU $FF72     ; initialize CIO to default state
CIO_ReadReg                  EQU $FF74     ; read CIO register
CIO_WriteReg                 EQU $FF76     ; write CIO register

RTC_ReadByte                 EQU $FF7C     ; read byte from I2C RTC
RTC_ReadBlock                EQU $FF7E     ; read block of bytes from I2C RTC
RTC_ReadRegs                 EQU $FF80     ; read I2C RTC registers 0-15
RTC_WriteByte                EQU $FF82     ; write byte to I2C RTC
RTC_WriteBlock               EQU $FF84     ; write block of bytes to I2C RTC
RTC_WriteRegs                EQU $FF86     ; write I2C RTC registers 0-15
RTC_FmtTime                  EQU $FF88     ; create formatted ASCII time string
RTC_FmtDate                  EQU $FF8A     ; create formatted ASCII date string

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

DELAYMS                      EQU $FFB8     ; delay X * ms
DELAYUS                      EQU $FFBA     ; delay X * 10us
MOVEMON                      EQU $FFBC     ; move MONITOR to RAM, select RAM
DL_START                     EQU $FFBE     ; HEXFILE DOWNLOAD via CONSOLE port
