library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Soft I2C port for Realtime Clock interface
--
--       7       6      5 4     3      2     1 0
--    [SCLout][SDAout][ 0 0 ][SCLin][SDAin][ 0 0 ]
--       rw      rw             r      r      
-- RST:  1       1              x      x     

entity I2Cport is
	port(	reset : in std_logic;	-- global reset
			clock : in std_logic;		-- global clock
			cs_n : in std_logic;			-- active low select
			wr_n : in std_logic;			-- active low write
			data : in std_logic_vector(7 downto 0);
			dataq : out std_logic_vector(7 downto 0);
			sda_in : in std_logic;		-- SDA monitor input
			scl_in : in std_logic 		-- SCL monitor input
	);
end I2Cport;


architecture behavior of I2Cport is
	signal sda_latch, scl_latch : std_logic; 	-- output latches
	signal sda_mon, scl_mon : std_logic;		-- synchronized inputs
begin
	process (reset,clock,data,sda_in,scl_in) begin
		-- set all outputs upon reset
		if (reset = '0') then
			sda_latch <= '1';
			scl_latch <= '1';
				
		-- process all events that take place on clock rising edge
		elsif (rising_edge(clock)) then 

		-- load output latches during write access
			if (wr_n = '0' and cs_n = '0') then
				sda_latch <= data(6);
				scl_latch <= data(7);
			end if;
		
		-- update input latches during inactivity
			if (cs_n = '1') then
				sda_mon <= sda_in;
				scl_mon <= scl_in;
			end if;
		end if;
	end process;
	
	-- drive latch readback and input signals onto dataq during read strobe	
	dataq(1 downto 0) <= "00";
	dataq(2) <= sda_mon;
	dataq(3) <= scl_mon;
	dataq(5 downto 4) <= "00";	
	dataq(6) <= sda_latch;	
	dataq(7) <= scl_latch;	
	
end behavior;		

