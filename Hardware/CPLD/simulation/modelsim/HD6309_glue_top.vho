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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "03/12/2014 17:35:40"

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
	RTCCS : OUT std_logic;
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
-- TP11	=>  Location: PIN_5
-- TP12	=>  Location: PIN_6
-- RD	=>  Location: PIN_81
-- ZRD	=>  Location: PIN_45
-- SPARE	=>  Location: PIN_33
-- RTCCS	=>  Location: PIN_12
-- BCLK	=>  Location: PIN_46
-- ACLK	=>  Location: PIN_48
-- CIOCS	=>  Location: PIN_40
-- SCCCS	=>  Location: PIN_41
-- ECLK	=>  Location: PIN_50
-- ZWR	=>  Location: PIN_44
-- RAM1CS	=>  Location: PIN_37
-- WR	=>  Location: PIN_80
-- LED[0]	=>  Location: PIN_28
-- LED[1]	=>  Location: PIN_29
-- SDCK	=>  Location: PIN_20
-- SDCS	=>  Location: PIN_18
-- LED[2]	=>  Location: PIN_27
-- ROMCS	=>  Location: PIN_39
-- RAM2CS	=>  Location: PIN_36
-- ROMP27	=>  Location: PIN_4
-- TP13	=>  Location: PIN_8
-- TP14	=>  Location: PIN_9
-- SDDO	=>  Location: PIN_21
-- QCLK	=>  Location: PIN_49


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
SIGNAL ww_RTCCS : std_logic;
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
SIGNAL \DATA[0]~116_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~116_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~127_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~128_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~137_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~138_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~146_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~149_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~154_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~158_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~162_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zrd_n~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \CPU_CLK|pre_cnt_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|pre_cnt_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|auxcs~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \ADDR_DECODE|rtccs~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|rtccs~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_b_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_drv_a_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \ADDR_DECODE|scccs~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|scccs~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \CPU_CLK|clock_state[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \CPU_CLK|clock_state[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \zwr_n~4_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \zwr_n~4_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|e_out~9_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|d_e_out_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \wr_n~6_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram1cs~4_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \SD_PORT|upd_latch[3]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[3]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~4_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \SD_PORT|upd_latch[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \IO_PORT|busy_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \IO_PORT|busy_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \SYS_PORT|ra14_latch_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|ra14_latch_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \SYS_PORT|mux_latch[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \LED~7_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \LED~7_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|romcs~3_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ADDR_DECODE|ram2cs~4_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \ROMP27~8_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~20_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~22_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|clock_state[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
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
SIGNAL \CPU_CLK|q_out~2_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \CPU_CLK|q_out~2_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~282_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~284_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~32_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~36_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch~40_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~286_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~288_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~290_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~292_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~294_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~296_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~298_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[7]~301_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[6]~303_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[5]~305_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[4]~307_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[3]~309_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[2]~311_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[1]~313_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA[0]~315_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~22_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP14~24_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \TP13~24_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~12_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \SPI_MASTER|MOSI_v~3_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \DATA~148sexp_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \XOSC~dataout\ : std_logic;
SIGNAL \DATA[0]~0\ : std_logic;
SIGNAL \DATA[1]~1\ : std_logic;
SIGNAL \DATA[2]~2\ : std_logic;
SIGNAL \DATA[3]~3\ : std_logic;
SIGNAL \DATA[4]~4\ : std_logic;
SIGNAL \DATA[5]~5\ : std_logic;
SIGNAL \DATA[6]~6\ : std_logic;
SIGNAL \DATA[7]~7\ : std_logic;
SIGNAL \RESET~dataout\ : std_logic;
SIGNAL \SDDI~dataout\ : std_logic;
SIGNAL \RW~dataout\ : std_logic;
SIGNAL \CPU_CLK|pre_cnt~dataout\ : std_logic;
SIGNAL \DATA[1]~288_pexpout\ : std_logic;
SIGNAL \SYS_PORT|romsel_latch~dataout\ : std_logic;
SIGNAL \DATA[0]~290_pexpout\ : std_logic;
SIGNAL \SYS_PORT|romws_latch~dataout\ : std_logic;
SIGNAL \SD_PORT|upd_latch~32_pexpout\ : std_logic;
SIGNAL \SD_PORT|upd_latch~36_pexpout\ : std_logic;
SIGNAL \SD_PORT|upd_latch~40_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|state.state_bit_2~dataout\ : std_logic;
SIGNAL \SPI_MASTER|state.state_bit_0~dataout\ : std_logic;
SIGNAL \SPI_MASTER|state.state_bit_1~dataout\ : std_logic;
SIGNAL \CPU_CLK|d_e_out~dataout\ : std_logic;
SIGNAL \DATA[0]~284_pexpout\ : std_logic;
SIGNAL \DATA[0]~116_dataout\ : std_logic;
SIGNAL \DATA[7]~127_dataout\ : std_logic;
SIGNAL \DATA[1]~282_pexpout\ : std_logic;
SIGNAL \DATA[1]~128_dataout\ : std_logic;
SIGNAL \DATA[2]~286_pexpout\ : std_logic;
SIGNAL \SYS_PORT|ra14_latch~dataout\ : std_logic;
SIGNAL \DATA[2]~137_dataout\ : std_logic;
SIGNAL \DATA[3]~298_pexpout\ : std_logic;
SIGNAL \IO_PORT|sdcs_latch~dataout\ : std_logic;
SIGNAL \DATA[3]~138_dataout\ : std_logic;
SIGNAL \DATA[4]~296_pexpout\ : std_logic;
SIGNAL \DATA[4]~146_dataout\ : std_logic;
SIGNAL \DATA~148sexp_dataout\ : std_logic;
SIGNAL \DATA[7]~149_dataout\ : std_logic;
SIGNAL \DATA[5]~294_pexpout\ : std_logic;
SIGNAL \PBTN~dataout\ : std_logic;
SIGNAL \IO_PORT|button_latch~dataout\ : std_logic;
SIGNAL \DATA[5]~154_dataout\ : std_logic;
SIGNAL \DATA[6]~292_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|SS~dataout\ : std_logic;
SIGNAL \IO_PORT|busy_latch~dataout\ : std_logic;
SIGNAL \DATA[6]~158_dataout\ : std_logic;
SIGNAL \CONF~dataout\ : std_logic;
SIGNAL \SYS_PORT|config_latch~dataout\ : std_logic;
SIGNAL \SDSW~dataout\ : std_logic;
SIGNAL \IO_PORT|switch_latch~dataout\ : std_logic;
SIGNAL \DATA[7]~162_dataout\ : std_logic;
SIGNAL \~GND~0~dataout\ : std_logic;
SIGNAL \~GND~1~dataout\ : std_logic;
SIGNAL \rd_n~2_dataout\ : std_logic;
SIGNAL \zrd_n~1_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|auxcs~3_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|rtccs~3_dataout\ : std_logic;
SIGNAL \WOSC~dataout\ : std_logic;
SIGNAL \BAUD_CLK|baud_drv_b~dataout\ : std_logic;
SIGNAL \BAUD_CLK|baud_drv_a~dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ciocs~4_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|scccs~3_dataout\ : std_logic;
SIGNAL \CPU_CLK|e_out~9_dataout\ : std_logic;
SIGNAL \zwr_n~4_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ram1cs~4_dataout\ : std_logic;
SIGNAL \wr_n~6_dataout\ : std_logic;
SIGNAL \LED~4_dataout\ : std_logic;
SIGNAL \LED~6_dataout\ : std_logic;
SIGNAL \SPI_MASTER|SCLK~dataout\ : std_logic;
SIGNAL \LED~7_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|romcs~3_dataout\ : std_logic;
SIGNAL \ADDR_DECODE|ram2cs~4_dataout\ : std_logic;
SIGNAL \ROMP27~8_dataout\ : std_logic;
SIGNAL \TP13~24_pexpout\ : std_logic;
SIGNAL \TP13~22_dataout\ : std_logic;
SIGNAL \TP14~22_pexpout\ : std_logic;
SIGNAL \TP14~24_pexpout\ : std_logic;
SIGNAL \TP14~20_dataout\ : std_logic;
SIGNAL \DATA[0]~315_pexpout\ : std_logic;
SIGNAL \DATA[1]~313_pexpout\ : std_logic;
SIGNAL \DATA[3]~309_pexpout\ : std_logic;
SIGNAL \DATA[2]~311_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~10_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~12_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~3_dataout\ : std_logic;
SIGNAL \DATA[4]~307_pexpout\ : std_logic;
SIGNAL \DATA[5]~305_pexpout\ : std_logic;
SIGNAL \DATA[7]~301_pexpout\ : std_logic;
SIGNAL \DATA[6]~303_pexpout\ : std_logic;
SIGNAL \SPI_MASTER|MOSI_v~dataout\ : std_logic;
SIGNAL \CPU_CLK|q_out~2_dataout\ : std_logic;
SIGNAL \ADDR~dataout\ : std_logic_vector(15 DOWNTO 4);
SIGNAL \CPU_CLK|clock_state\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_b\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \BAUD_CLK|baud_cnt_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \SYS_PORT|mux_latch\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \IO_PORT|led_latch\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \SD_PORT|upd_latch\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SD_PORT|d_latch\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \SPI_MASTER|index\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \SPI_MASTER|DataRxd\ : std_logic_vector(7 DOWNTO 0);
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
SIGNAL \CPU_CLK|ALT_INV_clock_state\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \SD_PORT|ALT_INV_d_latch\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \IO_PORT|ALT_INV_sdcs_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_mux_latch\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \SYS_PORT|ALT_INV_romws_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_romsel_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_ra14_latch~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_DataRxd\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \IO_PORT|ALT_INV_busy_latch~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_index\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \SPI_MASTER|ALT_INV_SS~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_state.state_bit_0~dataout\ : std_logic;
SIGNAL \SD_PORT|ALT_INV_upd_latch\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \IO_PORT|ALT_INV_led_latch\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \CPU_CLK|ALT_INV_d_e_out~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_state.state_bit_1~dataout\ : std_logic;
SIGNAL \IO_PORT|ALT_INV_switch_latch~dataout\ : std_logic;
SIGNAL \IO_PORT|ALT_INV_button_latch~dataout\ : std_logic;
SIGNAL \SYS_PORT|ALT_INV_config_latch~dataout\ : std_logic;
SIGNAL \SPI_MASTER|ALT_INV_state.state_bit_2~dataout\ : std_logic;
SIGNAL \BAUD_CLK|ALT_INV_baud_cnt_b\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \CPU_CLK|ALT_INV_pre_cnt~dataout\ : std_logic;
SIGNAL \ALT_INV_DATA[7]~149_dataout\ : std_logic;
SIGNAL \ALT_INV_DATA[7]~127_dataout\ : std_logic;

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
RTCCS <= ww_RTCCS;
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

\DATA[0]~116_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|romws_latch~dataout\ & NOT \IO_PORT|led_latch\(0) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6));

\DATA[0]~116_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~116_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|led_latch\(0) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(0));

\DATA[0]~116_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romws_latch~dataout\ & \IO_PORT|led_latch\(0) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6));

\DATA[0]~116_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(0) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & NOT \SPI_MASTER|DataRxd\(0));

\DATA[0]~116_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~116_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|led_latch\(0));

\DATA[0]~116_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~116_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[0]~116_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~116_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(14) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(11) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[7]~127_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(14) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(11) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5));

\DATA[7]~127_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~127_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~127_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~128_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|romsel_latch~dataout\ & NOT \IO_PORT|led_latch\(1) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6));

\DATA[1]~128_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~128_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|led_latch\(1) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(1));

\DATA[1]~128_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romsel_latch~dataout\ & \IO_PORT|led_latch\(1) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(4) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6));

\DATA[1]~128_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(1) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & NOT \SPI_MASTER|DataRxd\(1));

\DATA[1]~128_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~128_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|led_latch\(1));

\DATA[1]~128_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~128_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[1]~128_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~128_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SPI_MASTER|DataRxd\(2) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[2]~137_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|ra14_latch~dataout\ & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4));

\DATA[2]~137_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[2]~137_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~137_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~138_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~138_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~138_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|sdcs_latch~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & 
NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(3));

\DATA[3]~138_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdcs_latch~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & 
NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(6) & NOT \SPI_MASTER|DataRxd\(3));

\DATA[3]~138_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdcs_latch~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & 
NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & \ADDR~dataout\(6));

\DATA[3]~138_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~138_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \IO_PORT|sdcs_latch~dataout\);

\DATA[3]~138_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~138_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[3]~138_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~138_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SPI_MASTER|DataRxd\(4) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\DATA[4]~146_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|mux_latch\(0) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4));

\DATA[4]~146_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[4]~146_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~146_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \DATA~148sexp_dataout\ & NOT \DATA[7]~127_dataout\);

\DATA[7]~149_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~149_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~149_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(5));

\DATA[5]~154_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|mux_latch\(1) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[5]~154_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|button_latch~dataout\ & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[5]~154_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[5]~154_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~154_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(6));

\DATA[6]~158_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|mux_latch\(2) & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[6]~158_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|busy_latch~dataout\ & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[6]~158_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~158_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~158_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \ADDR~dataout\(6) & \SPI_MASTER|DataRxd\(7));

\DATA[7]~162_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|config_latch~dataout\ & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[7]~162_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|switch_latch~dataout\ & \CPU_CLK|d_e_out~dataout\ & \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4) & \ADDR~dataout\(6));

\DATA[7]~162_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~162_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~162_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RW~dataout\ & \RESET~dataout\);

\zrd_n~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\zrd_n~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zrd_n~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
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

\CPU_CLK|pre_cnt_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLK|pre_cnt_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|pre_cnt_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLK|baud_cnt_a[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLK|baud_cnt_b[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\
& \ADDR~dataout\(7));

\ADDR_DECODE|auxcs~3_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|auxcs~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|auxcs~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \BAUD_CLK|baud_cnt_a\(0));

