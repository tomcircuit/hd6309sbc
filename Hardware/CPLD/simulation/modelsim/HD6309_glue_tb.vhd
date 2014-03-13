
-------------------------------------------------------------
--
-- Program : HD6309 Glue Logic Testbench
--
-------------------------------------------------------------

---import std_logic from the IEEE library
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

--declare entity: no inputs, no outputs
entity HD6309_glue_tb is
end HD6309_glue_tb;

architecture behavior of HD6309_glue_tb is
   --pass glue logic entity to the testbench as component
  component HD6309_glue_top is
	port ( 
		XOSC : in std_logic;			-- Oscillator input for CPU (nominally 24 MHz)
		WOSC : in std_logic;			-- Oscillator input for ACLK/BCLK (nominally 14.745 MHz)

		QCLK : out std_logic;		-- Q phase clock output (nom 2.5 MHz, XOSC divided by 8)
		ECLK : out std_logic;		-- E phase clock output (nom 2.5 MHz, XOSC divided by 8)
		BCLK : out std_logic;		-- SCC ch B baudrate (WOSC/48 for 19.2kbps at connector)
		ACLK : out std_logic;		-- SCC ch A baudrate (WOSC/8 for 115.2kbps at USB bridge)
		
		RESET : in std_logic;		-- active low RESET input
		
		ADDR : in std_logic_vector (15 downto 4);  -- A[15:] from CPU
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
		
		ROMP27 : OUT std_logic; -- E(E)PROM pin 27
		
		TP11 : out std_logic;		-- PCB testpoint TP11
		TP12 : out std_logic;		-- PCB testpoint TP12
		TP13 : out std_logic;  -- PCB testpoint TP13
		TP14 : out std_logic;		-- PCB testpoint TP14
		
		CONF : in std_logic;			-- configuration option (pulled high)
		SPARE : out std_logic;		-- decode of 0x280...0x2FF (unused I/O space)
		PBTN : in std_logic;			-- input from pushbutton (to be routed to input port)
		
		LED : out std_logic_vector (2 downto 0);	-- LED outputs (H = ON)
		
		SDCK : out std_logic;		-- SD card clock output
		SDDO : out std_logic;		-- SD card data output (from CPU)
		SDCS : out std_logic;		-- SD card chip select
		SDDI : in std_logic;			-- SD card data intput (to CPU)
		SDSW : in std_logic			-- SD card present switch (L = present)
	);
  end component;

 	signal ROMCS, CIOCS, RTCCS: std_logic;
	signal RESET, RW, ROMSEL, PBTN : std_logic;
	signal ECLK, QCLK, ACLK, BCLK : std_logic;
	signal XOSC, WOSC, SCCCS, RD, WR : std_logic;
	signal ADDR : std_logic_vector (15 downto 0);
	signal DATA : std_logic_vector (7 downto 0);
	signal RAM1CS, RAM2CS : std_logic;
	signal ZRD, ZWR : std_logic;
	signal ROMP27, TP11, TP12, TP13, TP14 : std_logic;
	signal ALLADDR : std_logic_vector (15 downto 0);
	signal SDDO, SDCS, SDCK : std_logic;

	constant Tpw_xosc : time := 21 ns;
	constant Tpw_wosc : time := 34 ns;	
  constant Tpw_pbtn : time := 1700 ns;
	
