
# Hitachi HD6309 Singleboard Computer 
 
The HD6309 SBC is a retroputing distraction, born to provide an opportunity to try my hand at assembly language for the 6809 - which many have billed as "the most advanced 8-bit processor" ever. The Hitachi 6309 variant is **even more advanced**, with significant extensions from the base Motorola 6809 ISA. 

There are many 8bit SBC (singleboard computers) in the wild, each developed according to the designers' vision. Some go for strict hardware implementation using only vintage components, while others take advantage of modern FPGAs and encapsulate nearly everything into a single device. For this particular SBC, I went for a blend of 'old skool' and 'all mod cons'. For example, the primary interface is ASCII serial, but the physical layer is implemented as a FDTI USB
bridge chip, as I loathe having to use RS232 adapters. Similarly, I included a SPI-mode SD card interface, rather than the purist approach of an actual floppy drive. I use a CPLD for all the glue logic for ease of reconfiguring address mapping and operation. Fortunately, it all can be powered from the USB port (<250mA at last measurement).

## HD6309 SBC V1 Features

Version 1 of the SBC has the following features:

 - 3 MHz Hitachi HD63C09 microprocessor 
 - 64KB RAM (2x 32KB SRAM)
 - 32KB EPROM (27C256) 
 - Parallel Interface & Timers (Zilog Z8536 CIO)
 - Dual Serial Channels (Zilog Z85C30 SCC)   
 - USB slave (FTDI FT230XS) connected to SCC Ch. A
 - Realtime Clock (Epson RTC7301)  w/ CR2032 backup 
 - SPI-mode micro-SD memory card (CPLD hardware SPI)
 - RESET pushbutton
 - USER pushbutton (read via CPLD)
 - 2 USER LED's (control via CPLD)
 - USB RX/TX Activity LED
 - SD card Activity LED
 - Expansion Connector (bus signals)

Hardware wise, the short-term goal is met: it all functions and works as intended. Several people have built this SBC from the files I provided, and the feedback has been helpful. 

Future hardware features to consider would be elimination of the CIO chip (seldom used), a better SCC (faster baudrate) and more memory and associated MMU. To do any/all of these, a bigger CPLD is required, as the MAX7128 is nearly fully used. 



It seems to be an axiom that every SBC has a ROM resident monitor. Over the years, I've used a number of different monitors on this SBC. For my own use I've ported the (excellent) Dave Dunfield MON09 to this SBC but, sadly, this is not open source and cannot be redistributed. What I include in this repository is a ported version of "WOZMON", the Apple 1 monitor. It's enough to examine and modify memory, and load Intel hex and Motorola S-record files.

Assembly language is fun and all, but having a ROM-resident BASIC interpreter is even better. Grant Searle to the rescue,
who has dissected and commented 6809 MICROSOFT BASIC, which I easily adapted to this SBC.

The firmware stretch goal is some sort of operating system, such as NitrOS-9 operating 
system (level I). Here I am completely a noob; I've never used OS-9 at all, but it seems 
like a nice OS.

More up-to-date information on the SBC can be found on the Hackaday project page:
https://hackaday.io/project/345-hd6309-singleboard-computer

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

HD6309 Singleboard Computer (SBC)
Tom LeMense
1/28/2020

tomcircuit@gmail.com
@TomLeMense


		
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTAyMTI5NDM1MiwxNzk1OTkxMDc1LDYzMz
I0Mzc3NCwxMjYxMjYyNTYxXX0=
-->