\BAUD_CLK|baud_cnt_a[1]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLK|baud_cnt_a[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_a[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \BAUD_CLK|baud_cnt_b\(1) & NOT \BAUD_CLK|baud_cnt_b\(0));

\BAUD_CLK|baud_cnt_b[1]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\BAUD_CLK|baud_cnt_b[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_cnt_b[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|index[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|index[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SD_PORT|upd_latch\(0) & NOT \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\
);

\SPI_MASTER|index[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|index[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|index[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|index[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|state.state_bit_2_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|state.state_bit_2_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_2_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \ADDR~dataout\(4));

\ADDR_DECODE|rtccs~3_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|rtccs~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|rtccs~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \BAUD_CLK|baud_cnt_b\(1) & \BAUD_CLK|baud_cnt_b\(0));

\BAUD_CLK|baud_drv_b_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_b_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \BAUD_CLK|baud_cnt_a\(0) & \BAUD_CLK|baud_cnt_a\(1));

\BAUD_CLK|baud_drv_a_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\BAUD_CLK|baud_drv_a_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ciocs~4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(4));

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

\ADDR_DECODE|scccs~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(4));

\ADDR_DECODE|scccs~3_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|scccs~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|scccs~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|index[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SD_PORT|upd_latch\(0) & NOT \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|state.state_bit_1~dataout\
);

\SPI_MASTER|index[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|index[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|index[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|index[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[1]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1));

\CPU_CLK|clock_state[1]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(6));

\CPU_CLK|clock_state[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & \ADDR~dataout\(7) & \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\);

\CPU_CLK|clock_state[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[1]_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(0));

\CPU_CLK|clock_state[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\CPU_CLK|clock_state[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CONF~dataout\ & NOT \SYS_PORT|config_latch~dataout\ & NOT \RESET~dataout\);

\SYS_PORT|config_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|config_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CONF~dataout\ & \SYS_PORT|config_latch~dataout\ & NOT \RESET~dataout\);

\SYS_PORT|config_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \CONF~dataout\ & \SYS_PORT|config_latch~dataout\);

\SYS_PORT|config_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \CONF~dataout\ & NOT \SYS_PORT|config_latch~dataout\);

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

\IO_PORT|button_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \PBTN~dataout\ & NOT \IO_PORT|button_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|button_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|button_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \PBTN~dataout\ & \IO_PORT|button_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|button_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & \ADDR~dataout\(4) & \PBTN~dataout\ & \IO_PORT|button_latch~dataout\);

\IO_PORT|button_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & \ADDR~dataout\(4) & NOT \PBTN~dataout\ & NOT \IO_PORT|button_latch~dataout\);

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

\IO_PORT|switch_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SDSW~dataout\ & NOT \IO_PORT|switch_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|switch_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|switch_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SDSW~dataout\ & \IO_PORT|switch_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|switch_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & \ADDR~dataout\(4) & \SDSW~dataout\ & \IO_PORT|switch_latch~dataout\);

\IO_PORT|switch_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & \ADDR~dataout\(4) & NOT \SDSW~dataout\ & NOT \IO_PORT|switch_latch~dataout\);

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

\CPU_CLK|clock_state[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2));

\CPU_CLK|clock_state[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(0));

\CPU_CLK|clock_state[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\CPU_CLK|clock_state[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|state.state_bit_1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|state.state_bit_1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(0) & NOT \RW~dataout\);

\zwr_n~4_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\zwr_n~4_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\zwr_n~4_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\zwr_n~4_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2));

\CPU_CLK|e_out~9_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(2));

\CPU_CLK|e_out~9_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2));

\CPU_CLK|e_out~9_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLK|e_out~9_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|e_out~9_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2));

\CPU_CLK|d_e_out_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(2));

\CPU_CLK|d_e_out_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2));

\CPU_CLK|d_e_out_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLK|d_e_out_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|d_e_out_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & \RESET~dataout\ & NOT \RW~dataout\);

\wr_n~6_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(2) & \RESET~dataout\ & NOT \RW~dataout\);

\wr_n~6_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & \RESET~dataout\ & NOT \RW~dataout\);

\wr_n~6_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\wr_n~6_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\wr_n~6_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram1cs~4_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\ADDR_DECODE|ram1cs~4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8));

\ADDR_DECODE|ram1cs~4_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1));

\ADDR_DECODE|ram1cs~4_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1));

\ADDR_DECODE|ram1cs~4_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(15));

\ADDR_DECODE|ram1cs~4_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram1cs~4_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram1cs~4_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram1cs~4_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|ram1cs~4_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram1cs~4_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|led_latch[1]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \IO_PORT|led_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[1]~1\);

\IO_PORT|led_latch[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[1]~1\ & NOT \CPU_CLK|clock_state\(0));

\IO_PORT|led_latch[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \IO_PORT|led_latch\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[1]~1\);

\IO_PORT|led_latch[1]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \IO_PORT|led_latch\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[1]~1\ & NOT \CPU_CLK|clock_state\(0));

\IO_PORT|led_latch[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \IO_PORT|led_latch\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[1]~1\);

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

\IO_PORT|led_latch[0]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \IO_PORT|led_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[0]~0\);

\IO_PORT|led_latch[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[0]~0\ & NOT \CPU_CLK|clock_state\(0));

\IO_PORT|led_latch[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \IO_PORT|led_latch\(0) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[0]~0\);

\IO_PORT|led_latch[0]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \IO_PORT|led_latch\(0) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[0]~0\ & NOT \CPU_CLK|clock_state\(0));

\IO_PORT|led_latch[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \IO_PORT|led_latch\(0) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[0]~0\);

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

\SD_PORT|upd_latch[3]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & \SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\SD_PORT|upd_latch[3]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
NOT \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\SD_PORT|upd_latch[3]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\SD_PORT|upd_latch[3]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
NOT \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\SD_PORT|upd_latch[3]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[3]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[3]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[3]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch[3]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[3]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|led_latch\(0) & \RESET~dataout\);

\LED~4_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\LED~4_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~4_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~6_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|led_latch\(1) & \RESET~dataout\);

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

\SD_PORT|upd_latch[2]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & \SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SD_PORT|upd_latch\(2));

\SD_PORT|upd_latch[2]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & NOT \SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SD_PORT|upd_latch\(2));

\SD_PORT|upd_latch[2]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\RW~dataout\ & \SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SD_PORT|upd_latch\(2));

\SD_PORT|upd_latch[2]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & \SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SD_PORT|upd_latch\(2));

\SD_PORT|upd_latch[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[2]_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|upd_latch\(3));

\SD_PORT|upd_latch[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[1]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & \SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SD_PORT|upd_latch\(1));

\SD_PORT|upd_latch[1]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & NOT \SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SD_PORT|upd_latch\(1));

\SD_PORT|upd_latch[1]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\RW~dataout\ & \SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & 
\RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SD_PORT|upd_latch\(1));

\SD_PORT|upd_latch[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & \SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \SD_PORT|upd_latch\(1));

\SD_PORT|upd_latch[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[1]_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|upd_latch\(2));

\SD_PORT|upd_latch[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[0]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & NOT \SD_PORT|upd_latch\(0) & \SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\SD_PORT|upd_latch[0]_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|upd_latch[0]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(2) & \SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\);

\SD_PORT|upd_latch[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(2) & \SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\);

\SD_PORT|upd_latch[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[0]_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|upd_latch\(1));

\SD_PORT|upd_latch[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_1~dataout\ & \RESET~dataout\);

\SPI_MASTER|state.state_bit_0_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SD_PORT|upd_latch\(0));

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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|state.state_bit_0_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|state.state_bit_0_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|state.state_bit_0_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|SCLK_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|SCLK_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SCLK_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

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
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|SS_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|SS_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|SS_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1));

\SPI_MASTER|index[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SD_PORT|upd_latch\(0) & \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\
);

\SPI_MASTER|index[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|index[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|index[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|index[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|busy_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|SS~dataout\ & NOT \IO_PORT|busy_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|busy_latch_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|busy_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|SS~dataout\ & \IO_PORT|busy_latch~dataout\ & NOT \RESET~dataout\);

\IO_PORT|busy_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & \ADDR~dataout\(4) & NOT \SPI_MASTER|SS~dataout\ & \IO_PORT|busy_latch~dataout\);

\IO_PORT|busy_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT 
\ADDR~dataout\(5) & \ADDR~dataout\(6) & \ADDR~dataout\(4) & \SPI_MASTER|SS~dataout\ & NOT \IO_PORT|busy_latch~dataout\);

\IO_PORT|busy_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|busy_latch_pxor_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|SS~dataout\);

\IO_PORT|busy_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|busy_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\IO_PORT|busy_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|busy_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(7) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[7]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(7) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[7]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[7]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[7]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[7]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(6) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[6]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(6) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[6]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[6]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[6]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(5) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[5]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(5) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[5]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[5]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[5]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(4) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[4]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(4) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(2) & NOT 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[4]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[4]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[4]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(3) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[3]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(3) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[3]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[3]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[3]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(1) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & 
\SDDI~dataout\);

\SPI_MASTER|DataRxd[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(1) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & NOT 
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
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|DataRxd\(0) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2)
& \SDDI~dataout\);

\SPI_MASTER|DataRxd[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|DataRxd\(0) & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|state.state_bit_2~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(2) & 
NOT \SDDI~dataout\);

\SPI_MASTER|DataRxd[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|DataRxd[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|DataRxd[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|DataRxd[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|ra14_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SYS_PORT|ra14_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[2]~2\);

\SYS_PORT|ra14_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|ra14_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[2]~2\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|ra14_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SYS_PORT|ra14_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[2]~2\);

\SYS_PORT|ra14_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|ra14_latch~dataout\ & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[2]~2\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|ra14_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|ra14_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[2]~2\);

\SYS_PORT|ra14_latch_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|ra14_latch_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|ra14_latch_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|ra14_latch_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|ra14_latch_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|ra14_latch_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|romsel_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SYS_PORT|romsel_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[1]~1\);

\SYS_PORT|romsel_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romsel_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[1]~1\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|romsel_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SYS_PORT|romsel_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[1]~1\);

\SYS_PORT|romsel_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|romsel_latch~dataout\ & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[1]~1\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|romsel_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|romsel_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[1]~1\);

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

\SYS_PORT|romws_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SYS_PORT|romws_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[0]~0\);

\SYS_PORT|romws_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romws_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[0]~0\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|romws_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SYS_PORT|romws_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[0]~0\);

\SYS_PORT|romws_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|romws_latch~dataout\ & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[0]~0\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|romws_latch_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|romws_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[0]~0\);

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

\SYS_PORT|mux_latch[2]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(2) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[6]~6\);

\SYS_PORT|mux_latch[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(2) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[6]~6\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|mux_latch[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SYS_PORT|mux_latch\(2) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[6]~6\);

\SYS_PORT|mux_latch[2]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[6]~6\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|mux_latch[2]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(2) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[6]~6\);

\SYS_PORT|mux_latch[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|mux_latch[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[1]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[5]~5\);

\SYS_PORT|mux_latch[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[5]~5\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|mux_latch[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SYS_PORT|mux_latch\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[5]~5\);

\SYS_PORT|mux_latch[1]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[5]~5\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|mux_latch[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[5]~5\);

\SYS_PORT|mux_latch[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|mux_latch[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[0]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[4]~4\);

\SYS_PORT|mux_latch[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[4]~4\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|mux_latch[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SYS_PORT|mux_latch\(0) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[4]~4\);

\SYS_PORT|mux_latch[0]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(0) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & 
NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[4]~4\ & NOT \CPU_CLK|clock_state\(0));

\SYS_PORT|mux_latch[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SYS_PORT|mux_latch\(0) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[4]~4\);

\SYS_PORT|mux_latch[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SYS_PORT|mux_latch[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SYS_PORT|mux_latch[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\IO_PORT|sdcs_latch_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdcs_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[3]~3\);

\IO_PORT|sdcs_latch_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|sdcs_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[3]~3\);

\IO_PORT|sdcs_latch_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(0) & \IO_PORT|sdcs_latch~dataout\ & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[3]~3\);

\IO_PORT|sdcs_latch_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\IO_PORT|sdcs_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[3]~3\);

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

\SD_PORT|d_latch[7]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(7) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[7]~7\);

\SD_PORT|d_latch[7]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(7) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[7]~7\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[7]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(7) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[7]~7\);

\SD_PORT|d_latch[7]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(7) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[7]~7\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[7]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(7) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[7]~7\);

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

\SD_PORT|d_latch[6]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(6) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[6]~6\);

\SD_PORT|d_latch[6]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(6) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[6]~6\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[6]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(6) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[6]~6\);

\SD_PORT|d_latch[6]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(6) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[6]~6\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[6]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(6) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[6]~6\);

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

\SD_PORT|d_latch[5]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(5) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[5]~5\);

\SD_PORT|d_latch[5]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(5) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[5]~5\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[5]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(5) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[5]~5\);

\SD_PORT|d_latch[5]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(5) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[5]~5\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[5]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(5) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[5]~5\);

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

\SD_PORT|d_latch[4]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(4) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[4]~4\);

\SD_PORT|d_latch[4]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(4) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[4]~4\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[4]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(4) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[4]~4\);

\SD_PORT|d_latch[4]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(4) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[4]~4\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[4]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(4) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[4]~4\);

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

\SD_PORT|d_latch[3]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(3) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[3]~3\);

\SD_PORT|d_latch[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(3) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[3]~3\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[3]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(3) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[3]~3\);

\SD_PORT|d_latch[3]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(3) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[3]~3\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[3]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(3) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[3]~3\);

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

\SD_PORT|d_latch[2]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(2) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[2]~2\);

\SD_PORT|d_latch[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(2) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[2]~2\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(2) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[2]~2\);

\SD_PORT|d_latch[2]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[2]~2\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[2]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(2) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[2]~2\);

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

\SD_PORT|d_latch[1]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[1]~1\);

\SD_PORT|d_latch[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[1]~1\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[1]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[1]~1\);

\SD_PORT|d_latch[1]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[1]~1\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[1]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[1]~1\);

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

\SD_PORT|d_latch[0]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & 
NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[0]~0\);

\SD_PORT|d_latch[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[0]~0\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[0]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & NOT \SD_PORT|d_latch\(0) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[0]~0\);

\SD_PORT|d_latch[0]_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(0) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[0]~0\ & NOT \CPU_CLK|clock_state\(0));

\SD_PORT|d_latch[0]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(1) & \SD_PORT|d_latch\(0) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & NOT \DATA[0]~0\);

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

\LED~7_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \IO_PORT|sdcs_latch~dataout\ & \RESET~dataout\);

\LED~7_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\LED~7_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\LED~7_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|romsel_latch~dataout\ & \ADDR~dataout\(14) & \ADDR~dataout\(15) & \RESET~dataout\);

\ADDR_DECODE|romcs~3_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|romcs~3_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|romcs~3_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~4_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \RESET~dataout\);

