
This set of design files implements the glue logic for the HD6309 Singleboard Computer v1.0

Target device is Altera EPM7128SLI in 84 pin PLCC
Development tool is Altera Quartus web edition



As present, all planned functions have been implemented:

. E & Q clock generation with 0WS, 1WS, and 3WS as necessary
. programmable 0WS/1WS for ROM area access
	---> note; 1WS is nasty, because this will slow down all the 6309 "idle" cycles, also!
		The power-on default is 1WS, in order to support slower EPROM devices at boot.
		
. all address decoding for on-chip and off-chip peripherals

. decoding of the uppermost 128bytes of the I/O page to an "AUXCS" signal ("spare" signal on schematic)

. hardware SPI master* for SD card access (chews up a lot of macrocells!)

. test signal multiplexer for TP13 and TP14

. selectable EEPROM/EPROM support (write-enable for EEPROM, RA14 for EPROM)

*Note that the hardware SPI was something that I found while casting about on the intarwebs.  
SimpleSPI_M.vhd is copyright 2007 by Tom Scott, of Mission Technologies
http://www.mission-technologies.org/read_article.php?subject=VHDL&id=14
It works exactly as described, and so I was happy to include it, almost as-is, into my project.


This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.


HD6309 Singleboard Computer (SBC)
Tom LeMense
3/12/2014

tlemense@yahoo.com
@TomLeMense

		
