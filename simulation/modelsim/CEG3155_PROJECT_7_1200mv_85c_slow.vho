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

-- DATE "12/04/2024 12:12:51"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	receiverFSM IS
    PORT (
	sampleCountReached : IN std_logic;
	endData : IN std_logic;
	RXD : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	rsrShift : OUT std_logic;
	Inc : OUT std_logic;
	clrInc : OUT std_logic;
	setRDRF : OUT std_logic
	);
END receiverFSM;

-- Design Ports Information
-- rsrShift	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inc	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clrInc	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setRDRF	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sampleCountReached	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXD	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endData	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF receiverFSM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sampleCountReached : std_logic;
SIGNAL ww_endData : std_logic;
SIGNAL ww_RXD : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_rsrShift : std_logic;
SIGNAL ww_Inc : std_logic;
SIGNAL ww_clrInc : std_logic;
SIGNAL ww_setRDRF : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sampleCountReached~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rsrShift~output_o\ : std_logic;
SIGNAL \Inc~output_o\ : std_logic;
SIGNAL \clrInc~output_o\ : std_logic;
SIGNAL \setRDRF~output_o\ : std_logic;
SIGNAL \RXD~input_o\ : std_logic;
SIGNAL \endData~input_o\ : std_logic;
SIGNAL \int_y1~2_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \y0|int_q~q\ : std_logic;
SIGNAL \int_y0~0_combout\ : std_logic;
SIGNAL \y1|int_q~q\ : std_logic;
SIGNAL \D~0_combout\ : std_logic;
SIGNAL \Inc~0_combout\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_Inc~0_combout\ : std_logic;

BEGIN

ww_sampleCountReached <= sampleCountReached;
ww_endData <= endData;
ww_RXD <= RXD;
ww_clk <= clk;
ww_reset <= reset;
rsrShift <= ww_rsrShift;
Inc <= ww_Inc;
clrInc <= ww_clrInc;
setRDRF <= ww_setRDRF;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_Inc~0_combout\ <= NOT \Inc~0_combout\;

-- Location: IOIBUF_X0_Y68_N8
\sampleCountReached~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sampleCountReached,
	o => \sampleCountReached~input_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOOBUF_X0_Y68_N2
\rsrShift~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \D~0_combout\,
	devoe => ww_devoe,
	o => \rsrShift~output_o\);

-- Location: IOOBUF_X0_Y67_N23
\Inc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Inc~0_combout\,
	devoe => ww_devoe,
	o => \Inc~output_o\);

-- Location: IOOBUF_X0_Y66_N23
\clrInc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Inc~0_combout\,
	devoe => ww_devoe,
	o => \clrInc~output_o\);

-- Location: IOOBUF_X0_Y66_N16
\setRDRF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Inc~0_combout\,
	devoe => ww_devoe,
	o => \setRDRF~output_o\);

-- Location: IOIBUF_X0_Y67_N15
\RXD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RXD,
	o => \RXD~input_o\);

-- Location: IOIBUF_X0_Y68_N15
\endData~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endData,
	o => \endData~input_o\);

-- Location: LCCOMB_X1_Y68_N2
\int_y1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_y1~2_combout\ = (\y0|int_q~q\ & ((\y1|int_q~q\ & ((!\endData~input_o\))) # (!\y1|int_q~q\ & (\sampleCountReached~input_o\)))) # (!\y0|int_q~q\ & (((\y1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sampleCountReached~input_o\,
	datab => \endData~input_o\,
	datac => \y0|int_q~q\,
	datad => \y1|int_q~q\,
	combout => \int_y1~2_combout\);

-- Location: IOIBUF_X0_Y36_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X1_Y68_N3
\y0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \int_y1~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y0|int_q~q\);

-- Location: LCCOMB_X1_Y68_N0
\int_y0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_y0~0_combout\ = (\y1|int_q~q\ & (\sampleCountReached~input_o\ & ((!\y0|int_q~q\)))) # (!\y1|int_q~q\ & ((\y0|int_q~q\ & (!\sampleCountReached~input_o\)) # (!\y0|int_q~q\ & ((!\RXD~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sampleCountReached~input_o\,
	datab => \RXD~input_o\,
	datac => \y1|int_q~q\,
	datad => \y0|int_q~q\,
	combout => \int_y0~0_combout\);

-- Location: FF_X1_Y68_N1
\y1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \int_y0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y1|int_q~q\);

-- Location: LCCOMB_X1_Y68_N16
\D~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \D~0_combout\ = (\y1|int_q~q\ & \y0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y1|int_q~q\,
	datac => \y0|int_q~q\,
	combout => \D~0_combout\);

-- Location: LCCOMB_X1_Y68_N30
\Inc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Inc~0_combout\ = (\y1|int_q~q\) # (\y0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y1|int_q~q\,
	datac => \y0|int_q~q\,
	combout => \Inc~0_combout\);

ww_rsrShift <= \rsrShift~output_o\;

ww_Inc <= \Inc~output_o\;

ww_clrInc <= \clrInc~output_o\;

ww_setRDRF <= \setRDRF~output_o\;
END structure;