\ADDR_DECODE|ram2cs~4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|romsel_latch~dataout\ & \ADDR~dataout\(14));

\ADDR_DECODE|ram2cs~4_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1));

\ADDR_DECODE|ram2cs~4_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1));

\ADDR_DECODE|ram2cs~4_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \ADDR~dataout\(15));

\ADDR_DECODE|ram2cs~4_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~4_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~4_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~4_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ADDR_DECODE|ram2cs~4_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ADDR_DECODE|ram2cs~4_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ROMP27~8_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ROMP27~8_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CONF~dataout\ & \SYS_PORT|ra14_latch~dataout\ & NOT \CPU_CLK|clock_state\(0) & \RESET~dataout\ & NOT \RW~dataout\ & \CPU_CLK|clock_state\(1));

\ROMP27~8_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(2) & NOT \CONF~dataout\ & \SYS_PORT|ra14_latch~dataout\ & \RESET~dataout\ & NOT \RW~dataout\ & \CPU_CLK|clock_state\(1));

\ROMP27~8_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(2) & NOT \CONF~dataout\ & \SYS_PORT|ra14_latch~dataout\ & \RESET~dataout\ & NOT \RW~dataout\ & NOT \CPU_CLK|clock_state\(1));

\ROMP27~8_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CONF~dataout\ & NOT \SYS_PORT|ra14_latch~dataout\);

\ROMP27~8_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ROMP27~8_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ROMP27~8_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ROMP27~8_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\ROMP27~8_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\ROMP27~8_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~20_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SYS_PORT|ra14_latch~dataout\ & NOT \RW~dataout\ & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(0) & NOT \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(2) & \RESET~dataout\);

\TP14~20_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(1) & NOT \SYS_PORT|mux_latch\(2) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(15) & \RESET~dataout\ & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(4));

\TP14~20_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|romsel_latch~dataout\ & \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2) & \ADDR~dataout\(14) & \ADDR~dataout\(15) & \RESET~dataout\);

\TP14~20_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SYS_PORT|ra14_latch~dataout\ & NOT \RW~dataout\ & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(2) & \RESET~dataout\);

\TP14~20_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SYS_PORT|ra14_latch~dataout\ & NOT \RW~dataout\ & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & NOT \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(2) & \RESET~dataout\);

\TP14~20_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~20_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~20_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~20_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\TP14~20_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~20_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~22_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|d_e_out~dataout\ & NOT \SYS_PORT|mux_latch\(1) & NOT \SYS_PORT|mux_latch\(2));

\TP13~22_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|romsel_latch~dataout\ & NOT \SYS_PORT|romws_latch~dataout\ & \ADDR~dataout\(15) & \RESET~dataout\ & \ADDR~dataout\(14) & \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2)
);

\TP13~22_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(13) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(15) & \RESET~dataout\ & NOT 
\ADDR~dataout\(14) & \SYS_PORT|mux_latch\(1) & NOT \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2));

\TP13~22_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & \ADDR~dataout\(7) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(10) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(13) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(15) & \RESET~dataout\ & NOT \ADDR~dataout\(14) & 
\SYS_PORT|mux_latch\(1) & NOT \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2));

\TP13~22_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|SS~dataout\ & NOT \SYS_PORT|mux_latch\(0) & NOT \SYS_PORT|mux_latch\(2));

\TP13~22_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~22_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~22_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~22_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\TP13~22_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~22_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[2]_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & \ADDR~dataout\(7) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & 
\RESET~dataout\ & \CPU_CLK|clock_state\(0) & NOT \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1));

\CPU_CLK|clock_state[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1));

\CPU_CLK|clock_state[2]_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \ADDR~dataout\(15) & \ADDR~dataout\(14) & \RESET~dataout\ & \CPU_CLK|clock_state\(0) & NOT \SYS_PORT|romws_latch~dataout\ & NOT \SYS_PORT|romsel_latch~dataout\ & NOT \CPU_CLK|clock_state\(2) & 
\CPU_CLK|clock_state\(1));

\CPU_CLK|clock_state[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[2]_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(15) & NOT 
\ADDR~dataout\(14) & \RESET~dataout\ & \CPU_CLK|clock_state\(0) & NOT \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1));

\CPU_CLK|clock_state[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\CPU_CLK|clock_state[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|clock_state[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(6) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~3_dataout\);

\SPI_MASTER|MOSI_v_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SD_PORT|d_latch\(4) & \SPI_MASTER|MOSI_v~3_dataout\);

\SPI_MASTER|MOSI_v_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(5) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~3_dataout\);

\SPI_MASTER|MOSI_v_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(7) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & \SPI_MASTER|index\(2) & \SPI_MASTER|MOSI_v~3_dataout\);

\SPI_MASTER|MOSI_v_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|pre_cnt~dataout\);

\SPI_MASTER|MOSI_v_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(0) & NOT \CPU_CLK|clock_state\(2));

\CPU_CLK|q_out~2_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\CPU_CLK|q_out~2_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\CPU_CLK|q_out~2_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[1]~1\);

\DATA[1]~282_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[1]~282_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~282_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|led_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \DATA[0]~0\);

\DATA[0]~284_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[0]~284_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~284_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\);

\SD_PORT|upd_latch~32_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(0) & NOT \SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\);

\SD_PORT|upd_latch~32_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|upd_latch\(3) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\);

\SD_PORT|upd_latch~32_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch~32_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~32_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & NOT \CPU_CLK|clock_state\(1) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\);

\SD_PORT|upd_latch~36_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(0) & NOT \SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT 
\ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\);

\SD_PORT|upd_latch~36_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|upd_latch\(2) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT 
\ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \CPU_CLK|clock_state\(1) & NOT \CPU_CLK|clock_state\(2) & NOT \RW~dataout\);

\SD_PORT|upd_latch~36_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch~36_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~36_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
NOT \SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & 
NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SD_PORT|upd_latch\(0) & \RW~dataout\);

\SD_PORT|upd_latch~40_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & 
\ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SD_PORT|upd_latch\(0));

\SD_PORT|upd_latch~40_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\CPU_CLK|clock_state\(0) & \CPU_CLK|clock_state\(2) & \CPU_CLK|clock_state\(1) & NOT \SD_PORT|upd_latch\(1) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4) & \SD_PORT|upd_latch\(0));

\SD_PORT|upd_latch~40_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SD_PORT|upd_latch~40_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SD_PORT|upd_latch~40_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|ra14_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[2]~2\);

\DATA[2]~286_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[2]~286_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~286_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romsel_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[1]~1\);

\DATA[1]~288_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[1]~288_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~288_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|romws_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & NOT \DATA[0]~0\);

\DATA[0]~290_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[0]~290_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~290_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(2) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[6]~6\);

\DATA[6]~292_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~292_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~292_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[5]~5\);

\DATA[5]~294_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[5]~294_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~294_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(4) & \DATA[4]~4\);

\DATA[4]~296_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[4]~296_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~296_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\IO_PORT|sdcs_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[3]~3\);

\DATA[3]~298_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\CPU_CLK|clock_state\(0) & NOT \IO_PORT|sdcs_latch~dataout\ & \CPU_CLK|clock_state\(2) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT 
\ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(5) & \ADDR~dataout\(6) & \DATA[3]~3\);

\DATA[3]~298_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[3]~298_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~298_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(7) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[7]~7\);

\DATA[7]~301_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[7]~301_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[7]~301_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(6) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[6]~6\);

\DATA[6]~303_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[6]~303_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[6]~303_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(5) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[5]~5\);

\DATA[5]~305_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[5]~305_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[5]~305_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(4) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[4]~4\);

\DATA[4]~307_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[4]~307_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[4]~307_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(3) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[3]~3\);

\DATA[3]~309_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[3]~309_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[3]~309_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(2) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[2]~2\);

\DATA[2]~311_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[2]~311_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[2]~311_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(1) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[1]~1\);

\DATA[1]~313_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[1]~313_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[1]~313_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SD_PORT|d_latch\(0) & \CPU_CLK|clock_state\(2) & NOT \CPU_CLK|clock_state\(1) & NOT \RW~dataout\ & \ADDR~dataout\(4) & NOT \ADDR~dataout\(15) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11)
& NOT \ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & \RESET~dataout\ & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \DATA[0]~0\);

\DATA[0]~315_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\DATA[0]~315_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\DATA[0]~315_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|mux_latch\(0) & NOT \SYS_PORT|mux_latch\(1));

\TP14~22_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\TP14~22_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~22_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~24_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(0) & NOT \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2));

\TP14~24_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
\SYS_PORT|mux_latch\(0) & NOT \SYS_PORT|mux_latch\(2) & \SYS_PORT|mux_latch\(1) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(15) & \RESET~dataout\ & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT 
\ADDR~dataout\(10) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(6) & \ADDR~dataout\(5) & \ADDR~dataout\(4));

\TP14~24_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT 
\SYS_PORT|mux_latch\(0) & NOT \SYS_PORT|mux_latch\(2) & NOT \ADDR~dataout\(14) & NOT \ADDR~dataout\(15) & \RESET~dataout\ & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(12) & NOT \ADDR~dataout\(11) & NOT \ADDR~dataout\(10) & \ADDR~dataout\(9)
& NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & \ADDR~dataout\(6) & NOT \ADDR~dataout\(5) & NOT \ADDR~dataout\(4));

\TP14~24_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|clock_state\(1) & NOT \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2));

\TP14~24_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \CPU_CLK|clock_state\(2) & NOT \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2));

\TP14~24_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~24_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~24_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~24_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\TP14~24_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP14~24_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~24_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~24_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \CPU_CLK|pre_cnt~dataout\ & NOT \SYS_PORT|mux_latch\(1) & NOT \SYS_PORT|mux_latch\(0));

\TP13~24_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|mux_latch\(1) & NOT \SYS_PORT|mux_latch\(0) & NOT \SYS_PORT|mux_latch\(2));

\TP13~24_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SYS_PORT|ra14_latch~dataout\ & NOT \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(0) & \SYS_PORT|mux_latch\(2));

\TP13~24_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SD_PORT|upd_latch\(0) & \SYS_PORT|mux_latch\(1) & \SYS_PORT|mux_latch\(0) & NOT \SYS_PORT|mux_latch\(2));

\TP13~24_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~24_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~24_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~24_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\TP13~24_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\TP13~24_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(2) & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\
);

\SPI_MASTER|MOSI_v~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|MOSI_v~dataout\ & \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|MOSI_v~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SD_PORT|d_latch\(0) & \SPI_MASTER|state.state_bit_0~dataout\ & NOT 
\SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|MOSI_v~10_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(1) & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\
);

\SPI_MASTER|MOSI_v~10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(3) & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SPI_MASTER|state.state_bit_0~dataout\ & NOT \SPI_MASTER|state.state_bit_1~dataout\);

\SPI_MASTER|MOSI_v~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~12_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(2) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & NOT 
\SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|MOSI_v~12_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SPI_MASTER|state.state_bit_2~dataout\ & NOT \SPI_MASTER|state.state_bit_0~dataout\ & \SPI_MASTER|MOSI_v~dataout\);

\SPI_MASTER|MOSI_v~12_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_1~dataout\ & NOT \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & \SD_PORT|d_latch\(0) & NOT 
\SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|MOSI_v~12_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(1) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & NOT \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & NOT 
\SPI_MASTER|state.state_bit_2~dataout\);

\SPI_MASTER|MOSI_v~12_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \SD_PORT|d_latch\(3) & NOT \SPI_MASTER|state.state_bit_1~dataout\ & \SPI_MASTER|index\(0) & \SPI_MASTER|index\(1) & NOT \SPI_MASTER|index\(2) & NOT \SPI_MASTER|state.state_bit_2~dataout\
);

\SPI_MASTER|MOSI_v~12_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~12_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~12_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~12_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\SPI_MASTER|MOSI_v~12_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~12_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\~GND~0_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\~GND~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\SPI_MASTER|MOSI_v~3_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \SPI_MASTER|state.state_bit_0~dataout\ & \SPI_MASTER|state.state_bit_2~dataout\);

