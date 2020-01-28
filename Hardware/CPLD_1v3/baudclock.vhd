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
	signal c3out : std_logic_vector(2 downto 0);
	
begin
	-- The target ACLK (baud rate clock) frequency is 1.843 MHz, which is 14.745 MHz clock divided by 8
	-- The target BCLK (baud rate clock) frequency is 3.686 MHz, which is 14.745 MHz clock divided by 4
	-- so, use the two most significant outputs of a 3-bit counter for ACLK and BCLK, respectively.

   counter : entity work.count3 port map (
		aclr	=> not reset,
		clock	=> clock,
		q => c3out
	);

	-- update ACLK output from Q2 tap of counter
	a_out <= c3out(2);
	
	-- update BCLK output from Q1 tap of counter
	b_out <= c3out(1);

end behavior;		

