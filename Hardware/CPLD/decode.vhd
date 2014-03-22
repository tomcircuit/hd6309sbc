library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode is
	port( reset : in std_logic;		-- global reset
			addr : in std_logic_vector(15 downto 4);	-- CPU address bus
			eclk : in std_logic;			-- CPU E clock
			rd_n : in std_logic;			-- CPU READ signal (active low)
			wr_n : in std_logic;			-- CPU WRITE signal (active low)
			romsel : in std_logic;		-- ROM banking control
			ciocs : out std_logic;		-- CIO active low select
			scccs : out std_logic;		-- SCC active low select
			rtccs : out std_logic;		-- RTC active low select
			auxcs : out std_logic;		-- AUX active low select
			romcs : out std_logic;		-- ROM active low select
			ram1cs : out std_logic;		-- RAM #1 active low select
			ram2cs : out std_logic;		-- RAM #2 active low select
			syscs : out std_logic;		-- SYSTEM port active low select
			sdccs : out std_logic;		-- SD card interface active low select
			iopcs : out std_logic		-- IO port active low select
		);
end decode;

architecture behavioral of decode is

	-- page to which both on-chip and off-chip IO is mapped
	constant IO_PAGE : std_logic_vector (7 downto 0) := 		x"C0";		-- 0x02XX
	constant CIO_PARA : std_logic_vector (11 downto 0) := IO_PAGE & x"0";		-- IO_PAGE+00...IO_PAGE+0F
	constant SCC_PARA : std_logic_vector (11 downto 0) := IO_PAGE & x"1";		-- IO_PAGE+10...IO_PAGE+1F
	constant RTC_PARA : std_logic_vector (11 downto 0) := IO_PAGE & x"2";		-- IO_PAGE+20...IO_PAGE+2F
	constant SDCARD_PARA : std_logic_vector (11 downto 0) := IO_PAGE & x"3"; 		-- IO_PAGE+30...IO_PAGE+3F		
	constant SYSCFG_PARA : std_logic_vector (11 downto 0) := IO_PAGE & x"4";		-- IO_PAGE+40...IO_PAGE+4F
	constant INOUT_PARA : std_logic_vector (11 downto 0) := 	IO_PAGE & x"5";		-- IO_PAGE+50...IO_PAGE+5F	
	
		begin
	
	-- Address Decoder
	------------------
	-- RAM #1 from 0x0000-7FFF 
	-- RAM #2 from 0x8000-BFFF read and write access
	--			 from 0xC000-FFFF write access
	--			 from 0xC000-FFFF read access when ROMSEL = 0
	--
	-- ROM from 0xC000-FFFF read access when ROMSEL = 1
		
	-- active LOW ROM chip seelct during reads from pages C0-FF when ROMSEL is high (default)
	romcs <= '0' when ( reset = '1' and addr(15 downto 8) /= IO_PAGE and addr(15 downto 14) = "11" and romsel = '1' ) else '1';	

	-- active LOW RAM #1 chip select during access to pages 00-7F
	ram1cs <= '0' when ( reset = '1' and eclk = '1' and addr(15 downto 8) /= IO_PAGE and addr(15) = '0' ) else '1';

	-- active LOW RAM1 chip select during access to pages 80-BF
	-- and pages C0-FF during reads when ROMSEL is LOW
	ram2cs <= '0' when ( reset = '1' and eclk = '1' and addr(15 downto 8) /= IO_PAGE and 
			( ( addr(15 downto 14) = "10" ) or ( addr(15 downto 14) = "11" and romsel = '0' ) ) )	else '1';	
																								
	-- active LOW CIO chip select output driver
	ciocs <= '0' when ( reset = '1' and addr(15 downto 4) = CIO_PARA ) else '1';
	
	-- active LOW CIO chip select output driver 
	scccs <= '0' when ( reset = '1' and addr(15 downto 4) = SCC_PARA ) else '1';
	
	-- active LOW RTC chip select output 
	rtccs <= '0' when ( reset = '1' and addr(15 downto 4) = RTC_PARA ) else '1';
	
	-- active LOW auxillary chip select output (upper 128 bytes of IO_PAGE)
	auxcs <= '0' when ( reset = '1' and addr(15 downto 8) = IO_PAGE and addr(7) = '1' ) else '1';
														
	-- active LOW system config port select
	syscs <= '0' when ( reset = '1' and addr(15 downto 4) = SYSCFG_PARA ) else '1';

	-- active LOW SD card port select
	sdccs <= '0' when ( reset = '1' and addr(15 downto 4) = SDCARD_PARA ) else '1';

	-- active LOW I/O port select
	iopcs <= '0' when ( reset = '1' and addr(15 downto 4) = INOUT_PARA ) else '1';
	
end behavioral;		

