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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "01/22/2020 14:49:32"

-- 
-- Device: Altera EPM7128SLI84-10 Package PLCC84
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAX;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAX.MAX_COMPONENTS.ALL;

ENTITY 	HD6309_glue_top IS
    PORT (
	XOSC : IN std_logic;
	WOSC : IN std_logic;
	QCLK : OUT std_logic;
	ECLK : OUT std_logic;
	BCLK : OUT std_logic;
	ACLK : OUT std_logic;
	RESET : IN std_logic;
	ADDR : IN std_logic_vector(15 DOWNTO 4);
	RW : IN std_logic;
	DATA : INOUT std_logic_vector(7 DOWNTO 0);
	LIC : IN std_logic;
	ROMCS : OUT std_logic;
	RAM1CS : OUT std_logic;
	RAM2CS : OUT std_logic;
	CIOCS : OUT std_logic;
	SCCCS : OUT std_logic;
	RD : OUT std_logic;
	WR : OUT std_logic;
	ZRD : OUT std_logic;
	ZWR : OUT std_logic;
	ROMP27 : OUT std_logic;
	TP11 : OUT std_logic;
	TP12 : OUT std_logic;
	TP13 : OUT std_logic;
	TP14 : OUT std_logic;
	CONF : IN std_logic;
	SPARE : OUT std_logic;
	PBTN : IN std_logic;
	LED : OUT std_logic_vector(2 DOWNTO 0);
	I2CSDA : INOUT std_logic;
	I2CSCL : INOUT std_logic;
	SDCK : OUT std_logic;
	SDDO : OUT std_logic;
	SDCS : OUT std_logic;
	SDDI : IN std_logic;
	SDSW : IN std_logic
	);
END HD6309_glue_top;

-- Design Ports Information
-- XOSC	=>  Location: PIN_2
-- WOSC	=>  Location: PIN_83
-- RESET	=>  Location: PIN_1
-- ADDR[4]	=>  Location: PIN_79
-- ADDR[5]	=>  Location: PIN_77
-- ADDR[6]	=>  Location: PIN_76
-- ADDR[7]	=>  Location: PIN_75
-- ADDR[8]	=>  Location: PIN_74
-- ADDR[9]	=>  Location: PIN_73
-- ADDR[10]	=>  Location: PIN_70
-- ADDR[11]	=>  Location: PIN_69
-- ADDR[12]	=>  Location: PIN_68
-- ADDR[13]	=>  Location: PIN_67
-- ADDR[14]	=>  Location: PIN_65
-- ADDR[15]	=>  Location: PIN_64
-- RW	=>  Location: PIN_51
-- LIC	=>  Location: PIN_35
-- CONF	=>  Location: PIN_34
-- PBTN	=>  Location: PIN_15
-- SDDI	=>  Location: PIN_22
-- SDSW	=>  Location: PIN_17
-- DATA[0]	=>  Location: PIN_54
-- DATA[1]	=>  Location: PIN_55
-- DATA[2]	=>  Location: PIN_56
-- DATA[3]	=>  Location: PIN_57
-- DATA[4]	=>  Location: PIN_58
-- DATA[5]	=>  Location: PIN_60
-- DATA[6]	=>  Location: PIN_61
-- DATA[7]	=>  Location: PIN_63
-- I2CSDA	=>  Location: PIN_11
-- I2CSCL	=>  Location: PIN_12
-- SPARE	=>  Location: PIN_33
-- TP12	=>  Location: PIN_6
-- RAM1CS	=>  Location: PIN_37
-- RD	=>  Location: PIN_81
-- ZRD	=>  Location: PIN_45
-- WR	=>  Location: PIN_80
-- BCLK	=>  Location: PIN_46
-- ACLK	=>  Location: PIN_48
-- SCCCS	=>  Location: PIN_41
-- CIOCS	=>  Location: PIN_40
-- SDCS	=>  Location: PIN_18
-- TP13	=>  Location: PIN_8
-- LED[0]	=>  Location: PIN_28
-- LED[1]	=>  Location: PIN_29
-- LED[2]	=>  Location: PIN_27
-- SDCK	=>  Location: PIN_20
-- TP14	=>  Location: PIN_9
-- ROMP27	=>  Location: PIN_4
-- ROMCS	=>  Location: PIN_39
-- RAM2CS	=>  Location: PIN_36
-- SDDO	=>  Location: PIN_21
-- QCLK	=>  Location: PIN_49
-- ECLK	=>  Location: PIN_50
-- TP11	=>  Location: PIN_5
-- ZWR	=>  Location: PIN_44


ARCHITECTURE structure OF HD6309_glue_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_XOSC : std_logic;
SIGNAL ww_WOSC : std_logic;
SIGNAL ww_QCLK : std_logic;
SIGNAL ww_ECLK : std_logic;
SIGNAL ww_BCLK : std_logic;
SIGNAL ww_ACLK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_ADDR : std_logic_vector(15 DOWNTO 4);
SIGNAL ww_RW : std_logic;
SIGNAL ww_LIC : std_logic;
SIGNAL ww_ROMCS : std_logic;
SIGNAL ww_RAM1CS : std_logic;
SIGNAL ww_RAM2CS : std_logic;
SIGNAL ww_CIOCS : std_logic;
SIGNAL ww_SCCCS : std_logic;
SIGNAL ww_RD : std_logic;
SIGNAL ww_WR : std_logic;
SIGNAL ww_ZRD : std_logic;
SIGNAL ww_ZWR : std_logic;
SIGNAL ww_ROMP27 : std_logic;
SIGNAL ww_TP11 : std_logic;
SIGNAL ww_TP12 : std_logic;
SIGNAL ww_TP13 : std_logic;
SIGNAL ww_TP14 : std_logic;
SIGNAL ww_CONF : std_logic;
SIGNAL ww_SPARE : std_logic;
SIGNAL ww_PBTN : std_logic;
SIGNAL ww_LED : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_SDCK : std_logic;
SIGNAL ww_SDDO : std_logic;
SIGNAL ww_SDCS : std_logic;
SIGNAL ww_SDDI : std_logic;
SIGNAL ww_SDSW : std_logic;
SIGNAL \DATA[0]~133_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~133_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~137_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~141_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~151_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~154_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~165_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~168_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~176_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~184_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SDDI~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \rd_n~2_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|pre_cnt_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|region1~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~5_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~8_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_2_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~5_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ciocs~4_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[5]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|switch_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|led_latch[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|button_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|config_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~6_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~9_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdcs_latch~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|d_e_out_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|sdclk_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[5]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SS_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[7]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[6]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[4]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[7]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|state.state_bit_0_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[6]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[4]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|index[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|SCLK~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|scl_mon_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \I2C_PORT|sda_mon_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[3]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romp27_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romws_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romseh_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|romsel_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[3]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|d_latch[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~11_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~15_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|clock_state[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|q_out~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|e_out~7_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~11_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \z_wr_n~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~295_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLOCK|next_state[2]~32_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~13_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~15_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~VCC~0_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~310_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~311_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~312_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~324_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~325_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~326_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \spi_clk~19bal_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~327_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~328_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~142_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~143_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~145_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~146_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~170_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|process_0~4_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~8_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~9_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~4_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~0\ : std_logic;
SIGNAL \DATA[1]~1\ : std_logic;
SIGNAL \DATA[2]~2\ : std_logic;
SIGNAL \DATA[3]~3\ : std_logic;
SIGNAL \DATA[4]~4\ : std_logic;
SIGNAL \DATA[5]~5\ : std_logic;
SIGNAL \DATA[6]~6\ : std_logic;
SIGNAL \DATA[7]~7\ : std_logic;
SIGNAL \I2CSDA~0\ : std_logic;
SIGNAL \I2CSCL~0\ : std_logic;
SIGNAL \RESET~dataout\ : std_logic;
SIGNAL \SDDI~dataout\ : std_logic;
SIGNAL \XOSC~dataout\ : std_logic;
SIGNAL \CPU_CLOCK|pre_cnt~dataout\ : std_logic;
SIGNAL \RW~dataout\ : std_logic;
SIGNAL \SYS_PORT|romseh_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|romws_latch~dataout\ : std_logic;
SIGNAL \CPU_CLOCK|next_state[2]~32_pexpout\ : std_logic;
SIGNAL \SYS_PORT|romsel_latch~dataout\ : std_logic;
SIGNAL \IO_PORT|sdclk_latch~dataout\ : std_logic;
SIGNAL \spi_clk~19bal_dataout\ : std_logic;
SIGNAL \SPI_MASTER|state.state_bit_2~dataout\ : std_logic;
SIGNAL \SPI_MASTER|state.state_bit_0~dataout\ : std_logic;
SIGNAL \SPI_MASTER|state.state_bit_1~dataout\ : std_logic;
SIGNAL \SPI_MASTER|SS~dataout\ : std_logic;
SIGNAL \SD_PORT|upd_latch~dataout\ : std_logic;
SIGNAL \CPU_CLOCK|d_e_out~dataout\ : std_logic;
SIGNAL \DATA[0]~133_dataout\ : std_logic;
SIGNAL \DATA[7]~137_dataout\ : std_logic;
SIGNAL \DATA[1]~141_dataout\ : std_logic;
SIGNAL \DATA[2]~145_dataout\ : std_logic;
SIGNAL \I2C_PORT|sda_mon~dataout\ : std_logic;
SIGNAL \DATA[2]~146_dataout\ : std_logic;
SIGNAL \DATA[2]~142_dataout\ : std_logic;
SIGNAL \DATA[2]~143_dataout\ : std_logic;
SIGNAL \DATA[2]~151_dataout\ : std_logic;
SIGNAL \I2C_PORT|scl_mon~dataout\ : std_logic;
SIGNAL \CONF~dataout\ : std_logic;
SIGNAL \SYS_PORT|process_0~4_dataout\ : std_logic;
SIGNAL \SYS_PORT|romp27_latch~dataout\ : std_logic;
SIGNAL \PBTN~dataout\ : std_logic;
SIGNAL \IO_PORT|button_latch~dataout\ : std_logic;
SIGNAL \DATA[3]~295_pexpout\ : std_logic;
SIGNAL \DATA[3]~154_dataout\ : std_logic;
SIGNAL \SYS_PORT|config_latch~dataout\ : std_logic;
SIGNAL \IO_PORT|sdcs_latch~dataout\ : std_logic;
SIGNAL \DATA[4]~165_dataout\ : std_logic;
SIGNAL \DATA[5]~168_dataout\ : std_logic;
SIGNAL \I2C_PORT|sda_latch~dataout\ : std_logic;
SIGNAL \DATA[6]~312_pexpout\ : std_logic;
SIGNAL \DATA[6]~311_pexpout\ : std_logic;
SIGNAL \DATA[6]~310_pexpout\ : std_logic;
SIGNAL \DATA[6]~170_dataout\ : std_logic;
SIGNAL \DATA[6]~176_dataout\ : std_logic;
SIGNAL \DATA[6]~327_dataout\ : std_logic;
SIGNAL \I2C_PORT|scl_latch~dataout\ : std_logic;
SIGNAL \DATA[7]~326_pexpout\ : std_logic;
SIGNAL \DATA[7]~325_pexpout\ : std_logic;
SIGNAL \DATA[7]~324_pexpout\ : std_logic;
SIGNAL \SDSW~dataout\ : std_logic;
SIGNAL \IO_PORT|switch_latch~dataout\ : std_logic;
SIGNAL \DATA[7]~184_dataout\ : std_logic;
SIGNAL \DATA[7]~328_dataout\ : std_logic;
SIGNAL \~VCC~0~dataout\ : std_logic;
SIGNAL \SDDI~1_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|region1~1_dataout\ : std_logic;
SIGNAL \rd_n~2_dataout\ : std_logic;
SIGNAL \wr_n~5_dataout\ : std_logic;
SIGNAL \wr_n~8_dataout\ : std_logic;
SIGNAL \WOSC~dataout\ : std_logic;
SIGNAL \ADDR_DECODE|scccs~5_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ciocs~4_dataout\ : std_logic;
SIGNAL \IO_PORT|sdcs_latch~1_dataout\ : std_logic;
SIGNAL \LED~3_dataout\ : std_logic;
SIGNAL \LED~6_dataout\ : std_logic;
SIGNAL \LED~9_dataout\ : std_logic;
SIGNAL \SPI_MASTER|SCLK~dataout\ : std_logic;
SIGNAL \SPI_MASTER|SCLK~1_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|romcs~11_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ram2cs~9_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ram2cs~8_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ram2cs~15_dataout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~13_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~4_dataout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~15_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~dataout\ : std_logic;
SIGNAL \CPU_CLOCK|q_out~3_dataout\ : std_logic;
SIGNAL \CPU_CLOCK|e_out~7_dataout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~11_dataout\ : std_logic;
SIGNAL \z_wr_n~3_dataout\ : std_logic;
SIGNAL \IO_PORT|led_latch\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \SD_PORT|d_latch\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|dffs\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SPI_MASTER|index\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ADDR~dataout\ : std_logic_vector(15 DOWNTO 4);
SIGNAL \CPU_CLOCK|clock_state\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_I2CSCL~0\ : std_logic;
SIGNAL \ALT_INV_I2CSDA~0\ : std_logic;
SIGNAL \ALT_INV_DATA[7]~7\ : std_logic;
SIGNAL \ALT_INV_DATA[6]~6\ : std_logic;
SIGNAL \ALT_INV_DATA[5]~5\ : std_logic;
SIGNAL \ALT_INV_DATA[4]~4\ : std_logic;
SIGNAL \ALT_INV_DATA[3]~3\ : std_logic;
SIGNAL \ALT_INV_DATA[2]~2\ : std_logic;
SIGNAL \ALT_INV_DATA[1]~1\ : std_logic;
SIGNAL \ALT_INV_DATA[0]~0\ : std_logic;
SIGNAL \ALT_INV_SDSW~dataout\ : std_logic;
SIGNAL \ALT_INV_SDDI~dataout\ : std_logic;
SIGNAL \ALT_INV_PBTN~dataout\ : std_logic;
SIGNAL \ALT_INV_CONF~dataout\ : std_logic;
SIGNAL \ALT_INV_RW~dataout\ : std_logic;
SIGNAL \ALT_INV_ADDR~dataout\ : std_logic_vector(15 DOWNTO 4);
SIGNAL \ALT_INV_RESET~dataout\ : std_logic;
SIGNAL \ALT_INV_XOSC~dataout\ : std_logic;
SIGNAL \CPU_CLOCK|ALT_INV_clock_state\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \SD_PORT|ALT_INV_d_latch\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \SYS_PORT|ALT_INV_romsel_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_romseh_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_romws_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_romp27_latch~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_DataRxd\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \I2C_PORT|ALT_INV_sda_mon~dataout\ : std_logic;
SIGNAL \I2C_PORT|ALT_INV_scl_mon~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_index\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \I2C_PORT|ALT_INV_sda_latch~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_state.state_bit_0~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_state.state_bit_1~dataout\ : std_logic;
SIGNAL \I2C_PORT|ALT_INV_scl_latch~dataout\ : std_logic;
SIGNAL \SD_PORT|ALT_INV_upd_latch~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_SS~dataout\ : std_logic;
SIGNAL \IO_PORT|ALT_INV_sdclk_latch~dataout\ : std_logic;
SIGNAL \CPU_CLOCK|ALT_INV_d_e_out~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_config_latch~dataout\ : std_logic;
SIGNAL \IO_PORT|ALT_INV_button_latch~dataout\ : std_logic;
SIGNAL \IO_PORT|ALT_INV_sdcs_latch~dataout\ : std_logic;
SIGNAL \IO_PORT|ALT_INV_led_latch\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \IO_PORT|ALT_INV_switch_latch~dataout\ : std_logic;
SIGNAL \SPI_CLK_DIV|LPM_COUNTER_component|ALT_INV_dffs\ : std_logic_vector(3 DOWNTO 3);
SIGNAL \SPI_MASTER|ALT_INV_state.state_bit_2~dataout\ : std_logic;

BEGIN

ww_XOSC <= XOSC;
ww_WOSC <= WOSC;
QCLK <= ww_QCLK;
ECLK <= ww_ECLK;
BCLK <= ww_BCLK;
ACLK <= ww_ACLK;
ww_RESET <= RESET;
ww_ADDR <= ADDR;
ww_RW <= RW;
ww_LIC <= LIC;
ROMCS <= ww_ROMCS;
RAM1CS <= ww_RAM1CS;
RAM2CS <= ww_RAM2CS;
CIOCS <= ww_CIOCS;
SCCCS <= ww_SCCCS;
RD <= ww_RD;
WR <= ww_WR;
ZRD <= ww_ZRD;
ZWR <= ww_ZWR;
ROMP27 <= ww_ROMP27;
TP11 <= ww_TP11;
TP12 <= ww_TP12;
TP13 <= ww_TP13;
TP14 <= ww_TP14;
ww_CONF <= CONF;
SPARE <= ww_SPARE;
ww_PBTN <= PBTN;
LED <= ww_LED;
SDCK <= ww_SDCK;
SDDO <= ww_SDDO;
SDCS <= ww_SDCS;
ww_SDDI <= SDDI;
ww_SDSW <= SDSW;

\DATA[0]~133_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~133_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(0));

\DATA[0]~133_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romws_latch~dataout\ & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[0]~133_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(0) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[0]~133_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~133_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~133_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~133_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~133_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[0]~133_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~133_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
\ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[7]~137_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& \ADDR~dataout\(6) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[7]~137_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& NOT \ADDR~dataout\(6) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(5) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[7]~137_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~137_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~137_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(1));

\DATA[1]~141_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romsel_latch~dataout\ & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[1]~141_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(1) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[1]~141_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[1]~141_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~141_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~151_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(4) & \ADDR~dataout\(6) & NOT \I2C_PORT|sda_mon~dataout\ & \DATA[2]~146_dataout\ & \DATA[2]~145_dataout\);

\DATA[2]~151_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~151_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \I2C_PORT|sda_mon~dataout\ & \DATA[2]~142_dataout\ & \DATA[2]~146_dataout\ & \DATA[2]~145_dataout\);

