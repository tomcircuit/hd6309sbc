library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Input-Output port for SD card interface, pushbutton, and LED's
--
--       7     6      5     4     3   2   1     0
--    [SDSW][SDBSY][SDCLK][SDCS][PB][--][LED2][LED1]
--       r     r      rw    rw    r   r   rw    rw
-- RST:  x     x      0     1     x   0   1     1

entity IOport is
	port(	reset : in std_logic;	-- global reset
			clock : in std_logic;		-- global clock
			cs_n : in std_logic;			-- active low select
			wr_n : in std_logic;			-- active low write
			data : in std_logic_vector(7 downto 0);
			dataq : out std_logic_vector(7 downto 0);
			sdbusy : in std_logic;		-- SPI interface busy status (1 == busy)
			sdswitch : in std_logic;	-- SD card sense switch	(1 == card)
			button : in std_logic		-- pushbutton input (1 == pushed)
	);
end IOport;


architecture behavior of IOport is
	signal led_latch : std_logic_vector(1 downto 0); -- LED drive outputs
	signal sdcs_latch, sdclk_latch : std_logic; -- SD CS control and SD clock select
	signal switch_latch, button_latch : std_logic; -- synchronized inputs
begin
	process (reset,clock,data,button) begin
		-- set all outputs upon reset
		if (reset = '0') then
			led_latch <= "11";
			sdcs_latch <= '1';
			sdclk_latch <= '0';
				
		-- process all events that take place on clock rising edge
		elsif (rising_edge(clock)) then 

		-- load output latches during write access
			if (wr_n = '0' and cs_n = '0') then
				led_latch <= data(1 downto 0);
				sdcs_latch <= data(4);
				sdclk_latch <= data(5);
			end if;
		
		-- update input latches during inactivity
			if (cs_n = '1') then
				button_latch <= button;
				switch_latch <= sdswitch;
			end if;
		end if;
	end process;
	
	-- drive latch readback and input signals onto dataq during read strobe	
	dataq(1 downto 0) <= led_latch;
	dataq(2) <= '0';
	dataq(3) <= button_latch;	
--	dataq(3) <= button;	
	dataq(4) <= sdcs_latch;	
	dataq(5) <= sdclk_latch;
--	dataq(6) <= busy_latch;
	dataq(6) <= sdbusy;
	dataq(7) <= switch_latch;	
--	dataq(7) <= sdswitch;	
	
end behavior;		

