library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- SD_DATA port (SPI master data port) 
--
--      7   6   5   4   3   2   1   0
--    [D7][D6][D5][D4][D3][D2][D1][D0]
--     rw  rw  rw  rw  rw  rw  rw  rw
-- RST: 0   0   0   0   0   0   0   0
--
-- a WRITE starts a SPI transfer of the written data
-- and reads in a new byte. a READ drives the read
-- data onto the data bus.

entity SDdata is
	port (	reset : in std_logic;	-- global reset
				clock : in std_logic;		-- global clock
				cs_n : in std_logic;			-- active low select
				wr_n : in std_logic;			-- active low write
				data : in std_logic_vector(7 downto 0);
				dataq : out std_logic_vector(7 downto 0);
				update_cl : in std_logic;		-- bring high to clear the update output
				update : out std_logic		-- high after a write completes
		);
end SDdata;

architecture behavior of SDdata is
	signal d_latch : std_logic_vector(7 downto 0); -- latched outputs
	signal upd_latch : std_logic;
	
begin
	process (reset,clock,data) begin
		-- clear outputs upon reset
		if (reset = '0') then
			d_latch <= x"00";		
			upd_latch <= '0';
			
		-- process all events that take place on clock rising edge
		elsif ( clock'event and clock='1' ) then

		-- clear the update latch when acknowledged
			if (update_cl = '1') then
				upd_latch <= '0';				
			end if;
		
		-- load output latches during write access
			if (wr_n = '0' and cs_n = '0') then
				d_latch <= data;
				upd_latch <= '1';
			end if;
		
		end if;
	end process;
	
	-- drive latch output signals
	dataq <= d_latch;
	update <= upd_latch;	
	
end behavior;		