\DATA[2]~151_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \DATA[2]~143_dataout\ & \DATA[2]~146_dataout\ & \DATA[2]~145_dataout\);

\DATA[2]~151_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(5) & \DATA[2]~143_dataout\ & NOT \I2C_PORT|sda_mon~dataout\ & \DATA[2]~146_dataout\ & \DATA[2]~145_dataout\);

\DATA[2]~151_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~151_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA[2]~146_dataout\ & \DATA[2]~145_dataout\);

\DATA[2]~151_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~151_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[2]~151_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~151_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~154_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|button_latch~dataout\ & \I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[3]~154_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~154_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & NOT \SPI_MASTER|DataRxd\(3));

\DATA[3]~154_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romp27_latch~dataout\ & \I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[3]~154_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[3]~154_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~154_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|scl_mon~dataout\);

\DATA[3]~154_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~154_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[3]~154_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~154_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~165_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~165_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(4));

\DATA[4]~165_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|config_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[4]~165_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[4]~165_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdcs_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[4]~165_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~165_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~165_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~165_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[4]~165_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~165_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SPI_MASTER|DataRxd\(5));

\DATA[5]~168_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdclk_latch~dataout\ & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[5]~168_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[5]~168_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~168_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~176_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA[6]~170_dataout\ & \I2C_PORT|sda_latch~dataout\ & NOT \ADDR~dataout\(6));

\DATA[6]~176_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SPI_MASTER|DataRxd\(6));

\DATA[6]~176_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SPI_MASTER|SS~dataout\ & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[6]~176_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|sda_latch~dataout\ & \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[6]~176_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|sda_latch~dataout\ & NOT \CPU_CLOCK|d_e_out~dataout\);

\DATA[6]~176_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~176_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~176_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~176_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~176_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~176_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~184_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA[6]~170_dataout\ & \I2C_PORT|scl_latch~dataout\ & NOT \ADDR~dataout\(6));

\DATA[7]~184_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SPI_MASTER|DataRxd\(7));

\DATA[7]~184_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|switch_latch~dataout\ & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[7]~184_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|scl_latch~dataout\ & \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[7]~184_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|scl_latch~dataout\ & NOT \CPU_CLOCK|d_e_out~dataout\);

\DATA[7]~184_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~184_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~184_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~184_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~184_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~184_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SDDI~dataout\);

\SDDI~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SDDI~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SDDI~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \RW~dataout\ & \RESET~dataout\);

\rd_n~2_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\rd_n~2_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\rd_n~2_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLOCK|pre_cnt_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|pre_cnt_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(15) & \RESET~dataout\);

\ADDR_DECODE|region1~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|region1~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|region1~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RW~dataout\ & \RESET~dataout\);

\wr_n~5_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\wr_n~5_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~5_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RW~dataout\ & \RESET~dataout\ & \CPU_CLOCK|clock_state\(2));

\wr_n~8_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|clock_state\(1) & NOT \RW~dataout\ & \RESET~dataout\);

\wr_n~8_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\wr_n~8_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~8_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2));

\CPU_CLOCK|clock_state[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & \CPU_CLOCK|clock_state\(2) & NOT \CPU_CLOCK|clock_state\(0));

\CPU_CLOCK|clock_state[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|pre_cnt~dataout\);

\CPU_CLOCK|clock_state[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(0));

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(0));

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \RESET~dataout\ & \SPI_MASTER|state.state_bit_0~dataout\);

\SPI_MASTER|state.state_bit_2_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \RESET~dataout\);

\SPI_MASTER|state.state_bit_2_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|state.state_bit_2_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|state.state_bit_2_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|index[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT 
\SD_PORT|upd_latch~dataout\);

\SPI_MASTER|index[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|index[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|index[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|index[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|index[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(0) & \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(1));

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(0) & \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(1));

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6));

\ADDR_DECODE|scccs~5_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|scccs~5_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~5_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7)
& NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5));

\ADDR_DECODE|ciocs~4_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|ciocs~4_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(2) & \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(0) & \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(1));

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(5) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[5]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(5) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[5]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[5]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[5]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|switch_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SDSW~dataout\ & NOT \IO_PORT|switch_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|switch_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|switch_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SDSW~dataout\ & \IO_PORT|switch_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|switch_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6)
& NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SDSW~dataout\ & \IO_PORT|switch_latch~dataout\);

\IO_PORT|switch_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6)
& NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SDSW~dataout\ & NOT \IO_PORT|switch_latch~dataout\);

\IO_PORT|switch_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|switch_latch_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SDSW~dataout\);

\IO_PORT|switch_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|switch_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|switch_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|switch_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[1]~1\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|led_latch[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \IO_PORT|led_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[1]~1\);

\IO_PORT|led_latch[1]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|led_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[1]~1\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|led_latch[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \IO_PORT|led_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[1]~1\);

\IO_PORT|led_latch[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|led_latch[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[0]~0\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|led_latch[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \IO_PORT|led_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[0]~0\);

\IO_PORT|led_latch[0]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|led_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[0]~0\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|led_latch[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \IO_PORT|led_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[0]~0\);

\IO_PORT|led_latch[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|led_latch[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \IO_PORT|sdcs_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[4]~4\);

\IO_PORT|sdcs_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|sdcs_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[4]~4\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|sdcs_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \IO_PORT|sdcs_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[4]~4\);

\IO_PORT|sdcs_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdcs_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[4]~4\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|sdcs_latch_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|sdcs_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_papre_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\IO_PORT|button_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \PBTN~dataout\ & NOT \IO_PORT|button_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|button_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|button_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \PBTN~dataout\ & \IO_PORT|button_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|button_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6)
& NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \PBTN~dataout\ & \IO_PORT|button_latch~dataout\);

\IO_PORT|button_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6)
& NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \PBTN~dataout\ & NOT \IO_PORT|button_latch~dataout\);

\IO_PORT|button_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|button_latch_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \PBTN~dataout\);

\IO_PORT|button_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|button_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|button_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|button_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CONF~dataout\ & NOT \SYS_PORT|config_latch~dataout\ & NOT \RESET~dataout\);

\SYS_PORT|config_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CONF~dataout\ & \SYS_PORT|config_latch~dataout\ & NOT \RESET~dataout\);

\SYS_PORT|config_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6)
& NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \CONF~dataout\ & \SYS_PORT|config_latch~dataout\);

\SYS_PORT|config_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6)
& NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & \CONF~dataout\ & NOT \SYS_PORT|config_latch~dataout\);

\SYS_PORT|config_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CONF~dataout\);

\SYS_PORT|config_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|config_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \IO_PORT|led_latch\(0) & \RESET~dataout\);

\LED~3_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\LED~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \IO_PORT|led_latch\(1) & \RESET~dataout\);

\LED~6_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\LED~6_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|sdcs_latch~dataout\ & \RESET~dataout\);

\LED~9_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\LED~9_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~9_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \IO_PORT|sdcs_latch~dataout\);

\IO_PORT|sdcs_latch~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|sdcs_latch~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[1]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(1) & \CPU_CLOCK|clock_state\(0));

\CPU_CLOCK|clock_state[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(0));

\CPU_CLOCK|clock_state[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & NOT \ADDR~dataout\(5) & NOT \CPU_CLOCK|clock_state\(2) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \CPU_CLOCK|clock_state\(1));

\CPU_CLOCK|clock_state[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(2) & NOT \CPU_CLOCK|clock_state\(0));

\CPU_CLOCK|clock_state[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|pre_cnt~dataout\);

\CPU_CLOCK|clock_state[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2));

\CPU_CLOCK|d_e_out_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLOCK|d_e_out_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|d_e_out_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdclk_latch_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdclk_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|sdclk_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[5]~5\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|sdclk_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \IO_PORT|sdclk_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[5]~5\);

\IO_PORT|sdclk_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdclk_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[5]~5\ & \CPU_CLOCK|clock_state\(2));

\IO_PORT|sdclk_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \IO_PORT|sdclk_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[5]~5\);

\IO_PORT|sdclk_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdclk_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdclk_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdclk_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|sdclk_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdclk_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[5]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[5]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(5) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[5]~5\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[5]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(5) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[5]~5\);

\SD_PORT|d_latch[5]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(5) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[5]~5\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[5]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(5) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[5]~5\);

\SD_PORT|d_latch[5]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[5]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[5]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[5]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[5]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[5]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|SS~dataout\ & NOT \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|SS_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|SS~dataout\ & \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|SS_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|SS_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|SS_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|SS~dataout\ & \SD_PORT|upd_latch~dataout\);

\SD_PORT|upd_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & 
\ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \RESET~dataout\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|upd_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& \CPU_CLOCK|clock_state\(1) & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \RESET~dataout\);

\SD_PORT|upd_latch_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT 
\SD_PORT|upd_latch~dataout\);

\SPI_MASTER|index[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|index[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|index\(1));

\SPI_MASTER|index[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|index[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|index[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(7) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1)
& \SDDI~dataout\);

\SPI_MASTER|DataRxd[7]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(7) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & 
NOT \SDDI~dataout\);

\SPI_MASTER|DataRxd[7]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[7]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[7]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(6) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[6]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(6) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[6]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[6]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[6]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(4) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[4]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(4) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[4]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[4]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[4]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \RESET~dataout\);

\SPI_MASTER|state.state_bit_1_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_0~dataout\ & \RESET~dataout\);

\SPI_MASTER|state.state_bit_1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \RESET~dataout\);

\SPI_MASTER|state.state_bit_1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|state.state_bit_1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|state.state_bit_1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \I2C_PORT|scl_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[7]~7\);

\I2C_PORT|scl_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\I2C_PORT|scl_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[7]~7\ & \CPU_CLOCK|clock_state\(2));

\I2C_PORT|scl_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \I2C_PORT|scl_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[7]~7\);

\I2C_PORT|scl_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\I2C_PORT|scl_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[7]~7\ & \CPU_CLOCK|clock_state\(2));

\I2C_PORT|scl_latch_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\I2C_PORT|scl_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_latch_papre_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\SD_PORT|d_latch[7]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[7]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(7) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[7]~7\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[7]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(7) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[7]~7\);

\SD_PORT|d_latch[7]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(7) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[7]~7\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[7]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(7) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[7]~7\);

\SD_PORT|d_latch[7]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[7]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[7]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[7]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[7]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[7]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_1~dataout\ & \RESET~dataout\);

\SPI_MASTER|state.state_bit_0_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SD_PORT|upd_latch~dataout\);

\SPI_MASTER|state.state_bit_0_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\);

\SPI_MASTER|state.state_bit_0_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\);

\SPI_MASTER|state.state_bit_0_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|state.state_bit_0_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|state.state_bit_0_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \I2C_PORT|sda_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[6]~6\);

\I2C_PORT|sda_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\I2C_PORT|sda_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[6]~6\ & \CPU_CLOCK|clock_state\(2));

\I2C_PORT|sda_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \I2C_PORT|sda_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[6]~6\);

\I2C_PORT|sda_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\I2C_PORT|sda_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[6]~6\ & \CPU_CLOCK|clock_state\(2));

\I2C_PORT|sda_latch_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\I2C_PORT|sda_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_latch_papre_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\SD_PORT|d_latch[6]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[6]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(6) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[6]~6\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[6]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(6) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[6]~6\);

\SD_PORT|d_latch[6]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(6) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[6]~6\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[6]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(6) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[6]~6\);

\SD_PORT|d_latch[6]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[6]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[6]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[6]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[6]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[6]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[4]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[4]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(4) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[4]~4\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[4]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(4) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[4]~4\);

\SD_PORT|d_latch[4]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(4) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[4]~4\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[4]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(4) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[4]~4\);

\SD_PORT|d_latch[4]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[4]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[4]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[4]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[4]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[4]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|SCLK~dataout\ & \SPI_MASTER|state.state_bit_0~dataout\);

\SPI_MASTER|SCLK_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|SCLK~dataout\);

\SPI_MASTER|SCLK_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|SCLK_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|SCLK_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|SCLK_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT 
\SD_PORT|upd_latch~dataout\);

\SPI_MASTER|index[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|index[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|index[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|index[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|SCLK~dataout\);

\SPI_MASTER|SCLK~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|SCLK~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_mon_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2CSCL~0\ & NOT \I2C_PORT|scl_mon~dataout\ & NOT \RESET~dataout\);

\I2C_PORT|scl_mon_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_mon_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \I2CSCL~0\ & \I2C_PORT|scl_mon~dataout\ & NOT \RESET~dataout\);

\I2C_PORT|scl_mon_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6)
& NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \I2CSCL~0\ & \I2C_PORT|scl_mon~dataout\);

\I2C_PORT|scl_mon_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6)
& NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & \I2CSCL~0\ & NOT \I2C_PORT|scl_mon~dataout\);

\I2C_PORT|scl_mon_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_mon_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2CSCL~0\);

\I2C_PORT|scl_mon_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_mon_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\I2C_PORT|scl_mon_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|scl_mon_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_mon_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2CSDA~0\ & NOT \I2C_PORT|sda_mon~dataout\ & NOT \RESET~dataout\);

\I2C_PORT|sda_mon_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_mon_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \I2CSDA~0\ & \I2C_PORT|sda_mon~dataout\ & NOT \RESET~dataout\);

\I2C_PORT|sda_mon_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6)
& NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \I2CSDA~0\ & \I2C_PORT|sda_mon~dataout\);

\I2C_PORT|sda_mon_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6)
& NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & \I2CSDA~0\ & NOT \I2C_PORT|sda_mon~dataout\);

\I2C_PORT|sda_mon_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_mon_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2CSDA~0\);

\I2C_PORT|sda_mon_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_mon_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\I2C_PORT|sda_mon_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\I2C_PORT|sda_mon_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(2) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(2) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(0) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(0) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(3) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[3]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(3) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[3]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[3]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[3]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|DataRxd[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA[3]~3\);

\SYS_PORT|romp27_latch_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romp27_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT 
\ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \SYS_PORT|process_0~4_dataout\ & \RESET~dataout\);

\SYS_PORT|romp27_latch_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CONF~dataout\ & NOT \RESET~dataout\);

\SYS_PORT|romp27_latch_papre_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CONF~dataout\ & NOT \RESET~dataout\);

\SYS_PORT|romws_latch_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romws_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romws_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[0]~0\ & \CPU_CLOCK|clock_state\(2));

\SYS_PORT|romws_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SYS_PORT|romws_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[0]~0\);

\SYS_PORT|romws_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|romws_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[0]~0\ & \CPU_CLOCK|clock_state\(2));

\SYS_PORT|romws_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SYS_PORT|romws_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[0]~0\);

\SYS_PORT|romws_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romws_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romws_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romws_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|romws_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romws_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romseh_latch_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romseh_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[2]~2\ & \CPU_CLOCK|clock_state\(2));

