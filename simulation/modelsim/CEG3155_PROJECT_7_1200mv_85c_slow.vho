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

-- DATE "12/04/2024 10:08:03"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	rdrfLatch IS
    PORT (
	i_clear : IN std_logic;
	i_set : IN std_logic;
	o_rdrf : OUT std_logic;
	o_rdrfBar : OUT std_logic
	);
END rdrfLatch;

-- Design Ports Information
-- o_rdrf	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_rdrfBar	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clear	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_set	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF rdrfLatch IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clear : std_logic;
SIGNAL ww_i_set : std_logic;
SIGNAL ww_o_rdrf : std_logic;
SIGNAL ww_o_rdrfBar : std_logic;
SIGNAL \o_rdrf~output_o\ : std_logic;
SIGNAL \o_rdrfBar~output_o\ : std_logic;
SIGNAL \i_set~input_o\ : std_logic;
SIGNAL \i_clear~input_o\ : std_logic;
SIGNAL \int_q~combout\ : std_logic;
SIGNAL \ALT_INV_int_q~combout\ : std_logic;

BEGIN

ww_i_clear <= i_clear;
ww_i_set <= i_set;
o_rdrf <= ww_o_rdrf;
o_rdrfBar <= ww_o_rdrfBar;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_int_q~combout\ <= NOT \int_q~combout\;

-- Location: IOOBUF_X0_Y12_N23
\o_rdrf~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \int_q~combout\,
	devoe => ww_devoe,
	o => \o_rdrf~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\o_rdrfBar~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_int_q~combout\,
	devoe => ww_devoe,
	o => \o_rdrfBar~output_o\);

-- Location: IOIBUF_X0_Y11_N15
\i_set~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_set,
	o => \i_set~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\i_clear~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clear,
	o => \i_clear~input_o\);

-- Location: LCCOMB_X1_Y11_N0
int_q : cycloneive_lcell_comb
-- Equation(s):
-- \int_q~combout\ = (!\i_clear~input_o\ & ((\i_set~input_o\) # (\int_q~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_set~input_o\,
	datab => \i_clear~input_o\,
	datad => \int_q~combout\,
	combout => \int_q~combout\);

ww_o_rdrf <= \o_rdrf~output_o\;

ww_o_rdrfBar <= \o_rdrfBar~output_o\;
END structure;


