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
-- VERSION 1.4 - January 18, 2020
--
-- This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 
-- International License. To view a copy of this license, visit 
-- http://creativecommons.org/licenses/by-sa/4.0/.
--
-- V1.4 adds provisions for a bit-banged I2C interface to a realtime clock.
-- The parallel interface Epson RTC7301 is long obsolete and hard to find.
-- The "soft I2C" interface is located at the same memory map address as
-- the Epson RTC was, but is controlled by D4-D7 so as not to get confused
-- by any software that was expecting to see the Epson RTC (D0-D3).
-- The output used for ~RTCCS is the SCL terminal, and a formerly N.C.
-- pin (11) is the SDA terminal.
-- 

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
		SCCCS : out std_logic;		-- active low SCC chip select
		
		RD : out std_logic;			-- E-qualified active low RD signal e.g. SRAM, ROM
		WR : out std_logic;			-- E-qualified active low WR signal 
		ZRD : out std_logic;			-- active low RD signal for CIO and SCC
		ZWR : out std_logic;			-- active low WR signal for CIO and SCC
		
		ROMP27 : out std_logic;		-- EPROM A14 ( EEPROM WEn)
		
		TP11 : out std_logic;		-- PCB testpoint TP11 (SD SPI MOSI)
		TP12 : out std_logic;		-- PCB testpoint TP12 (SD SPI MISO)
		TP13 : out std_logic;      -- PCB testpoint TP13 (SD SPI CSn)
		TP14 : out std_logic;		-- PCB testpoint TP14 (SD SPI CLK)
		
		CONF : in std_logic;			-- config option (sets default state of ROMP27 pin)
		SPARE : out std_logic;		-- unused output (drives Z)
		PBTN : in std_logic;			-- input from pushbutton (to be routed to input port)
		
		LED : out std_logic_vector (2 downto 0);	-- LED outputs (H = ON)
		
		I2CSDA : inout std_logic;	-- I2C SDA terminal for RTC ### New for 1V4 ###
		I2CSCL : inout std_logic;	-- I2C SCL terminal for RTC ### New for 1V4 ###
		
		SDCK : out std_logic;		-- SD card clock output
		SDDO : out std_logic;		-- SD card data output (from CPU)
		SDCS : out std_logic;		-- SD card chip select
		SDDI : in std_logic;			-- SD card data intput (to CPU)
		SDSW : in std_logic			-- SD card present switch (L = present)
	);
end HD6309_glue_top;