\SYS_PORT|romseh_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[2]~2\);

\SYS_PORT|romseh_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[2]~2\ & \CPU_CLOCK|clock_state\(2));

\SYS_PORT|romseh_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[2]~2\);

\SYS_PORT|romseh_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romseh_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romseh_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romseh_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|romseh_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romseh_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(2) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[2]~2\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(2) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[2]~2\);

\SD_PORT|d_latch[2]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(2) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[2]~2\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[2]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(2) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[2]~2\);

\SD_PORT|d_latch[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[0]~0\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[0]~0\);

\SD_PORT|d_latch[0]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[0]~0\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[0]~0\);

\SD_PORT|d_latch[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romsel_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[1]~1\ & \CPU_CLOCK|clock_state\(2));

\SYS_PORT|romsel_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SYS_PORT|romsel_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & NOT \DATA[1]~1\);

\SYS_PORT|romsel_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|romsel_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[1]~1\ & \CPU_CLOCK|clock_state\(2));

\SYS_PORT|romsel_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SYS_PORT|romsel_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & NOT \RW~dataout\ & \DATA[1]~1\);

\SYS_PORT|romsel_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|romsel_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[3]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(3) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[3]~3\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[3]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(3) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[3]~3\);

\SD_PORT|d_latch[3]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(3) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[3]~3\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[3]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(3) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[3]~3\);

\SD_PORT|d_latch[3]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[3]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[3]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[3]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[3]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[3]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[1]~1\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & NOT \SD_PORT|d_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & \DATA[1]~1\);

\SD_PORT|d_latch[1]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|d_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[1]~1\ & \CPU_CLOCK|clock_state\(2));

\SD_PORT|d_latch[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLOCK|clock_state\(1) & \SD_PORT|d_latch\(1) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \RW~dataout\ & NOT \DATA[1]~1\);

\SD_PORT|d_latch[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|d_latch[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|d_latch[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~11_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(12) & NOT \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \RW~dataout\);

\ADDR_DECODE|romcs~11_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & \RW~dataout\ & NOT \SYS_PORT|romsel_latch~dataout\);

\ADDR_DECODE|romcs~11_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(9) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \RW~dataout\);

\ADDR_DECODE|romcs~11_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(10) & NOT \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \RW~dataout\);

\ADDR_DECODE|romcs~11_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(11) & NOT \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \RW~dataout\);

\ADDR_DECODE|romcs~11_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~11_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~11_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~11_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|romcs~11_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~11_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~15_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|clock_state\(1) & NOT \RW~dataout\ & \ADDR_DECODE|ram2cs~8_dataout\ & \ADDR~dataout\(15) & \RESET~dataout\);

\ADDR_DECODE|ram2cs~15_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(15) & \RESET~dataout\ & NOT \ADDR~dataout\(14));

\ADDR_DECODE|ram2cs~15_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SYS_PORT|romsel_latch~dataout\ & NOT \ADDR~dataout\(13) & \ADDR~dataout\(15) & \RESET~dataout\);

\ADDR_DECODE|ram2cs~15_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SYS_PORT|romseh_latch~dataout\ & \ADDR_DECODE|ram2cs~9_dataout\ & \ADDR~dataout\(13) & \ADDR~dataout\(15) & \RESET~dataout\);

\ADDR_DECODE|ram2cs~15_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RW~dataout\ & \ADDR_DECODE|ram2cs~8_dataout\ & \CPU_CLOCK|clock_state\(2) & \ADDR~dataout\(15) & \RESET~dataout\);

\ADDR_DECODE|ram2cs~15_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~15_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~15_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~15_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|ram2cs~15_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~15_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[2]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & \CPU_CLOCK|clock_state\(2));

\CPU_CLOCK|clock_state[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \RW~dataout\ & NOT 
\SYS_PORT|romws_latch~dataout\ & NOT \SYS_PORT|romseh_latch~dataout\ & \ADDR~dataout\(11));

\CPU_CLOCK|clock_state[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(12) & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \RW~dataout\ & NOT 
\SYS_PORT|romws_latch~dataout\ & NOT \SYS_PORT|romseh_latch~dataout\);

\CPU_CLOCK|clock_state[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[2]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|romsel_latch~dataout\ & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & NOT 
\ADDR~dataout\(13) & \RW~dataout\ & NOT \SYS_PORT|romws_latch~dataout\);

\CPU_CLOCK|clock_state[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|pre_cnt~dataout\);

\CPU_CLOCK|clock_state[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|clock_state[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(6) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SD_PORT|d_latch\(4) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(5) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(7) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \spi_clk~19bal_dataout\);

\SPI_MASTER|MOSI_v_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLOCK|clock_state\(0) & NOT \CPU_CLOCK|clock_state\(2));

\CPU_CLOCK|q_out~3_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLOCK|q_out~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|q_out~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2));

\CPU_CLOCK|e_out~7_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLOCK|e_out~7_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|e_out~7_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|MOSI_v~dataout\);

\SPI_MASTER|MOSI_v~11_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v~11_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~11_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(0) & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & NOT \RW~dataout\);

\z_wr_n~3_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\z_wr_n~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\z_wr_n~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\z_wr_n~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & \SPI_MASTER|DataRxd\(3));

\DATA[3]~295_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|romp27_latch~dataout\ & NOT \I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[3]~295_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|button_latch~dataout\ & NOT \I2C_PORT|scl_mon~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[3]~295_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[3]~295_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~295_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(0) & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(5));

\CPU_CLOCK|next_state[2]~32_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & \RW~dataout\ & NOT \SYS_PORT|romws_latch~dataout\ & NOT \SYS_PORT|romseh_latch~dataout\ & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(0) & \ADDR~dataout\(15) & 
\RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \ADDR~dataout\(9));

\CPU_CLOCK|next_state[2]~32_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & \RW~dataout\ & NOT \SYS_PORT|romws_latch~dataout\ & NOT \SYS_PORT|romseh_latch~dataout\ & \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2) & \CPU_CLOCK|clock_state\(0) & \ADDR~dataout\(15) & 
\RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & \ADDR~dataout\(10));

\CPU_CLOCK|next_state[2]~32_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLOCK|next_state[2]~32_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLOCK|next_state[2]~32_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|MOSI_v~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|MOSI_v~13_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v~13_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~13_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~15_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v~15_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & \SPI_MASTER|MOSI_v~dataout\);

\SPI_MASTER|MOSI_v~15_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SD_PORT|d_latch\(0) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v~15_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(1) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v~15_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(3) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~4_dataout\);

\SPI_MASTER|MOSI_v~15_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~15_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~15_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~15_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v~15_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~15_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\~VCC~0_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~VCC~0_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~310_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(10) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~310_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|sda_latch~dataout\ & NOT \RW~dataout\);

\DATA[6]~310_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(7) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~310_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(8) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~310_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(9) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~310_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~310_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~310_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~310_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~310_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~310_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~311_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\ & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~311_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|sda_latch~dataout\ & \ADDR~dataout\(11));

\DATA[6]~311_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(12) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~311_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(13) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~311_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(14) & \I2C_PORT|sda_latch~dataout\);

\DATA[6]~311_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~311_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~311_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~311_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~311_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~311_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|sda_latch~dataout\ & NOT \ADDR~dataout\(15));

\DATA[6]~312_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~312_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~312_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~324_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(10) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~324_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|scl_latch~dataout\ & NOT \RW~dataout\);

\DATA[7]~324_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(7) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~324_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(8) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~324_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(9) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~324_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~324_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~324_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~324_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~324_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~324_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~325_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\ & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~325_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|scl_latch~dataout\ & \ADDR~dataout\(11));

\DATA[7]~325_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(12) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~325_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(13) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~325_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(14) & \I2C_PORT|scl_latch~dataout\);

\DATA[7]~325_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~325_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~325_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~325_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~325_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~325_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \I2C_PORT|scl_latch~dataout\ & NOT \ADDR~dataout\(15));

\DATA[7]~326_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~326_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~326_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|sdclk_latch~dataout\ & NOT \XOSC~dataout\);

\spi_clk~19bal_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(3) & \IO_PORT|sdclk_latch~dataout\);

\spi_clk~19bal_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\spi_clk~19bal_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\spi_clk~19bal_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA[6]~176_dataout\);

\DATA[6]~327_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~327_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~327_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA[7]~184_dataout\);

\DATA[7]~328_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~328_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~328_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~142_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\);

\DATA[2]~143_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(4) & NOT \SYS_PORT|romseh_latch~dataout\);

\DATA[2]~145_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & 
\CPU_CLOCK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SPI_MASTER|DataRxd\(2));

\DATA[2]~146_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \I2C_PORT|sda_mon~dataout\ & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4));

\DATA[6]~170_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\SYS_PORT|process_0~4_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLOCK|clock_state\(1) & NOT \CPU_CLOCK|clock_state\(2));

\ADDR_DECODE|ram2cs~8_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9));

\ADDR_DECODE|ram2cs~9_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(9));

\SPI_MASTER|MOSI_v~4_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_0~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);
\ALT_INV_I2CSCL~0\ <= NOT \I2CSCL~0\;
\ALT_INV_I2CSDA~0\ <= NOT \I2CSDA~0\;
\ALT_INV_DATA[7]~7\ <= NOT \DATA[7]~7\;
\ALT_INV_DATA[6]~6\ <= NOT \DATA[6]~6\;
\ALT_INV_DATA[5]~5\ <= NOT \DATA[5]~5\;
\ALT_INV_DATA[4]~4\ <= NOT \DATA[4]~4\;
\ALT_INV_DATA[3]~3\ <= NOT \DATA[3]~3\;
\ALT_INV_DATA[2]~2\ <= NOT \DATA[2]~2\;
\ALT_INV_DATA[1]~1\ <= NOT \DATA[1]~1\;
\ALT_INV_DATA[0]~0\ <= NOT \DATA[0]~0\;
\ALT_INV_SDSW~dataout\ <= NOT \SDSW~dataout\;
\ALT_INV_SDDI~dataout\ <= NOT \SDDI~dataout\;
\ALT_INV_PBTN~dataout\ <= NOT \PBTN~dataout\;
\ALT_INV_CONF~dataout\ <= NOT \CONF~dataout\;
\ALT_INV_RW~dataout\ <= NOT \RW~dataout\;
\ALT_INV_ADDR~dataout\(15) <= NOT \ADDR~dataout\(15);
\ALT_INV_ADDR~dataout\(14) <= NOT \ADDR~dataout\(14);
\ALT_INV_ADDR~dataout\(13) <= NOT \ADDR~dataout\(13);
\ALT_INV_ADDR~dataout\(12) <= NOT \ADDR~dataout\(12);
\ALT_INV_ADDR~dataout\(11) <= NOT \ADDR~dataout\(11);
\ALT_INV_ADDR~dataout\(10) <= NOT \ADDR~dataout\(10);
\ALT_INV_ADDR~dataout\(9) <= NOT \ADDR~dataout\(9);
\ALT_INV_ADDR~dataout\(8) <= NOT \ADDR~dataout\(8);
\ALT_INV_ADDR~dataout\(7) <= NOT \ADDR~dataout\(7);
\ALT_INV_ADDR~dataout\(6) <= NOT \ADDR~dataout\(6);
\ALT_INV_ADDR~dataout\(5) <= NOT \ADDR~dataout\(5);
\ALT_INV_ADDR~dataout\(4) <= NOT \ADDR~dataout\(4);
\ALT_INV_RESET~dataout\ <= NOT \RESET~dataout\;
\ALT_INV_XOSC~dataout\ <= NOT \XOSC~dataout\;
\CPU_CLOCK|ALT_INV_clock_state\(2) <= NOT \CPU_CLOCK|clock_state\(2);
\SD_PORT|ALT_INV_d_latch\(1) <= NOT \SD_PORT|d_latch\(1);
\SD_PORT|ALT_INV_d_latch\(3) <= NOT \SD_PORT|d_latch\(3);
\SYS_PORT|ALT_INV_romsel_latch~dataout\ <= NOT \SYS_PORT|romsel_latch~dataout\;
\SD_PORT|ALT_INV_d_latch\(0) <= NOT \SD_PORT|d_latch\(0);
\SD_PORT|ALT_INV_d_latch\(2) <= NOT \SD_PORT|d_latch\(2);
\SYS_PORT|ALT_INV_romseh_latch~dataout\ <= NOT \SYS_PORT|romseh_latch~dataout\;
\SYS_PORT|ALT_INV_romws_latch~dataout\ <= NOT \SYS_PORT|romws_latch~dataout\;
\SYS_PORT|ALT_INV_romp27_latch~dataout\ <= NOT \SYS_PORT|romp27_latch~dataout\;
\SPI_MASTER|ALT_INV_DataRxd\(1) <= NOT \SPI_MASTER|DataRxd\(1);
\SPI_MASTER|ALT_INV_DataRxd\(3) <= NOT \SPI_MASTER|DataRxd\(3);
\SPI_MASTER|ALT_INV_DataRxd\(0) <= NOT \SPI_MASTER|DataRxd\(0);
\SPI_MASTER|ALT_INV_DataRxd\(2) <= NOT \SPI_MASTER|DataRxd\(2);
\I2C_PORT|ALT_INV_sda_mon~dataout\ <= NOT \I2C_PORT|sda_mon~dataout\;
\I2C_PORT|ALT_INV_scl_mon~dataout\ <= NOT \I2C_PORT|scl_mon~dataout\;
\SPI_MASTER|ALT_INV_index\(2) <= NOT \SPI_MASTER|index\(2);
\SD_PORT|ALT_INV_d_latch\(4) <= NOT \SD_PORT|d_latch\(4);
\SD_PORT|ALT_INV_d_latch\(6) <= NOT \SD_PORT|d_latch\(6);
\I2C_PORT|ALT_INV_sda_latch~dataout\ <= NOT \I2C_PORT|sda_latch~dataout\;
\SPI_MASTER|ALT_INV_state.state_bit_0~dataout\ <= NOT \SPI_MASTER|state.state_bit_0~dataout\;
\SD_PORT|ALT_INV_d_latch\(7) <= NOT \SD_PORT|d_latch\(7);
\SPI_MASTER|ALT_INV_state.state_bit_1~dataout\ <= NOT \SPI_MASTER|state.state_bit_1~dataout\;
\I2C_PORT|ALT_INV_scl_latch~dataout\ <= NOT \I2C_PORT|scl_latch~dataout\;
\SPI_MASTER|ALT_INV_DataRxd\(4) <= NOT \SPI_MASTER|DataRxd\(4);
\SPI_MASTER|ALT_INV_DataRxd\(6) <= NOT \SPI_MASTER|DataRxd\(6);
\SPI_MASTER|ALT_INV_index\(1) <= NOT \SPI_MASTER|index\(1);
\SPI_MASTER|ALT_INV_DataRxd\(7) <= NOT \SPI_MASTER|DataRxd\(7);
\SD_PORT|ALT_INV_upd_latch~dataout\ <= NOT \SD_PORT|upd_latch~dataout\;
\SPI_MASTER|ALT_INV_SS~dataout\ <= NOT \SPI_MASTER|SS~dataout\;
\SD_PORT|ALT_INV_d_latch\(5) <= NOT \SD_PORT|d_latch\(5);
\IO_PORT|ALT_INV_sdclk_latch~dataout\ <= NOT \IO_PORT|sdclk_latch~dataout\;
\CPU_CLOCK|ALT_INV_d_e_out~dataout\ <= NOT \CPU_CLOCK|d_e_out~dataout\;
\CPU_CLOCK|ALT_INV_clock_state\(1) <= NOT \CPU_CLOCK|clock_state\(1);
\SYS_PORT|ALT_INV_config_latch~dataout\ <= NOT \SYS_PORT|config_latch~dataout\;
\IO_PORT|ALT_INV_button_latch~dataout\ <= NOT \IO_PORT|button_latch~dataout\;
\IO_PORT|ALT_INV_sdcs_latch~dataout\ <= NOT \IO_PORT|sdcs_latch~dataout\;
\IO_PORT|ALT_INV_led_latch\(0) <= NOT \IO_PORT|led_latch\(0);
\IO_PORT|ALT_INV_led_latch\(1) <= NOT \IO_PORT|led_latch\(1);
\IO_PORT|ALT_INV_switch_latch~dataout\ <= NOT \IO_PORT|switch_latch~dataout\;
\SPI_MASTER|ALT_INV_DataRxd\(5) <= NOT \SPI_MASTER|DataRxd\(5);
\SPI_CLK_DIV|LPM_COUNTER_component|ALT_INV_dffs\(3) <= NOT \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(3);
\SPI_MASTER|ALT_INV_index\(0) <= NOT \SPI_MASTER|index\(0);
\SPI_MASTER|ALT_INV_state.state_bit_2~dataout\ <= NOT \SPI_MASTER|state.state_bit_2~dataout\;
\CPU_CLOCK|ALT_INV_clock_state\(0) <= NOT \CPU_CLOCK|clock_state\(0);