begin	
	-- instantiate the unit and map signals to ports
	uut : HD6309_glue_top port map(
    XOSC => XOSC,
    WOSC => WOSC,
    QCLK => QCLK,
    ECLK => ECLK,
    BCLK => BCLK,
    ACLK => ACLK,
		RESET => RESET,
		ADDR => ADDR(15 downto 4),
		RW => RW,
		LIC => '0',
		DATA => DATA,
		ROMCS => ROMCS,
		RAM1CS => RAM1CS,
		RAM2CS => RAM2CS,		
		CIOCS => CIOCS,
		RTCCS => RTCCS,		
		SCCCS => SCCCS,
		ROMP27 => ROMP27,
		TP11 => TP11,
		TP12 => TP12,
		TP13 => TP13,
		TP14 => TP14,
		CONF => '1',
		SPARE => open,
		PBTN => PBTN,
		LED => open,
		SDDI => WOSC,
		SDSW => PBTN,
		SDCK => SDCK,
		SDDO => SDDO,
		SDCS => SDCS,
		RD => RD,
		WR => WR,
		ZRD => ZRD,
		ZWR => ZWR
	);
	
	-- make a 24 MHz clock
	xosc_gen : process is
	  begin
	    XOSC <= '0' after Tpw_xosc, '1' after 2 * Tpw_xosc;
	    wait for 2*Tpw_xosc;
	end process xosc_gen;
	
	-- make a 14.7 MHz clock
	wosc_gen : process is
	  begin
	    WOSC <= '0' after Tpw_wosc, '1' after 2 * Tpw_wosc;
	    wait for 2*Tpw_wosc;
	end process wosc_gen;
	
	-- make a 500kHz clock on PB
	pb_gen : process is
	   begin
	     PBTN <='0' after Tpw_pbtn, '1' after 2 * Tpw_pbtn;
	     wait for 2*Tpw_pbtn;
	end process pb_gen;
	
  stim : process is
		begin
      RESET <= '0';
  		  ADDR <= "1111111111111111";
  		  RW <= '1';
		  wait for 500 ns;
		  
		  RESET <= '1';
		  wait for 10 ns;
		  
      for address in 0 to 20 loop
        
        ALLADDR(15 downto 0) <= "1111111111111111";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111111";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111111";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';
      
        ALLADDR <= "0000001001010000";    -- a read of the port at 0x250
        
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';
        
        ALLADDR(15 downto 0) <= "1111111111111111";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';
        
        ALLADDR(15 downto 0) <= "1111111111111110";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR <= "0000001000110000";    -- a write of the port at 0x230
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '0';
        DATA <= "11001010";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111111";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';
        
        ALLADDR <= "0000001001010000";    -- a read of the port at 0x250
        
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111110";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111110";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111110";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111110";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

        ALLADDR(15 downto 0) <= "1111111111111110";   -- an internal cycle
           		  
        wait until QCLK'event and QCLK='1';
        
			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
        RW <= '1';
        DATA <= "ZZZZZZZZ";
        
        wait until ECLK'event and ECLK='0';

      end loop;        
		  
--			for address in 0 to 48 loop
--
--			  ALLADDR <= std_logic_vector(to_unsigned(address*16,16));			 
--
--			  wait until QCLK'event and QCLK='1';
--			  
--			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
--			  
--      		--TEST 1 : address WRITE 
--			  RESET <= '1';
--			  RW <= '0';
--			  DATA <= "10101010";
--			  
--			  wait until QCLK'event and QCLK='1';
--			  
--			  --TEST 2 : address READ
--		    RESET <= '1';
--			  RW <= '1';
--			  DATA <= "ZZZZZZZZ";
--
--			end loop;
--			
--		  wait until QCLK'event and QCLK='1';
--
--      -- set ROMSEL to 1			  
--		  ADDR(15 downto 0) <= "0000001001000000";
--		  RESET <= '1';
--		  RW <= '0';
--		  DATA <= "00000001";
--			
--			for address in 0 to 127 loop
--
--			  ALLADDR <= std_logic_vector(to_unsigned(address*512,16));			 
--
--			  wait until QCLK'event and QCLK='1';
--			  
--			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
--			  
--      		--TEST 1 : address WRITE 
--			  RESET <= '1';
--			  RW <= '0';
--			  DATA <= "10101010";
--			  
--			  wait until QCLK'event and QCLK='1';
--			  
--			  --TEST 2 : address READ
--		    RESET <= '1';
--			  RW <= '1';
--			  DATA <= "ZZZZZZZZ";			  
--
--			end loop;
--			
--		  wait until QCLK'event and QCLK='1';
--
--      -- set ROMSEL to 0			  
--		  ADDR(15 downto 0) <= "0000001001000000";
--		  RESET <= '1';
--		  RW <= '0';
--		  DATA <= "00000000";
--			
--			for address in 0 to 127 loop
--
--			  ALLADDR <= std_logic_vector(to_unsigned(address*512,16));			 
--
--			  wait until QCLK'event and QCLK='1';
--			  
--			  ADDR(15 downto 0) <= ALLADDR(15 downto 0);
--			  
--      		--TEST 1 : address WRITE 
--			  RESET <= '1';
--			  RW <= '0';
--			  DATA <= "10101010";
--			  
--			  wait until QCLK'event and QCLK='1';
--			  
--			  --TEST 2 : address READ
--		    RESET <= '1';
--			  RW <= '1';
--			  DATA <= "ZZZZZZZZ";
--
--			end loop;
			
			wait;
			
  end process stim;
	
end architecture;

