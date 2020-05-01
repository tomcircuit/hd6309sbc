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
-- VERSION 1.41 - May 1, 2020
--
-- This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 
-- International License. To view a copy of this license, visit 
-- http://creativecommons.org/licenses/by-sa/4.0/.
-- 
-- V1.41 adds an SD SPI data read-only register. Upon read, a SPI transaction
-- is initiated. The purpose of this read-only register is to allow use
-- of the 6309 TFM (block memory move) instruction for fast SD card reading.
-- Other minor changes: eliminated 1WS option for ROM. Simplified ADDR_DECODE 
-- block and implemented peripheral chip select generation via LPFM decoder.
-- Changed sense of select signals to active high, these are inverted when
-- driven to output pins, if required.
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
		BCLK : out std_logic;		-- SCC ch B baudrate (WOSC/4 for 115kbps in SCC 32x mode)
		ACLK : out std_logic;		-- SCC ch A baudrate (WOSC/8 or /4 for 115kbps/230kbps in SCC 16x mode)
		
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
		
		TP11 : out std_logic;		-- PCB testpoint TP11 ()
		TP12 : out std_logic;		-- PCB testpoint TP12 (spi_start)
		TP13 : out std_logic;      -- PCB testpoint TP13 (SD SPI CSn)
		TP14 : out std_logic;		-- PCB testpoint TP14 (SD SPI CLK)
		
		CONF : in std_logic;			-- config option (sets state of ROMP27 pin at RESET)
		SPARE : out std_logic;		-- unused output 
		PBTN : in std_logic;			-- input from pushbutton (L = PRESSED)
		
		LED : out std_logic_vector (2 downto 0);	-- LED outputs (H = ON)
		
		I2CSDA : inout std_logic;	-- I2C SDA terminal for RTC ### New for 1V4 ###
		I2CSCL : inout std_logic;	-- I2C SCL terminal for RTC ### New for 1V4 ###
		
		SDCK : out std_logic;		-- SD card clock output
		SDDO : out std_logic;		-- SD card data output (from CPU)
		SDCS : out std_logic;		-- SD card chip select
		SDDI : in std_logic;			-- SD card data intput (to CPU)
		SDSW : in std_logic			-- SD card present switch (L = PRESENT)
	);
end HD6309_glue_top;

