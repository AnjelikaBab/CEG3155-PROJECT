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

-- DATE "12/04/2024 13:27:42"

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

ENTITY 	receiverTopLevel IS
    PORT (
	RXD : IN std_logic;
	clrRDRF : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	RXout : OUT std_logic_vector(7 DOWNTO 0);
	RDRF : OUT std_logic
	);
END receiverTopLevel;

-- Design Ports Information
-- RXout[0]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[1]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[2]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[3]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[4]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[5]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[6]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXout[7]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RDRF	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clrRDRF	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXD	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF receiverTopLevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RXD : std_logic;
SIGNAL ww_clrRDRF : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_RXout : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_RDRF : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RXout[0]~output_o\ : std_logic;
SIGNAL \RXout[1]~output_o\ : std_logic;
SIGNAL \RXout[2]~output_o\ : std_logic;
SIGNAL \RXout[3]~output_o\ : std_logic;
SIGNAL \RXout[4]~output_o\ : std_logic;
SIGNAL \RXout[5]~output_o\ : std_logic;
SIGNAL \RXout[6]~output_o\ : std_logic;
SIGNAL \RXout[7]~output_o\ : std_logic;
SIGNAL \RDRF~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \RXD~input_o\ : std_logic;
SIGNAL \RSR|regloop:7:bit_n|int_q~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \reset_incrementer~combout\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \fsm|w~0_combout\ : std_logic;
SIGNAL \fsm|w~1_combout\ : std_logic;
SIGNAL \fsm|int_y0~0_combout\ : std_logic;
SIGNAL \fsm|y0|int_q~q\ : std_logic;
SIGNAL \fsm|y1|int_q~0_combout\ : std_logic;
SIGNAL \fsm|y1|int_q~q\ : std_logic;
SIGNAL \fsm|rsrShift~combout\ : std_logic;
SIGNAL \RSR|regloop:7:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:6:bit_n|int_q~feeder_combout\ : std_logic;
SIGNAL \RSR|regloop:6:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:5:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:4:bit_n|int_q~feeder_combout\ : std_logic;
SIGNAL \RSR|regloop:4:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:3:bit_n|int_q~feeder_combout\ : std_logic;
SIGNAL \RSR|regloop:3:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:2:bit_n|int_q~feeder_combout\ : std_logic;
SIGNAL \RSR|regloop:2:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:1:bit_n|int_q~q\ : std_logic;
SIGNAL \RSR|regloop:0:bit_n|int_q~feeder_combout\ : std_logic;
SIGNAL \RSR|regloop:0:bit_n|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:0:b|int_q~feeder_combout\ : std_logic;
SIGNAL \rdrf_latch|comb~0_combout\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ : std_logic;
SIGNAL \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \rdrf_latch|comb~1_combout\ : std_logic;
SIGNAL \clrRDRF~input_o\ : std_logic;
SIGNAL \rdrf_latch|int_q~combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:1:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:2:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:3:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:4:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:4:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:5:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:5:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:6:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:6:b|int_q~q\ : std_logic;
SIGNAL \RDR|reg_n_bits:7:b|int_q~feeder_combout\ : std_logic;
SIGNAL \RDR|reg_n_bits:7:b|int_q~q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \rdrf_latch|ALT_INV_int_q~combout\ : std_logic;
SIGNAL \ALT_INV_reset_incrementer~combout\ : std_logic;

BEGIN

ww_RXD <= RXD;
ww_clrRDRF <= clrRDRF;
ww_clk <= clk;
ww_reset <= reset;
RXout <= ww_RXout;
RDRF <= ww_RDRF;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\rdrf_latch|ALT_INV_int_q~combout\ <= NOT \rdrf_latch|int_q~combout\;
\ALT_INV_reset_incrementer~combout\ <= NOT \reset_incrementer~combout\;

