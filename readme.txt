
This set of design files implements the PCB for the HD6309 Singleboard Computer v1.0

The HD6309 SBC is a retroputing distraction, born to provide an opportunity to try my hand
at assembly language for the 6809 - which many have billed as "the most advanced 8-bit
processor" ever. I shot for a blend of 'old skool' and 'all mod cons'. For example, the
primary interface is ASCII serial, but the physical layer is implemented as a FDTI USB
bridge chip, as I loathe having to bust out RS232 adapters. Similarly, I included a
SPI-mode SD card interface, rather than the purist approach of an actual floppy drive.
I use a CPLD for all the glue logic for ease of reconfiguring address mapping and 
operation. Fortunately, it all can be powered from the USB port (<230mA at last
measurement).

Hardware wise, the short-term goal is met: it all functions and seems to be working as
intended. The long-term goal is to make a companion card that mates with the stacking
'expansion port' connector that provides more functionality - particularly towards the 
stretch software-goal (NitrOS-9). Therefore, some sort of video display, keyboard
interface, and perhaps some larger store of memory (and associated MMU). 

Firmware wise, the short-term goal is a ROM monitor program. I've already ported the
(excellent) Dave Dunfield MON09 to this SBC but, sadly, this is not open source and cannot
be redistributed. Instead, I work on a new monitor in the spirit of Motorola's ASSIST09.
A longer-term goal is a ROM-resident BASIC interpreter. Here, I find no better candidate
than Lee Davison's excellent ehBasic which exists for the 6502 and 68000. From the latter
I think the 68K version is more suited to be adapted to the hd6303. Finally, the firm-
ware stretch goal is to port NitrOS-9 operating system (level I) to the SBC. Here I am
completely a noob; I've never used OS-9 at all, but it seems like a nice OS.

At least...that's the plan right now...

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

HD6309 Singleboard Computer (SBC)
Tom LeMense
3/12/2014

tlemense@yahoo.com
@TomLeMense

		
