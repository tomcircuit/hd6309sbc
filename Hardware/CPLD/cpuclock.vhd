library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- CPU clock generation
-----------------------
-- HD6309 needs quadrature phase clock (here with 0WS)
--        ___________            __________               __________
--  Q ___/           \__________/          \_____________/
--
--              ___________             ___________             _______
--  E _________/           \___________/           \___________/
--
--                ___________             ___________             _______
--  D-E _________/           \___________/           \___________/
--
-- ST 0     1     3     2     0     1     3     2     0     1     3       
--
--
-- (here with 1WS)
--        ___________            __________                    ___________
--  Q ___/           \__________/          \__________________/           \_
--
--              ___________             _________________             ______
--  E _________/           \___________/                 \___________/       
--
--    ___________________________________        ____________________________
-- R1                   \\\\\\\\\\\\\\\\\\______//////////////////////
--
-- ST 0     1     3     2     0     1     3     6     2     0     1     3
--
--
-- (here with 3WS)
--        ___________            __________
--  Q ___/           \__________/          \______________________________
--
--              ___________             _____________________________
--  E _________/           \___________/                             \_____
--
--    ___________________________________        ____________________________
-- R3                   \\\\\\\\\\\\\\\\\\______/////////////////////////////
--
-- ST 0     1     3     2     0     1     3     4     5     6     2     0  
--
--
-- States 4 and 5 and 6 are wait states for slow peripherals and are inserted
-- if READY3 is not asserted before end of state 3. READY3 is asserted during
-- accesses to the CIO and SCC (slow Zilog peripherals).
--
-- A shorter, 1 wait state, sequence is used if READY1 is not asserted before
-- end of state 3 (only the extra state 6 is inserted). 
--
-- The target ECLK frequency is 3 MHz, and the assumed XOSC clock frequency
-- is 24 MHz. One ECLK cycle is 4 states instead of two states so the ECLK
-- state clock rate is 6 MHz. Therefore, we need to divide the 24 MHz XOSC 
-- input by 4 to obtain the correct state clock frequency.  In order
--	to make the states correspond to the E/Q waveforms, I'll make a prescalar 
-- to divide-by-4 and only on prescalar events will the clock state update.

entity cpuclock is
		port(	clock : in std_logic;		-- 24M oscillator input
				ready1 : in std_logic;		-- H = ready, L = insert 1WS
				ready3 : in std_logic;		-- H = ready, L = insert 3WS
				e_out : out std_logic;		-- E quadrature clock output
				q_out : out std_logic;		-- Q quadrature clock output
				d_e_out : out std_logic;	-- delayed E quad clock output				
				zw_out : out std_logic		-- write gate (H during State 2)
													-- used to create WRITE strobe for Zilog peripherals
		);
end cpuclock;

architecture behavior of cpuclock is
	-- clock generation state and output drivers
	constant cpu_div : integer range 0 to 1 := 1;
	signal pre_cnt : integer range 0 to 1;
	signal clock_state : integer range 0 to 6;
	signal next_state : integer range 0 to 6;
	signal e_drive : std_logic;
	signal s_drive : std_logic;
	signal state_vec : std_logic_vector(2 downto 0);
	
begin

	-- create a 6 MHz state clock, which feeds the E/Q state logic
	clock_gen : process(clock) begin
		if (clock = '1' and clock'event) then 
			if (pre_cnt = cpu_div) then 
				pre_cnt <= 0;
				clock_state <= next_state;
			else
				pre_cnt <= pre_cnt + 1;
			end if;
			
			-- create an E output delayed by one XCLK period, to be
			-- used for output enable of CPU readable on-chip registers
			-- (to satisfy the CPU read data hold time after E falls)
			d_e_out <= e_drive;
		end if;
	end process;
	
	clock_advance : process (clock_state, ready1, ready3) begin
		if (clock_state = 0) then 
			next_state <= 1;
		elsif (clock_state = 1) then
			next_state <= 3;
		elsif (clock_state = 3 and ready3 = '1' and ready1 = '1') then
			next_state <= 2;
		elsif (clock_state = 3 and ready3 = '1' and ready1 = '0') then
			next_state <= 6;
		elsif (clock_state = 3 and ready3 = '0') then
			next_state <= 4;
		elsif (clock_state = 4) then
			next_state <= 5;
		elsif (clock_state = 5) then
			next_state <= 6;
		elsif (clock_state = 6) then
			next_state <= 2;
		else
			next_state <= 0;
		end if;
	end process;


	-- generate ECLK and QCLK outputs from state value
	-- the hardcoded logic impl. requires FAR fewer macrocells than the conditional assignment impl.
	state_vec <= std_logic_vector(to_unsigned(clock_state,3));		
	
	--	e_drive <= '1' when (clock_state = 3 or clock_state = 4 or clock_state = 5 or clock_state = 6 or clock_state = 2) else '0';	
	e_drive <= state_vec(1) or state_vec(2);
	e_out <= e_drive;	
	
	--	q_out <= '1' when (clock_state = 1 or clock_state = 3) else '0';
   q_out <= state_vec(0) and not state_vec(2);

	-- generate Zilog write strobe output from state value	
	--	zw_out <= '1' when (clock_state = 2) else '0';
	zw_out <= not state_vec(0) and state_vec(1) and not state_vec(2);
	
end behavior;		