-- Location: IOOBUF_X0_Y34_N2
\RXout[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:0:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[0]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\RXout[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:1:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[1]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\RXout[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:2:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[2]~output_o\);

-- Location: IOOBUF_X0_Y32_N16
\RXout[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:3:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[3]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\RXout[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:4:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[4]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\RXout[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:5:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[5]~output_o\);

-- Location: IOOBUF_X0_Y35_N16
\RXout[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:6:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[6]~output_o\);

-- Location: IOOBUF_X0_Y35_N9
\RXout[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RDR|reg_n_bits:7:b|int_q~q\,
	devoe => ww_devoe,
	o => \RXout[7]~output_o\);

-- Location: IOOBUF_X0_Y32_N23
\RDRF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rdrf_latch|int_q~combout\,
	devoe => ww_devoe,
	o => \RDRF~output_o\);

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

-- Location: IOIBUF_X0_Y33_N15
\RXD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RXD,
	o => \RXD~input_o\);

-- Location: LCCOMB_X2_Y34_N28
\RSR|regloop:7:bit_n|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RSR|regloop:7:bit_n|int_q~feeder_combout\ = \RXD~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RXD~input_o\,
	combout => \RSR|regloop:7:bit_n|int_q~feeder_combout\);

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

-- Location: LCCOMB_X2_Y34_N22
\samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ = \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (((\fsm|y0|int_q~q\) # (\fsm|y1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|y0|int_q~q\,
	datac => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: LCCOMB_X2_Y34_N8
reset_incrementer : cycloneive_lcell_comb
-- Equation(s):
-- \reset_incrementer~combout\ = (\reset~input_o\) # ((!\fsm|y1|int_q~q\ & !\fsm|y0|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y1|int_q~q\,
	datab => \reset~input_o\,
	datad => \fsm|y0|int_q~q\,
	combout => \reset_incrementer~combout\);

-- Location: FF_X2_Y34_N23
\samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_reset_incrementer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N14
\samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ = (\samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\fsm|y0|int_q~q\) # (\fsm|y1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datab => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: LCCOMB_X2_Y34_N16
\samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ = \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (\samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\);

-- Location: FF_X2_Y34_N17
\samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\,
	clrn => \ALT_INV_reset_incrementer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X2_Y34_N6
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ = !\rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: FF_X2_Y34_N7
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_reset_incrementer~combout\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X2_Y34_N24
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ = \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (((\fsm|y0|int_q~q\ & (\fsm|y1|int_q~q\ & \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: FF_X2_Y34_N25
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_reset_incrementer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X2_Y34_N14
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ = (\fsm|y1|int_q~q\ & (\rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\fsm|y0|int_q~q\ & \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y1|int_q~q\,
	datab => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: LCCOMB_X2_Y34_N20
\samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ = \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (((\samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\fsm|y0|int_q~q\) # (\fsm|y1|int_q~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: FF_X2_Y34_N21
\samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_reset_incrementer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X2_Y34_N10
\fsm|w~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|w~0_combout\ = (\samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\fsm|y0|int_q~q\ $ (\fsm|y1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \samplingIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \samplingIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \fsm|w~0_combout\);

-- Location: LCCOMB_X2_Y34_N0
\fsm|w~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|w~1_combout\ = (\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\) # ((!\samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & \fsm|w~0_combout\)))) # 
-- (!\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & (!\samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((\fsm|w~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datab => \samplingIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datac => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	datad => \fsm|w~0_combout\,
	combout => \fsm|w~1_combout\);

-- Location: LCCOMB_X2_Y34_N12
\fsm|int_y0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|int_y0~0_combout\ = (\fsm|w~1_combout\ & (((!\fsm|y0|int_q~q\)))) # (!\fsm|w~1_combout\ & (!\fsm|y1|int_q~q\ & ((\fsm|y0|int_q~q\) # (!\RXD~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXD~input_o\,
	datab => \fsm|y1|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \fsm|w~1_combout\,
	combout => \fsm|int_y0~0_combout\);

-- Location: FF_X2_Y34_N13
\fsm|y0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm|int_y0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|y0|int_q~q\);

-- Location: LCCOMB_X2_Y34_N26
\fsm|y1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|y1|int_q~0_combout\ = \fsm|y1|int_q~q\ $ (((\fsm|y0|int_q~q\ & \fsm|w~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|y0|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \fsm|w~1_combout\,
	combout => \fsm|y1|int_q~0_combout\);

-- Location: FF_X2_Y34_N27
\fsm|y1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm|y1|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|y1|int_q~q\);

-- Location: LCCOMB_X2_Y34_N18
\fsm|rsrShift\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|rsrShift~combout\ = (\fsm|y0|int_q~q\ & \fsm|y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \fsm|rsrShift~combout\);

-- Location: FF_X2_Y34_N29
\RSR|regloop:7:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RSR|regloop:7:bit_n|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:7:bit_n|int_q~q\);

-- Location: LCCOMB_X2_Y34_N4
\RSR|regloop:6:bit_n|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RSR|regloop:6:bit_n|int_q~feeder_combout\ = \RSR|regloop:7:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:7:bit_n|int_q~q\,
	combout => \RSR|regloop:6:bit_n|int_q~feeder_combout\);

-- Location: FF_X2_Y34_N5
\RSR|regloop:6:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RSR|regloop:6:bit_n|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:6:bit_n|int_q~q\);

-- Location: FF_X2_Y34_N19
\RSR|regloop:5:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \RSR|regloop:6:bit_n|int_q~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:5:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y34_N24
\RSR|regloop:4:bit_n|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RSR|regloop:4:bit_n|int_q~feeder_combout\ = \RSR|regloop:5:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:5:bit_n|int_q~q\,
	combout => \RSR|regloop:4:bit_n|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N25
\RSR|regloop:4:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RSR|regloop:4:bit_n|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:4:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y34_N10
\RSR|regloop:3:bit_n|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RSR|regloop:3:bit_n|int_q~feeder_combout\ = \RSR|regloop:4:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:4:bit_n|int_q~q\,
	combout => \RSR|regloop:3:bit_n|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N11
\RSR|regloop:3:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RSR|regloop:3:bit_n|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:3:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y34_N16
\RSR|regloop:2:bit_n|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RSR|regloop:2:bit_n|int_q~feeder_combout\ = \RSR|regloop:3:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:3:bit_n|int_q~q\,
	combout => \RSR|regloop:2:bit_n|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N17
\RSR|regloop:2:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RSR|regloop:2:bit_n|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:2:bit_n|int_q~q\);

-- Location: FF_X2_Y34_N9
\RSR|regloop:1:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \RSR|regloop:2:bit_n|int_q~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:1:bit_n|int_q~q\);

-- Location: LCCOMB_X2_Y34_N2
\RSR|regloop:0:bit_n|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RSR|regloop:0:bit_n|int_q~feeder_combout\ = \RSR|regloop:1:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:1:bit_n|int_q~q\,
	combout => \RSR|regloop:0:bit_n|int_q~feeder_combout\);

-- Location: FF_X2_Y34_N3
\RSR|regloop:0:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RSR|regloop:0:bit_n|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|rsrShift~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RSR|regloop:0:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y34_N12
\RDR|reg_n_bits:0:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:0:b|int_q~feeder_combout\ = \RSR|regloop:0:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:0:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:0:b|int_q~feeder_combout\);

-- Location: LCCOMB_X1_Y34_N22
\rdrf_latch|comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rdrf_latch|comb~0_combout\ = (\rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (!\fsm|y0|int_q~q\ & \fsm|y1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datab => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \rdrf_latch|comb~0_combout\);

-- Location: LCCOMB_X2_Y34_N30
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ = \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ $ (\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	datac => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\);

-- Location: FF_X2_Y34_N31
\rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\,
	clrn => \ALT_INV_reset_incrementer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N8
\rdrf_latch|comb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rdrf_latch|comb~1_combout\ = (\rdrf_latch|comb~0_combout\ & \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rdrf_latch|comb~0_combout\,
	datad => \rsrShiftIncrementer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \rdrf_latch|comb~1_combout\);

-- Location: IOIBUF_X0_Y33_N22
\clrRDRF~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clrRDRF,
	o => \clrRDRF~input_o\);

-- Location: LCCOMB_X1_Y34_N20
\rdrf_latch|int_q\ : cycloneive_lcell_comb
-- Equation(s):
-- \rdrf_latch|int_q~combout\ = (!\clrRDRF~input_o\ & ((\rdrf_latch|comb~1_combout\) # (\rdrf_latch|int_q~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rdrf_latch|comb~1_combout\,
	datac => \clrRDRF~input_o\,
	datad => \rdrf_latch|int_q~combout\,
	combout => \rdrf_latch|int_q~combout\);

-- Location: FF_X1_Y34_N13
\RDR|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:0:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N2
\RDR|reg_n_bits:1:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:1:b|int_q~feeder_combout\ = \RSR|regloop:1:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RSR|regloop:1:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:1:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N3
\RDR|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:1:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N28
\RDR|reg_n_bits:2:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:2:b|int_q~feeder_combout\ = \RSR|regloop:2:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:2:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:2:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N29
\RDR|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:2:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N18
\RDR|reg_n_bits:3:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:3:b|int_q~feeder_combout\ = \RSR|regloop:3:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:3:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:3:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N19
\RDR|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:3:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N4
\RDR|reg_n_bits:4:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:4:b|int_q~feeder_combout\ = \RSR|regloop:4:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:4:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:4:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N5
\RDR|reg_n_bits:4:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:4:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:4:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N26
\RDR|reg_n_bits:5:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:5:b|int_q~feeder_combout\ = \RSR|regloop:5:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:5:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:5:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N27
\RDR|reg_n_bits:5:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:5:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:5:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N0
\RDR|reg_n_bits:6:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:6:b|int_q~feeder_combout\ = \RSR|regloop:6:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:6:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:6:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N1
\RDR|reg_n_bits:6:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:6:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:6:b|int_q~q\);

-- Location: LCCOMB_X1_Y34_N6
\RDR|reg_n_bits:7:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RDR|reg_n_bits:7:b|int_q~feeder_combout\ = \RSR|regloop:7:bit_n|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RSR|regloop:7:bit_n|int_q~q\,
	combout => \RDR|reg_n_bits:7:b|int_q~feeder_combout\);

-- Location: FF_X1_Y34_N7
\RDR|reg_n_bits:7:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RDR|reg_n_bits:7:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \rdrf_latch|ALT_INV_int_q~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RDR|reg_n_bits:7:b|int_q~q\);

ww_RXout(0) <= \RXout[0]~output_o\;

ww_RXout(1) <= \RXout[1]~output_o\;

ww_RXout(2) <= \RXout[2]~output_o\;

ww_RXout(3) <= \RXout[3]~output_o\;

ww_RXout(4) <= \RXout[4]~output_o\;

ww_RXout(5) <= \RXout[5]~output_o\;

ww_RXout(6) <= \RXout[6]~output_o\;

ww_RXout(7) <= \RXout[7]~output_o\;

ww_RDRF <= \RDRF~output_o\;
END structure;


