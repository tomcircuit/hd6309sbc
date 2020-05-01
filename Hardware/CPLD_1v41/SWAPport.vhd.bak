library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- V1.41 move update logic from this component into toplevel
-- changed select senses to active high

-- SD_DATA port (SPI master data port) 
--
--      7   6   5   4   3   2   1   0
--    [D7][D6][D5][D4][D3][D2][D1][D0]
--     rw  rw  rw  rw  rw  rw  rw  rw
-- RST: 0   0   0   0   0   0   0   0
--
-- a WRITE starts a SPI transfer of the written data
-- and reads in a new byte. 

entity SDdata is
	port (	reset : in std_logic;	-- global reset
				clock : in std_logic;		-- global clock
				cs : in std_logic;			-- select
				wr_n : in std_logic;			-- active low write
				data : in std_logic_vector(7 downto 0);
				dataq : out std_logic_vector(7 downto 0)
		);
end SDdata;

architecture behavior of SDdata is
	signal d_latch : std_logic_vector(7 downto 0); -- latched outputs
	
begin
	process (reset,clock,data) begin
		-- clear outputs upon reset
		if (reset = '0') then
			d_latch <= x"00";		
			
		-- process all events that take place on clock rising edge
		elsif (clock'event and clock='1') then

		-- load output latches during write access
			if (wr_n = '0' and cs = '1') then
				d_latch <= data;
			end if;
		end if;
	end process;
	
	-- drive latch output signals
	dataq <= d_latch;
	
end behavior;		

