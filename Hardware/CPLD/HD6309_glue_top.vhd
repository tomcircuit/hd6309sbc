library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--
-- Glue Logic for HD63C09 based single board computer
-- Tom LeMense
--
-- Target = Altera EPM7128SLI84 CPLD
-- Tool = Quartus 32-bit web edition 13.0.1
--
-- VERSION 1.2 - March 22, 2014
--
-- This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 
-- International License. To view a copy of this license, visit 
-- http://creativecommons.org/licenses/by-sa/4.0/.

entity HD6309_glue_top is
	port ( 
		XOSC : in std_logic;			-- Oscillator input for CPU (nominally 24 MHz)
		WOSC : in std_logic;			-- Oscillator input for ACLK/BCLK (nominally 14.745 MHz)

		QCLK : out std_logic;		-- Q phase clock output (nom 3 MHz, XOSC divided by 8)
		ECLK : out std_logic;		-- E phase clock output (nom 3 MHz, XOSC divided by 8)
		BCLK : out std_logic;		-- SCC ch B baudrate (WOSC/4 for SCC BRG)
		ACLK : out std_logic;		-- SCC ch A baudrate (WOSC/8 for 115.2kbps in SCC 16x mode)
		
		RESET : in std_logic;		-- active low RESET input
		
		ADDR : in std_logic_vector (15 downto 4);  -- A[15:4] from CPU
		RW : in std_logic;			-- H = RD, L = WR input from CPU
		DATA : inout std_logic_vector (7 downto 0); -- D[7:0] from CPU
		LIC : in std_logic;			-- Instruction Decode flag from CPU		
		
		ROMCS : out std_logic;		-- active low EPROM chip select
		RAM1CS : out std_logic;		-- active low SRAM #1 chip select
		RAM2CS : out std_logic;		-- active low SRAM #1 chip select		
		CIOCS : out std_logic;		-- active low CIO chip select
		RTCCS : out std_logic;		-- active low RTC chip select
		SCCCS : out std_logic;		-- active low SCC chip select
		RD : out std_logic;			-- E-qualified active low RD signal e.g. SRAM, ROM
		WR : out std_logic;			-- E-qualified active low WR signal 
		ZRD : out std_logic;			-- active low RD signal for CIO and SCC
		ZWR : out std_logic;			-- active low WR signal for CIO and SCC
		
		ROMP27 : out std_logic;		-- EPROM A14 / EEPROM WE
		
		TP11 : out std_logic;		-- PCB testpoint TP11 
		TP12 : out std_logic;		-- PCB testpoint TP12
		TP13 : out std_logic;      -- PCB testpoint TP13
		TP14 : out std_logic;		-- PCB testpoint TP14
		
		CONF : in std_logic;			-- configuration option (L = 28C128 EEPROM / H = 27C128 EPROM )
		SPARE : out std_logic;		-- output to expansion bus (low from 0x0280...0x02FF)
		PBTN : in std_logic;			-- input from pushbutton (to be routed to input port)
		
		LED : out std_logic_vector (2 downto 0);	-- LED outputs (H = ON)
		
		SDCK : out std_logic;		-- SD card clock output
		SDDO : out std_logic;		-- SD card data output (from CPU)
		SDCS : out std_logic;		-- SD card chip select
		SDDI : in std_logic;			-- SD card data intput (to CPU)
		SDSW : in std_logic			-- SD card present switch (L = present)
	);
end HD6309_glue_top;