\DATA~148sexp_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& NOT \ADDR~dataout\(6) & NOT \ADDR~dataout\(8) & NOT \ADDR~dataout\(7) & NOT \ADDR~dataout\(14) & \ADDR~dataout\(9) & NOT \ADDR~dataout\(12) & \RESET~dataout\ & NOT \ADDR~dataout\(13) & NOT \ADDR~dataout\(4) & \ADDR~dataout\(5) & NOT 
\ADDR~dataout\(10) & NOT \ADDR~dataout\(15) & \RW~dataout\ & NOT \ADDR~dataout\(11));
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
\ALT_INV_ADDR~dataout\(8) <= NOT \ADDR~dataout\(8);
\ALT_INV_ADDR~dataout\(7) <= NOT \ADDR~dataout\(7);
\ALT_INV_ADDR~dataout\(6) <= NOT \ADDR~dataout\(6);
\ALT_INV_ADDR~dataout\(5) <= NOT \ADDR~dataout\(5);
\ALT_INV_ADDR~dataout\(4) <= NOT \ADDR~dataout\(4);
\ALT_INV_RESET~dataout\ <= NOT \RESET~dataout\;
\CPU_CLK|ALT_INV_clock_state\(2) <= NOT \CPU_CLK|clock_state\(2);
\SD_PORT|ALT_INV_d_latch\(0) <= NOT \SD_PORT|d_latch\(0);
\SD_PORT|ALT_INV_d_latch\(1) <= NOT \SD_PORT|d_latch\(1);
\SD_PORT|ALT_INV_d_latch\(2) <= NOT \SD_PORT|d_latch\(2);
\SD_PORT|ALT_INV_d_latch\(3) <= NOT \SD_PORT|d_latch\(3);
\SD_PORT|ALT_INV_d_latch\(4) <= NOT \SD_PORT|d_latch\(4);
\SD_PORT|ALT_INV_d_latch\(5) <= NOT \SD_PORT|d_latch\(5);
\SD_PORT|ALT_INV_d_latch\(6) <= NOT \SD_PORT|d_latch\(6);
\SD_PORT|ALT_INV_d_latch\(7) <= NOT \SD_PORT|d_latch\(7);
\IO_PORT|ALT_INV_sdcs_latch~dataout\ <= NOT \IO_PORT|sdcs_latch~dataout\;
\SYS_PORT|ALT_INV_mux_latch\(0) <= NOT \SYS_PORT|mux_latch\(0);
\SYS_PORT|ALT_INV_mux_latch\(1) <= NOT \SYS_PORT|mux_latch\(1);
\SYS_PORT|ALT_INV_mux_latch\(2) <= NOT \SYS_PORT|mux_latch\(2);
\SYS_PORT|ALT_INV_romws_latch~dataout\ <= NOT \SYS_PORT|romws_latch~dataout\;
\SYS_PORT|ALT_INV_romsel_latch~dataout\ <= NOT \SYS_PORT|romsel_latch~dataout\;
\SYS_PORT|ALT_INV_ra14_latch~dataout\ <= NOT \SYS_PORT|ra14_latch~dataout\;
\SPI_MASTER|ALT_INV_DataRxd\(0) <= NOT \SPI_MASTER|DataRxd\(0);
\SPI_MASTER|ALT_INV_DataRxd\(1) <= NOT \SPI_MASTER|DataRxd\(1);
\SPI_MASTER|ALT_INV_DataRxd\(2) <= NOT \SPI_MASTER|DataRxd\(2);
\SPI_MASTER|ALT_INV_DataRxd\(3) <= NOT \SPI_MASTER|DataRxd\(3);
\SPI_MASTER|ALT_INV_DataRxd\(4) <= NOT \SPI_MASTER|DataRxd\(4);
\SPI_MASTER|ALT_INV_DataRxd\(5) <= NOT \SPI_MASTER|DataRxd\(5);
\SPI_MASTER|ALT_INV_DataRxd\(6) <= NOT \SPI_MASTER|DataRxd\(6);
\SPI_MASTER|ALT_INV_DataRxd\(7) <= NOT \SPI_MASTER|DataRxd\(7);
\IO_PORT|ALT_INV_busy_latch~dataout\ <= NOT \IO_PORT|busy_latch~dataout\;
\SPI_MASTER|ALT_INV_index\(2) <= NOT \SPI_MASTER|index\(2);
\SPI_MASTER|ALT_INV_SS~dataout\ <= NOT \SPI_MASTER|SS~dataout\;
\SPI_MASTER|ALT_INV_state.state_bit_0~dataout\ <= NOT \SPI_MASTER|state.state_bit_0~dataout\;
\SD_PORT|ALT_INV_upd_latch\(0) <= NOT \SD_PORT|upd_latch\(0);
\SD_PORT|ALT_INV_upd_latch\(1) <= NOT \SD_PORT|upd_latch\(1);
\SD_PORT|ALT_INV_upd_latch\(2) <= NOT \SD_PORT|upd_latch\(2);
\SD_PORT|ALT_INV_upd_latch\(3) <= NOT \SD_PORT|upd_latch\(3);
\IO_PORT|ALT_INV_led_latch\(0) <= NOT \IO_PORT|led_latch\(0);
\IO_PORT|ALT_INV_led_latch\(1) <= NOT \IO_PORT|led_latch\(1);
\CPU_CLK|ALT_INV_d_e_out~dataout\ <= NOT \CPU_CLK|d_e_out~dataout\;
\SPI_MASTER|ALT_INV_state.state_bit_1~dataout\ <= NOT \SPI_MASTER|state.state_bit_1~dataout\;
\CPU_CLK|ALT_INV_clock_state\(0) <= NOT \CPU_CLK|clock_state\(0);
\IO_PORT|ALT_INV_switch_latch~dataout\ <= NOT \IO_PORT|switch_latch~dataout\;
\IO_PORT|ALT_INV_button_latch~dataout\ <= NOT \IO_PORT|button_latch~dataout\;
\SYS_PORT|ALT_INV_config_latch~dataout\ <= NOT \SYS_PORT|config_latch~dataout\;
\CPU_CLK|ALT_INV_clock_state\(1) <= NOT \CPU_CLK|clock_state\(1);
\SPI_MASTER|ALT_INV_index\(1) <= NOT \SPI_MASTER|index\(1);
\SPI_MASTER|ALT_INV_state.state_bit_2~dataout\ <= NOT \SPI_MASTER|state.state_bit_2~dataout\;
\SPI_MASTER|ALT_INV_index\(0) <= NOT \SPI_MASTER|index\(0);
\BAUD_CLK|ALT_INV_baud_cnt_b\(1) <= NOT \BAUD_CLK|baud_cnt_b\(1);
\BAUD_CLK|ALT_INV_baud_cnt_b\(0) <= NOT \BAUD_CLK|baud_cnt_b\(0);
\CPU_CLK|ALT_INV_pre_cnt~dataout\ <= NOT \CPU_CLK|pre_cnt~dataout\;
\ALT_INV_DATA[7]~149_dataout\ <= NOT \DATA[7]~149_dataout\;
\ALT_INV_DATA[7]~127_dataout\ <= NOT \DATA[7]~127_dataout\;

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
	datain => \DATA[0]~116_dataout\,
	oe => \DATA[7]~127_dataout\,
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
	datain => \DATA[1]~128_dataout\,
	oe => \DATA[7]~127_dataout\,
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
	datain => \DATA[2]~137_dataout\,
	oe => \DATA[7]~127_dataout\,
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
	datain => \DATA[3]~138_dataout\,
	oe => \DATA[7]~127_dataout\,
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
	datain => \DATA[4]~146_dataout\,
	oe => \ALT_INV_DATA[7]~149_dataout\,
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
	datain => \DATA[5]~154_dataout\,
	oe => \ALT_INV_DATA[7]~149_dataout\,
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
	datain => \DATA[6]~158_dataout\,
	oe => \ALT_INV_DATA[7]~149_dataout\,
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
	datain => \DATA[7]~162_dataout\,
	oe => \ALT_INV_DATA[7]~149_dataout\,
	padio => DATA(7),
	dataout => \DATA[7]~7\);

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

-- Location: LC28
\CPU_CLK|pre_cnt\ : max_mcell
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
	pterm0 => \CPU_CLK|pre_cnt_pterm0_bus\,
	pterm1 => \CPU_CLK|pre_cnt_pterm1_bus\,
	pterm2 => \CPU_CLK|pre_cnt_pterm2_bus\,
	pterm3 => \CPU_CLK|pre_cnt_pterm3_bus\,
	pterm4 => \CPU_CLK|pre_cnt_pterm4_bus\,
	pterm5 => \CPU_CLK|pre_cnt_pterm5_bus\,
	pxor => \CPU_CLK|pre_cnt_pxor_bus\,
	pclk => \CPU_CLK|pre_cnt_pclk_bus\,
	papre => \CPU_CLK|pre_cnt_papre_bus\,
	paclr => \CPU_CLK|pre_cnt_paclr_bus\,
	pena => \CPU_CLK|pre_cnt_pena_bus\,
	dataout => \CPU_CLK|pre_cnt~dataout\);

-- Location: LC99
\CPU_CLK|clock_state[0]\ : max_mcell
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
	pterm0 => \CPU_CLK|clock_state[0]_pterm0_bus\,
	pterm1 => \CPU_CLK|clock_state[0]_pterm1_bus\,
	pterm2 => \CPU_CLK|clock_state[0]_pterm2_bus\,
	pterm3 => \CPU_CLK|clock_state[0]_pterm3_bus\,
	pterm4 => \CPU_CLK|clock_state[0]_pterm4_bus\,
	pterm5 => \CPU_CLK|clock_state[0]_pterm5_bus\,
	pxor => \CPU_CLK|clock_state[0]_pxor_bus\,
	pclk => \CPU_CLK|clock_state[0]_pclk_bus\,
	papre => \CPU_CLK|clock_state[0]_papre_bus\,
	paclr => \CPU_CLK|clock_state[0]_paclr_bus\,
	pena => \CPU_CLK|clock_state[0]_pena_bus\,
	dataout => \CPU_CLK|clock_state\(0));

-- Location: LC4
\CPU_CLK|clock_state[1]\ : max_mcell
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
	pterm0 => \CPU_CLK|clock_state[1]_pterm0_bus\,
	pterm1 => \CPU_CLK|clock_state[1]_pterm1_bus\,
	pterm2 => \CPU_CLK|clock_state[1]_pterm2_bus\,
	pterm3 => \CPU_CLK|clock_state[1]_pterm3_bus\,
	pterm4 => \CPU_CLK|clock_state[1]_pterm4_bus\,
	pterm5 => \CPU_CLK|clock_state[1]_pterm5_bus\,
	pxor => \CPU_CLK|clock_state[1]_pxor_bus\,
	pclk => \CPU_CLK|clock_state[1]_pclk_bus\,
	papre => \CPU_CLK|clock_state[1]_papre_bus\,
	paclr => \CPU_CLK|clock_state[1]_paclr_bus\,
	pena => \CPU_CLK|clock_state[1]_pena_bus\,
	dataout => \CPU_CLK|clock_state\(1));

-- Location: LC62
\DATA[1]~288\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[1]~288_pterm0_bus\,
	pterm1 => \DATA[1]~288_pterm1_bus\,
	pterm2 => \DATA[1]~288_pterm2_bus\,
	pterm3 => \DATA[1]~288_pterm3_bus\,
	pterm4 => \DATA[1]~288_pterm4_bus\,
	pterm5 => \DATA[1]~288_pterm5_bus\,
	pxor => \DATA[1]~288_pxor_bus\,
	pclk => \DATA[1]~288_pclk_bus\,
	papre => \DATA[1]~288_papre_bus\,
	paclr => \DATA[1]~288_paclr_bus\,
	pena => \DATA[1]~288_pena_bus\,
	pexpout => \DATA[1]~288_pexpout\);

-- Location: LC63
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
	pexpin => \DATA[1]~288_pexpout\,
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

-- Location: LC113
\DATA[0]~290\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[0]~290_pterm0_bus\,
	pterm1 => \DATA[0]~290_pterm1_bus\,
	pterm2 => \DATA[0]~290_pterm2_bus\,
	pterm3 => \DATA[0]~290_pterm3_bus\,
	pterm4 => \DATA[0]~290_pterm4_bus\,
	pterm5 => \DATA[0]~290_pterm5_bus\,
	pxor => \DATA[0]~290_pxor_bus\,
	pclk => \DATA[0]~290_pclk_bus\,
	papre => \DATA[0]~290_papre_bus\,
	paclr => \DATA[0]~290_paclr_bus\,
	pena => \DATA[0]~290_pena_bus\,
	pexpout => \DATA[0]~290_pexpout\);

-- Location: LC114
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
	pexpin => \DATA[0]~290_pexpout\,
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

-- Location: LC52
\CPU_CLK|clock_state[2]\ : max_mcell
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
	pterm0 => \CPU_CLK|clock_state[2]_pterm0_bus\,
	pterm1 => \CPU_CLK|clock_state[2]_pterm1_bus\,
	pterm2 => \CPU_CLK|clock_state[2]_pterm2_bus\,
	pterm3 => \CPU_CLK|clock_state[2]_pterm3_bus\,
	pterm4 => \CPU_CLK|clock_state[2]_pterm4_bus\,
	pterm5 => \CPU_CLK|clock_state[2]_pterm5_bus\,
	pxor => \CPU_CLK|clock_state[2]_pxor_bus\,
	pclk => \CPU_CLK|clock_state[2]_pclk_bus\,
	papre => \CPU_CLK|clock_state[2]_papre_bus\,
	paclr => \CPU_CLK|clock_state[2]_paclr_bus\,
	pena => \CPU_CLK|clock_state[2]_pena_bus\,
	dataout => \CPU_CLK|clock_state\(2));

-- Location: LC54
\SD_PORT|upd_latch[3]\ : max_mcell
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
	pterm0 => \SD_PORT|upd_latch[3]_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch[3]_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch[3]_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch[3]_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch[3]_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch[3]_pterm5_bus\,
	pxor => \SD_PORT|upd_latch[3]_pxor_bus\,
	pclk => \SD_PORT|upd_latch[3]_pclk_bus\,
	papre => \SD_PORT|upd_latch[3]_papre_bus\,
	paclr => \SD_PORT|upd_latch[3]_paclr_bus\,
	pena => \SD_PORT|upd_latch[3]_pena_bus\,
	dataout => \SD_PORT|upd_latch\(3));

-- Location: LC78
\SD_PORT|upd_latch~32\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \SD_PORT|upd_latch~32_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch~32_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch~32_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch~32_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch~32_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch~32_pterm5_bus\,
	pxor => \SD_PORT|upd_latch~32_pxor_bus\,
	pclk => \SD_PORT|upd_latch~32_pclk_bus\,
	papre => \SD_PORT|upd_latch~32_papre_bus\,
	paclr => \SD_PORT|upd_latch~32_paclr_bus\,
	pena => \SD_PORT|upd_latch~32_pena_bus\,
	pexpout => \SD_PORT|upd_latch~32_pexpout\);

-- Location: LC79
\SD_PORT|upd_latch[2]\ : max_mcell
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
	aclr => \ALT_INV_RESET~dataout\,
	pexpin => \SD_PORT|upd_latch~32_pexpout\,
	pterm0 => \SD_PORT|upd_latch[2]_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch[2]_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch[2]_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch[2]_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch[2]_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch[2]_pterm5_bus\,
	pxor => \SD_PORT|upd_latch[2]_pxor_bus\,
	pclk => \SD_PORT|upd_latch[2]_pclk_bus\,
	papre => \SD_PORT|upd_latch[2]_papre_bus\,
	paclr => \SD_PORT|upd_latch[2]_paclr_bus\,
	pena => \SD_PORT|upd_latch[2]_pena_bus\,
	dataout => \SD_PORT|upd_latch\(2));

-- Location: LC76
\SD_PORT|upd_latch~36\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \SD_PORT|upd_latch~36_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch~36_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch~36_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch~36_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch~36_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch~36_pterm5_bus\,
	pxor => \SD_PORT|upd_latch~36_pxor_bus\,
	pclk => \SD_PORT|upd_latch~36_pclk_bus\,
	papre => \SD_PORT|upd_latch~36_papre_bus\,
	paclr => \SD_PORT|upd_latch~36_paclr_bus\,
	pena => \SD_PORT|upd_latch~36_pena_bus\,
	pexpout => \SD_PORT|upd_latch~36_pexpout\);

