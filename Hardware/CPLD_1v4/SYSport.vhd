library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- SYSTEM CONFIGURATION port
--
--      7     6     5     4      3       2       1      0
--    [n.u.][n.u.][n.u.][CONF][ROMP27][ROMSEH][ROMSEL][ROMWS]
--      r     r     r     r      rw      rw      rw     rw   
-- RST: 0     0     0     x      x       1       1      1
--
-- 

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
	signal romp27_latch, romsel_latch, romws_latch, romseh_latch : std_logic; -- latched outputs
	signal config_latch : std_logic; -- synchronized input
begin
	process (reset,clock,data,config) begin
		-- initialize port upon reset (RA14 takes CONFIG state at reset)
		if (reset = '0') then
			romws_latch <= '1';		
			romsel_latch <= '1';
			romseh_latch <= '1';
			romp27_latch <= config;			
				
		-- process all events that take place on clock rising edge
		elsif ( clock'event and clock='1' ) then
		
		-- load output latches during write accesses
			if (wr_n = '0' and cs_n = '0') then
				romws_latch <= data(0);						
				romsel_latch <= data(1);				
				romseh_latch <= data(2);				
				romp27_latch <= data(3);
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
	dataq(2) <= romseh_latch;
	dataq(3) <= romp27_latch;	
	dataq(4) <= config_latch;
	dataq(7 downto 5) <= (others => '0');

end behavior;		