architecture behavioral of HD6309_glue_top is

	-- clock generation state and output drivers
	signal e_drv, q_drv : std_logic;			-- internal E and Q clocks
	signal bclk_drv, aclk_drv : std_logic;	-- SCC baud rate reference clocks
	signal dly_e : std_logic;			-- delayed E clock used for internal SFR access
	
	-- read, write, peripheral select signals
	signal rd_n, wr_n, zrd_n, zwr_n, eewr_n : std_logic;
	signal scccs_n, ciocs_n, rtccs_n, auxcs_n : std_logic;
	signal romcs_n, ram1cs_n, ram2cs_n : std_logic;
	
	-- ready-state control signals
	signal ready3, ready1 : std_logic; 		-- internal READY signals (H = ready, L = insert xWS)
	signal zwgate : std_logic;			-- write gate for Zilog peripherals (H during S2)

	-- on-chip I/O signals
	signal roma14, romsel, romws : std_logic;
	signal syscs_n, sdccs_n, iopcs_n : std_logic;
	signal spi_start, spi_busy_n, sdcs_n, sdclk_sel, spi_clk, spi_sddo, spi_sdck : std_logic;
	signal data_in, sys_data_out, sdc_data_out, iop_data_out, spi_data_rx, spi_data_tx : std_logic_vector(7 downto 0);
	
	component cpuclock
		port(	clock : in std_logic;		-- 24M oscillator input
				ready1 : in std_logic;		-- H = ready, L = insert 1WS
				ready3 : in std_logic;		-- H = ready, L = insert 3WS
				e_out : out std_logic;		-- E quadrature clock output
				q_out : out std_logic;		-- Q quadrature clock output
				d_e_out : out std_logic;	-- delayed E quad clock output				
				zw_out : out std_logic		-- write gate (H during State 2)
													-- used to create WRITE strobe for Zilog peripherals
		);
	end component;

	component baudclock
		port ( reset : in std_logic;		-- global reset
				clock : in std_logic;		-- 14.745M oscillator input
				a_out : out std_logic;		-- 115.2kbps * 16 clock output = 1.8432 MHz
				b_out : out std_logic		-- 3.6864 MHz clock output (for BRG)
		);
	end component;

	component decode
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
	end component;
	
   -- SD DATA port 
	component SDdata
		port ( reset : in std_logic;	-- global reset
				 clock : in std_logic;		-- global clock
				 cs_n : in std_logic;			-- active low select
				 wr_n : in std_logic;			-- active low write
				 data : in std_logic_vector(7 downto 0);
				 dataq : out std_logic_vector(7 downto 0);
				 update_cl : in std_logic;		-- bring high to clear the update output				 
				 update : out std_logic		-- high after a write completes
		);
	end component; 
	
	-- SYSTEM CONFIG port
	--      7   6   5   4    3     2      1      0
	--		[--][A2][A1][A0][CONF][RA14][ROMSEL][ROMWS]
	--      X   O   O   O    I     O      O      O   
	component sysport
	port (	reset : in std_logic;		-- global reset
				clock : in std_logic;		-- global clock
				cs_n : in std_logic;			-- active low select
				wr_n : in std_logic;			-- active low write
				data : in std_logic_vector(7 downto 0);
				dataq : out std_logic_vector(7 downto 0);
				config : in std_logic		-- CONFIG jumper status (0 = EEPROM / 1 = EPROM)
		);
	end component;

	-- Input-Output port
	--      7      6     5    4      3    2    1     0
	--    [SDSW][SDBSY][PB][SDCLK][SDCS][--][LED2][LED1]
	--      I      I     I    O      O    X    O     O
	component ioport
	port (	reset : in std_logic;		-- global reset
				clock : in std_logic;		-- global clock
				cs_n : in std_logic;			-- active low select
				wr_n : in std_logic;			-- active low write
				data : in std_logic_vector(7 downto 0);
				dataq : out std_logic_vector(7 downto 0);
				sdbusy : in std_logic;		-- SPI interface busy status (high = busy)
				sdswitch : in std_logic;	-- SD card sense switch (high = card in)
				button : in std_logic		-- pushbutton input (high = button pressed)
		);
	end component;

	-- simple SPI master
	component simpleSPI_M
		port(	reset    : in  std_logic;
				clk     : in  std_logic;
				SCLK     : out std_logic;
				SS       : out std_logic;
				MOSI     : out std_logic;
				MISO     : in  std_logic;
				DataToTx : in  std_logic_vector(7 downto 0);
				DataRxd  : out std_logic_vector(7 downto 0);
				StartTx  : in  std_logic
      );
	end component;

	begin	

	CPU_CLK : cpuclock port map (
		clock => XOSC,
		ready1 => ready1,
		ready3 => ready3,
		e_out => e_drv,
		q_out => q_drv,
		d_e_out => dly_e,
		zw_out => zwgate
	);
	
	BAUD_CLK : baudclock port map (
		reset => RESET,
		clock => WOSC,
		a_out => aclk_drv,
		b_out => bclk_drv
	);
	
	-- map the address decoder
	ADDR_DECODE : decode port map ( 
		reset => RESET,
		addr => ADDR(15 downto 4),
		eclk => e_drv,
		rd_n => rd_n,
		wr_n => wr_n,
		romsel => romsel,		
		ciocs => ciocs_n,
		scccs => scccs_n,
		rtccs => rtccs_n,
		auxcs => auxcs_n,
		romcs => romcs_n,
		ram1cs => ram1cs_n,
		ram2cs => ram2cs_n,
		syscs => syscs_n,
		sdccs => sdccs_n,
		iopcs => iopcs_n
	);
	
	-- map the SYSTEM CONFIG port
	SYS_PORT : sysport port map ( 
		reset => reset,
		clock => XOSC,
		cs_n => syscs_n,
		wr_n => wr_n,
		data => data_in,
		dataq => sys_data_out,
		config => CONF
	);
	
	romws <= sys_data_out(0);
	romsel <= sys_data_out(1);
	roma14 <= sys_data_out(2);

	-- map the SBC I/O port	
	IO_PORT : ioport port map ( 
		reset => reset,
		clock => XOSC,
		cs_n => iopcs_n,
		wr_n => wr_n,
		data => data_in,
		dataq => iop_data_out,
		sdbusy => not spi_busy_n,
		sdswitch => not SDSW,
		button => not PBTN
	);
	
	sdcs_n <= iop_data_out(4);
	sdclk_sel <= iop_data_out(5);

	-- map the SD SPI data port
	SD_PORT : SDdata port map (
		reset => reset,
		clock => XOSC,
		cs_n => sdccs_n,			-- active low select
		wr_n => wr_n,				-- active low write
		data => data_in,
		dataq => spi_data_tx,
		update_cl => not spi_busy_n, -- inverted SPI SS is the acknowledge
		update => spi_start		-- pulses high after a write completes
	);
	
	spi_clk <= aclk_drv when (sdclk_sel = '1') else XOSC;
	
	-- component instantiation
	SPI_MASTER: simpleSPI_M port map (
      reset    => reset,
      clk      => spi_clk,
      SCLK     => spi_sdck,
      SS       => spi_busy_n,
      MOSI     => spi_sddo,
      MISO     => SDDI,
      DataToTx => spi_data_tx,
      DataRxd  => spi_data_rx,
      StartTx  => spi_start
	);			
	
	-- Resolve onchip register outputs onto tri-state DATA bus
	data_in <= DATA;
	DATA <= 	spi_data_rx when ( dly_e = '1' and sdccs_n = '0' and RW = '1' ) else
				sys_data_out when ( dly_e = '1' and syscs_n = '0' and RW = '1' ) else
				iop_data_out when ( dly_e = '1' and iopcs_n = '0' and RW = '1' ) else
				"0000ZZZZ" when (rtccs_n = '0' and RW = '1') else
				(others => 'Z');
				
	-- Read-Write signal generation
	-------------------------------
	-- Generation of Zilog ZRD is RW without any qualification
	-- Generation of Zilog ZRW is RW qualified by last portion of e-clock (state 2)
	-- both ZRD and ZWR are asseted simultaneously during RESET
	zrd_n <= '0' when ( RESET = '0' or RW = '1' ) else '1';
	zwr_n <= '0' when ( RESET = '0' or (RW = '0' and zwgate = '1') ) else '1';
	
	-- Generation of RD is RW qualified by a negated RESET
	-- Generation of WR is CPU RW qualified by e-clock (states 3,2)
	rd_n <= '0' when ( RESET = '1' and RW = '1' ) else '1';
	wr_n <= '0' when ( RESET = '1' and RW = '0' and e_drv = '1' ) else '1';
	
	-- wait state control
	ready3 <= scccs_n and ciocs_n and auxcs_n;		-- when SCC or CIO or SPARE are selected, ready3 is negated (adds 3 ws)
	ready1 <= romcs_n when (romws = '1') else '1';		-- ROM is either 0 or 1 WS (default is 1 WS)
	
	-- Output Drivers
	-------------------------
	-- Drive the E and Q clock signals onto output pads.	
	ECLK <= e_drv;
	QCLK <= q_drv;
	
	-- Drive the ACLK and BCLK baud reference outputs
	ACLK <= aclk_drv;
	BCLK <= bclk_drv;
	
	-- Drive the E qualified RD and WR outputs
	RD <= rd_n;		
	WR <= wr_n;
	
	-- Drive the special Zilog RD and WR outputs
	ZRD <= zrd_n;
	ZWR <= zwr_n;
	
	-- Drive the memory and peripheral chip selects
	SCCCS <= scccs_n;
	CIOCS <= ciocs_n;
	RTCCS <= rtccs_n;
	SPARE <= auxcs_n;
	ROMCS <= romcs_n;
	RAM1CS <= ram1cs_n;
	RAM2CS <= ram2cs_n;

	--   if CONF is HIGH (jumper off) then device is EPROM and pin 27 is A14 address signal (from roma14)
	--   if CONF is LOW (jumper installed) then device is EEPROM and pin 27 is WE/ control signal (if roma14 is 1)
	eewr_n <= ((not roma14) or wr_n);
	ROMP27 <= roma14 when ( CONF = '1' ) else eewr_n ;

	-- drive the SD CS line
	SDCS <= sdcs_n;
	SDDO <= spi_sddo;
	SDCK <= spi_sdck;
	
	-- drive the LED outputs (LED1 and LED2 are easy, LED3 is controlled by the SDCS signal)
	LED(1 downto 0) <= iop_data_out(1 downto 0) when (reset = '1') else "00";
	LED(2) <= (not sdcs_n) when (reset = '1') else '0';
	
	-- Drive signals onto the TPxx testpoints
	TP11 <= 	spi_sddo;
	TP12 <= 	SDDI;
--	TP13 <= 	dly_e when (sys_data_out(6 downto 4) = "001") else
--				ready1 when (sys_data_out(6 downto 4) = "010") else
--				ready3 when (sys_data_out(6 downto 4) = "011") else				
--				sclk_drv when (sys_data_out(6 downto 4) = "100") else
--				sys_data_out(2) when (sys_data_out(6 downto 4) = "101") else
--				spi_busy_n when (sys_data_out(6 downto 4) = "110") else
--				'0';

	TP13 <= sdcs_n;
	
--	TP14 <= 	iopcs_n when (sys_data_out(6 downto 4) = "001") else
--				syscs_n when (sys_data_out(6 downto 4) = "010") else
--				sdccs_n when (sys_data_out(6 downto 4) = "011") else
--				eewr_n when (sys_data_out(6 downto 4) = "100") else
--				zwgate when (sys_data_out(6 downto 4) = "101") else
--				spi_start when (sys_data_out(6 downto 4) = "110") else		
--				'0';
				
	TP14 <= spi_sdck;
				
end behavioral;
			

	
	
	
	
	