-- Location: LC77
\SD_PORT|upd_latch[1]\ : max_mcell
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
	aclr => \ALT_INV_RESET~dataout\,
	pexpin => \SD_PORT|upd_latch~36_pexpout\,
	pterm0 => \SD_PORT|upd_latch[1]_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch[1]_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch[1]_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch[1]_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch[1]_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch[1]_pterm5_bus\,
	pxor => \SD_PORT|upd_latch[1]_pxor_bus\,
	pclk => \SD_PORT|upd_latch[1]_pclk_bus\,
	papre => \SD_PORT|upd_latch[1]_papre_bus\,
	paclr => \SD_PORT|upd_latch[1]_paclr_bus\,
	pena => \SD_PORT|upd_latch[1]_pena_bus\,
	dataout => \SD_PORT|upd_latch\(1));

-- Location: LC1
\SD_PORT|upd_latch~40\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \SD_PORT|upd_latch~40_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch~40_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch~40_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch~40_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch~40_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch~40_pterm5_bus\,
	pxor => \SD_PORT|upd_latch~40_pxor_bus\,
	pclk => \SD_PORT|upd_latch~40_pclk_bus\,
	papre => \SD_PORT|upd_latch~40_papre_bus\,
	paclr => \SD_PORT|upd_latch~40_paclr_bus\,
	pena => \SD_PORT|upd_latch~40_pena_bus\,
	pexpout => \SD_PORT|upd_latch~40_pexpout\);

-- Location: LC2
\SD_PORT|upd_latch[0]\ : max_mcell
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
	aclr => \ALT_INV_RESET~dataout\,
	pexpin => \SD_PORT|upd_latch~40_pexpout\,
	pterm0 => \SD_PORT|upd_latch[0]_pterm0_bus\,
	pterm1 => \SD_PORT|upd_latch[0]_pterm1_bus\,
	pterm2 => \SD_PORT|upd_latch[0]_pterm2_bus\,
	pterm3 => \SD_PORT|upd_latch[0]_pterm3_bus\,
	pterm4 => \SD_PORT|upd_latch[0]_pterm4_bus\,
	pterm5 => \SD_PORT|upd_latch[0]_pterm5_bus\,
	pxor => \SD_PORT|upd_latch[0]_pxor_bus\,
	pclk => \SD_PORT|upd_latch[0]_pclk_bus\,
	papre => \SD_PORT|upd_latch[0]_papre_bus\,
	paclr => \SD_PORT|upd_latch[0]_paclr_bus\,
	pena => \SD_PORT|upd_latch[0]_pena_bus\,
	dataout => \SD_PORT|upd_latch\(0));

-- Location: LC31
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

-- Location: LC34
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

-- Location: LC47
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

-- Location: LC35
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

-- Location: LC46
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

-- Location: LC42
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

-- Location: LC68
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

-- Location: LC15
\CPU_CLK|d_e_out\ : max_mcell
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
	pterm0 => \CPU_CLK|d_e_out_pterm0_bus\,
	pterm1 => \CPU_CLK|d_e_out_pterm1_bus\,
	pterm2 => \CPU_CLK|d_e_out_pterm2_bus\,
	pterm3 => \CPU_CLK|d_e_out_pterm3_bus\,
	pterm4 => \CPU_CLK|d_e_out_pterm4_bus\,
	pterm5 => \CPU_CLK|d_e_out_pterm5_bus\,
	pxor => \CPU_CLK|d_e_out_pxor_bus\,
	pclk => \CPU_CLK|d_e_out_pclk_bus\,
	papre => \CPU_CLK|d_e_out_papre_bus\,
	paclr => \CPU_CLK|d_e_out_paclr_bus\,
	pena => \CPU_CLK|d_e_out_pena_bus\,
	dataout => \CPU_CLK|d_e_out~dataout\);

-- Location: LC117
\DATA[0]~284\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[0]~284_pterm0_bus\,
	pterm1 => \DATA[0]~284_pterm1_bus\,
	pterm2 => \DATA[0]~284_pterm2_bus\,
	pterm3 => \DATA[0]~284_pterm3_bus\,
	pterm4 => \DATA[0]~284_pterm4_bus\,
	pterm5 => \DATA[0]~284_pterm5_bus\,
	pxor => \DATA[0]~284_pxor_bus\,
	pclk => \DATA[0]~284_pclk_bus\,
	papre => \DATA[0]~284_papre_bus\,
	paclr => \DATA[0]~284_paclr_bus\,
	pena => \DATA[0]~284_pena_bus\,
	pexpout => \DATA[0]~284_pexpout\);

-- Location: LC118
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
	pexpin => \DATA[0]~284_pexpout\,
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
\DATA[0]~116\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[0]~116_pterm0_bus\,
	pterm1 => \DATA[0]~116_pterm1_bus\,
	pterm2 => \DATA[0]~116_pterm2_bus\,
	pterm3 => \DATA[0]~116_pterm3_bus\,
	pterm4 => \DATA[0]~116_pterm4_bus\,
	pterm5 => \DATA[0]~116_pterm5_bus\,
	pxor => \DATA[0]~116_pxor_bus\,
	pclk => \DATA[0]~116_pclk_bus\,
	papre => \DATA[0]~116_papre_bus\,
	paclr => \DATA[0]~116_paclr_bus\,
	pena => \DATA[0]~116_pena_bus\,
	dataout => \DATA[0]~116_dataout\);

-- Location: LC5
\DATA[7]~127\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~127_pterm0_bus\,
	pterm1 => \DATA[7]~127_pterm1_bus\,
	pterm2 => \DATA[7]~127_pterm2_bus\,
	pterm3 => \DATA[7]~127_pterm3_bus\,
	pterm4 => \DATA[7]~127_pterm4_bus\,
	pterm5 => \DATA[7]~127_pterm5_bus\,
	pxor => \DATA[7]~127_pxor_bus\,
	pclk => \DATA[7]~127_pclk_bus\,
	papre => \DATA[7]~127_papre_bus\,
	paclr => \DATA[7]~127_paclr_bus\,
	pena => \DATA[7]~127_pena_bus\,
	dataout => \DATA[7]~127_dataout\);

-- Location: LC41
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

-- Location: LC104
\DATA[1]~282\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[1]~282_pterm0_bus\,
	pterm1 => \DATA[1]~282_pterm1_bus\,
	pterm2 => \DATA[1]~282_pterm2_bus\,
	pterm3 => \DATA[1]~282_pterm3_bus\,
	pterm4 => \DATA[1]~282_pterm4_bus\,
	pterm5 => \DATA[1]~282_pterm5_bus\,
	pxor => \DATA[1]~282_pxor_bus\,
	pclk => \DATA[1]~282_pclk_bus\,
	papre => \DATA[1]~282_papre_bus\,
	paclr => \DATA[1]~282_paclr_bus\,
	pena => \DATA[1]~282_pena_bus\,
	pexpout => \DATA[1]~282_pexpout\);

-- Location: LC105
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
	pexpin => \DATA[1]~282_pexpout\,
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
\DATA[1]~128\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[1]~128_pterm0_bus\,
	pterm1 => \DATA[1]~128_pterm1_bus\,
	pterm2 => \DATA[1]~128_pterm2_bus\,
	pterm3 => \DATA[1]~128_pterm3_bus\,
	pterm4 => \DATA[1]~128_pterm4_bus\,
	pterm5 => \DATA[1]~128_pterm5_bus\,
	pxor => \DATA[1]~128_pxor_bus\,
	pclk => \DATA[1]~128_pclk_bus\,
	papre => \DATA[1]~128_papre_bus\,
	paclr => \DATA[1]~128_paclr_bus\,
	pena => \DATA[1]~128_pena_bus\,
	dataout => \DATA[1]~128_dataout\);

-- Location: LC36
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

-- Location: LC70
\DATA[2]~286\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[2]~286_pterm0_bus\,
	pterm1 => \DATA[2]~286_pterm1_bus\,
	pterm2 => \DATA[2]~286_pterm2_bus\,
	pterm3 => \DATA[2]~286_pterm3_bus\,
	pterm4 => \DATA[2]~286_pterm4_bus\,
	pterm5 => \DATA[2]~286_pterm5_bus\,
	pxor => \DATA[2]~286_pxor_bus\,
	pclk => \DATA[2]~286_pclk_bus\,
	papre => \DATA[2]~286_papre_bus\,
	paclr => \DATA[2]~286_paclr_bus\,
	pena => \DATA[2]~286_pena_bus\,
	pexpout => \DATA[2]~286_pexpout\);

-- Location: LC71
\SYS_PORT|ra14_latch\ : max_mcell
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
	pexpin => \DATA[2]~286_pexpout\,
	pterm0 => \SYS_PORT|ra14_latch_pterm0_bus\,
	pterm1 => \SYS_PORT|ra14_latch_pterm1_bus\,
	pterm2 => \SYS_PORT|ra14_latch_pterm2_bus\,
	pterm3 => \SYS_PORT|ra14_latch_pterm3_bus\,
	pterm4 => \SYS_PORT|ra14_latch_pterm4_bus\,
	pterm5 => \SYS_PORT|ra14_latch_pterm5_bus\,
	pxor => \SYS_PORT|ra14_latch_pxor_bus\,
	pclk => \SYS_PORT|ra14_latch_pclk_bus\,
	papre => \SYS_PORT|ra14_latch_papre_bus\,
	paclr => \SYS_PORT|ra14_latch_paclr_bus\,
	pena => \SYS_PORT|ra14_latch_pena_bus\,
	dataout => \SYS_PORT|ra14_latch~dataout\);

-- Location: LC86
\DATA[2]~137\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[2]~137_pterm0_bus\,
	pterm1 => \DATA[2]~137_pterm1_bus\,
	pterm2 => \DATA[2]~137_pterm2_bus\,
	pterm3 => \DATA[2]~137_pterm3_bus\,
	pterm4 => \DATA[2]~137_pterm4_bus\,
	pterm5 => \DATA[2]~137_pterm5_bus\,
	pxor => \DATA[2]~137_pxor_bus\,
	pclk => \DATA[2]~137_pclk_bus\,
	papre => \DATA[2]~137_papre_bus\,
	paclr => \DATA[2]~137_paclr_bus\,
	pena => \DATA[2]~137_pena_bus\,
	dataout => \DATA[2]~137_dataout\);

-- Location: LC66
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

-- Location: LC23
\DATA[3]~298\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[3]~298_pterm0_bus\,
	pterm1 => \DATA[3]~298_pterm1_bus\,
	pterm2 => \DATA[3]~298_pterm2_bus\,
	pterm3 => \DATA[3]~298_pterm3_bus\,
	pterm4 => \DATA[3]~298_pterm4_bus\,
	pterm5 => \DATA[3]~298_pterm5_bus\,
	pxor => \DATA[3]~298_pxor_bus\,
	pclk => \DATA[3]~298_pclk_bus\,
	papre => \DATA[3]~298_papre_bus\,
	paclr => \DATA[3]~298_paclr_bus\,
	pena => \DATA[3]~298_pena_bus\,
	pexpout => \DATA[3]~298_pexpout\);

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
	pexpin => \DATA[3]~298_pexpout\,
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

-- Location: LC88
\DATA[3]~138\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "xor",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[3]~138_pterm0_bus\,
	pterm1 => \DATA[3]~138_pterm1_bus\,
	pterm2 => \DATA[3]~138_pterm2_bus\,
	pterm3 => \DATA[3]~138_pterm3_bus\,
	pterm4 => \DATA[3]~138_pterm4_bus\,
	pterm5 => \DATA[3]~138_pterm5_bus\,
	pxor => \DATA[3]~138_pxor_bus\,
	pclk => \DATA[3]~138_pclk_bus\,
	papre => \DATA[3]~138_papre_bus\,
	paclr => \DATA[3]~138_paclr_bus\,
	pena => \DATA[3]~138_pena_bus\,
	dataout => \DATA[3]~138_dataout\);

-- Location: LC80
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

-- Location: LC121
\DATA[4]~296\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[4]~296_pterm0_bus\,
	pterm1 => \DATA[4]~296_pterm1_bus\,
	pterm2 => \DATA[4]~296_pterm2_bus\,
	pterm3 => \DATA[4]~296_pterm3_bus\,
	pterm4 => \DATA[4]~296_pterm4_bus\,
	pterm5 => \DATA[4]~296_pterm5_bus\,
	pxor => \DATA[4]~296_pxor_bus\,
	pclk => \DATA[4]~296_pclk_bus\,
	papre => \DATA[4]~296_papre_bus\,
	paclr => \DATA[4]~296_paclr_bus\,
	pena => \DATA[4]~296_pena_bus\,
	pexpout => \DATA[4]~296_pexpout\);

-- Location: LC122
\SYS_PORT|mux_latch[0]\ : max_mcell
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
	pexpin => \DATA[4]~296_pexpout\,
	pterm0 => \SYS_PORT|mux_latch[0]_pterm0_bus\,
	pterm1 => \SYS_PORT|mux_latch[0]_pterm1_bus\,
	pterm2 => \SYS_PORT|mux_latch[0]_pterm2_bus\,
	pterm3 => \SYS_PORT|mux_latch[0]_pterm3_bus\,
	pterm4 => \SYS_PORT|mux_latch[0]_pterm4_bus\,
	pterm5 => \SYS_PORT|mux_latch[0]_pterm5_bus\,
	pxor => \SYS_PORT|mux_latch[0]_pxor_bus\,
	pclk => \SYS_PORT|mux_latch[0]_pclk_bus\,
	papre => \SYS_PORT|mux_latch[0]_papre_bus\,
	paclr => \SYS_PORT|mux_latch[0]_paclr_bus\,
	pena => \SYS_PORT|mux_latch[0]_pena_bus\,
	dataout => \SYS_PORT|mux_latch\(0));

-- Location: LC91
\DATA[4]~146\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[4]~146_pterm0_bus\,
	pterm1 => \DATA[4]~146_pterm1_bus\,
	pterm2 => \DATA[4]~146_pterm2_bus\,
	pterm3 => \DATA[4]~146_pterm3_bus\,
	pterm4 => \DATA[4]~146_pterm4_bus\,
	pterm5 => \DATA[4]~146_pterm5_bus\,
	pxor => \DATA[4]~146_pxor_bus\,
	pclk => \DATA[4]~146_pclk_bus\,
	papre => \DATA[4]~146_papre_bus\,
	paclr => \DATA[4]~146_paclr_bus\,
	pena => \DATA[4]~146_pena_bus\,
	dataout => \DATA[4]~146_dataout\);