-- Location: LC99
\SPI_MASTER|DataRxd[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[2]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[2]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[2]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[2]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[2]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[2]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[2]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[2]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[2]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[2]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[2]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(2));

-- Location: PIN_54
\DATA[0]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[0]~133_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(0),
	dataout => \DATA[0]~0\);

-- Location: PIN_55
\DATA[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[1]~141_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(1),
	dataout => \DATA[1]~1\);

-- Location: PIN_56
\DATA[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[2]~151_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(2),
	dataout => \DATA[2]~2\);

-- Location: PIN_57
\DATA[3]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[3]~154_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(3),
	dataout => \DATA[3]~3\);

-- Location: PIN_58
\DATA[4]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[4]~165_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(4),
	dataout => \DATA[4]~4\);

-- Location: PIN_60
\DATA[5]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[5]~168_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(5),
	dataout => \DATA[5]~5\);

-- Location: PIN_61
\DATA[6]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[6]~327_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(6),
	dataout => \DATA[6]~6\);

-- Location: PIN_63
\DATA[7]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \DATA[7]~328_dataout\,
	oe => \DATA[7]~137_dataout\,
	padio => DATA(7),
	dataout => \DATA[7]~7\);

-- Location: PIN_11
\I2CSDA~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \I2C_PORT|sda_latch~dataout\,
	oe => VCC,
	padio => I2CSDA,
	dataout => \I2CSDA~0\);

-- Location: PIN_12
\I2CSCL~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	operation_mode => "bidir",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \I2C_PORT|scl_latch~dataout\,
	oe => VCC,
	padio => I2CSCL,
	dataout => \I2CSCL~0\);

-- Location: PIN_1
\RESET~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_RESET,
	dataout => \RESET~dataout\);

-- Location: PIN_22
\SDDI~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SDDI,
	dataout => \SDDI~dataout\);

-- Location: PIN_2
\XOSC~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_XOSC,
	dataout => \XOSC~dataout\);

-- Location: PIN_77
\ADDR[5]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(5),
	dataout => \ADDR~dataout\(5));

-- Location: PIN_76
\ADDR[6]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(6),
	dataout => \ADDR~dataout\(6));

-- Location: PIN_75
\ADDR[7]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(7),
	dataout => \ADDR~dataout\(7));

-- Location: PIN_74
\ADDR[8]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(8),
	dataout => \ADDR~dataout\(8));

-- Location: PIN_73
\ADDR[9]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(9),
	dataout => \ADDR~dataout\(9));

-- Location: PIN_70
\ADDR[10]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(10),
	dataout => \ADDR~dataout\(10));

-- Location: PIN_69
\ADDR[11]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(11),
	dataout => \ADDR~dataout\(11));

-- Location: PIN_68
\ADDR[12]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(12),
	dataout => \ADDR~dataout\(12));

-- Location: PIN_67
\ADDR[13]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(13),
	dataout => \ADDR~dataout\(13));

-- Location: PIN_65
\ADDR[14]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(14),
	dataout => \ADDR~dataout\(14));

-- Location: PIN_64
\ADDR[15]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(15),
	dataout => \ADDR~dataout\(15));

-- Location: LC34
\CPU_CLOCK|pre_cnt\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "reg",
	pexp_mode => "on",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \CPU_CLOCK|pre_cnt_pterm0_bus\,
	pterm1 => \CPU_CLOCK|pre_cnt_pterm1_bus\,
	pterm2 => \CPU_CLOCK|pre_cnt_pterm2_bus\,
	pterm3 => \CPU_CLOCK|pre_cnt_pterm3_bus\,
	pterm4 => \CPU_CLOCK|pre_cnt_pterm4_bus\,
	pterm5 => \CPU_CLOCK|pre_cnt_pterm5_bus\,
	pxor => \CPU_CLOCK|pre_cnt_pxor_bus\,
	pclk => \CPU_CLOCK|pre_cnt_pclk_bus\,
	papre => \CPU_CLOCK|pre_cnt_papre_bus\,
	paclr => \CPU_CLOCK|pre_cnt_paclr_bus\,
	pena => \CPU_CLOCK|pre_cnt_pena_bus\,
	dataout => \CPU_CLOCK|pre_cnt~dataout\);

-- Location: LC50
\CPU_CLOCK|clock_state[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \CPU_CLOCK|clock_state[1]_pterm0_bus\,
	pterm1 => \CPU_CLOCK|clock_state[1]_pterm1_bus\,
	pterm2 => \CPU_CLOCK|clock_state[1]_pterm2_bus\,
	pterm3 => \CPU_CLOCK|clock_state[1]_pterm3_bus\,
	pterm4 => \CPU_CLOCK|clock_state[1]_pterm4_bus\,
	pterm5 => \CPU_CLOCK|clock_state[1]_pterm5_bus\,
	pxor => \CPU_CLOCK|clock_state[1]_pxor_bus\,
	pclk => \CPU_CLOCK|clock_state[1]_pclk_bus\,
	papre => \CPU_CLOCK|clock_state[1]_papre_bus\,
	paclr => \CPU_CLOCK|clock_state[1]_paclr_bus\,
	pena => \CPU_CLOCK|clock_state[1]_pena_bus\,
	dataout => \CPU_CLOCK|clock_state\(1));

-- Location: LC60
\CPU_CLOCK|clock_state[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \CPU_CLOCK|clock_state[0]_pterm0_bus\,
	pterm1 => \CPU_CLOCK|clock_state[0]_pterm1_bus\,
	pterm2 => \CPU_CLOCK|clock_state[0]_pterm2_bus\,
	pterm3 => \CPU_CLOCK|clock_state[0]_pterm3_bus\,
	pterm4 => \CPU_CLOCK|clock_state[0]_pterm4_bus\,
	pterm5 => \CPU_CLOCK|clock_state[0]_pterm5_bus\,
	pxor => \CPU_CLOCK|clock_state[0]_pxor_bus\,
	pclk => \CPU_CLOCK|clock_state[0]_pclk_bus\,
	papre => \CPU_CLOCK|clock_state[0]_papre_bus\,
	paclr => \CPU_CLOCK|clock_state[0]_paclr_bus\,
	pena => \CPU_CLOCK|clock_state[0]_pena_bus\,
	dataout => \CPU_CLOCK|clock_state\(0));

-- Location: PIN_51
\RW~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_RW,
	dataout => \RW~dataout\);

-- Location: PIN_79
\ADDR[4]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ADDR(4),
	dataout => \ADDR~dataout\(4));

-- Location: LC52
\SYS_PORT|romseh_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SYS_PORT|romseh_latch_pterm0_bus\,
	pterm1 => \SYS_PORT|romseh_latch_pterm1_bus\,
	pterm2 => \SYS_PORT|romseh_latch_pterm2_bus\,
	pterm3 => \SYS_PORT|romseh_latch_pterm3_bus\,
	pterm4 => \SYS_PORT|romseh_latch_pterm4_bus\,
	pterm5 => \SYS_PORT|romseh_latch_pterm5_bus\,
	pxor => \SYS_PORT|romseh_latch_pxor_bus\,
	pclk => \SYS_PORT|romseh_latch_pclk_bus\,
	papre => \SYS_PORT|romseh_latch_papre_bus\,
	paclr => \SYS_PORT|romseh_latch_paclr_bus\,
	pena => \SYS_PORT|romseh_latch_pena_bus\,
	dataout => \SYS_PORT|romseh_latch~dataout\);

-- Location: LC59
\SYS_PORT|romws_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SYS_PORT|romws_latch_pterm0_bus\,
	pterm1 => \SYS_PORT|romws_latch_pterm1_bus\,
	pterm2 => \SYS_PORT|romws_latch_pterm2_bus\,
	pterm3 => \SYS_PORT|romws_latch_pterm3_bus\,
	pterm4 => \SYS_PORT|romws_latch_pterm4_bus\,
	pterm5 => \SYS_PORT|romws_latch_pterm5_bus\,
	pxor => \SYS_PORT|romws_latch_pxor_bus\,
	pclk => \SYS_PORT|romws_latch_pclk_bus\,
	papre => \SYS_PORT|romws_latch_papre_bus\,
	paclr => \SYS_PORT|romws_latch_paclr_bus\,
	pena => \SYS_PORT|romws_latch_pena_bus\,
	dataout => \SYS_PORT|romws_latch~dataout\);

-- Location: LC62
\CPU_CLOCK|next_state[2]~32\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \CPU_CLOCK|next_state[2]~32_pterm0_bus\,
	pterm1 => \CPU_CLOCK|next_state[2]~32_pterm1_bus\,
	pterm2 => \CPU_CLOCK|next_state[2]~32_pterm2_bus\,
	pterm3 => \CPU_CLOCK|next_state[2]~32_pterm3_bus\,
	pterm4 => \CPU_CLOCK|next_state[2]~32_pterm4_bus\,
	pterm5 => \CPU_CLOCK|next_state[2]~32_pterm5_bus\,
	pxor => \CPU_CLOCK|next_state[2]~32_pxor_bus\,
	pclk => \CPU_CLOCK|next_state[2]~32_pclk_bus\,
	papre => \CPU_CLOCK|next_state[2]~32_papre_bus\,
	paclr => \CPU_CLOCK|next_state[2]~32_paclr_bus\,
	pena => \CPU_CLOCK|next_state[2]~32_pena_bus\,
	pexpout => \CPU_CLOCK|next_state[2]~32_pexpout\);

-- Location: LC58
\SYS_PORT|romsel_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SYS_PORT|romsel_latch_pterm0_bus\,
	pterm1 => \SYS_PORT|romsel_latch_pterm1_bus\,
	pterm2 => \SYS_PORT|romsel_latch_pterm2_bus\,
	pterm3 => \SYS_PORT|romsel_latch_pterm3_bus\,
	pterm4 => \SYS_PORT|romsel_latch_pterm4_bus\,
	pterm5 => \SYS_PORT|romsel_latch_pterm5_bus\,
	pxor => \SYS_PORT|romsel_latch_pxor_bus\,
	pclk => \SYS_PORT|romsel_latch_pclk_bus\,
	papre => \SYS_PORT|romsel_latch_papre_bus\,
	paclr => \SYS_PORT|romsel_latch_paclr_bus\,
	pena => \SYS_PORT|romsel_latch_pena_bus\,
	dataout => \SYS_PORT|romsel_latch~dataout\);

-- Location: LC63
\CPU_CLOCK|clock_state[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pexpin => \CPU_CLOCK|next_state[2]~32_pexpout\,
	pterm0 => \CPU_CLOCK|clock_state[2]_pterm0_bus\,
	pterm1 => \CPU_CLOCK|clock_state[2]_pterm1_bus\,
	pterm2 => \CPU_CLOCK|clock_state[2]_pterm2_bus\,
	pterm3 => \CPU_CLOCK|clock_state[2]_pterm3_bus\,
	pterm4 => \CPU_CLOCK|clock_state[2]_pterm4_bus\,
	pterm5 => \CPU_CLOCK|clock_state[2]_pterm5_bus\,
	pxor => \CPU_CLOCK|clock_state[2]_pxor_bus\,
	pclk => \CPU_CLOCK|clock_state[2]_pclk_bus\,
	papre => \CPU_CLOCK|clock_state[2]_papre_bus\,
	paclr => \CPU_CLOCK|clock_state[2]_paclr_bus\,
	pena => \CPU_CLOCK|clock_state[2]_pena_bus\,
	dataout => \CPU_CLOCK|clock_state\(2));

-- Location: LC12
\IO_PORT|sdclk_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \IO_PORT|sdclk_latch_pterm0_bus\,
	pterm1 => \IO_PORT|sdclk_latch_pterm1_bus\,
	pterm2 => \IO_PORT|sdclk_latch_pterm2_bus\,
	pterm3 => \IO_PORT|sdclk_latch_pterm3_bus\,
	pterm4 => \IO_PORT|sdclk_latch_pterm4_bus\,
	pterm5 => \IO_PORT|sdclk_latch_pterm5_bus\,
	pxor => \IO_PORT|sdclk_latch_pxor_bus\,
	pclk => \IO_PORT|sdclk_latch_pclk_bus\,
	papre => \IO_PORT|sdclk_latch_papre_bus\,
	paclr => \IO_PORT|sdclk_latch_paclr_bus\,
	pena => \IO_PORT|sdclk_latch_pena_bus\,
	dataout => \IO_PORT|sdclk_latch~dataout\);

-- Location: LC66
\SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "reg",
	pexp_mode => "on",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm0_bus\,
	pterm1 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm1_bus\,
	pterm2 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm2_bus\,
	pterm3 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm3_bus\,
	pterm4 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm4_bus\,
	pterm5 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pterm5_bus\,
	pxor => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pxor_bus\,
	pclk => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pclk_bus\,
	papre => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_papre_bus\,
	paclr => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_paclr_bus\,
	pena => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[0]_pena_bus\,
	dataout => \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(0));

-- Location: LC111
\SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm0_bus\,
	pterm1 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm1_bus\,
	pterm2 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm2_bus\,
	pterm3 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm3_bus\,
	pterm4 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm4_bus\,
	pterm5 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pterm5_bus\,
	pxor => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pxor_bus\,
	pclk => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pclk_bus\,
	papre => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_papre_bus\,
	paclr => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_paclr_bus\,
	pena => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[1]_pena_bus\,
	dataout => \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(1));

-- Location: LC102
\SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm0_bus\,
	pterm1 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm1_bus\,
	pterm2 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm2_bus\,
	pterm3 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm3_bus\,
	pterm4 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm4_bus\,
	pterm5 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pterm5_bus\,
	pxor => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pxor_bus\,
	pclk => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pclk_bus\,
	papre => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_papre_bus\,
	paclr => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_paclr_bus\,
	pena => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[2]_pena_bus\,
	dataout => \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(2));

-- Location: LC101
\SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm0_bus\,
	pterm1 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm1_bus\,
	pterm2 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm2_bus\,
	pterm3 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm3_bus\,
	pterm4 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm4_bus\,
	pterm5 => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pterm5_bus\,
	pxor => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pxor_bus\,
	pclk => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pclk_bus\,
	papre => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_papre_bus\,
	paclr => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_paclr_bus\,
	pena => \SPI_CLK_DIV|LPM_COUNTER_component|dffs[3]_pena_bus\,
	dataout => \SPI_CLK_DIV|LPM_COUNTER_component|dffs\(3));

-- Location: LC105
\spi_clk~19bal\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \spi_clk~19bal_pterm0_bus\,
	pterm1 => \spi_clk~19bal_pterm1_bus\,
	pterm2 => \spi_clk~19bal_pterm2_bus\,
	pterm3 => \spi_clk~19bal_pterm3_bus\,
	pterm4 => \spi_clk~19bal_pterm4_bus\,
	pterm5 => \spi_clk~19bal_pterm5_bus\,
	pxor => \spi_clk~19bal_pxor_bus\,
	pclk => \spi_clk~19bal_pclk_bus\,
	papre => \spi_clk~19bal_papre_bus\,
	paclr => \spi_clk~19bal_paclr_bus\,
	pena => \spi_clk~19bal_pena_bus\,
	dataout => \spi_clk~19bal_dataout\);

-- Location: LC71
\SPI_MASTER|state.state_bit_2\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|state.state_bit_2_pterm0_bus\,
	pterm1 => \SPI_MASTER|state.state_bit_2_pterm1_bus\,
	pterm2 => \SPI_MASTER|state.state_bit_2_pterm2_bus\,
	pterm3 => \SPI_MASTER|state.state_bit_2_pterm3_bus\,
	pterm4 => \SPI_MASTER|state.state_bit_2_pterm4_bus\,
	pterm5 => \SPI_MASTER|state.state_bit_2_pterm5_bus\,
	pxor => \SPI_MASTER|state.state_bit_2_pxor_bus\,
	pclk => \SPI_MASTER|state.state_bit_2_pclk_bus\,
	papre => \SPI_MASTER|state.state_bit_2_papre_bus\,
	paclr => \SPI_MASTER|state.state_bit_2_paclr_bus\,
	pena => \SPI_MASTER|state.state_bit_2_pena_bus\,
	dataout => \SPI_MASTER|state.state_bit_2~dataout\);

