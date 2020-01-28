
This set of design files implements the PCB for the HD6309 Singleboard Computer v1.0

Design tool is Cadence (Orcad)

The circuit was designed to maximize use of POS ("Parts On Shelf") and not necessarily
to use the best device possible for a given function. That being said, I think that the
choice of the Zilog SCC is a good choice for serial coms, much better than the default
choice of MC6850. On the other hand, I like the Zilog CIO a lot because of the integration
it offers (much better than an MC6821, for example) but it is weird, and not so commonplace.

At the time of this update (Janunary 2020) the Epson RTC7301DG device has become very scarce!

The mezz_shifter_sch.pdf is the schematic for an adapter board between the HD6309 SBC and
an Altera DE1 Cyclone FPGA development board. 

More up-to-date information on the SBC can be found on the Hackaday project page:
https://hackaday.io/project/345-hd6309-singleboard-computer

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

HD6309 Singleboard Computer (SBC)
Tom LeMense
1/28/2020

tomcircuit@gmail.com
@TomLeMense

		