-- Location: SEXP97
\DATA~148sexp\ : max_sexp
PORT MAP (
	datain => \DATA~148sexp_datain_bus\,
	dataout => \DATA~148sexp_dataout\);

-- Location: LC112
\DATA[7]~149\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~149_pterm0_bus\,
	pterm1 => \DATA[7]~149_pterm1_bus\,
	pterm2 => \DATA[7]~149_pterm2_bus\,
	pterm3 => \DATA[7]~149_pterm3_bus\,
	pterm4 => \DATA[7]~149_pterm4_bus\,
	pterm5 => \DATA[7]~149_pterm5_bus\,
	pxor => \DATA[7]~149_pxor_bus\,
	pclk => \DATA[7]~149_pclk_bus\,
	papre => \DATA[7]~149_papre_bus\,
	paclr => \DATA[7]~149_paclr_bus\,
	pena => \DATA[7]~149_pena_bus\,
	dataout => \DATA[7]~149_dataout\);

-- Location: LC48
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

-- Location: LC106
\DATA[5]~294\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[5]~294_pterm0_bus\,
	pterm1 => \DATA[5]~294_pterm1_bus\,
	pterm2 => \DATA[5]~294_pterm2_bus\,
	pterm3 => \DATA[5]~294_pterm3_bus\,
	pterm4 => \DATA[5]~294_pterm4_bus\,
	pterm5 => \DATA[5]~294_pterm5_bus\,
	pxor => \DATA[5]~294_pxor_bus\,
	pclk => \DATA[5]~294_pclk_bus\,
	papre => \DATA[5]~294_papre_bus\,
	paclr => \DATA[5]~294_paclr_bus\,
	pena => \DATA[5]~294_pena_bus\,
	pexpout => \DATA[5]~294_pexpout\);

-- Location: LC107
\SYS_PORT|mux_latch[1]\ : max_mcell
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
	pexpin => \DATA[5]~294_pexpout\,
	pterm0 => \SYS_PORT|mux_latch[1]_pterm0_bus\,
	pterm1 => \SYS_PORT|mux_latch[1]_pterm1_bus\,
	pterm2 => \SYS_PORT|mux_latch[1]_pterm2_bus\,
	pterm3 => \SYS_PORT|mux_latch[1]_pterm3_bus\,
	pterm4 => \SYS_PORT|mux_latch[1]_pterm4_bus\,
	pterm5 => \SYS_PORT|mux_latch[1]_pterm5_bus\,
	pxor => \SYS_PORT|mux_latch[1]_pxor_bus\,
	pclk => \SYS_PORT|mux_latch[1]_pclk_bus\,
	papre => \SYS_PORT|mux_latch[1]_papre_bus\,
	paclr => \SYS_PORT|mux_latch[1]_paclr_bus\,
	pena => \SYS_PORT|mux_latch[1]_pena_bus\,
	dataout => \SYS_PORT|mux_latch\(1));

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

-- Location: LC90
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

-- Location: LC93
\DATA[5]~154\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[5]~154_pterm0_bus\,
	pterm1 => \DATA[5]~154_pterm1_bus\,
	pterm2 => \DATA[5]~154_pterm2_bus\,
	pterm3 => \DATA[5]~154_pterm3_bus\,
	pterm4 => \DATA[5]~154_pterm4_bus\,
	pterm5 => \DATA[5]~154_pterm5_bus\,
	pxor => \DATA[5]~154_pxor_bus\,
	pclk => \DATA[5]~154_pclk_bus\,
	papre => \DATA[5]~154_papre_bus\,
	paclr => \DATA[5]~154_paclr_bus\,
	pena => \DATA[5]~154_pena_bus\,
	dataout => \DATA[5]~154_dataout\);

-- Location: LC45
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

-- Location: LC119
\DATA[6]~292\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[6]~292_pterm0_bus\,
	pterm1 => \DATA[6]~292_pterm1_bus\,
	pterm2 => \DATA[6]~292_pterm2_bus\,
	pterm3 => \DATA[6]~292_pterm3_bus\,
	pterm4 => \DATA[6]~292_pterm4_bus\,
	pterm5 => \DATA[6]~292_pterm5_bus\,
	pxor => \DATA[6]~292_pxor_bus\,
	pclk => \DATA[6]~292_pclk_bus\,
	papre => \DATA[6]~292_papre_bus\,
	paclr => \DATA[6]~292_paclr_bus\,
	pena => \DATA[6]~292_pena_bus\,
	pexpout => \DATA[6]~292_pexpout\);

-- Location: LC120
\SYS_PORT|mux_latch[2]\ : max_mcell
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
	pexpin => \DATA[6]~292_pexpout\,
	pterm0 => \SYS_PORT|mux_latch[2]_pterm0_bus\,
	pterm1 => \SYS_PORT|mux_latch[2]_pterm1_bus\,
	pterm2 => \SYS_PORT|mux_latch[2]_pterm2_bus\,
	pterm3 => \SYS_PORT|mux_latch[2]_pterm3_bus\,
	pterm4 => \SYS_PORT|mux_latch[2]_pterm4_bus\,
	pterm5 => \SYS_PORT|mux_latch[2]_pterm5_bus\,
	pxor => \SYS_PORT|mux_latch[2]_pxor_bus\,
	pclk => \SYS_PORT|mux_latch[2]_pclk_bus\,
	papre => \SYS_PORT|mux_latch[2]_papre_bus\,
	paclr => \SYS_PORT|mux_latch[2]_paclr_bus\,
	pena => \SYS_PORT|mux_latch[2]_pena_bus\,
	dataout => \SYS_PORT|mux_latch\(2));

-- Location: LC59
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

-- Location: LC50
\IO_PORT|busy_latch\ : max_mcell
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
	pterm0 => \IO_PORT|busy_latch_pterm0_bus\,
	pterm1 => \IO_PORT|busy_latch_pterm1_bus\,
	pterm2 => \IO_PORT|busy_latch_pterm2_bus\,
	pterm3 => \IO_PORT|busy_latch_pterm3_bus\,
	pterm4 => \IO_PORT|busy_latch_pterm4_bus\,
	pterm5 => \IO_PORT|busy_latch_pterm5_bus\,
	pxor => \IO_PORT|busy_latch_pxor_bus\,
	pclk => \IO_PORT|busy_latch_pclk_bus\,
	papre => \IO_PORT|busy_latch_papre_bus\,
	paclr => \IO_PORT|busy_latch_paclr_bus\,
	pena => \IO_PORT|busy_latch_pena_bus\,
	dataout => \IO_PORT|busy_latch~dataout\);

-- Location: LC94
\DATA[6]~158\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[6]~158_pterm0_bus\,
	pterm1 => \DATA[6]~158_pterm1_bus\,
	pterm2 => \DATA[6]~158_pterm2_bus\,
	pterm3 => \DATA[6]~158_pterm3_bus\,
	pterm4 => \DATA[6]~158_pterm4_bus\,
	pterm5 => \DATA[6]~158_pterm5_bus\,
	pxor => \DATA[6]~158_pxor_bus\,
	pclk => \DATA[6]~158_pclk_bus\,
	papre => \DATA[6]~158_papre_bus\,
	paclr => \DATA[6]~158_paclr_bus\,
	pena => \DATA[6]~158_pena_bus\,
	dataout => \DATA[6]~158_dataout\);

-- Location: LC37
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

-- Location: LC58
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

-- Location: LC125
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

-- Location: LC97
\DATA[7]~162\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~162_pterm0_bus\,
	pterm1 => \DATA[7]~162_pterm1_bus\,
	pterm2 => \DATA[7]~162_pterm2_bus\,
	pterm3 => \DATA[7]~162_pterm3_bus\,
	pterm4 => \DATA[7]~162_pterm4_bus\,
	pterm5 => \DATA[7]~162_pterm5_bus\,
	pxor => \DATA[7]~162_pxor_bus\,
	pclk => \DATA[7]~162_pclk_bus\,
	papre => \DATA[7]~162_papre_bus\,
	paclr => \DATA[7]~162_paclr_bus\,
	pena => \DATA[7]~162_pena_bus\,
	dataout => \DATA[7]~162_dataout\);

-- Location: LC14
\~GND~0\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \~GND~0_pterm0_bus\,
	pterm1 => \~GND~0_pterm1_bus\,
	pterm2 => \~GND~0_pterm2_bus\,
	pterm3 => \~GND~0_pterm3_bus\,
	pterm4 => \~GND~0_pterm4_bus\,
	pterm5 => \~GND~0_pterm5_bus\,
	pxor => \~GND~0_pxor_bus\,
	pclk => \~GND~0_pclk_bus\,
	papre => \~GND~0_papre_bus\,
	paclr => \~GND~0_paclr_bus\,
	pena => \~GND~0_pena_bus\,
	dataout => \~GND~0~dataout\);

-- Location: LC13
\~GND~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \~GND~1_pterm0_bus\,
	pterm1 => \~GND~1_pterm1_bus\,
	pterm2 => \~GND~1_pterm2_bus\,
	pterm3 => \~GND~1_pterm3_bus\,
	pterm4 => \~GND~1_pterm4_bus\,
	pterm5 => \~GND~1_pterm5_bus\,
	pxor => \~GND~1_pxor_bus\,
	pclk => \~GND~1_pclk_bus\,
	papre => \~GND~1_papre_bus\,
	paclr => \~GND~1_paclr_bus\,
	pena => \~GND~1_pena_bus\,
	dataout => \~GND~1~dataout\);

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
\zrd_n~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \zrd_n~1_pterm0_bus\,
	pterm1 => \zrd_n~1_pterm1_bus\,
	pterm2 => \zrd_n~1_pterm2_bus\,
	pterm3 => \zrd_n~1_pterm3_bus\,
	pterm4 => \zrd_n~1_pterm4_bus\,
	pterm5 => \zrd_n~1_pterm5_bus\,
	pxor => \zrd_n~1_pxor_bus\,
	pclk => \zrd_n~1_pclk_bus\,
	papre => \zrd_n~1_papre_bus\,
	paclr => \zrd_n~1_paclr_bus\,
	pena => \zrd_n~1_pena_bus\,
	dataout => \zrd_n~1_dataout\);

-- Location: LC64
\ADDR_DECODE|auxcs~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|auxcs~3_pterm0_bus\,
	pterm1 => \ADDR_DECODE|auxcs~3_pterm1_bus\,
	pterm2 => \ADDR_DECODE|auxcs~3_pterm2_bus\,
	pterm3 => \ADDR_DECODE|auxcs~3_pterm3_bus\,
	pterm4 => \ADDR_DECODE|auxcs~3_pterm4_bus\,
	pterm5 => \ADDR_DECODE|auxcs~3_pterm5_bus\,
	pxor => \ADDR_DECODE|auxcs~3_pxor_bus\,
	pclk => \ADDR_DECODE|auxcs~3_pclk_bus\,
	papre => \ADDR_DECODE|auxcs~3_papre_bus\,
	paclr => \ADDR_DECODE|auxcs~3_paclr_bus\,
	pena => \ADDR_DECODE|auxcs~3_pena_bus\,
	dataout => \ADDR_DECODE|auxcs~3_dataout\);

-- Location: LC3
\ADDR_DECODE|rtccs~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|rtccs~3_pterm0_bus\,
	pterm1 => \ADDR_DECODE|rtccs~3_pterm1_bus\,
	pterm2 => \ADDR_DECODE|rtccs~3_pterm2_bus\,
	pterm3 => \ADDR_DECODE|rtccs~3_pterm3_bus\,
	pterm4 => \ADDR_DECODE|rtccs~3_pterm4_bus\,
	pterm5 => \ADDR_DECODE|rtccs~3_pterm5_bus\,
	pxor => \ADDR_DECODE|rtccs~3_pxor_bus\,
	pclk => \ADDR_DECODE|rtccs~3_pclk_bus\,
	papre => \ADDR_DECODE|rtccs~3_papre_bus\,
	paclr => \ADDR_DECODE|rtccs~3_paclr_bus\,
	pena => \ADDR_DECODE|rtccs~3_pena_bus\,
	dataout => \ADDR_DECODE|rtccs~3_dataout\);

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

-- Location: LC26
\BAUD_CLK|baud_cnt_b[0]\ : max_mcell
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
	pterm0 => \BAUD_CLK|baud_cnt_b[0]_pterm0_bus\,
	pterm1 => \BAUD_CLK|baud_cnt_b[0]_pterm1_bus\,
	pterm2 => \BAUD_CLK|baud_cnt_b[0]_pterm2_bus\,
	pterm3 => \BAUD_CLK|baud_cnt_b[0]_pterm3_bus\,
	pterm4 => \BAUD_CLK|baud_cnt_b[0]_pterm4_bus\,
	pterm5 => \BAUD_CLK|baud_cnt_b[0]_pterm5_bus\,
	pxor => \BAUD_CLK|baud_cnt_b[0]_pxor_bus\,
	pclk => \BAUD_CLK|baud_cnt_b[0]_pclk_bus\,
	papre => \BAUD_CLK|baud_cnt_b[0]_papre_bus\,
	paclr => \BAUD_CLK|baud_cnt_b[0]_paclr_bus\,
	pena => \BAUD_CLK|baud_cnt_b[0]_pena_bus\,
	dataout => \BAUD_CLK|baud_cnt_b\(0));

-- Location: LC127
\BAUD_CLK|baud_cnt_b[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \WOSC~dataout\,
	pterm0 => \BAUD_CLK|baud_cnt_b[1]_pterm0_bus\,
	pterm1 => \BAUD_CLK|baud_cnt_b[1]_pterm1_bus\,
	pterm2 => \BAUD_CLK|baud_cnt_b[1]_pterm2_bus\,
	pterm3 => \BAUD_CLK|baud_cnt_b[1]_pterm3_bus\,
	pterm4 => \BAUD_CLK|baud_cnt_b[1]_pterm4_bus\,
	pterm5 => \BAUD_CLK|baud_cnt_b[1]_pterm5_bus\,
	pxor => \BAUD_CLK|baud_cnt_b[1]_pxor_bus\,
	pclk => \BAUD_CLK|baud_cnt_b[1]_pclk_bus\,
	papre => \BAUD_CLK|baud_cnt_b[1]_papre_bus\,
	paclr => \BAUD_CLK|baud_cnt_b[1]_paclr_bus\,
	pena => \BAUD_CLK|baud_cnt_b[1]_pena_bus\,
	dataout => \BAUD_CLK|baud_cnt_b\(1));