-- Location: LC76
\SPI_MASTER|index[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|index[0]_pterm0_bus\,
	pterm1 => \SPI_MASTER|index[0]_pterm1_bus\,
	pterm2 => \SPI_MASTER|index[0]_pterm2_bus\,
	pterm3 => \SPI_MASTER|index[0]_pterm3_bus\,
	pterm4 => \SPI_MASTER|index[0]_pterm4_bus\,
	pterm5 => \SPI_MASTER|index[0]_pterm5_bus\,
	pxor => \SPI_MASTER|index[0]_pxor_bus\,
	pclk => \SPI_MASTER|index[0]_pclk_bus\,
	papre => \SPI_MASTER|index[0]_papre_bus\,
	paclr => \SPI_MASTER|index[0]_paclr_bus\,
	pena => \SPI_MASTER|index[0]_pena_bus\,
	dataout => \SPI_MASTER|index\(0));

-- Location: LC77
\SPI_MASTER|index[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|index[1]_pterm0_bus\,
	pterm1 => \SPI_MASTER|index[1]_pterm1_bus\,
	pterm2 => \SPI_MASTER|index[1]_pterm2_bus\,
	pterm3 => \SPI_MASTER|index[1]_pterm3_bus\,
	pterm4 => \SPI_MASTER|index[1]_pterm4_bus\,
	pterm5 => \SPI_MASTER|index[1]_pterm5_bus\,
	pxor => \SPI_MASTER|index[1]_pxor_bus\,
	pclk => \SPI_MASTER|index[1]_pclk_bus\,
	papre => \SPI_MASTER|index[1]_papre_bus\,
	paclr => \SPI_MASTER|index[1]_paclr_bus\,
	pena => \SPI_MASTER|index[1]_pena_bus\,
	dataout => \SPI_MASTER|index\(1));

-- Location: LC78
\SPI_MASTER|state.state_bit_0\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|state.state_bit_0_pterm0_bus\,
	pterm1 => \SPI_MASTER|state.state_bit_0_pterm1_bus\,
	pterm2 => \SPI_MASTER|state.state_bit_0_pterm2_bus\,
	pterm3 => \SPI_MASTER|state.state_bit_0_pterm3_bus\,
	pterm4 => \SPI_MASTER|state.state_bit_0_pterm4_bus\,
	pterm5 => \SPI_MASTER|state.state_bit_0_pterm5_bus\,
	pxor => \SPI_MASTER|state.state_bit_0_pxor_bus\,
	pclk => \SPI_MASTER|state.state_bit_0_pclk_bus\,
	papre => \SPI_MASTER|state.state_bit_0_papre_bus\,
	paclr => \SPI_MASTER|state.state_bit_0_paclr_bus\,
	pena => \SPI_MASTER|state.state_bit_0_pena_bus\,
	dataout => \SPI_MASTER|state.state_bit_0~dataout\);

-- Location: LC70
\SPI_MASTER|state.state_bit_1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|state.state_bit_1_pterm0_bus\,
	pterm1 => \SPI_MASTER|state.state_bit_1_pterm1_bus\,
	pterm2 => \SPI_MASTER|state.state_bit_1_pterm2_bus\,
	pterm3 => \SPI_MASTER|state.state_bit_1_pterm3_bus\,
	pterm4 => \SPI_MASTER|state.state_bit_1_pterm4_bus\,
	pterm5 => \SPI_MASTER|state.state_bit_1_pterm5_bus\,
	pxor => \SPI_MASTER|state.state_bit_1_pxor_bus\,
	pclk => \SPI_MASTER|state.state_bit_1_pclk_bus\,
	papre => \SPI_MASTER|state.state_bit_1_papre_bus\,
	paclr => \SPI_MASTER|state.state_bit_1_paclr_bus\,
	pena => \SPI_MASTER|state.state_bit_1_pena_bus\,
	dataout => \SPI_MASTER|state.state_bit_1~dataout\);

-- Location: LC110
\SPI_MASTER|SS\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|SS_pterm0_bus\,
	pterm1 => \SPI_MASTER|SS_pterm1_bus\,
	pterm2 => \SPI_MASTER|SS_pterm2_bus\,
	pterm3 => \SPI_MASTER|SS_pterm3_bus\,
	pterm4 => \SPI_MASTER|SS_pterm4_bus\,
	pterm5 => \SPI_MASTER|SS_pterm5_bus\,
	pxor => \SPI_MASTER|SS_pxor_bus\,
	pclk => \SPI_MASTER|SS_pclk_bus\,
	papre => \SPI_MASTER|SS_papre_bus\,
	paclr => \SPI_MASTER|SS_paclr_bus\,
	pena => \SPI_MASTER|SS_pena_bus\,
	dataout => \SPI_MASTER|SS~dataout\);

-- Location: LC115
\SD_PORT|upd_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|upd_latch_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch_pterm5_bus\,
	pxor => \SD_PORT|upd_latch_pxor_bus\,
	pclk => \SD_PORT|upd_latch_pclk_bus\,
	papre => \SD_PORT|upd_latch_papre_bus\,
	paclr => \SD_PORT|upd_latch_paclr_bus\,
	pena => \SD_PORT|upd_latch_pena_bus\,
	dataout => \SD_PORT|upd_latch~dataout\);

-- Location: LC80
\SPI_MASTER|index[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|index[2]_pterm0_bus\,
	pterm1 => \SPI_MASTER|index[2]_pterm1_bus\,
	pterm2 => \SPI_MASTER|index[2]_pterm2_bus\,
	pterm3 => \SPI_MASTER|index[2]_pterm3_bus\,
	pterm4 => \SPI_MASTER|index[2]_pterm4_bus\,
	pterm5 => \SPI_MASTER|index[2]_pterm5_bus\,
	pxor => \SPI_MASTER|index[2]_pxor_bus\,
	pclk => \SPI_MASTER|index[2]_pclk_bus\,
	papre => \SPI_MASTER|index[2]_papre_bus\,
	paclr => \SPI_MASTER|index[2]_paclr_bus\,
	pena => \SPI_MASTER|index[2]_pena_bus\,
	dataout => \SPI_MASTER|index\(2));

-- Location: LC106
\SPI_MASTER|DataRxd[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[0]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[0]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[0]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[0]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[0]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[0]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[0]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[0]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[0]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[0]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[0]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(0));

-- Location: LC68
\CPU_CLOCK|d_e_out\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \CPU_CLOCK|d_e_out_pterm0_bus\,
	pterm1 => \CPU_CLOCK|d_e_out_pterm1_bus\,
	pterm2 => \CPU_CLOCK|d_e_out_pterm2_bus\,
	pterm3 => \CPU_CLOCK|d_e_out_pterm3_bus\,
	pterm4 => \CPU_CLOCK|d_e_out_pterm4_bus\,
	pterm5 => \CPU_CLOCK|d_e_out_pterm5_bus\,
	pxor => \CPU_CLOCK|d_e_out_pxor_bus\,
	pclk => \CPU_CLOCK|d_e_out_pclk_bus\,
	papre => \CPU_CLOCK|d_e_out_papre_bus\,
	paclr => \CPU_CLOCK|d_e_out_paclr_bus\,
	pena => \CPU_CLOCK|d_e_out_pena_bus\,
	dataout => \CPU_CLOCK|d_e_out~dataout\);

-- Location: LC46
\IO_PORT|led_latch[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \IO_PORT|led_latch[0]_pterm0_bus\,
	pterm1 => \IO_PORT|led_latch[0]_pterm1_bus\,
	pterm2 => \IO_PORT|led_latch[0]_pterm2_bus\,
	pterm3 => \IO_PORT|led_latch[0]_pterm3_bus\,
	pterm4 => \IO_PORT|led_latch[0]_pterm4_bus\,
	pterm5 => \IO_PORT|led_latch[0]_pterm5_bus\,
	pxor => \IO_PORT|led_latch[0]_pxor_bus\,
	pclk => \IO_PORT|led_latch[0]_pclk_bus\,
	papre => \IO_PORT|led_latch[0]_papre_bus\,
	paclr => \IO_PORT|led_latch[0]_paclr_bus\,
	pena => \IO_PORT|led_latch[0]_pena_bus\,
	dataout => \IO_PORT|led_latch\(0));

-- Location: LC83
\DATA[0]~133\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[0]~133_pterm0_bus\,
	pterm1 => \DATA[0]~133_pterm1_bus\,
	pterm2 => \DATA[0]~133_pterm2_bus\,
	pterm3 => \DATA[0]~133_pterm3_bus\,
	pterm4 => \DATA[0]~133_pterm4_bus\,
	pterm5 => \DATA[0]~133_pterm5_bus\,
	pxor => \DATA[0]~133_pxor_bus\,
	pclk => \DATA[0]~133_pclk_bus\,
	papre => \DATA[0]~133_papre_bus\,
	paclr => \DATA[0]~133_paclr_bus\,
	pena => \DATA[0]~133_pena_bus\,
	dataout => \DATA[0]~133_dataout\);

-- Location: LC120
\DATA[7]~137\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~137_pterm0_bus\,
	pterm1 => \DATA[7]~137_pterm1_bus\,
	pterm2 => \DATA[7]~137_pterm2_bus\,
	pterm3 => \DATA[7]~137_pterm3_bus\,
	pterm4 => \DATA[7]~137_pterm4_bus\,
	pterm5 => \DATA[7]~137_pterm5_bus\,
	pxor => \DATA[7]~137_pxor_bus\,
	pclk => \DATA[7]~137_pclk_bus\,
	papre => \DATA[7]~137_papre_bus\,
	paclr => \DATA[7]~137_paclr_bus\,
	pena => \DATA[7]~137_pena_bus\,
	dataout => \DATA[7]~137_dataout\);

-- Location: LC98
\SPI_MASTER|DataRxd[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[1]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[1]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[1]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[1]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[1]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[1]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[1]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[1]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[1]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[1]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[1]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(1));

-- Location: LC113
\IO_PORT|led_latch[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \IO_PORT|led_latch[1]_pterm0_bus\,
	pterm1 => \IO_PORT|led_latch[1]_pterm1_bus\,
	pterm2 => \IO_PORT|led_latch[1]_pterm2_bus\,
	pterm3 => \IO_PORT|led_latch[1]_pterm3_bus\,
	pterm4 => \IO_PORT|led_latch[1]_pterm4_bus\,
	pterm5 => \IO_PORT|led_latch[1]_pterm5_bus\,
	pxor => \IO_PORT|led_latch[1]_pxor_bus\,
	pclk => \IO_PORT|led_latch[1]_pclk_bus\,
	papre => \IO_PORT|led_latch[1]_papre_bus\,
	paclr => \IO_PORT|led_latch[1]_paclr_bus\,
	pena => \IO_PORT|led_latch[1]_pena_bus\,
	dataout => \IO_PORT|led_latch\(1));

-- Location: LC85
\DATA[1]~141\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[1]~141_pterm0_bus\,
	pterm1 => \DATA[1]~141_pterm1_bus\,
	pterm2 => \DATA[1]~141_pterm2_bus\,
	pterm3 => \DATA[1]~141_pterm3_bus\,
	pterm4 => \DATA[1]~141_pterm4_bus\,
	pterm5 => \DATA[1]~141_pterm5_bus\,
	pxor => \DATA[1]~141_pxor_bus\,
	pclk => \DATA[1]~141_pclk_bus\,
	papre => \DATA[1]~141_papre_bus\,
	paclr => \DATA[1]~141_paclr_bus\,
	pena => \DATA[1]~141_pena_bus\,
	dataout => \DATA[1]~141_dataout\);

-- Location: SEXP85
\DATA[2]~145\ : max_sexp
PORT MAP (
	datain => \DATA[2]~145_datain_bus\,
	dataout => \DATA[2]~145_dataout\);

-- Location: LC33
\I2C_PORT|sda_mon\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \I2C_PORT|sda_mon_pterm0_bus\,
	pterm1 => \I2C_PORT|sda_mon_pterm1_bus\,
	pterm2 => \I2C_PORT|sda_mon_pterm2_bus\,
	pterm3 => \I2C_PORT|sda_mon_pterm3_bus\,
	pterm4 => \I2C_PORT|sda_mon_pterm4_bus\,
	pterm5 => \I2C_PORT|sda_mon_pterm5_bus\,
	pxor => \I2C_PORT|sda_mon_pxor_bus\,
	pclk => \I2C_PORT|sda_mon_pclk_bus\,
	papre => \I2C_PORT|sda_mon_papre_bus\,
	paclr => \I2C_PORT|sda_mon_paclr_bus\,
	pena => \I2C_PORT|sda_mon_pena_bus\,
	dataout => \I2C_PORT|sda_mon~dataout\);

-- Location: SEXP83
\DATA[2]~146\ : max_sexp
PORT MAP (
	datain => \DATA[2]~146_datain_bus\,
	dataout => \DATA[2]~146_dataout\);

-- Location: SEXP87
\DATA[2]~142\ : max_sexp
PORT MAP (
	datain => \DATA[2]~142_datain_bus\,
	dataout => \DATA[2]~142_dataout\);

-- Location: SEXP91
\DATA[2]~143\ : max_sexp
PORT MAP (
	datain => \DATA[2]~143_datain_bus\,
	dataout => \DATA[2]~143_dataout\);

-- Location: LC86
\DATA[2]~151\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[2]~151_pterm0_bus\,
	pterm1 => \DATA[2]~151_pterm1_bus\,
	pterm2 => \DATA[2]~151_pterm2_bus\,
	pterm3 => \DATA[2]~151_pterm3_bus\,
	pterm4 => \DATA[2]~151_pterm4_bus\,
	pterm5 => \DATA[2]~151_pterm5_bus\,
	pxor => \DATA[2]~151_pxor_bus\,
	pclk => \DATA[2]~151_pclk_bus\,
	papre => \DATA[2]~151_papre_bus\,
	paclr => \DATA[2]~151_paclr_bus\,
	pena => \DATA[2]~151_pena_bus\,
	dataout => \DATA[2]~151_dataout\);

-- Location: LC103
\SPI_MASTER|DataRxd[3]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[3]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[3]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[3]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[3]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[3]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[3]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[3]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[3]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[3]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[3]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[3]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(3));

-- Location: LC36
\I2C_PORT|scl_mon\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \I2C_PORT|scl_mon_pterm0_bus\,
	pterm1 => \I2C_PORT|scl_mon_pterm1_bus\,
	pterm2 => \I2C_PORT|scl_mon_pterm2_bus\,
	pterm3 => \I2C_PORT|scl_mon_pterm3_bus\,
	pterm4 => \I2C_PORT|scl_mon_pterm4_bus\,
	pterm5 => \I2C_PORT|scl_mon_pterm5_bus\,
	pxor => \I2C_PORT|scl_mon_pxor_bus\,
	pclk => \I2C_PORT|scl_mon_pclk_bus\,
	papre => \I2C_PORT|scl_mon_papre_bus\,
	paclr => \I2C_PORT|scl_mon_paclr_bus\,
	pena => \I2C_PORT|scl_mon_pena_bus\,
	dataout => \I2C_PORT|scl_mon~dataout\);

-- Location: PIN_34
\CONF~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CONF,
	dataout => \CONF~dataout\);

-- Location: SEXP7
\SYS_PORT|process_0~4\ : max_sexp
PORT MAP (
	datain => \SYS_PORT|process_0~4_datain_bus\,
	dataout => \SYS_PORT|process_0~4_dataout\);

-- Location: LC16
\SYS_PORT|romp27_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \SYS_PORT|romp27_latch_pterm0_bus\,
	pterm1 => \SYS_PORT|romp27_latch_pterm1_bus\,
	pterm2 => \SYS_PORT|romp27_latch_pterm2_bus\,
	pterm3 => \SYS_PORT|romp27_latch_pterm3_bus\,
	pterm4 => \SYS_PORT|romp27_latch_pterm4_bus\,
	pterm5 => \SYS_PORT|romp27_latch_pterm5_bus\,
	pxor => \SYS_PORT|romp27_latch_pxor_bus\,
	pclk => \SYS_PORT|romp27_latch_pclk_bus\,
	papre => \SYS_PORT|romp27_latch_papre_bus\,
	paclr => \SYS_PORT|romp27_latch_paclr_bus\,
	pena => \SYS_PORT|romp27_latch_pena_bus\,
	dataout => \SYS_PORT|romp27_latch~dataout\);

