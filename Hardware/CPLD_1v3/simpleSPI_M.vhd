-------------------------------------------------------------------------------
-- Title      : "SPI Master"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : simpleSPI_M.vhdl
-- Author     : Tom Scott www.missiontech.co.nz
-- Company    : Mission Technologies        
-- Created    : 2007-02-05
-- Last update: 2014-03-06 toml
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Creates a simple SPI Master
-- The master drives the SPI interface providing the Slave Select (SS) to begin
-- data transfer as well as the SCLK to sync data to.
-------------------------------------------------------------------------------
-- Copyright (c) 2007 Mission Technologies
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2007-05-10  1.0      toms    Created
-- 2014-03-06  1.1      toml    Changed data width to 8 bits
--                              added delay2 state for SCLK fall before CS negate
--                  					(it just looks nicer on the scope, but not strictly required for SPI)
--	  					  					changed MOSI output from Z to DataToTx(0) during idle
-- 2014-03-21  1.2      toml    Corrected SPI bit shift order (changed to MSB first!)
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
entity simpleSPI_M is
  port (
    reset    : in  std_logic;
    clk      : in  std_logic;
    SCLK     : out std_logic;
    SS       : out std_logic;
    MOSI     : out  std_logic;
    MISO     : in std_logic;
    DataToTx : in std_logic_vector(7 downto 0);
    DataRxd  : out std_logic_vector(7 downto 0);
    StartTx  : in std_logic);
end simpleSPI_M;

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
      SCLK <= '0';
      SS <= '1';
      MOSI_v := '0';
      index := dataLen;
    else
      if(clk'event and clk = '1') then
        case state is
          when idle =>
            SCLK <= '0';
            SS <= '1';                    -- stop SPI
            MOSI_v := DataToTx(index);
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