-- Location: LC69
\BAUD_CLK|baud_drv_b\ : max_mcell
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
	pterm0 => \BAUD_CLK|baud_drv_b_pterm0_bus\,
	pterm1 => \BAUD_CLK|baud_drv_b_pterm1_bus\,
	pterm2 => \BAUD_CLK|baud_drv_b_pterm2_bus\,
	pterm3 => \BAUD_CLK|baud_drv_b_pterm3_bus\,
	pterm4 => \BAUD_CLK|baud_drv_b_pterm4_bus\,
	pterm5 => \BAUD_CLK|baud_drv_b_pterm5_bus\,
	pxor => \BAUD_CLK|baud_drv_b_pxor_bus\,
	pclk => \BAUD_CLK|baud_drv_b_pclk_bus\,
	papre => \BAUD_CLK|baud_drv_b_papre_bus\,
	paclr => \BAUD_CLK|baud_drv_b_paclr_bus\,
	pena => \BAUD_CLK|baud_drv_b_pena_bus\,
	dataout => \BAUD_CLK|baud_drv_b~dataout\);

-- Location: LC20
\BAUD_CLK|baud_cnt_a[0]\ : max_mcell
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
	pterm0 => \BAUD_CLK|baud_cnt_a[0]_pterm0_bus\,
	pterm1 => \BAUD_CLK|baud_cnt_a[0]_pterm1_bus\,
	pterm2 => \BAUD_CLK|baud_cnt_a[0]_pterm2_bus\,
	pterm3 => \BAUD_CLK|baud_cnt_a[0]_pterm3_bus\,
	pterm4 => \BAUD_CLK|baud_cnt_a[0]_pterm4_bus\,
	pterm5 => \BAUD_CLK|baud_cnt_a[0]_pterm5_bus\,
	pxor => \BAUD_CLK|baud_cnt_a[0]_pxor_bus\,
	pclk => \BAUD_CLK|baud_cnt_a[0]_pclk_bus\,
	papre => \BAUD_CLK|baud_cnt_a[0]_papre_bus\,
	paclr => \BAUD_CLK|baud_cnt_a[0]_paclr_bus\,
	pena => \BAUD_CLK|baud_cnt_a[0]_pena_bus\,
	dataout => \BAUD_CLK|baud_cnt_a\(0));

-- Location: LC55
\BAUD_CLK|baud_cnt_a[1]\ : max_mcell
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
	pterm0 => \BAUD_CLK|baud_cnt_a[1]_pterm0_bus\,
	pterm1 => \BAUD_CLK|baud_cnt_a[1]_pterm1_bus\,
	pterm2 => \BAUD_CLK|baud_cnt_a[1]_pterm2_bus\,
	pterm3 => \BAUD_CLK|baud_cnt_a[1]_pterm3_bus\,
	pterm4 => \BAUD_CLK|baud_cnt_a[1]_pterm4_bus\,
	pterm5 => \BAUD_CLK|baud_cnt_a[1]_pterm5_bus\,
	pxor => \BAUD_CLK|baud_cnt_a[1]_pxor_bus\,
	pclk => \BAUD_CLK|baud_cnt_a[1]_pclk_bus\,
	papre => \BAUD_CLK|baud_cnt_a[1]_papre_bus\,
	paclr => \BAUD_CLK|baud_cnt_a[1]_paclr_bus\,
	pena => \BAUD_CLK|baud_cnt_a[1]_pena_bus\,
	dataout => \BAUD_CLK|baud_cnt_a\(1));

-- Location: LC72
\BAUD_CLK|baud_drv_a\ : max_mcell
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
	pterm0 => \BAUD_CLK|baud_drv_a_pterm0_bus\,
	pterm1 => \BAUD_CLK|baud_drv_a_pterm1_bus\,
	pterm2 => \BAUD_CLK|baud_drv_a_pterm2_bus\,
	pterm3 => \BAUD_CLK|baud_drv_a_pterm3_bus\,
	pterm4 => \BAUD_CLK|baud_drv_a_pterm4_bus\,
	pterm5 => \BAUD_CLK|baud_drv_a_pterm5_bus\,
	pxor => \BAUD_CLK|baud_drv_a_pxor_bus\,
	pclk => \BAUD_CLK|baud_drv_a_pclk_bus\,
	papre => \BAUD_CLK|baud_drv_a_papre_bus\,
	paclr => \BAUD_CLK|baud_drv_a_paclr_bus\,
	pena => \BAUD_CLK|baud_drv_a_pena_bus\,
	dataout => \BAUD_CLK|baud_drv_a~dataout\);

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

-- Location: LC49
\ADDR_DECODE|scccs~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|scccs~3_pterm0_bus\,
	pterm1 => \ADDR_DECODE|scccs~3_pterm1_bus\,
	pterm2 => \ADDR_DECODE|scccs~3_pterm2_bus\,
	pterm3 => \ADDR_DECODE|scccs~3_pterm3_bus\,
	pterm4 => \ADDR_DECODE|scccs~3_pterm4_bus\,
	pterm5 => \ADDR_DECODE|scccs~3_pterm5_bus\,
	pxor => \ADDR_DECODE|scccs~3_pxor_bus\,
	pclk => \ADDR_DECODE|scccs~3_pclk_bus\,
	papre => \ADDR_DECODE|scccs~3_papre_bus\,
	paclr => \ADDR_DECODE|scccs~3_paclr_bus\,
	pena => \ADDR_DECODE|scccs~3_pena_bus\,
	dataout => \ADDR_DECODE|scccs~3_dataout\);

-- Location: LC75
\CPU_CLK|e_out~9\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \CPU_CLK|e_out~9_pterm0_bus\,
	pterm1 => \CPU_CLK|e_out~9_pterm1_bus\,
	pterm2 => \CPU_CLK|e_out~9_pterm2_bus\,
	pterm3 => \CPU_CLK|e_out~9_pterm3_bus\,
	pterm4 => \CPU_CLK|e_out~9_pterm4_bus\,
	pterm5 => \CPU_CLK|e_out~9_pterm5_bus\,
	pxor => \CPU_CLK|e_out~9_pxor_bus\,
	pclk => \CPU_CLK|e_out~9_pclk_bus\,
	papre => \CPU_CLK|e_out~9_papre_bus\,
	paclr => \CPU_CLK|e_out~9_paclr_bus\,
	pena => \CPU_CLK|e_out~9_pena_bus\,
	dataout => \CPU_CLK|e_out~9_dataout\);

-- Location: LC65
\zwr_n~4\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \zwr_n~4_pterm0_bus\,
	pterm1 => \zwr_n~4_pterm1_bus\,
	pterm2 => \zwr_n~4_pterm2_bus\,
	pterm3 => \zwr_n~4_pterm3_bus\,
	pterm4 => \zwr_n~4_pterm4_bus\,
	pterm5 => \zwr_n~4_pterm5_bus\,
	pxor => \zwr_n~4_pxor_bus\,
	pclk => \zwr_n~4_pclk_bus\,
	papre => \zwr_n~4_papre_bus\,
	paclr => \zwr_n~4_paclr_bus\,
	pena => \zwr_n~4_pena_bus\,
	dataout => \zwr_n~4_dataout\);

-- Location: LC56
\ADDR_DECODE|ram1cs~4\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|ram1cs~4_pterm0_bus\,
	pterm1 => \ADDR_DECODE|ram1cs~4_pterm1_bus\,
	pterm2 => \ADDR_DECODE|ram1cs~4_pterm2_bus\,
	pterm3 => \ADDR_DECODE|ram1cs~4_pterm3_bus\,
	pterm4 => \ADDR_DECODE|ram1cs~4_pterm4_bus\,
	pterm5 => \ADDR_DECODE|ram1cs~4_pterm5_bus\,
	pxor => \ADDR_DECODE|ram1cs~4_pxor_bus\,
	pclk => \ADDR_DECODE|ram1cs~4_pclk_bus\,
	papre => \ADDR_DECODE|ram1cs~4_papre_bus\,
	paclr => \ADDR_DECODE|ram1cs~4_paclr_bus\,
	pena => \ADDR_DECODE|ram1cs~4_pena_bus\,
	dataout => \ADDR_DECODE|ram1cs~4_dataout\);

-- Location: LC126
\wr_n~6\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \wr_n~6_pterm0_bus\,
	pterm1 => \wr_n~6_pterm1_bus\,
	pterm2 => \wr_n~6_pterm2_bus\,
	pterm3 => \wr_n~6_pterm3_bus\,
	pterm4 => \wr_n~6_pterm4_bus\,
	pterm5 => \wr_n~6_pterm5_bus\,
	pxor => \wr_n~6_pxor_bus\,
	pclk => \wr_n~6_pclk_bus\,
	papre => \wr_n~6_papre_bus\,
	paclr => \wr_n~6_paclr_bus\,
	pena => \wr_n~6_pena_bus\,
	dataout => \wr_n~6_dataout\);

-- Location: LC40
\LED~4\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \LED~4_pterm0_bus\,
	pterm1 => \LED~4_pterm1_bus\,
	pterm2 => \LED~4_pterm2_bus\,
	pterm3 => \LED~4_pterm3_bus\,
	pterm4 => \LED~4_pterm4_bus\,
	pterm5 => \LED~4_pterm5_bus\,
	pxor => \LED~4_pxor_bus\,
	pclk => \LED~4_pclk_bus\,
	papre => \LED~4_papre_bus\,
	paclr => \LED~4_paclr_bus\,
	pena => \LED~4_pena_bus\,
	dataout => \LED~4_dataout\);

-- Location: LC38
\LED~6\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
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

-- Location: LC43
\LED~7\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \LED~7_pterm0_bus\,
	pterm1 => \LED~7_pterm1_bus\,
	pterm2 => \LED~7_pterm2_bus\,
	pterm3 => \LED~7_pterm3_bus\,
	pterm4 => \LED~7_pterm4_bus\,
	pterm5 => \LED~7_pterm5_bus\,
	pxor => \LED~7_pxor_bus\,
	pclk => \LED~7_pclk_bus\,
	papre => \LED~7_papre_bus\,
	paclr => \LED~7_paclr_bus\,
	pena => \LED~7_pena_bus\,
	dataout => \LED~7_dataout\);

-- Location: LC53
\ADDR_DECODE|romcs~3\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|romcs~3_pterm0_bus\,
	pterm1 => \ADDR_DECODE|romcs~3_pterm1_bus\,
	pterm2 => \ADDR_DECODE|romcs~3_pterm2_bus\,
	pterm3 => \ADDR_DECODE|romcs~3_pterm3_bus\,
	pterm4 => \ADDR_DECODE|romcs~3_pterm4_bus\,
	pterm5 => \ADDR_DECODE|romcs~3_pterm5_bus\,
	pxor => \ADDR_DECODE|romcs~3_pxor_bus\,
	pclk => \ADDR_DECODE|romcs~3_pclk_bus\,
	papre => \ADDR_DECODE|romcs~3_papre_bus\,
	paclr => \ADDR_DECODE|romcs~3_paclr_bus\,
	pena => \ADDR_DECODE|romcs~3_pena_bus\,
	dataout => \ADDR_DECODE|romcs~3_dataout\);

-- Location: LC57
\ADDR_DECODE|ram2cs~4\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ADDR_DECODE|ram2cs~4_pterm0_bus\,
	pterm1 => \ADDR_DECODE|ram2cs~4_pterm1_bus\,
	pterm2 => \ADDR_DECODE|ram2cs~4_pterm2_bus\,
	pterm3 => \ADDR_DECODE|ram2cs~4_pterm3_bus\,
	pterm4 => \ADDR_DECODE|ram2cs~4_pterm4_bus\,
	pterm5 => \ADDR_DECODE|ram2cs~4_pterm5_bus\,
	pxor => \ADDR_DECODE|ram2cs~4_pxor_bus\,
	pclk => \ADDR_DECODE|ram2cs~4_pclk_bus\,
	papre => \ADDR_DECODE|ram2cs~4_papre_bus\,
	paclr => \ADDR_DECODE|ram2cs~4_paclr_bus\,
	pena => \ADDR_DECODE|ram2cs~4_pena_bus\,
	dataout => \ADDR_DECODE|ram2cs~4_dataout\);

-- Location: LC16
\ROMP27~8\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \ROMP27~8_pterm0_bus\,
	pterm1 => \ROMP27~8_pterm1_bus\,
	pterm2 => \ROMP27~8_pterm2_bus\,
	pterm3 => \ROMP27~8_pterm3_bus\,
	pterm4 => \ROMP27~8_pterm4_bus\,
	pterm5 => \ROMP27~8_pterm5_bus\,
	pxor => \ROMP27~8_pxor_bus\,
	pclk => \ROMP27~8_pclk_bus\,
	papre => \ROMP27~8_papre_bus\,
	paclr => \ROMP27~8_paclr_bus\,
	pena => \ROMP27~8_pena_bus\,
	dataout => \ROMP27~8_dataout\);

-- Location: LC10
\TP13~24\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \TP13~24_pterm0_bus\,
	pterm1 => \TP13~24_pterm1_bus\,
	pterm2 => \TP13~24_pterm2_bus\,
	pterm3 => \TP13~24_pterm3_bus\,
	pterm4 => \TP13~24_pterm4_bus\,
	pterm5 => \TP13~24_pterm5_bus\,
	pxor => \TP13~24_pxor_bus\,
	pclk => \TP13~24_pclk_bus\,
	papre => \TP13~24_papre_bus\,
	paclr => \TP13~24_paclr_bus\,
	pena => \TP13~24_pena_bus\,
	pexpout => \TP13~24_pexpout\);

-- Location: LC11
\TP13~22\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \TP13~24_pexpout\,
	pterm0 => \TP13~22_pterm0_bus\,
	pterm1 => \TP13~22_pterm1_bus\,
	pterm2 => \TP13~22_pterm2_bus\,
	pterm3 => \TP13~22_pterm3_bus\,
	pterm4 => \TP13~22_pterm4_bus\,
	pterm5 => \TP13~22_pterm5_bus\,
	pxor => \TP13~22_pxor_bus\,
	pclk => \TP13~22_pclk_bus\,
	papre => \TP13~22_papre_bus\,
	paclr => \TP13~22_paclr_bus\,
	pena => \TP13~22_pena_bus\,
	dataout => \TP13~22_dataout\);

