-------------------------------------------------------------------------------
-- Title      : "I2C Shifter"
-- Project    : 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-05-01  1.0      toml    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
entity I2Cshifter is
  port (
    reset    : in  std_logic;
    clk      : in  std_logic;
    SCLout   : out std_logic;
    SDAout   : out std_logic;
	SDAin    : in std_logic; 
    DataToTx : in std_logic_vector(7 downto 0);
    DataRxd  : out std_logic_vector(7 downto 0);
    StartTx  : in std_logic);
end I2Cshifter;

architecture a of simpleSPI_M is
    type state_type is (idle, loadData, delay1, delay2, txBit, CheckFinished);
    signal state : state_type;

begin
  process(clk, reset, StartTx)
  
	constant dataLen : integer := 7;   -- this must be set for the length of
                                        -- the data word to be txd
	variable index : integer range 0 to dataLen := 0;
	variable MOSI_v : std_logic;
  begin
    if reset = '0' then
      DataRxd <= (others => '0');  
      SCL <= '1';
      SDAout := '1';
      index := dataLen;
    else
      if(clk'event and clk = '1') then
        case state is
          when idle =>
  	      	SCL <= '1';
      		SDAout := '1';
            if(StartTx = '1') then
              state <= loadData;
            else
              state <= idle;
              index := dataLen;
            end if;

          when loadData =>
            SS <= '0';                   -- start SPI
            SCLK <= '0';
            MOSI_v := DataToTx(index);   --set up data to slave
            state <= delay1;

          when delay1 =>
            state <= txBit;
				
			 when delay2 =>						-- allow CLK to fall with CS still active
			    SCLK <= '0';
			    state <= idle;
            
          when txBit =>
            SCLK <= '1';
            DataRxd(index) <= MISO;
            state <= CheckFinished;
            
          when checkFinished =>
            if(index = 0) then
              state <= delay2;
           else
              state <= loadData;
              index := index - 1;
            end if;
          
          when others => null;
        end case;
      end if;
    end if;     
    MOSI <= MOSI_v;
  end process;
end a;