architecture behavioral of HD6309_glue_top is
   constant BIN_VERSION : std_logic_vector(7 downto 0) := "00010100";
	
	-- clock generation state and output drivers
	signal e_drv, q_drv : std_logic;			-- internal E and Q clocks
	signal bclk_drv, aclk_drv : std_logic;	-- SCC baud rate reference clocks
	signal dly_e : std_logic;			-- delayed E clock used for internal SFR access
	
	-- read, write, peripheral select signals
	signal rd_n, wr_n, z_rd_n, z_wr_n : std_logic;
	signal scccs_n, ciocs_n : std_logic;
	signal romcs_n, ram1cs_n, ram2cs_n : std_logic;
	signal z_wr_gate : std_logic;			-- write gate for Zilog peripherals (H during S2)	
	
	-- ready-state control signals
	signal romws, ready3, ready1 : std_logic; 		-- internal READY signals (H = ready, L = insert xWS)

	-- internal peripheral signals
	signal syscs_n, sdccs_n, iopcs_n, vercs_n, i2ccs_n : std_logic;
	signal romsel, romseh : std_logic;	
	signal sdclk_sel, spi_clk : std_logic;
	signal spi_start, spi_busy_n, sdcs_n, spi_sddo, spi_sdck : std_logic;
   signal spi_clk_counter : std_logic_vector(3 downto 0);	
	
	-- internal peripheral datapaths
	signal data_in, sys_data_out, sdc_data_out, iop_data_out : std_logic_vector(7 downto 0);
	signal i2c_data_out, spi_data_rx, spi_data_tx : std_logic_vector(7 downto 0);
	
	begin	

	-- map the CPU clock generator		
	CPU_CLOCK : entity work.cpuclock port map (
		clock => XOSC,
		ready1 => ready1,
		ready3 => ready3,
		e_out => e_drv,
		q_out => q_drv,
		d_e_out => dly_e,
		zw_out => z_wr_gate
	);
	
	-- map the SCC baud rate clock generator
	BAUD_CLOCK : entity work.baudclock port map (
		reset => RESET,
		clock => WOSC,
		a_out => aclk_drv,
		b_out => bclk_drv
	);
	
	-- map the address decoder
	ADDR_DECODE : entity work.decode port map ( 
		reset => RESET,
		addr => ADDR(15 downto 4),
		rd_n => rd_n,
		wr_n => wr_n,
		romsel => romsel,		
		romseh => romseh,
		ciocs => ciocs_n,
		scccs => scccs_n,
		i2ccs => i2ccs_n,
		romcs => romcs_n,
		ram1cs => ram1cs_n,
		ram2cs => ram2cs_n,
		syscs => syscs_n,
		sdccs => sdccs_n,
		iopcs => iopcs_n,
		vercs => vercs_n
	);
	
	-- map the SYSTEM CONFIG port
	SYS_PORT : entity work.sysport port map ( 
		reset => RESET,
		clock => XOSC,
		cs_n => syscs_n,
		wr_n => wr_n,
		data => data_in,
		dataq => sys_data_out,
		config => CONF
	);
	
	romws <= sys_data_out(0);
	romsel <= sys_data_out(1);
	romseh <= sys_data_out(2);
	ROMP27 <= sys_data_out(3);

	-- map the SBC I/O port	
	IO_PORT : entity work.ioport port map ( 
		reset => RESET,
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
	
	-- map the SBC I2C port
	I2C_PORT : entity work.i2cport port map (
		reset => RESET,
		clock => XOSC,
		cs_n => i2ccs_n,
		wr_n => wr_n,
		data => data_in,
		dataq => i2c_data_out,
		sda_in => I2CSDA,
		scl_in => I2CSCL
	);
	
	-- map the SD SPI data port
	SD_PORT : entity work.SDdata port map (
		reset => RESET,
		clock => XOSC,
		cs_n => sdccs_n,			-- active low select
		wr_n => wr_n,				-- active low write
		data => data_in,
		dataq => spi_data_tx,
		update_cl => not spi_busy_n, -- inverted SPI SS is the acknowledge
		update => spi_start		-- pulses high after a write completes
	);

   -- map the SPI clock divider (Altera LPFM)	
   SPI_CLK_DIV : entity work.count4 port map (
		aclr	=> not reset,
		clock	=> XOSC,
		q => spi_clk_counter
	);
	
	spi_clk <= spi_clk_counter(3) when (sdclk_sel = '1') else XOSC;
	
	-- map the Simple SPI Master component
	SPI_MASTER: entity work.simpleSPI_M port map (
      reset    => RESET,
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
				BIN_VERSION when ( dly_e = '1' and vercs_n = '0' and RW = '1' ) else
				i2c_data_out when ( dly_e = '1' and i2ccs_n = '0' and RW = '1' ) else
				(others => 'Z');
				
	-- Read-Write signal generation
	-------------------------------
	-- Generation of Zilog ZRD is RW without any qualification
	-- Generation of Zilog ZRW is RW qualified by last portion of e-clock (state 2)
	-- both ZRD and ZWR are asseted simultaneously during RESET
	z_rd_n <= '0' when ( RESET = '0' or RW = '1' ) else '1';
	z_wr_n <= '0' when ( RESET = '0' or (RW = '0' and z_wr_gate = '1') ) else '1';
	
	-- Generation of RD is RW qualified by a negated RESET
	-- Generation of WR is CPU RW qualified by e-clock (states 3,2)
	rd_n <= '0' when ( RESET = '1' and RW = '1' ) else '1';
	wr_n <= '0' when ( RESET = '1' and RW = '0' and e_drv = '1' ) else '1';
	
	-- wait state control
	ready3 <= scccs_n and ciocs_n;			-- when SCC or CIO are selected, ready3 is negated (adds 3 ws)
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
	ZRD <= z_rd_n;
	ZWR <= z_wr_n;
	
	-- Drive the memory and peripheral chip selects
	SCCCS <= scccs_n;
	CIOCS <= ciocs_n;
	ROMCS <= romcs_n;
	RAM1CS <= ram1cs_n;
	RAM2CS <= ram2cs_n;
	
	-- drive the I2C clock and data open drain outputs
	I2CSDA <= '0' when i2c_data_out(6) = '0' else 'Z';
	i2CSCL <= '0' when i2c_data_out(7) = '0' else 'Z';	

	-- drive the SD SPI output lines
	SDCS <= sdcs_n;
	SDDO <= spi_sddo;
	SDCK <= spi_sdck;
	
	-- drive the LED outputs (LED1 and LED2 are easy, LED3 is controlled by the SDCS signal)
	LED(1 downto 0) <= iop_data_out(1 downto 0) when (reset = '1') else "11";
	LED(2) <= (not sdcs_n) when (reset = '1') else '0';
	
	-- Drive signals onto the TPxx testpoints (mirror SD SPI for easy debugging)
	TP11 <= spi_sddo;
	TP12 <= SDDI;
	TP13 <= sdcs_n;
	TP14 <= spi_sdck;
	
	-- Drive spare signal (expansion bus)
	SPARE <= 'Z';
				
end behavioral;
			

	
	
	
	
	


	