-- Location: LC6
\TP14~22\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \TP14~22_pterm0_bus\,
	pterm1 => \TP14~22_pterm1_bus\,
	pterm2 => \TP14~22_pterm2_bus\,
	pterm3 => \TP14~22_pterm3_bus\,
	pterm4 => \TP14~22_pterm4_bus\,
	pterm5 => \TP14~22_pterm5_bus\,
	pxor => \TP14~22_pxor_bus\,
	pclk => \TP14~22_pclk_bus\,
	papre => \TP14~22_papre_bus\,
	paclr => \TP14~22_paclr_bus\,
	pena => \TP14~22_pena_bus\,
	pexpout => \TP14~22_pexpout\);

-- Location: LC7
\TP14~24\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \TP14~22_pexpout\,
	pterm0 => \TP14~24_pterm0_bus\,
	pterm1 => \TP14~24_pterm1_bus\,
	pterm2 => \TP14~24_pterm2_bus\,
	pterm3 => \TP14~24_pterm3_bus\,
	pterm4 => \TP14~24_pterm4_bus\,
	pterm5 => \TP14~24_pterm5_bus\,
	pxor => \TP14~24_pxor_bus\,
	pclk => \TP14~24_pclk_bus\,
	papre => \TP14~24_papre_bus\,
	paclr => \TP14~24_paclr_bus\,
	pena => \TP14~24_pena_bus\,
	pexpout => \TP14~24_pexpout\);

-- Location: LC8
\TP14~20\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \TP14~24_pexpout\,
	pterm0 => \TP14~20_pterm0_bus\,
	pterm1 => \TP14~20_pterm1_bus\,
	pterm2 => \TP14~20_pterm2_bus\,
	pterm3 => \TP14~20_pterm3_bus\,
	pterm4 => \TP14~20_pterm4_bus\,
	pterm5 => \TP14~20_pterm5_bus\,
	pxor => \TP14~20_pxor_bus\,
	pclk => \TP14~20_pclk_bus\,
	papre => \TP14~20_papre_bus\,
	paclr => \TP14~20_paclr_bus\,
	pena => \TP14~20_pena_bus\,
	dataout => \TP14~20_dataout\);

-- Location: LC115
\DATA[0]~315\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[0]~315_pterm0_bus\,
	pterm1 => \DATA[0]~315_pterm1_bus\,
	pterm2 => \DATA[0]~315_pterm2_bus\,
	pterm3 => \DATA[0]~315_pterm3_bus\,
	pterm4 => \DATA[0]~315_pterm4_bus\,
	pterm5 => \DATA[0]~315_pterm5_bus\,
	pxor => \DATA[0]~315_pxor_bus\,
	pclk => \DATA[0]~315_pclk_bus\,
	papre => \DATA[0]~315_papre_bus\,
	paclr => \DATA[0]~315_paclr_bus\,
	pena => \DATA[0]~315_pena_bus\,
	pexpout => \DATA[0]~315_pexpout\);

-- Location: LC116
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
	pexpin => \DATA[0]~315_pexpout\,
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

-- Location: LC60
\DATA[1]~313\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[1]~313_pterm0_bus\,
	pterm1 => \DATA[1]~313_pterm1_bus\,
	pterm2 => \DATA[1]~313_pterm2_bus\,
	pterm3 => \DATA[1]~313_pterm3_bus\,
	pterm4 => \DATA[1]~313_pterm4_bus\,
	pterm5 => \DATA[1]~313_pterm5_bus\,
	pxor => \DATA[1]~313_pxor_bus\,
	pclk => \DATA[1]~313_pclk_bus\,
	papre => \DATA[1]~313_papre_bus\,
	paclr => \DATA[1]~313_paclr_bus\,
	pena => \DATA[1]~313_pena_bus\,
	pexpout => \DATA[1]~313_pexpout\);

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
	pexpin => \DATA[1]~313_pexpout\,
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

-- Location: LC29
\DATA[3]~309\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[3]~309_pterm0_bus\,
	pterm1 => \DATA[3]~309_pterm1_bus\,
	pterm2 => \DATA[3]~309_pterm2_bus\,
	pterm3 => \DATA[3]~309_pterm3_bus\,
	pterm4 => \DATA[3]~309_pterm4_bus\,
	pterm5 => \DATA[3]~309_pterm5_bus\,
	pxor => \DATA[3]~309_pxor_bus\,
	pclk => \DATA[3]~309_pclk_bus\,
	papre => \DATA[3]~309_papre_bus\,
	paclr => \DATA[3]~309_paclr_bus\,
	pena => \DATA[3]~309_pena_bus\,
	pexpout => \DATA[3]~309_pexpout\);

-- Location: LC30
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
	pexpin => \DATA[3]~309_pexpout\,
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

-- Location: LC102
\DATA[2]~311\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[2]~311_pterm0_bus\,
	pterm1 => \DATA[2]~311_pterm1_bus\,
	pterm2 => \DATA[2]~311_pterm2_bus\,
	pterm3 => \DATA[2]~311_pterm3_bus\,
	pterm4 => \DATA[2]~311_pterm4_bus\,
	pterm5 => \DATA[2]~311_pterm5_bus\,
	pxor => \DATA[2]~311_pxor_bus\,
	pclk => \DATA[2]~311_pclk_bus\,
	papre => \DATA[2]~311_papre_bus\,
	paclr => \DATA[2]~311_paclr_bus\,
	pena => \DATA[2]~311_pena_bus\,
	pexpout => \DATA[2]~311_pexpout\);

-- Location: LC103
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
	pexpin => \DATA[2]~311_pexpout\,
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

-- Location: LC17
\SPI_MASTER|MOSI_v~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \SPI_MASTER|MOSI_v~10_pterm0_bus\,
	pterm1 => \SPI_MASTER|MOSI_v~10_pterm1_bus\,
	pterm2 => \SPI_MASTER|MOSI_v~10_pterm2_bus\,
	pterm3 => \SPI_MASTER|MOSI_v~10_pterm3_bus\,
	pterm4 => \SPI_MASTER|MOSI_v~10_pterm4_bus\,
	pterm5 => \SPI_MASTER|MOSI_v~10_pterm5_bus\,
	pxor => \SPI_MASTER|MOSI_v~10_pxor_bus\,
	pclk => \SPI_MASTER|MOSI_v~10_pclk_bus\,
	papre => \SPI_MASTER|MOSI_v~10_papre_bus\,
	paclr => \SPI_MASTER|MOSI_v~10_paclr_bus\,
	pena => \SPI_MASTER|MOSI_v~10_pena_bus\,
	pexpout => \SPI_MASTER|MOSI_v~10_pexpout\);

-- Location: LC18
\SPI_MASTER|MOSI_v~12\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \SPI_MASTER|MOSI_v~10_pexpout\,
	pterm0 => \SPI_MASTER|MOSI_v~12_pterm0_bus\,
	pterm1 => \SPI_MASTER|MOSI_v~12_pterm1_bus\,
	pterm2 => \SPI_MASTER|MOSI_v~12_pterm2_bus\,
	pterm3 => \SPI_MASTER|MOSI_v~12_pterm3_bus\,
	pterm4 => \SPI_MASTER|MOSI_v~12_pterm4_bus\,
	pterm5 => \SPI_MASTER|MOSI_v~12_pterm5_bus\,
	pxor => \SPI_MASTER|MOSI_v~12_pxor_bus\,
	pclk => \SPI_MASTER|MOSI_v~12_pclk_bus\,
	papre => \SPI_MASTER|MOSI_v~12_papre_bus\,
	paclr => \SPI_MASTER|MOSI_v~12_paclr_bus\,
	pena => \SPI_MASTER|MOSI_v~12_pena_bus\,
	pexpout => \SPI_MASTER|MOSI_v~12_pexpout\);

-- Location: SEXP20
\SPI_MASTER|MOSI_v~3\ : max_sexp
PORT MAP (
	datain => \SPI_MASTER|MOSI_v~3_datain_bus\,
	dataout => \SPI_MASTER|MOSI_v~3_dataout\);

-- Location: LC108
\DATA[4]~307\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[4]~307_pterm0_bus\,
	pterm1 => \DATA[4]~307_pterm1_bus\,
	pterm2 => \DATA[4]~307_pterm2_bus\,
	pterm3 => \DATA[4]~307_pterm3_bus\,
	pterm4 => \DATA[4]~307_pterm4_bus\,
	pterm5 => \DATA[4]~307_pterm5_bus\,
	pxor => \DATA[4]~307_pxor_bus\,
	pclk => \DATA[4]~307_pclk_bus\,
	papre => \DATA[4]~307_papre_bus\,
	paclr => \DATA[4]~307_paclr_bus\,
	pena => \DATA[4]~307_pena_bus\,
	pexpout => \DATA[4]~307_pexpout\);

-- Location: LC109
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
	pexpin => \DATA[4]~307_pexpout\,
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

-- Location: LC123
\DATA[5]~305\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[5]~305_pterm0_bus\,
	pterm1 => \DATA[5]~305_pterm1_bus\,
	pterm2 => \DATA[5]~305_pterm2_bus\,
	pterm3 => \DATA[5]~305_pterm3_bus\,
	pterm4 => \DATA[5]~305_pterm4_bus\,
	pterm5 => \DATA[5]~305_pterm5_bus\,
	pxor => \DATA[5]~305_pxor_bus\,
	pclk => \DATA[5]~305_pclk_bus\,
	papre => \DATA[5]~305_papre_bus\,
	paclr => \DATA[5]~305_paclr_bus\,
	pena => \DATA[5]~305_pena_bus\,
	pexpout => \DATA[5]~305_pexpout\);

-- Location: LC124
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
	pexpin => \DATA[5]~305_pexpout\,
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

-- Location: LC110
\DATA[7]~301\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[7]~301_pterm0_bus\,
	pterm1 => \DATA[7]~301_pterm1_bus\,
	pterm2 => \DATA[7]~301_pterm2_bus\,
	pterm3 => \DATA[7]~301_pterm3_bus\,
	pterm4 => \DATA[7]~301_pterm4_bus\,
	pterm5 => \DATA[7]~301_pterm5_bus\,
	pxor => \DATA[7]~301_pxor_bus\,
	pclk => \DATA[7]~301_pclk_bus\,
	papre => \DATA[7]~301_papre_bus\,
	paclr => \DATA[7]~301_paclr_bus\,
	pena => \DATA[7]~301_pena_bus\,
	pexpout => \DATA[7]~301_pexpout\);

-- Location: LC111
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
	pexpin => \DATA[7]~301_pexpout\,
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

-- Location: LC100
\DATA[6]~303\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \DATA[6]~303_pterm0_bus\,
	pterm1 => \DATA[6]~303_pterm1_bus\,
	pterm2 => \DATA[6]~303_pterm2_bus\,
	pterm3 => \DATA[6]~303_pterm3_bus\,
	pterm4 => \DATA[6]~303_pterm4_bus\,
	pterm5 => \DATA[6]~303_pterm5_bus\,
	pxor => \DATA[6]~303_pxor_bus\,
	pclk => \DATA[6]~303_pclk_bus\,
	papre => \DATA[6]~303_papre_bus\,
	paclr => \DATA[6]~303_paclr_bus\,
	pena => \DATA[6]~303_pena_bus\,
	pexpout => \DATA[6]~303_pexpout\);

-- Location: LC101
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
	pexpin => \DATA[6]~303_pexpout\,
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
	pexpin => \SPI_MASTER|MOSI_v~12_pexpout\,
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
\CPU_CLK|q_out~2\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \CPU_CLK|q_out~2_pterm0_bus\,
	pterm1 => \CPU_CLK|q_out~2_pterm1_bus\,
	pterm2 => \CPU_CLK|q_out~2_pterm2_bus\,
	pterm3 => \CPU_CLK|q_out~2_pterm3_bus\,
	pterm4 => \CPU_CLK|q_out~2_pterm4_bus\,
	pterm5 => \CPU_CLK|q_out~2_pterm5_bus\,
	pxor => \CPU_CLK|q_out~2_pxor_bus\,
	pclk => \CPU_CLK|q_out~2_pclk_bus\,
	papre => \CPU_CLK|q_out~2_papre_bus\,
	paclr => \CPU_CLK|q_out~2_paclr_bus\,
	pena => \CPU_CLK|q_out~2_pena_bus\,
	dataout => \CPU_CLK|q_out~2_dataout\);

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
	datain => \~GND~0~dataout\,
	oe => VCC,
	padio => ww_TP11);

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
	datain => \~GND~1~dataout\,
	oe => VCC,
	padio => ww_TP12);

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
	datain => \zrd_n~1_dataout\,
	oe => VCC,
	padio => ww_ZRD);

-- Location: PIN_33
\SPARE~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|auxcs~3_dataout\,
	oe => VCC,
	padio => ww_SPARE);

-- Location: PIN_12
\RTCCS~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \ADDR_DECODE|rtccs~3_dataout\,
	oe => VCC,
	padio => ww_RTCCS);

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
	datain => \BAUD_CLK|baud_drv_b~dataout\,
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
	datain => \BAUD_CLK|baud_drv_a~dataout\,
	oe => VCC,
	padio => ww_ACLK);

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
	datain => \ADDR_DECODE|scccs~3_dataout\,
	oe => VCC,
	padio => ww_SCCCS);

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
	datain => \CPU_CLK|e_out~9_dataout\,
	oe => VCC,
	padio => ww_ECLK);

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
	datain => \zwr_n~4_dataout\,
	oe => VCC,
	padio => ww_ZWR);

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
	datain => \ADDR_DECODE|ram1cs~4_dataout\,
	oe => VCC,
	padio => ww_RAM1CS);

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
	datain => \wr_n~6_dataout\,
	oe => VCC,
	padio => ww_WR);

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
	datain => \LED~4_dataout\,
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
	datain => \LED~7_dataout\,
	oe => VCC,
	padio => ww_LED(2));

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
	datain => \ADDR_DECODE|romcs~3_dataout\,
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
	datain => \ADDR_DECODE|ram2cs~4_dataout\,
	oe => VCC,
	padio => ww_RAM2CS);

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
	datain => \ROMP27~8_dataout\,
	oe => VCC,
	padio => ww_ROMP27);

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
	datain => \TP13~22_dataout\,
	oe => VCC,
	padio => ww_TP13);

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
	datain => \TP14~20_dataout\,
	oe => VCC,
	padio => ww_TP14);

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
	datain => \CPU_CLK|q_out~2_dataout\,
	oe => VCC,
	padio => ww_QCLK);
END structure;


