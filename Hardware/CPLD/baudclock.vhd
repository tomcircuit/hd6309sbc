library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Baudrate clock generation
----------------------------
entity baudclock is
	port ( reset : in std_logic;		-- global reset
			clock : in std_logic;		-- 14.745M oscillator input
			a_out : out std_logic;		-- 115.2kbps * 16 clock output = 1.8432 MHz
			b_out : out std_logic		-- 3.6864 MHz clock output (for BRG)
	);
end baudclock;

architecture behavior of baudclock is
	-- clock generation state and output drivers
	signal baud_cnt_a : integer range 0 to 3;
	signal baud_cnt_b : integer range 0 to 3;
	signal baud_drv_a : std_logic;
	signal baud_drv_b : std_logic;

begin

	-- The target ACLK (baud rate clock) frequency is 1.843 MHz, which is 
	-- 14.745 MHz clock divided by 8.
	
	baud_gen_a : process ( reset, clock ) begin
		if ( reset = '0' ) then
			baud_cnt_a <= 0;
			baud_drv_a <= '0';
 		elsif ( clock = '1' and clock'event ) then 
			if ( baud_cnt_a = 3 ) then 
				baud_cnt_a <= 0;
				baud_drv_a <= not baud_drv_a;
			else
				baud_cnt_a <= baud_cnt_a + 1;
			end if;
		end if;
	end process;

	-- The target BCLK (baud rate clock) frequency is 3.686 MHz, which is 
	-- 14.745 MHz clock divided by 4.
	
	baud_gen_b : process ( clock ) begin
 		if ( clock = '1' and clock'event ) then 
			if ( baud_cnt_b = 1 ) then 
				baud_cnt_b <= 0;
				baud_drv_b <= not baud_drv_b;
			else
				baud_cnt_b <= baud_cnt_b + 1;			
			end if;
		end if;
	end process;

	-- update ACLK output from baud_drv_a value
	a_out <= baud_drv_a;
	
	-- update BCLK output from baud_drv_b value
	b_out <= baud_drv_b;

end behavior;		

