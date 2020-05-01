library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- V1.41 move peripheral decoding up to top level (enables LPFM decoder)
-- changed select senses to active high

entity decode is
	port( reset : in std_logic;		-- global reset
			addr : in std_logic_vector(15 downto 8);	-- CPU address bus
			rd_n : in std_logic;			-- CPU READ signal (active low)
			wr_n : in std_logic;			-- CPU WRITE signal (active low)
			romsel : in std_logic;		-- ROM banking control
			romseh : in std_logic;     -- ROM banking control
   		rom : out std_logic;		-- ROM select
			ram1 : out std_logic;		-- RAM #1 select
			ram2 : out std_logic;		-- RAM #2 select
			peripl : out std_logic;		-- LOW peripheral (0xE000-0xE0FF) select
			periph : out std_logic		-- HIGH peripheral (0xE100-0xE1FF) select
		);
end decode;

architecture behavioral of decode is
	signal region1, region2, region3, region4, region5, region6 : std_logic;
	
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

	
	-- Generate Select Signals from Region Strobes
	----------------------------------------------
	
	-- RAM#1 in region 1
	ram1 <= region1;
	
	-- RAM#2 in region 2 and region 3 when romsel = 0 or a write and region 6 when romseh = 0 or a write
	ram2 <= '1' when region2 = '1' or ( region3 = '1' and (romsel = '0' or wr_n = '0') ) 
	                              or ( region6 = '1' and (romseh = '0' or wr_n = '0') ) else '0';

	-- ROM in region 3 when romsel = 1 and reads or in region 6 when romseh = 1 and reads
	rom <= '1' when ( (region3 = '1' and ( romsel = '1' and rd_n = '0' ) )
	                               or ( region6 = '1' and (romseh = '1' and rd_n = '0') ) ) else '0';
																								
	-- LOW peripheral block
	peripl <= region4;
	
	-- HIGH peripheral block
	periph <= region5;

end behavioral;		



