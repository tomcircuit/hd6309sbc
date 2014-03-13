library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Input-Output port 
--      7      6     5   4    3    2    1     0
--    [SDSW][SDBSY][PB][XX][SDCS][--][LED2][LED1]
--      I      I     I   X    O    X    O     O
--  all bits read, output bits readback

entity ioport is
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
end ioport;


architecture behavior of ioport is
	signal led_latch : std_logic_vector(1 downto 0); -- LED drive outputs
	signal sdcs_latch : std_logic; -- SD CS control
	signal busy_latch, switch_latch, button_latch : std_logic; -- synchronized inputs
begin
	process (reset,clock,data,button) begin
		-- set all outputs upon reset
		if (reset = '0') then
			led_latch <= "11";
			sdcs_latch <= '1';
				
		-- process all events that take place on clock rising edge
		elsif (rising_edge(clock)) then 

		-- load output latches during write access
			if (wr_n = '0' and cs_n = '0') then
				led_latch <= data(1 downto 0);
				sdcs_latch <= data(3);
			end if;
		
		-- update input latches during inactivity
			if (cs_n = '1') then
				button_latch <= button;
				switch_latch <= sdswitch;
				busy_latch <= sdbusy;
			end if;
		end if;
	end process;
	
	-- drive latch readback and input signals onto dataq during read strobe	
	dataq(1 downto 0) <= led_latch;
	dataq(2) <= '0';
	dataq(3) <= sdcs_latch;	
	dataq(4) <= '0';
	dataq(5) <= button_latch;
	dataq(6) <= busy_latch;
	dataq(7) <= switch_latch;

end behavior;		

