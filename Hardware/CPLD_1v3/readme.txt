
This set of design files implements the glue logic for the HD6309 Singleboard Computer 

CPLD VERSION v1.3

Target device is Altera EPM7128SLI in 84 pin PLCC
Development tool is Altera Quartus web edition v13.0.1

As present, all planned functions have been implemented:

. E & Q clock generation with 0WS, 1WS, and 3WS as necessary
. programmable 0WS/1WS for ROM area access
	---> note; 1WS is nasty, because this will slow down all the 6309 "idle" cycles, also!
		The power-on default is 1WS, in order to support slower EPROM devices at boot.
		
. SCC Ch A and Ch B baudrate clocks generated from 14.745 MHz oscillator Y2
		
. Hardware SPI master* for SD card access

. [new 1.3] SPI clocks (fast and slow) derived only from 24 MHz oscillator Y1

. [new 1.3] moved IO page to $E000-E1FF:
            $E000=CIO, $E010=SCC, $E020=RTC, $E030=SD_DATA, $E040=SYS, $E050=CFG, $E060=VER
		  $E070-$E1FF are undecoded space (for use by expansion card devices, for example)

. [new 1.3] selectable EPROM 27C128/27C256 support (pin 27 defaults to state of CONFIG jumper at RESET)

. [new 1.3] CPLD version "register" at $E060 - returns $13

. [new 1.3] removed test mux for TP11,12,13,14 pins - these are now fixed to echo SD card signals

*Note that the hardware SPI was something that I found while casting about on the intarwebs.  
SimpleSPI_M.vhd is copyright 2007 by Tom Scott, of Mission Technologies
http://www.mission-technologies.org/read_article.php?subject=VHDL&id=14
It works well, and so I was happy to include it, with relatively minor changes, into my project.

More up-to-date information on the SBC can be found on the Hackaday project page:
https://hackaday.io/project/345-hd6309-singleboard-computer

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

HD6309 Singleboard Computer (SBC)
Tom LeMense
1/28/2020

tomcircuit@gmail.com
@TomLeMense


		