-- Location: PIN_15
\PBTN~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_PBTN,
	dataout => \PBTN~dataout\);

-- Location: LC121
\IO_PORT|button_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \IO_PORT|button_latch_pterm0_bus\,
	pterm1 => \IO_PORT|button_latch_pterm1_bus\,
	pterm2 => \IO_PORT|button_latch_pterm2_bus\,
	pterm3 => \IO_PORT|button_latch_pterm3_bus\,
	pterm4 => \IO_PORT|button_latch_pterm4_bus\,
	pterm5 => \IO_PORT|button_latch_pterm5_bus\,
	pxor => \IO_PORT|button_latch_pxor_bus\,
	pclk => \IO_PORT|button_latch_pclk_bus\,
	papre => \IO_PORT|button_latch_papre_bus\,
	paclr => \IO_PORT|button_latch_paclr_bus\,
	pena => \IO_PORT|button_latch_pena_bus\,
	dataout => \IO_PORT|button_latch~dataout\);

-- Location: LC87
\DATA[3]~295\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[3]~295_pterm0_bus\,
	pterm1 => \DATA[3]~295_pterm1_bus\,
	pterm2 => \DATA[3]~295_pterm2_bus\,
	pterm3 => \DATA[3]~295_pterm3_bus\,
	pterm4 => \DATA[3]~295_pterm4_bus\,
	pterm5 => \DATA[3]~295_pterm5_bus\,
	pxor => \DATA[3]~295_pxor_bus\,
	pclk => \DATA[3]~295_pclk_bus\,
	papre => \DATA[3]~295_papre_bus\,
	paclr => \DATA[3]~295_paclr_bus\,
	pena => \DATA[3]~295_pena_bus\,
	pexpout => \DATA[3]~295_pexpout\);

-- Location: LC88
\DATA[3]~154\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[3]~295_pexpout\,
	pterm0 => \DATA[3]~154_pterm0_bus\,
	pterm1 => \DATA[3]~154_pterm1_bus\,
	pterm2 => \DATA[3]~154_pterm2_bus\,
	pterm3 => \DATA[3]~154_pterm3_bus\,
	pterm4 => \DATA[3]~154_pterm4_bus\,
	pterm5 => \DATA[3]~154_pterm5_bus\,
	pxor => \DATA[3]~154_pxor_bus\,
	pclk => \DATA[3]~154_pclk_bus\,
	papre => \DATA[3]~154_papre_bus\,
	paclr => \DATA[3]~154_paclr_bus\,
	pena => \DATA[3]~154_pena_bus\,
	dataout => \DATA[3]~154_dataout\);

-- Location: LC107
\SPI_MASTER|DataRxd[4]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[4]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[4]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[4]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[4]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[4]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[4]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[4]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[4]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[4]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[4]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[4]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(4));

-- Location: LC42
\SYS_PORT|config_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \SYS_PORT|config_latch_pterm0_bus\,
	pterm1 => \SYS_PORT|config_latch_pterm1_bus\,
	pterm2 => \SYS_PORT|config_latch_pterm2_bus\,
	pterm3 => \SYS_PORT|config_latch_pterm3_bus\,
	pterm4 => \SYS_PORT|config_latch_pterm4_bus\,
	pterm5 => \SYS_PORT|config_latch_pterm5_bus\,
	pxor => \SYS_PORT|config_latch_pxor_bus\,
	pclk => \SYS_PORT|config_latch_pclk_bus\,
	papre => \SYS_PORT|config_latch_papre_bus\,
	paclr => \SYS_PORT|config_latch_paclr_bus\,
	pena => \SYS_PORT|config_latch_pena_bus\,
	dataout => \SYS_PORT|config_latch~dataout\);

-- Location: LC24
\IO_PORT|sdcs_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \IO_PORT|sdcs_latch_pterm0_bus\,
	pterm1 => \IO_PORT|sdcs_latch_pterm1_bus\,
	pterm2 => \IO_PORT|sdcs_latch_pterm2_bus\,
	pterm3 => \IO_PORT|sdcs_latch_pterm3_bus\,
	pterm4 => \IO_PORT|sdcs_latch_pterm4_bus\,
	pterm5 => \IO_PORT|sdcs_latch_pterm5_bus\,
	pxor => \IO_PORT|sdcs_latch_pxor_bus\,
	pclk => \IO_PORT|sdcs_latch_pclk_bus\,
	papre => \IO_PORT|sdcs_latch_papre_bus\,
	paclr => \IO_PORT|sdcs_latch_paclr_bus\,
	pena => \IO_PORT|sdcs_latch_pena_bus\,
	dataout => \IO_PORT|sdcs_latch~dataout\);

-- Location: LC91
\DATA[4]~165\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[4]~165_pterm0_bus\,
	pterm1 => \DATA[4]~165_pterm1_bus\,
	pterm2 => \DATA[4]~165_pterm2_bus\,
	pterm3 => \DATA[4]~165_pterm3_bus\,
	pterm4 => \DATA[4]~165_pterm4_bus\,
	pterm5 => \DATA[4]~165_pterm5_bus\,
	pxor => \DATA[4]~165_pxor_bus\,
	pclk => \DATA[4]~165_pclk_bus\,
	papre => \DATA[4]~165_papre_bus\,
	paclr => \DATA[4]~165_paclr_bus\,
	pena => \DATA[4]~165_pena_bus\,
	dataout => \DATA[4]~165_dataout\);

-- Location: LC100
\SPI_MASTER|DataRxd[5]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[5]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[5]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[5]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[5]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[5]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[5]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[5]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[5]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[5]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[5]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[5]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(5));

-- Location: LC93
\DATA[5]~168\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[5]~168_pterm0_bus\,
	pterm1 => \DATA[5]~168_pterm1_bus\,
	pterm2 => \DATA[5]~168_pterm2_bus\,
	pterm3 => \DATA[5]~168_pterm3_bus\,
	pterm4 => \DATA[5]~168_pterm4_bus\,
	pterm5 => \DATA[5]~168_pterm5_bus\,
	pxor => \DATA[5]~168_pxor_bus\,
	pclk => \DATA[5]~168_pclk_bus\,
	papre => \DATA[5]~168_papre_bus\,
	paclr => \DATA[5]~168_paclr_bus\,
	pena => \DATA[5]~168_pena_bus\,
	dataout => \DATA[5]~168_dataout\);

-- Location: LC5
\I2C_PORT|sda_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \I2C_PORT|sda_latch_pterm0_bus\,
	pterm1 => \I2C_PORT|sda_latch_pterm1_bus\,
	pterm2 => \I2C_PORT|sda_latch_pterm2_bus\,
	pterm3 => \I2C_PORT|sda_latch_pterm3_bus\,
	pterm4 => \I2C_PORT|sda_latch_pterm4_bus\,
	pterm5 => \I2C_PORT|sda_latch_pterm5_bus\,
	pxor => \I2C_PORT|sda_latch_pxor_bus\,
	pclk => \I2C_PORT|sda_latch_pclk_bus\,
	papre => \I2C_PORT|sda_latch_papre_bus\,
	paclr => \I2C_PORT|sda_latch_paclr_bus\,
	pena => \I2C_PORT|sda_latch_pena_bus\,
	dataout => \I2C_PORT|sda_latch~dataout\);

-- Location: LC122
\DATA[6]~312\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[6]~312_pterm0_bus\,
	pterm1 => \DATA[6]~312_pterm1_bus\,
	pterm2 => \DATA[6]~312_pterm2_bus\,
	pterm3 => \DATA[6]~312_pterm3_bus\,
	pterm4 => \DATA[6]~312_pterm4_bus\,
	pterm5 => \DATA[6]~312_pterm5_bus\,
	pxor => \DATA[6]~312_pxor_bus\,
	pclk => \DATA[6]~312_pclk_bus\,
	papre => \DATA[6]~312_papre_bus\,
	paclr => \DATA[6]~312_paclr_bus\,
	pena => \DATA[6]~312_pena_bus\,
	pexpout => \DATA[6]~312_pexpout\);

-- Location: LC123
\DATA[6]~311\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[6]~312_pexpout\,
	pterm0 => \DATA[6]~311_pterm0_bus\,
	pterm1 => \DATA[6]~311_pterm1_bus\,
	pterm2 => \DATA[6]~311_pterm2_bus\,
	pterm3 => \DATA[6]~311_pterm3_bus\,
	pterm4 => \DATA[6]~311_pterm4_bus\,
	pterm5 => \DATA[6]~311_pterm5_bus\,
	pxor => \DATA[6]~311_pxor_bus\,
	pclk => \DATA[6]~311_pclk_bus\,
	papre => \DATA[6]~311_papre_bus\,
	paclr => \DATA[6]~311_paclr_bus\,
	pena => \DATA[6]~311_pena_bus\,
	pexpout => \DATA[6]~311_pexpout\);

-- Location: LC124
\DATA[6]~310\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[6]~311_pexpout\,
	pterm0 => \DATA[6]~310_pterm0_bus\,
	pterm1 => \DATA[6]~310_pterm1_bus\,
	pterm2 => \DATA[6]~310_pterm2_bus\,
	pterm3 => \DATA[6]~310_pterm3_bus\,
	pterm4 => \DATA[6]~310_pterm4_bus\,
	pterm5 => \DATA[6]~310_pterm5_bus\,
	pxor => \DATA[6]~310_pxor_bus\,
	pclk => \DATA[6]~310_pclk_bus\,
	papre => \DATA[6]~310_papre_bus\,
	paclr => \DATA[6]~310_paclr_bus\,
	pena => \DATA[6]~310_pena_bus\,
	pexpout => \DATA[6]~310_pexpout\);

-- Location: LC108
\SPI_MASTER|DataRxd[6]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[6]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[6]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[6]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[6]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[6]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[6]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[6]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[6]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[6]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[6]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[6]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(6));

-- Location: SEXP113
\DATA[6]~170\ : max_sexp
PORT MAP (
	datain => \DATA[6]~170_datain_bus\,
	dataout => \DATA[6]~170_dataout\);

-- Location: LC125
\DATA[6]~176\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[6]~310_pexpout\,
	pterm0 => \DATA[6]~176_pterm0_bus\,
	pterm1 => \DATA[6]~176_pterm1_bus\,
	pterm2 => \DATA[6]~176_pterm2_bus\,
	pterm3 => \DATA[6]~176_pterm3_bus\,
	pterm4 => \DATA[6]~176_pterm4_bus\,
	pterm5 => \DATA[6]~176_pterm5_bus\,
	pxor => \DATA[6]~176_pxor_bus\,
	pclk => \DATA[6]~176_pclk_bus\,
	papre => \DATA[6]~176_papre_bus\,
	paclr => \DATA[6]~176_paclr_bus\,
	pena => \DATA[6]~176_pena_bus\,
	dataout => \DATA[6]~176_dataout\);

-- Location: LC94
\DATA[6]~327\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[6]~327_pterm0_bus\,
	pterm1 => \DATA[6]~327_pterm1_bus\,
	pterm2 => \DATA[6]~327_pterm2_bus\,
	pterm3 => \DATA[6]~327_pterm3_bus\,
	pterm4 => \DATA[6]~327_pterm4_bus\,
	pterm5 => \DATA[6]~327_pterm5_bus\,
	pxor => \DATA[6]~327_pxor_bus\,
	pclk => \DATA[6]~327_pclk_bus\,
	papre => \DATA[6]~327_papre_bus\,
	paclr => \DATA[6]~327_paclr_bus\,
	pena => \DATA[6]~327_pena_bus\,
	dataout => \DATA[6]~327_dataout\);

-- Location: LC3
\I2C_PORT|scl_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \I2C_PORT|scl_latch_pterm0_bus\,
	pterm1 => \I2C_PORT|scl_latch_pterm1_bus\,
	pterm2 => \I2C_PORT|scl_latch_pterm2_bus\,
	pterm3 => \I2C_PORT|scl_latch_pterm3_bus\,
	pterm4 => \I2C_PORT|scl_latch_pterm4_bus\,
	pterm5 => \I2C_PORT|scl_latch_pterm5_bus\,
	pxor => \I2C_PORT|scl_latch_pxor_bus\,
	pclk => \I2C_PORT|scl_latch_pclk_bus\,
	papre => \I2C_PORT|scl_latch_papre_bus\,
	paclr => \I2C_PORT|scl_latch_paclr_bus\,
	pena => \I2C_PORT|scl_latch_pena_bus\,
	dataout => \I2C_PORT|scl_latch~dataout\);

-- Location: LC116
\DATA[7]~326\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~326_pterm0_bus\,
	pterm1 => \DATA[7]~326_pterm1_bus\,
	pterm2 => \DATA[7]~326_pterm2_bus\,
	pterm3 => \DATA[7]~326_pterm3_bus\,
	pterm4 => \DATA[7]~326_pterm4_bus\,
	pterm5 => \DATA[7]~326_pterm5_bus\,
	pxor => \DATA[7]~326_pxor_bus\,
	pclk => \DATA[7]~326_pclk_bus\,
	papre => \DATA[7]~326_papre_bus\,
	paclr => \DATA[7]~326_paclr_bus\,
	pena => \DATA[7]~326_pena_bus\,
	pexpout => \DATA[7]~326_pexpout\);

-- Location: LC117
\DATA[7]~325\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[7]~326_pexpout\,
	pterm0 => \DATA[7]~325_pterm0_bus\,
	pterm1 => \DATA[7]~325_pterm1_bus\,
	pterm2 => \DATA[7]~325_pterm2_bus\,
	pterm3 => \DATA[7]~325_pterm3_bus\,
	pterm4 => \DATA[7]~325_pterm4_bus\,
	pterm5 => \DATA[7]~325_pterm5_bus\,
	pxor => \DATA[7]~325_pxor_bus\,
	pclk => \DATA[7]~325_pclk_bus\,
	papre => \DATA[7]~325_papre_bus\,
	paclr => \DATA[7]~325_paclr_bus\,
	pena => \DATA[7]~325_pena_bus\,
	pexpout => \DATA[7]~325_pexpout\);

-- Location: LC118
\DATA[7]~324\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[7]~325_pexpout\,
	pterm0 => \DATA[7]~324_pterm0_bus\,
	pterm1 => \DATA[7]~324_pterm1_bus\,
	pterm2 => \DATA[7]~324_pterm2_bus\,
	pterm3 => \DATA[7]~324_pterm3_bus\,
	pterm4 => \DATA[7]~324_pterm4_bus\,
	pterm5 => \DATA[7]~324_pterm5_bus\,
	pxor => \DATA[7]~324_pxor_bus\,
	pclk => \DATA[7]~324_pclk_bus\,
	papre => \DATA[7]~324_papre_bus\,
	paclr => \DATA[7]~324_paclr_bus\,
	pena => \DATA[7]~324_pena_bus\,
	pexpout => \DATA[7]~324_pexpout\);

-- Location: LC109
\SPI_MASTER|DataRxd[7]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|DataRxd[7]_pterm0_bus\,
	pterm1 => \SPI_MASTER|DataRxd[7]_pterm1_bus\,
	pterm2 => \SPI_MASTER|DataRxd[7]_pterm2_bus\,
	pterm3 => \SPI_MASTER|DataRxd[7]_pterm3_bus\,
	pterm4 => \SPI_MASTER|DataRxd[7]_pterm4_bus\,
	pterm5 => \SPI_MASTER|DataRxd[7]_pterm5_bus\,
	pxor => \SPI_MASTER|DataRxd[7]_pxor_bus\,
	pclk => \SPI_MASTER|DataRxd[7]_pclk_bus\,
	papre => \SPI_MASTER|DataRxd[7]_papre_bus\,
	paclr => \SPI_MASTER|DataRxd[7]_paclr_bus\,
	pena => \SPI_MASTER|DataRxd[7]_pena_bus\,
	dataout => \SPI_MASTER|DataRxd\(7));

-- Location: PIN_17
\SDSW~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SDSW,
	dataout => \SDSW~dataout\);

