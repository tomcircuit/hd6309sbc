-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;

entity HD6309_glue_top_pins is
	port
	(
-- {ALTERA_IO_BEGIN} DO NOT REMOVE THIS LINE!

		ACLK : out std_logic;
		ADDR : in std_logic_vector(15 downto 4);
		BCLK : out std_logic;
		CIOCS : out std_logic;
		CONF : in std_logic;
		DATA : inout std_logic_vector(7 downto 0);
		ECLK : out std_logic;
		LED : out std_logic_vector(2 downto 0);
		LIC : in std_logic;
		PBTN : in std_logic;
		QCLK : out std_logic;
		RA14 : out std_logic;
		RAM1CS : out std_logic;
		RAM2CS : out std_logic;
		RD : out std_logic;
		RESET : in std_logic;
		ROMCS : out std_logic;
		RTCCS : out std_logic;
		RW : in std_logic;
		SCCCS : out std_logic;
		SDCK : out std_logic;
		SDCS : out std_logic;
		SDDI : in std_logic;
		SDDO : out std_logic;
		SDSW : in std_logic;
		SPARE : in std_logic;
		TCK : in std_logic;
		TDI : in std_logic;
		TDO : out std_logic;
		TMS : in std_logic;
		WOSC : in std_logic;
		WR : out std_logic;
		XOSC : in std_logic;
		ZRD : out std_logic;
		ZWR : out std_logic;
		ADDR : in std_logic_vector(15 downto 4);
		DATA : inout std_logic_vector(7 downto 0);
		LED : out std_logic_vector(2 downto 0)
-- {ALTERA_IO_END} DO NOT REMOVE THIS LINE!

	);

-- {ALTERA_ATTRIBUTE_BEGIN} DO NOT REMOVE THIS LINE!
-- {ALTERA_ATTRIBUTE_END} DO NOT REMOVE THIS LINE!
end HD6309_glue_top_pins;

architecture ppl_type of HD6309_glue_top_pins is

-- {ALTERA_COMPONENTS_BEGIN} DO NOT REMOVE THIS LINE!
-- {ALTERA_COMPONENTS_END} DO NOT REMOVE THIS LINE!
begin
-- {ALTERA_INSTANTIATION_BEGIN} DO NOT REMOVE THIS LINE!
-- {ALTERA_INSTANTIATION_END} DO NOT REMOVE THIS LINE!

end;