architecture behavioral of HD6309_glue_top is
   constant BIN_VERSION : std_logic_vector(7 downto 0) := "00010100";
	
	-- clock generation state and output drivers
	signal e_drv, q_drv : std_logic;			-- internal E and Q clocks
	signal bclk_drv, aclk_drv : std_logic;	-- SCC baud rate reference clocks
	signal dly_e : std_logic;			-- delayed E clock used for internal SFR access
	signal ready3 : std_logic; 		-- internal READY signal (H = ready, L = insert xWS)
	signal aux_div_taps : std_logic_vector(5 downto 0);	-- XOSC divided by 2,4,8,16,32,64
	
	-- external read, write, memory, and peripheral select signals
	signal rd_n, wr_n, z_rd_n, z_wr_n : std_logic;  -- read and write control outputs
	signal scc_sel, cio_sel : std_logic;	-- ext peripheral chip selects
	signal rom_sel, ram1_sel, ram2_sel : std_logic;  -- memory select outputs
	signal z_wr_gate : std_logic;			-- write gate for Zilog peripherals (H during S2)	
	
	-- internal control and select signals
	signal romsel, romseh, periph, peripl : std_logic;	
	signal aclk_sel, sdclk_sel : std_logic;
	
	-- internal peripheral select signals
	signal sys_sel, sd_sel, iop_sel, ver_sel, i2c_sel, sd2_sel, nu8_sel, nu9_sel : std_logic;
	
	-- SD/SPI peripheral signals
	signal spi_pclk : std_logic;	
	signal spi_start, spi_busy_n, spi_csn, spi_sdo, spi_sck : std_logic;
   
	
	-- internal peripheral datapaths
	signal data_in, sys_data_out, sdc_data_out, iop_data_out : std_logic_vector(7 downto 0);
	signal i2c_data_out, spi_data_rx, spi_data_tx : std_logic_vector(7 downto 0);
	
	begin	

	-- map the CPU clock generator		
	CPU_CLOCK : entity work.cpuclock port map (
		clock => XOSC,
		ready1 => '1',
		ready3 => ready3,
		e_out => e_drv,
		q_out => q_drv,
		d_e_out => dly_e,
		zw_out => z_wr_gate
	);
	
	-- map the "misc" clock generator
	-- uses the XOSC input and produces SPI and I2C outputs
	AUX_CLOCK : entity work.count6 port map (
		clock	=> XOSC,
		q => aux_div_taps
	);
	
	-- provide FAST or SLOW clock to SPI Master peripheral
	spi_pclk <= aux_div_taps(3) when (sdclk_sel = '1') else XOSC;
		
	-- map the SCC baud rate clock generator
	-- uses the WOSC input and produces baud-friendly outputs for SCC
	BAUD_CLOCK : entity work.baudclock port map (
		reset => RESET,
		clock => WOSC,
		asel => aclk_sel,
		a_out => aclk_drv,
		b_out => bclk_drv
	);
	
	-- map the address decoder
	ADDR_DECODE : entity work.decode port map ( 
		reset => RESET,
		addr => ADDR(15 downto 8),
		rd_n => rd_n,
		wr_n => wr_n,
		romsel => romsel,		
		romseh => romseh,
		rom => rom_sel,
		ram1 => ram1_sel,
		ram2 => ram2_sel,
		peripl => peripl,
		periph => periph
	);
	
	-- map the peripheral decoder to 0xE000...0xE07F
	PERIP_DECODE : entity work.decode10 port map (
	   data => ADDR(7 downto 4),
		enable => peripl,
		eq0 => cio_sel,
		eq1 => scc_sel,
		eq2 => i2c_sel,
		eq3 => sd_sel,
		eq4 => sys_sel,
		eq5 => iop_sel,
		eq6 => ver_sel,
		eq7 => sd2_sel,
		eq8 => nu8_sel,
		eq9 => nu9_sel
	);
		
	-- map the SYSTEM CONFIG port
	SYS_PORT : entity work.sysport port map ( 
		reset => RESET,
		clock => XOSC,
		cs => sys_sel,
		wr_n => wr_n,
		data => data_in,
		dataq => sys_data_out,
		config => CONF
	);
	
	-- control signals from SYSTEM CONFIG port
	romsel <= sys_data_out(1);
	romseh <= sys_data_out(2);
	ROMP27 <= sys_data_out(3);
	aclk_sel <= sys_data_out(5);

	-- map the SBC I/O port	
	IO_PORT : entity work.ioport port map ( 
		reset => RESET,
		clock => XOSC,
		cs => iop_sel,
		wr_n => wr_n,
		data => data_in,
		dataq => iop_data_out,
		sdbusy => not spi_busy_n,        --HIGH during SPI transaction
		sdswitch => not SDSW,		      --HIGH when card present
		button => not PBTN					--HIGH when button depressed
	);
	
	-- control signals associated with IO PORT
	spi_csn <= iop_data_out(4);		   --LOW to select SD Card
	sdclk_sel <= iop_data_out(5);
	
	-- map the SBC I2C port
	I2C_PORT : entity work.i2cport port map (
		reset => RESET,
		clock => XOSC,
		cs => i2c_sel,
		wr_n => wr_n,
		data => data_in,
		dataq => i2c_data_out,
		sda_in => I2CSDA
	);
	
	-- map the SD SPI data port
	SD_PORT : entity work.SDdata port map (
		reset => RESET,
		clock => XOSC,
		cs => sd_sel,			
		wr_n => wr_n,				-- active low write
		data => data_in,
		dataq => spi_data_tx
	);

	-- map the Simple SPI Master component
	SPI_MASTER: entity work.simpleSPI_M port map (
      reset    => RESET,		  -- active low RESET input
      clk      => spi_pclk,	  -- SPI Master state clock
      SCLK     => spi_sck,		  -- SPI SCK signal
      SS       => spi_busy_n,   -- active low busy signal
      MOSI     => spi_sdo,		  -- SPI SDO (MOSI)
      MISO     => SDDI,			  -- SPI SDI (MISO)
      DataToTx => spi_data_tx,  -- data byte to transmit
      DataRxd  => spi_data_rx,  -- data byte last received
      StartTx  => spi_start	  -- active high start pulse
	);	

	-- SPI master TX start control logic
	process (RESET,XOSC) begin
		-- clear outputs upon reset
		if (RESET = '0') then		
			spi_start <= '0';
			
		-- process all events that take place on clock rising edge
		elsif ( XOSC'event and XOSC='1' ) then

		-- clear spi_start latch after SPI transaction begins (spi_busy_n asserted)
			if (spi_busy_n = '0') then
				spi_start <= '0';				
		
		-- set spi_start latch on write to SDdata, or any access to SD2data
			elsif ((wr_n = '0' and sd_sel = '1') or sd2_sel = '1') then
				spi_start <= '1';	
			end if;
		
		end if;
	end process;	
	
	-- Resolve onchip register outputs onto tri-state DATA bus
	data_in <= DATA;
	DATA <= 	spi_data_rx when ( dly_e = '1' and sd_sel = '1' and RW = '1' ) else
				sys_data_out when ( dly_e = '1' and sys_sel = '1' and RW = '1' ) else
				iop_data_out when ( dly_e = '1' and iop_sel = '1' and RW = '1' ) else
				BIN_VERSION when ( dly_e = '1' and ver_sel = '1' and RW = '1' ) else
				i2c_data_out when ( dly_e = '1' and i2c_sel = '1' and RW = '1' ) else
				spi_data_rx when ( dly_e = '1' and sd2_sel = '1' and RW = '1' ) else
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
	----
	-- wait state control
	ready3 <= not (scc_sel or cio_sel);			-- when SCC or CIO are selected, ready3 is negated (adds 3 ws)
		
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
	
	-- Drive the active low memory and peripheral chip selects
	SCCCS <= not scc_sel;
	CIOCS <= not cio_sel;
	ROMCS <= not rom_sel;
	RAM1CS <= not ram1_sel;
	RAM2CS <= not ram2_sel;
	
	-- drive the I2C clock and data open drain outputs
	I2CSDA <= '0' when i2c_data_out(6) = '0' else 'Z';
	i2CSCL <= '0' when i2c_data_out(7) = '0' else 'Z';	

	-- drive the SD SPI output lines
	SDCS <= spi_csn;
	SDDO <= spi_sdo;
	SDCK <= spi_sck;
	
	-- drive the LED outputs (LED1 and LED2 are easy, LED3 is controlled by the SDCS signal)
	LED(1 downto 0) <= iop_data_out(1 downto 0) when (reset = '1') else "11";
	LED(2) <= (not spi_csn) when (reset = '1') else '0';
	
	-- Drive signals onto the TPxx testpoints (for debugging)
	TP11 <= spi_sdo;
	TP12 <= spi_start;
	TP13 <= spi_csn;
	TP14 <= spi_sck;
	
	-- Drive spare signal
	SPARE <= 'Z';
				
end behavioral;
			

	
	
	
	
	


	