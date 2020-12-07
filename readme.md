
# Hitachi HD6309 Singleboard Computer 
 
 The HD6309 SBC is a retroputing distraction, born to provide an opportunity to try my hand at assembly language for the 6809 - which many have billed as "the most advanced 8-bit processor" ever. The Hitachi 6309 variant is even more advanced, with significant extensionI shot for a blend of 'old skool' and 'all mod cons'. For example, the
primary interface is ASCII serial, but the physical layer is implemented as a FDTI USB
bridge chip, as I loathe having to bust out RS232 adapters. Similarly, I included a
SPI-mode SD card interface, rather than the purist approach of an actual floppy drive.
I use a CPLD for all the glue logic for ease of reconfiguring address mapping and 
operation. Fortunately, it all can be powered from the USB port (<230mA at last
measurement).
This is my attempt at a LiPo-based battery pack for "Classic" HP Calculators, specifically HP-35, HP-45, and HP-55.  The original NiCd packs are all dead by now, and rebuilding them is difficult - *assuming you can even find a pack to rebuild*. I thought it would be fun to use a rechargeable LiPo battery, and include the circuitry to re-charge via USB as well. 

> LiPo chemistry has very specific care-and-feeding when it comes to recharging, **you cannot use the HP AC charger to recharge this pack!**  Don't even try it with Version 1 of this project!

**UPDATE**: Version 2 design includes *Charger Immunity* circuitry to prevent mayhem if the HP AC  charger is connected. 

This set of design files pertains to the HD6309 Singleboard Computer v1.0

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

Firmware wise, things are not quite as settled. For my own use I've ported the (excellent) 
Dave Dunfield MON09 to this SBC but, sadly, this is not open source and cannot
be redistributed. What would be nice is a monitor in the spirit of Motorola's ASSIST09.
Another firmware goal is a ROM-resident BASIC interpreter. Grant Searle to the rescue,
who has dissected and commented 6809 MICROSOFT BASIC, which I've adapted to this SBC.
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
eyJoaXN0b3J5IjpbLTE1NTk5Mzk1NThdfQ==
-->