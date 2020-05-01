library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- V1.41 remove ROMWS and add ASEL
-- changed select senses to active high

-- SYSTEM CONFIGURATION port
--
--      7     6     5     4      3       2       1      0
--    [n.u.][n.u.][ASEL][CONF][ROMP27][ROMSEH][ROMSEL][n.u.]
--      r     r     rw    r      rw      rw      rw     r   
-- RST: 0     0     0     x      *       1       1      0
--
-- *ROMP27 takes the value of CONF at RESET

entity sysport is
port (	reset : in std_logic;	-- global reset
			clock : in std_logic;		-- global clock
			cs : in std_logic;			-- select
			wr_n : in std_logic;			-- active low write
			data : in std_logic_vector(7 downto 0);
			dataq : out std_logic_vector(7 downto 0);
			config : in std_logic		-- CONFIG jumper status
	);
end sysport;

architecture behavior of sysport is
	signal asel_latch, romp27_latch, romsel_latch, romseh_latch : std_logic; -- latched outputs
	signal config_latch : std_logic; -- synchronized input
begin
	process (reset,clock,data,config) begin
		-- initialize port upon reset (RA14 takes CONFIG state at reset)
		if (reset = '0') then
			romsel_latch <= '1';
			romseh_latch <= '1';
			romp27_latch <= config;
			asel_latch <= '0';
				
		-- process all events that take place on clock rising edge
		elsif (clock'event and clock='1') then
		
		-- load output latches during write accesses
			if (wr_n = '0' and cs = '1') then
				romsel_latch <= data(1);				
				romseh_latch <= data(2);				
				romp27_latch <= data(3);
				asel_latch <= data(5);						
			end if;

		-- update input latches during inactivity
			if (cs = '0') then
				config_latch <= config;
			end if;
		
		end if;
	end process;
	
	-- drive latch readback and input signals onto dataq 
	dataq(0) <= '0';
	dataq(1) <= romsel_latch;
	dataq(2) <= romseh_latch;
	dataq(3) <= romp27_latch;	
	dataq(4) <= config_latch;
	dataq(5) <= asel_latch;
	dataq(7 downto 6) <= (others => '0');

end behavior;		