-- Location: LC127
\IO_PORT|switch_latch\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	pterm0 => \IO_PORT|switch_latch_pterm0_bus\,
	pterm1 => \IO_PORT|switch_latch_pterm1_bus\,
	pterm2 => \IO_PORT|switch_latch_pterm2_bus\,
	pterm3 => \IO_PORT|switch_latch_pterm3_bus\,
	pterm4 => \IO_PORT|switch_latch_pterm4_bus\,
	pterm5 => \IO_PORT|switch_latch_pterm5_bus\,
	pxor => \IO_PORT|switch_latch_pxor_bus\,
	pclk => \IO_PORT|switch_latch_pclk_bus\,
	papre => \IO_PORT|switch_latch_papre_bus\,
	paclr => \IO_PORT|switch_latch_paclr_bus\,
	pena => \IO_PORT|switch_latch_pena_bus\,
	dataout => \IO_PORT|switch_latch~dataout\);

-- Location: LC119
\DATA[7]~184\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \DATA[7]~324_pexpout\,
	pterm0 => \DATA[7]~184_pterm0_bus\,
	pterm1 => \DATA[7]~184_pterm1_bus\,
	pterm2 => \DATA[7]~184_pterm2_bus\,
	pterm3 => \DATA[7]~184_pterm3_bus\,
	pterm4 => \DATA[7]~184_pterm4_bus\,
	pterm5 => \DATA[7]~184_pterm5_bus\,
	pxor => \DATA[7]~184_pxor_bus\,
	pclk => \DATA[7]~184_pclk_bus\,
	papre => \DATA[7]~184_papre_bus\,
	paclr => \DATA[7]~184_paclr_bus\,
	pena => \DATA[7]~184_pena_bus\,
	dataout => \DATA[7]~184_dataout\);

-- Location: LC97
\DATA[7]~328\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~328_pterm0_bus\,
	pterm1 => \DATA[7]~328_pterm1_bus\,
	pterm2 => \DATA[7]~328_pterm2_bus\,
	pterm3 => \DATA[7]~328_pterm3_bus\,
	pterm4 => \DATA[7]~328_pterm4_bus\,
	pterm5 => \DATA[7]~328_pterm5_bus\,
	pxor => \DATA[7]~328_pxor_bus\,
	pclk => \DATA[7]~328_pclk_bus\,
	papre => \DATA[7]~328_papre_bus\,
	paclr => \DATA[7]~328_paclr_bus\,
	pena => \DATA[7]~328_pena_bus\,
	dataout => \DATA[7]~328_dataout\);

-- Location: LC64
\~VCC~0\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \~VCC~0_pterm0_bus\,
	pterm1 => \~VCC~0_pterm1_bus\,
	pterm2 => \~VCC~0_pterm2_bus\,
	pterm3 => \~VCC~0_pterm3_bus\,
	pterm4 => \~VCC~0_pterm4_bus\,
	pterm5 => \~VCC~0_pterm5_bus\,
	pxor => \~VCC~0_pxor_bus\,
	pclk => \~VCC~0_pclk_bus\,
	papre => \~VCC~0_papre_bus\,
	paclr => \~VCC~0_paclr_bus\,
	pena => \~VCC~0_pena_bus\,
	dataout => \~VCC~0~dataout\);

-- Location: LC13
\SDDI~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \SDDI~1_pterm0_bus\,
	pterm1 => \SDDI~1_pterm1_bus\,
	pterm2 => \SDDI~1_pterm2_bus\,
	pterm3 => \SDDI~1_pterm3_bus\,
	pterm4 => \SDDI~1_pterm4_bus\,
	pterm5 => \SDDI~1_pterm5_bus\,
	pxor => \SDDI~1_pxor_bus\,
	pclk => \SDDI~1_pclk_bus\,
	papre => \SDDI~1_papre_bus\,
	paclr => \SDDI~1_paclr_bus\,
	pena => \SDDI~1_pena_bus\,
	dataout => \SDDI~1_dataout\);

-- Location: LC56
\ADDR_DECODE|region1~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|region1~1_pterm0_bus\,
	pterm1 => \ADDR_DECODE|region1~1_pterm1_bus\,
	pterm2 => \ADDR_DECODE|region1~1_pterm2_bus\,
	pterm3 => \ADDR_DECODE|region1~1_pterm3_bus\,
	pterm4 => \ADDR_DECODE|region1~1_pterm4_bus\,
	pterm5 => \ADDR_DECODE|region1~1_pterm5_bus\,
	pxor => \ADDR_DECODE|region1~1_pxor_bus\,
	pclk => \ADDR_DECODE|region1~1_pclk_bus\,
	papre => \ADDR_DECODE|region1~1_papre_bus\,
	paclr => \ADDR_DECODE|region1~1_paclr_bus\,
	pena => \ADDR_DECODE|region1~1_pena_bus\,
	dataout => \ADDR_DECODE|region1~1_dataout\);

-- Location: LC128
\rd_n~2\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \rd_n~2_pterm0_bus\,
	pterm1 => \rd_n~2_pterm1_bus\,
	pterm2 => \rd_n~2_pterm2_bus\,
	pterm3 => \rd_n~2_pterm3_bus\,
	pterm4 => \rd_n~2_pterm4_bus\,
	pterm5 => \rd_n~2_pterm5_bus\,
	pxor => \rd_n~2_pxor_bus\,
	pclk => \rd_n~2_pclk_bus\,
	papre => \rd_n~2_papre_bus\,
	paclr => \rd_n~2_paclr_bus\,
	pena => \rd_n~2_pena_bus\,
	dataout => \rd_n~2_dataout\);

-- Location: LC67
\wr_n~5\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \wr_n~5_pterm0_bus\,
	pterm1 => \wr_n~5_pterm1_bus\,
	pterm2 => \wr_n~5_pterm2_bus\,
	pterm3 => \wr_n~5_pterm3_bus\,
	pterm4 => \wr_n~5_pterm4_bus\,
	pterm5 => \wr_n~5_pterm5_bus\,
	pxor => \wr_n~5_pxor_bus\,
	pclk => \wr_n~5_pclk_bus\,
	papre => \wr_n~5_papre_bus\,
	paclr => \wr_n~5_paclr_bus\,
	pena => \wr_n~5_pena_bus\,
	dataout => \wr_n~5_dataout\);

-- Location: LC126
\wr_n~8\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \wr_n~8_pterm0_bus\,
	pterm1 => \wr_n~8_pterm1_bus\,
	pterm2 => \wr_n~8_pterm2_bus\,
	pterm3 => \wr_n~8_pterm3_bus\,
	pterm4 => \wr_n~8_pterm4_bus\,
	pterm5 => \wr_n~8_pterm5_bus\,
	pxor => \wr_n~8_pxor_bus\,
	pclk => \wr_n~8_pclk_bus\,
	papre => \wr_n~8_papre_bus\,
	paclr => \wr_n~8_paclr_bus\,
	pena => \wr_n~8_pena_bus\,
	dataout => \wr_n~8_dataout\);

-- Location: PIN_83
\WOSC~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_WOSC,
	dataout => \WOSC~dataout\);

-- Location: LC74
\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "reg",
	pexp_mode => "on",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \WOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm0_bus\,
	pterm1 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm1_bus\,
	pterm2 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm2_bus\,
	pterm3 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm3_bus\,
	pterm4 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm4_bus\,
	pterm5 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pterm5_bus\,
	pxor => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pxor_bus\,
	pclk => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pclk_bus\,
	papre => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_papre_bus\,
	paclr => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_paclr_bus\,
	pena => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[0]_pena_bus\,
	dataout => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(0));

-- Location: LC69
\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \WOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm0_bus\,
	pterm1 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm1_bus\,
	pterm2 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm2_bus\,
	pterm3 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm3_bus\,
	pterm4 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm4_bus\,
	pterm5 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pterm5_bus\,
	pxor => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pxor_bus\,
	pclk => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pclk_bus\,
	papre => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_papre_bus\,
	paclr => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_paclr_bus\,
	pena => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[1]_pena_bus\,
	dataout => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(1));

-- Location: LC72
\BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \WOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm0_bus\,
	pterm1 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm1_bus\,
	pterm2 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm2_bus\,
	pterm3 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm3_bus\,
	pterm4 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm4_bus\,
	pterm5 => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pterm5_bus\,
	pxor => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pxor_bus\,
	pclk => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pclk_bus\,
	papre => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_papre_bus\,
	paclr => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_paclr_bus\,
	pena => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs[2]_pena_bus\,
	dataout => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(2));

-- Location: LC49
\ADDR_DECODE|scccs~5\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|scccs~5_pterm0_bus\,
	pterm1 => \ADDR_DECODE|scccs~5_pterm1_bus\,
	pterm2 => \ADDR_DECODE|scccs~5_pterm2_bus\,
	pterm3 => \ADDR_DECODE|scccs~5_pterm3_bus\,
	pterm4 => \ADDR_DECODE|scccs~5_pterm4_bus\,
	pterm5 => \ADDR_DECODE|scccs~5_pterm5_bus\,
	pxor => \ADDR_DECODE|scccs~5_pxor_bus\,
	pclk => \ADDR_DECODE|scccs~5_pclk_bus\,
	papre => \ADDR_DECODE|scccs~5_papre_bus\,
	paclr => \ADDR_DECODE|scccs~5_paclr_bus\,
	pena => \ADDR_DECODE|scccs~5_pena_bus\,
	dataout => \ADDR_DECODE|scccs~5_dataout\);

-- Location: LC51
\ADDR_DECODE|ciocs~4\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|ciocs~4_pterm0_bus\,
	pterm1 => \ADDR_DECODE|ciocs~4_pterm1_bus\,
	pterm2 => \ADDR_DECODE|ciocs~4_pterm2_bus\,
	pterm3 => \ADDR_DECODE|ciocs~4_pterm3_bus\,
	pterm4 => \ADDR_DECODE|ciocs~4_pterm4_bus\,
	pterm5 => \ADDR_DECODE|ciocs~4_pterm5_bus\,
	pxor => \ADDR_DECODE|ciocs~4_pxor_bus\,
	pclk => \ADDR_DECODE|ciocs~4_pclk_bus\,
	papre => \ADDR_DECODE|ciocs~4_papre_bus\,
	paclr => \ADDR_DECODE|ciocs~4_paclr_bus\,
	pena => \ADDR_DECODE|ciocs~4_pena_bus\,
	dataout => \ADDR_DECODE|ciocs~4_dataout\);

-- Location: LC11
\IO_PORT|sdcs_latch~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \IO_PORT|sdcs_latch~1_pterm0_bus\,
	pterm1 => \IO_PORT|sdcs_latch~1_pterm1_bus\,
	pterm2 => \IO_PORT|sdcs_latch~1_pterm2_bus\,
	pterm3 => \IO_PORT|sdcs_latch~1_pterm3_bus\,
	pterm4 => \IO_PORT|sdcs_latch~1_pterm4_bus\,
	pterm5 => \IO_PORT|sdcs_latch~1_pterm5_bus\,
	pxor => \IO_PORT|sdcs_latch~1_pxor_bus\,
	pclk => \IO_PORT|sdcs_latch~1_pclk_bus\,
	papre => \IO_PORT|sdcs_latch~1_papre_bus\,
	paclr => \IO_PORT|sdcs_latch~1_paclr_bus\,
	pena => \IO_PORT|sdcs_latch~1_pena_bus\,
	dataout => \IO_PORT|sdcs_latch~1_dataout\);

-- Location: LC40
\LED~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \LED~3_pterm0_bus\,
	pterm1 => \LED~3_pterm1_bus\,
	pterm2 => \LED~3_pterm2_bus\,
	pterm3 => \LED~3_pterm3_bus\,
	pterm4 => \LED~3_pterm4_bus\,
	pterm5 => \LED~3_pterm5_bus\,
	pxor => \LED~3_pxor_bus\,
	pclk => \LED~3_pclk_bus\,
	papre => \LED~3_papre_bus\,
	paclr => \LED~3_paclr_bus\,
	pena => \LED~3_pena_bus\,
	dataout => \LED~3_dataout\);

-- Location: LC38
\LED~6\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \LED~6_pterm0_bus\,
	pterm1 => \LED~6_pterm1_bus\,
	pterm2 => \LED~6_pterm2_bus\,
	pterm3 => \LED~6_pterm3_bus\,
	pterm4 => \LED~6_pterm4_bus\,
	pterm5 => \LED~6_pterm5_bus\,
	pxor => \LED~6_pxor_bus\,
	pclk => \LED~6_pclk_bus\,
	papre => \LED~6_papre_bus\,
	paclr => \LED~6_paclr_bus\,
	pena => \LED~6_pena_bus\,
	dataout => \LED~6_dataout\);

-- Location: LC43
\LED~9\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \LED~9_pterm0_bus\,
	pterm1 => \LED~9_pterm1_bus\,
	pterm2 => \LED~9_pterm2_bus\,
	pterm3 => \LED~9_pterm3_bus\,
	pterm4 => \LED~9_pterm4_bus\,
	pterm5 => \LED~9_pterm5_bus\,
	pxor => \LED~9_pxor_bus\,
	pclk => \LED~9_pclk_bus\,
	papre => \LED~9_papre_bus\,
	paclr => \LED~9_paclr_bus\,
	pena => \LED~9_pena_bus\,
	dataout => \LED~9_dataout\);

-- Location: LC21
\SPI_MASTER|SCLK\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SPI_MASTER|SCLK_pterm0_bus\,
	pterm1 => \SPI_MASTER|SCLK_pterm1_bus\,
	pterm2 => \SPI_MASTER|SCLK_pterm2_bus\,
	pterm3 => \SPI_MASTER|SCLK_pterm3_bus\,
	pterm4 => \SPI_MASTER|SCLK_pterm4_bus\,
	pterm5 => \SPI_MASTER|SCLK_pterm5_bus\,
	pxor => \SPI_MASTER|SCLK_pxor_bus\,
	pclk => \SPI_MASTER|SCLK_pclk_bus\,
	papre => \SPI_MASTER|SCLK_papre_bus\,
	paclr => \SPI_MASTER|SCLK_paclr_bus\,
	pena => \SPI_MASTER|SCLK_pena_bus\,
	dataout => \SPI_MASTER|SCLK~dataout\);

-- Location: LC8
\SPI_MASTER|SCLK~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|SCLK~1_pterm0_bus\,
	pterm1 => \SPI_MASTER|SCLK~1_pterm1_bus\,
	pterm2 => \SPI_MASTER|SCLK~1_pterm2_bus\,
	pterm3 => \SPI_MASTER|SCLK~1_pterm3_bus\,
	pterm4 => \SPI_MASTER|SCLK~1_pterm4_bus\,
	pterm5 => \SPI_MASTER|SCLK~1_pterm5_bus\,
	pxor => \SPI_MASTER|SCLK~1_pxor_bus\,
	pclk => \SPI_MASTER|SCLK~1_pclk_bus\,
	papre => \SPI_MASTER|SCLK~1_papre_bus\,
	paclr => \SPI_MASTER|SCLK~1_paclr_bus\,
	pena => \SPI_MASTER|SCLK~1_pena_bus\,
	dataout => \SPI_MASTER|SCLK~1_dataout\);

-- Location: LC53
\ADDR_DECODE|romcs~11\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|romcs~11_pterm0_bus\,
	pterm1 => \ADDR_DECODE|romcs~11_pterm1_bus\,
	pterm2 => \ADDR_DECODE|romcs~11_pterm2_bus\,
	pterm3 => \ADDR_DECODE|romcs~11_pterm3_bus\,
	pterm4 => \ADDR_DECODE|romcs~11_pterm4_bus\,
	pterm5 => \ADDR_DECODE|romcs~11_pterm5_bus\,
	pxor => \ADDR_DECODE|romcs~11_pxor_bus\,
	pclk => \ADDR_DECODE|romcs~11_pclk_bus\,
	papre => \ADDR_DECODE|romcs~11_papre_bus\,
	paclr => \ADDR_DECODE|romcs~11_paclr_bus\,
	pena => \ADDR_DECODE|romcs~11_pena_bus\,
	dataout => \ADDR_DECODE|romcs~11_dataout\);

-- Location: SEXP49
\ADDR_DECODE|ram2cs~9\ : max_sexp
PORT MAP (
	datain => \ADDR_DECODE|ram2cs~9_datain_bus\,
	dataout => \ADDR_DECODE|ram2cs~9_dataout\);

-- Location: SEXP51
\ADDR_DECODE|ram2cs~8\ : max_sexp
PORT MAP (
	datain => \ADDR_DECODE|ram2cs~8_datain_bus\,
	dataout => \ADDR_DECODE|ram2cs~8_dataout\);

