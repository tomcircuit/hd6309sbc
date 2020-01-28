library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode is
	port( reset : in std_logic;		-- global reset
			addr : in std_logic_vector(15 downto 4);	-- CPU address bus
			rd_n : in std_logic;			-- CPU READ signal (active low)
			wr_n : in std_logic;			-- CPU WRITE signal (active low)
			romsel : in std_logic;		-- ROM banking control
			romseh : in std_logic;     -- ROM banking control
			ciocs : out std_logic;		-- CIO active low select
			scccs : out std_logic;		-- SCC active low select
			rtccs : out std_logic;		-- RTC active low select
			romcs : out std_logic;		-- ROM active low select
			ram1cs : out std_logic;		-- RAM #1 active low select
			ram2cs : out std_logic;		-- RAM #2 active low select
			syscs : out std_logic;		-- SYSTEM port active low select
			sdccs : out std_logic;		-- SD card interface active low select
			iopcs : out std_logic;		-- IO port active low select
			vercs : out std_logic		-- VERSION port active low select
		);
end decode;

architecture behavioral of decode is

	signal region1, region2, region3, region4, region5, region6 : std_logic;
	signal para0, para1, para2, para3, para4, para5, para6 : std_logic;
	
begin


	-- Decode Address Regions in Memory Map
	---------------------------------------
	
	-- REGION1 = 0x0000...0x7FFF
	region1 <= reset and not addr(15);	
	
	-- REGION2 = 0x8000...0xBFFF
	region2 <= reset and addr(15) and not addr(14);
	
	-- REGION3 = 0xC000...0xDFFF
	region3 <= reset and addr(15) and addr(14) and not addr(13);
	
	-- REGION4 = 0xE000...0xE0FF
   region4 <= reset and addr(15) and addr(14) and addr(13) and not addr(12) and not addr(11) and not addr(10) and not addr(9) and not addr(8);
	
	-- REGION5 = 0xE100...0xE1FF
   region5 <= reset and addr(15) and addr(14) and addr(13) and not addr(12) and not addr(11) and not addr(10) and not addr(9) and addr(8);	
	
	-- REGION6 = 0xE200...0xFFFF
	region6 <= reset and addr(15) and addr(14) and addr(13) and not region4 and not region5;
	
	
	-- Decode Paragraphs in Memory Map
	----------------------------------
	
	-- PARA0 = 0xXX0X
	para0 <= not addr(7) and not addr(6) and not addr(5) and not addr(4);
	
	-- PARA1 = 0xXX1X
	para1 <= not addr(7) and not addr(6) and not addr(5) and addr(4);	
	
	-- PARA2 = 0xXX2X
	para2 <= not addr(7) and not addr(6) and addr(5) and not addr(4);		
	
	-- PARA3 = 0xXX3X
	para3 <= not addr(7) and not addr(6) and addr(5) and addr(4);			
	
	-- PARA4 = 0xXX4X
	para4 <= not addr(7) and addr(6) and not addr(5) and not addr(4);				
	
	-- PARA5 = 0xXX5X
	para5 <= not addr(7) and addr(6) and not addr(5) and addr(4);					
	
	-- PARA6 = 0xXX6X
	para6 <= not addr(7) and addr(6) and addr(5) and not addr(4);	
	

	
	-- Generate Select Signals from Region Strobes
	----------------------------------------------
	
	-- RAM#1 in region 1
	ram1cs <= not region1;
	
	-- RAM#2 in region 2 and region 3 when romsel = 0 or a write and region 6 when romseh = 0 or a write
	ram2cs <= '0' when region2 = '1' or ( region3 = '1' and (romsel = '0' or wr_n = '0') ) 
	                              or ( region6 = '1' and (romseh = '0' or wr_n = '0') ) else '1';

	-- ROM in region 3 when romsel = 1 and reads or in region 6 when romseh = 1 and reads
	romcs <= '0' when ( (region3 = '1' and ( romsel = '1' and rd_n = '0' ) )
	                               or ( region6 = '1' and (romseh = '1' and rd_n = '0') ) ) else '1';
																								
	-- active LOW CIO chip select output driver
	ciocs <= not (region4 and para0);
	
	-- active LOW SCC chip select output driver 
	scccs <= not (region4 and para1);

	-- active LOW RTC chip select output 
	rtccs <= not (region4 and para2);

	-- active LOW SD card port select
	sdccs <= not (region4 and para3);
	
	-- active LOW system config port select
	syscs <= not (region4 and para4);

	-- active LOW I/O port select
	iopcs <= not (region4 and para5);

	-- active LOW VERSION port select
	vercs <= not (region4 and para6);
	
end behavioral;		



