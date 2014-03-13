library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- SYSTEM CONFIG port
--      7   6   5   4    3     2      1      0
--		[--][A2][A1][A0][CONF][RA14][ROMSEL][ROMWS]
--      X   O   O   O    I     O      O      O   
--  all bits readable, output bits readback
--  unused bits (X) read back as '0'

entity sysport is
port (	reset : in std_logic;	-- global reset
			clock : in std_logic;		-- global clock
			cs_n : in std_logic;			-- active low select
			wr_n : in std_logic;			-- active low write
			data : in std_logic_vector(7 downto 0);
			dataq : out std_logic_vector(7 downto 0);
			config : in std_logic		-- CONFIG jumper status
	);
end sysport;

architecture behavior of sysport is
	signal ra14_latch, romsel_latch, romws_latch : std_logic; -- latched outputs
	signal mux_latch : std_logic_vector(2 downto 0); -- latched outputs	
	signal config_latch : std_logic; -- synchronized input
begin
	process (reset,clock,data,config) begin
		-- clear outputs upon reset
		if (reset = '0') then
			ra14_latch <= '0';
			romsel_latch <= '1';
			romws_latch <= '1';
			mux_latch <= "000";			
				
		-- process all events that take place on clock rising edge
		elsif ( clock'event and clock='1' ) then
		
		-- load output latches during write accesses
			if (wr_n = '0' and cs_n = '0') then
				romws_latch <= data(0);			
				ra14_latch <= data(2);
				romsel_latch <= data(1);
				mux_latch <= data(6 downto 4);
			end if;
		
		-- update input latches during inactivity
			if (cs_n = '1') then
				config_latch <= config;
			end if;
		end if;
	end process;
	
	-- drive latch readback and input signals onto dataq 
	dataq(0) <= romws_latch;
	dataq(1) <= romsel_latch;
	dataq(2) <= ra14_latch;
	dataq(3) <= '0';	
	dataq(6 downto 4) <= mux_latch;
	dataq(7) <= config_latch;	

end behavior;		

