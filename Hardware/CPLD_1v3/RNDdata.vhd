library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- RND_DATA 
--      7   6   5   4   3   2   1   0
--    [D7][D6][D5][D4][D3][D2][D1][D0]
--

entity RNDdata is
	port (	reset : in std_logic;	-- global reset
				clock : in std_logic;		-- global clock
				cs_n : in std_logic;			-- active low select
				wr_n : in std_logic;			-- active low write
				data : in std_logic_vector(7 downto 0);
				dataq : out std_logic_vector(7 downto 0)
		);
end RNDdata;

architecture behavior of RNDdata is
	signal d_latch : std_logic_vector(7 downto 0); -- latched outputs
	signal upd_latch : std_logic;
begin
	process (reset,clock,data) begin
		-- clear outputs upon reset
		if (reset = '0') then
			d_latch <= x"80";		
			
		-- process all events that take place on clock rising edge
		elsif ( clock'event and clock='1' ) then

      --	detect LFSR read (set update flag)		
			if (wr_n = '1' and cs_n = '0') then
            upd_latch <= '1';
			end if;
			
      -- update LFSR after each read (clear update flag)			
			if (cs_n = '1' and upd_latch = '1') then
			   upd_latch <= '0';
				d_latch(0) <= d_latch(7) xor d_latch(5) xor d_latch(4) xor d_latch(3);
				d_latch(7 downto 1) <= d_latch(6 downto 0);				
			end if;
			
		end if;
	end process;
	
	-- drive latch output signals
	dataq <= d_latch;
	
end behavior;		