-- Location: LC57
\ADDR_DECODE|ram2cs~15\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|ram2cs~15_pterm0_bus\,
	pterm1 => \ADDR_DECODE|ram2cs~15_pterm1_bus\,
	pterm2 => \ADDR_DECODE|ram2cs~15_pterm2_bus\,
	pterm3 => \ADDR_DECODE|ram2cs~15_pterm3_bus\,
	pterm4 => \ADDR_DECODE|ram2cs~15_pterm4_bus\,
	pterm5 => \ADDR_DECODE|ram2cs~15_pterm5_bus\,
	pxor => \ADDR_DECODE|ram2cs~15_pxor_bus\,
	pclk => \ADDR_DECODE|ram2cs~15_pclk_bus\,
	papre => \ADDR_DECODE|ram2cs~15_papre_bus\,
	paclr => \ADDR_DECODE|ram2cs~15_paclr_bus\,
	pena => \ADDR_DECODE|ram2cs~15_pena_bus\,
	dataout => \ADDR_DECODE|ram2cs~15_dataout\);

-- Location: LC17
\SPI_MASTER|MOSI_v~13\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|MOSI_v~13_pterm0_bus\,
	pterm1 => \SPI_MASTER|MOSI_v~13_pterm1_bus\,
	pterm2 => \SPI_MASTER|MOSI_v~13_pterm2_bus\,
	pterm3 => \SPI_MASTER|MOSI_v~13_pterm3_bus\,
	pterm4 => \SPI_MASTER|MOSI_v~13_pterm4_bus\,
	pterm5 => \SPI_MASTER|MOSI_v~13_pterm5_bus\,
	pxor => \SPI_MASTER|MOSI_v~13_pxor_bus\,
	pclk => \SPI_MASTER|MOSI_v~13_pclk_bus\,
	papre => \SPI_MASTER|MOSI_v~13_papre_bus\,
	paclr => \SPI_MASTER|MOSI_v~13_paclr_bus\,
	pena => \SPI_MASTER|MOSI_v~13_pena_bus\,
	pexpout => \SPI_MASTER|MOSI_v~13_pexpout\);

-- Location: SEXP17
\SPI_MASTER|MOSI_v~4\ : max_sexp
PORT MAP (
	datain => \SPI_MASTER|MOSI_v~4_datain_bus\,
	dataout => \SPI_MASTER|MOSI_v~4_dataout\);

-- Location: LC55
\SD_PORT|d_latch[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[0]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[0]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[0]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[0]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[0]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[0]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[0]_pxor_bus\,
	pclk => \SD_PORT|d_latch[0]_pclk_bus\,
	papre => \SD_PORT|d_latch[0]_papre_bus\,
	paclr => \SD_PORT|d_latch[0]_paclr_bus\,
	pena => \SD_PORT|d_latch[0]_pena_bus\,
	dataout => \SD_PORT|d_latch\(0));

-- Location: LC61
\SD_PORT|d_latch[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[1]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[1]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[1]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[1]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[1]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[1]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[1]_pxor_bus\,
	pclk => \SD_PORT|d_latch[1]_pclk_bus\,
	papre => \SD_PORT|d_latch[1]_papre_bus\,
	paclr => \SD_PORT|d_latch[1]_paclr_bus\,
	pena => \SD_PORT|d_latch[1]_pena_bus\,
	dataout => \SD_PORT|d_latch\(1));

-- Location: LC10
\SD_PORT|d_latch[3]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[3]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[3]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[3]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[3]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[3]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[3]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[3]_pxor_bus\,
	pclk => \SD_PORT|d_latch[3]_pclk_bus\,
	papre => \SD_PORT|d_latch[3]_papre_bus\,
	paclr => \SD_PORT|d_latch[3]_paclr_bus\,
	pena => \SD_PORT|d_latch[3]_pena_bus\,
	dataout => \SD_PORT|d_latch\(3));

-- Location: LC54
\SD_PORT|d_latch[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[2]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[2]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[2]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[2]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[2]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[2]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[2]_pxor_bus\,
	pclk => \SD_PORT|d_latch[2]_pclk_bus\,
	papre => \SD_PORT|d_latch[2]_papre_bus\,
	paclr => \SD_PORT|d_latch[2]_paclr_bus\,
	pena => \SD_PORT|d_latch[2]_pena_bus\,
	dataout => \SD_PORT|d_latch\(2));

-- Location: LC18
\SPI_MASTER|MOSI_v~15\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \SPI_MASTER|MOSI_v~13_pexpout\,
	pterm0 => \SPI_MASTER|MOSI_v~15_pterm0_bus\,
	pterm1 => \SPI_MASTER|MOSI_v~15_pterm1_bus\,
	pterm2 => \SPI_MASTER|MOSI_v~15_pterm2_bus\,
	pterm3 => \SPI_MASTER|MOSI_v~15_pterm3_bus\,
	pterm4 => \SPI_MASTER|MOSI_v~15_pterm4_bus\,
	pterm5 => \SPI_MASTER|MOSI_v~15_pterm5_bus\,
	pxor => \SPI_MASTER|MOSI_v~15_pxor_bus\,
	pclk => \SPI_MASTER|MOSI_v~15_pclk_bus\,
	papre => \SPI_MASTER|MOSI_v~15_papre_bus\,
	paclr => \SPI_MASTER|MOSI_v~15_paclr_bus\,
	pena => \SPI_MASTER|MOSI_v~15_pena_bus\,
	pexpout => \SPI_MASTER|MOSI_v~15_pexpout\);

-- Location: LC41
\SD_PORT|d_latch[4]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[4]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[4]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[4]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[4]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[4]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[4]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[4]_pxor_bus\,
	pclk => \SD_PORT|d_latch[4]_pclk_bus\,
	papre => \SD_PORT|d_latch[4]_papre_bus\,
	paclr => \SD_PORT|d_latch[4]_paclr_bus\,
	pena => \SD_PORT|d_latch[4]_pena_bus\,
	dataout => \SD_PORT|d_latch\(4));

-- Location: LC9
\SD_PORT|d_latch[5]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[5]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[5]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[5]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[5]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[5]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[5]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[5]_pxor_bus\,
	pclk => \SD_PORT|d_latch[5]_pclk_bus\,
	papre => \SD_PORT|d_latch[5]_papre_bus\,
	paclr => \SD_PORT|d_latch[5]_paclr_bus\,
	pena => \SD_PORT|d_latch[5]_pena_bus\,
	dataout => \SD_PORT|d_latch\(5));

-- Location: LC7
\SD_PORT|d_latch[7]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[7]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[7]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[7]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[7]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[7]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[7]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[7]_pxor_bus\,
	pclk => \SD_PORT|d_latch[7]_pclk_bus\,
	papre => \SD_PORT|d_latch[7]_papre_bus\,
	paclr => \SD_PORT|d_latch[7]_paclr_bus\,
	pena => \SD_PORT|d_latch[7]_pena_bus\,
	dataout => \SD_PORT|d_latch\(7));

-- Location: LC15
\SD_PORT|d_latch[6]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	clk => \XOSC~dataout\,
	aclr => \ALT_INV_RESET~dataout\,
	pterm0 => \SD_PORT|d_latch[6]_pterm0_bus\,
	pterm1 => \SD_PORT|d_latch[6]_pterm1_bus\,
	pterm2 => \SD_PORT|d_latch[6]_pterm2_bus\,
	pterm3 => \SD_PORT|d_latch[6]_pterm3_bus\,
	pterm4 => \SD_PORT|d_latch[6]_pterm4_bus\,
	pterm5 => \SD_PORT|d_latch[6]_pterm5_bus\,
	pxor => \SD_PORT|d_latch[6]_pxor_bus\,
	pclk => \SD_PORT|d_latch[6]_pclk_bus\,
	papre => \SD_PORT|d_latch[6]_papre_bus\,
	paclr => \SD_PORT|d_latch[6]_paclr_bus\,
	pena => \SD_PORT|d_latch[6]_pena_bus\,
	dataout => \SD_PORT|d_latch\(6));

-- Location: LC19
\SPI_MASTER|MOSI_v\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	aclr => \ALT_INV_RESET~dataout\,
	pexpin => \SPI_MASTER|MOSI_v~15_pexpout\,
	pterm0 => \SPI_MASTER|MOSI_v_pterm0_bus\,
	pterm1 => \SPI_MASTER|MOSI_v_pterm1_bus\,
	pterm2 => \SPI_MASTER|MOSI_v_pterm2_bus\,
	pterm3 => \SPI_MASTER|MOSI_v_pterm3_bus\,
	pterm4 => \SPI_MASTER|MOSI_v_pterm4_bus\,
	pterm5 => \SPI_MASTER|MOSI_v_pterm5_bus\,
	pxor => \SPI_MASTER|MOSI_v_pxor_bus\,
	pclk => \SPI_MASTER|MOSI_v_pclk_bus\,
	papre => \SPI_MASTER|MOSI_v_papre_bus\,
	paclr => \SPI_MASTER|MOSI_v_paclr_bus\,
	pena => \SPI_MASTER|MOSI_v_pena_bus\,
	dataout => \SPI_MASTER|MOSI_v~dataout\);

-- Location: LC73
\CPU_CLOCK|q_out~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \CPU_CLOCK|q_out~3_pterm0_bus\,
	pterm1 => \CPU_CLOCK|q_out~3_pterm1_bus\,
	pterm2 => \CPU_CLOCK|q_out~3_pterm2_bus\,
	pterm3 => \CPU_CLOCK|q_out~3_pterm3_bus\,
	pterm4 => \CPU_CLOCK|q_out~3_pterm4_bus\,
	pterm5 => \CPU_CLOCK|q_out~3_pterm5_bus\,
	pxor => \CPU_CLOCK|q_out~3_pxor_bus\,
	pclk => \CPU_CLOCK|q_out~3_pclk_bus\,
	papre => \CPU_CLOCK|q_out~3_papre_bus\,
	paclr => \CPU_CLOCK|q_out~3_paclr_bus\,
	pena => \CPU_CLOCK|q_out~3_pena_bus\,
	dataout => \CPU_CLOCK|q_out~3_dataout\);

-- Location: LC75
\CPU_CLOCK|e_out~7\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \CPU_CLOCK|e_out~7_pterm0_bus\,
	pterm1 => \CPU_CLOCK|e_out~7_pterm1_bus\,
	pterm2 => \CPU_CLOCK|e_out~7_pterm2_bus\,
	pterm3 => \CPU_CLOCK|e_out~7_pterm3_bus\,
	pterm4 => \CPU_CLOCK|e_out~7_pterm4_bus\,
	pterm5 => \CPU_CLOCK|e_out~7_pterm5_bus\,
	pxor => \CPU_CLOCK|e_out~7_pxor_bus\,
	pclk => \CPU_CLOCK|e_out~7_pclk_bus\,
	papre => \CPU_CLOCK|e_out~7_papre_bus\,
	paclr => \CPU_CLOCK|e_out~7_paclr_bus\,
	pena => \CPU_CLOCK|e_out~7_pena_bus\,
	dataout => \CPU_CLOCK|e_out~7_dataout\);

-- Location: LC14
\SPI_MASTER|MOSI_v~11\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|MOSI_v~11_pterm0_bus\,
	pterm1 => \SPI_MASTER|MOSI_v~11_pterm1_bus\,
	pterm2 => \SPI_MASTER|MOSI_v~11_pterm2_bus\,
	pterm3 => \SPI_MASTER|MOSI_v~11_pterm3_bus\,
	pterm4 => \SPI_MASTER|MOSI_v~11_pterm4_bus\,
	pterm5 => \SPI_MASTER|MOSI_v~11_pterm5_bus\,
	pxor => \SPI_MASTER|MOSI_v~11_pxor_bus\,
	pclk => \SPI_MASTER|MOSI_v~11_pclk_bus\,
	papre => \SPI_MASTER|MOSI_v~11_papre_bus\,
	paclr => \SPI_MASTER|MOSI_v~11_paclr_bus\,
	pena => \SPI_MASTER|MOSI_v~11_pena_bus\,
	dataout => \SPI_MASTER|MOSI_v~11_dataout\);

-- Location: LC65
\z_wr_n~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \z_wr_n~3_pterm0_bus\,
	pterm1 => \z_wr_n~3_pterm1_bus\,
	pterm2 => \z_wr_n~3_pterm2_bus\,
	pterm3 => \z_wr_n~3_pterm3_bus\,
	pterm4 => \z_wr_n~3_pterm4_bus\,
	pterm5 => \z_wr_n~3_pterm5_bus\,
	pxor => \z_wr_n~3_pxor_bus\,
	pclk => \z_wr_n~3_pclk_bus\,
	papre => \z_wr_n~3_papre_bus\,
	paclr => \z_wr_n~3_paclr_bus\,
	pena => \z_wr_n~3_pena_bus\,
	dataout => \z_wr_n~3_dataout\);

-- Location: PIN_35
\LIC~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_LIC);

-- Location: PIN_33
\SPARE~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \~VCC~0~dataout\,
	oe => VCC,
	padio => ww_SPARE);

-- Location: PIN_6
\TP12~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \SDDI~1_dataout\,
	oe => VCC,
	padio => ww_TP12);

-- Location: PIN_37
\RAM1CS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|region1~1_dataout\,
	oe => VCC,
	padio => ww_RAM1CS);

-- Location: PIN_81
\RD~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \rd_n~2_dataout\,
	oe => VCC,
	padio => ww_RD);

-- Location: PIN_45
\ZRD~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \wr_n~5_dataout\,
	oe => VCC,
	padio => ww_ZRD);

-- Location: PIN_80
\WR~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \wr_n~8_dataout\,
	oe => VCC,
	padio => ww_WR);

-- Location: PIN_46
\BCLK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(1),
	oe => VCC,
	padio => ww_BCLK);

-- Location: PIN_48
\ACLK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \BAUD_CLOCK|counter|LPM_COUNTER_component|dffs\(2),
	oe => VCC,
	padio => ww_ACLK);

-- Location: PIN_41
\SCCCS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|scccs~5_dataout\,
	oe => VCC,
	padio => ww_SCCCS);

-- Location: PIN_40
\CIOCS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|ciocs~4_dataout\,
	oe => VCC,
	padio => ww_CIOCS);

-- Location: PIN_18
\SDCS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \IO_PORT|sdcs_latch~dataout\,
	oe => VCC,
	padio => ww_SDCS);

-- Location: PIN_8
\TP13~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \IO_PORT|sdcs_latch~1_dataout\,
	oe => VCC,
	padio => ww_TP13);

-- Location: PIN_28
\LED[0]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \LED~3_dataout\,
	oe => VCC,
	padio => ww_LED(0));

-- Location: PIN_29
\LED[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \LED~6_dataout\,
	oe => VCC,
	padio => ww_LED(1));

-- Location: PIN_27
\LED[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \LED~9_dataout\,
	oe => VCC,
	padio => ww_LED(2));

-- Location: PIN_20
\SDCK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \SPI_MASTER|SCLK~dataout\,
	oe => VCC,
	padio => ww_SDCK);

-- Location: PIN_9
\TP14~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \SPI_MASTER|SCLK~1_dataout\,
	oe => VCC,
	padio => ww_TP14);

-- Location: PIN_4
\ROMP27~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \SYS_PORT|romp27_latch~dataout\,
	oe => VCC,
	padio => ww_ROMP27);

-- Location: PIN_39
\ROMCS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|romcs~11_dataout\,
	oe => VCC,
	padio => ww_ROMCS);

-- Location: PIN_36
\RAM2CS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|ram2cs~15_dataout\,
	oe => VCC,
	padio => ww_RAM2CS);

-- Location: PIN_21
\SDDO~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \SPI_MASTER|MOSI_v~dataout\,
	oe => VCC,
	padio => ww_SDDO);

-- Location: PIN_49
\QCLK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \CPU_CLOCK|q_out~3_dataout\,
	oe => VCC,
	padio => ww_QCLK);

-- Location: PIN_50
\ECLK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \CPU_CLOCK|e_out~7_dataout\,
	oe => VCC,
	padio => ww_ECLK);

-- Location: PIN_5
\TP11~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \SPI_MASTER|MOSI_v~11_dataout\,
	oe => VCC,
	padio => ww_TP11);

-- Location: PIN_44
\ZWR~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \z_wr_n~3_dataout\,
	oe => VCC,
	padio => ww_ZWR);
END structure;


