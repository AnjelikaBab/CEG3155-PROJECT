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

-- DATE "12/04/2024 07:46:57"

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

ENTITY 	nBitShiftRegister IS
    PORT (
	i_resetBar : IN std_logic;
	i_clock : IN std_logic;
	i_load : IN std_logic;
	i_shift_right : IN std_logic;
	i_shift_left : IN std_logic;
	serial_in : IN std_logic;
	parallel_in : IN std_logic_vector(7 DOWNTO 0);
	parallel_out : OUT std_logic_vector(7 DOWNTO 0);
	serial_out : OUT std_logic
	);
END nBitShiftRegister;

-- Design Ports Information
-- parallel_out[0]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[1]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[2]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[3]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[4]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[5]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[6]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[7]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- serial_out	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_shift_left	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clock	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[0]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- serial_in	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_resetBar	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_shift_right	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_load	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[1]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[2]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[3]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[4]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[5]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[6]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_in[7]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF nBitShiftRegister IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_resetBar : std_logic;
SIGNAL ww_i_clock : std_logic;
SIGNAL ww_i_load : std_logic;
SIGNAL ww_i_shift_right : std_logic;
SIGNAL ww_i_shift_left : std_logic;
SIGNAL ww_serial_in : std_logic;
SIGNAL ww_parallel_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_parallel_out : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_serial_out : std_logic;
SIGNAL \i_resetBar~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \parallel_in[0]~input_o\ : std_logic;
SIGNAL \parallel_in[1]~input_o\ : std_logic;
SIGNAL \parallel_in[2]~input_o\ : std_logic;
SIGNAL \parallel_in[3]~input_o\ : std_logic;
SIGNAL \parallel_in[4]~input_o\ : std_logic;
SIGNAL \parallel_in[5]~input_o\ : std_logic;
SIGNAL \parallel_in[6]~input_o\ : std_logic;
SIGNAL \parallel_out[0]~output_o\ : std_logic;
SIGNAL \parallel_out[1]~output_o\ : std_logic;
SIGNAL \parallel_out[2]~output_o\ : std_logic;
SIGNAL \parallel_out[3]~output_o\ : std_logic;
SIGNAL \parallel_out[4]~output_o\ : std_logic;
SIGNAL \parallel_out[5]~output_o\ : std_logic;
SIGNAL \parallel_out[6]~output_o\ : std_logic;
SIGNAL \parallel_out[7]~output_o\ : std_logic;
SIGNAL \serial_out~output_o\ : std_logic;
SIGNAL \i_clock~input_o\ : std_logic;
SIGNAL \i_clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_shift_left~input_o\ : std_logic;
SIGNAL \serial_in~input_o\ : std_logic;
SIGNAL \regloop:0:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \regloop:1:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \regloop:2:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \regloop:3:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \regloop:4:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \regloop:5:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \regloop:6:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \parallel_in[7]~input_o\ : std_logic;
SIGNAL \regloop:7:bit_n|int_q~0_combout\ : std_logic;
SIGNAL \mux_msb|mux2|selX0~combout\ : std_logic;
SIGNAL \i_resetBar~input_o\ : std_logic;
SIGNAL \i_resetBar~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_shift_right~input_o\ : std_logic;
SIGNAL \i_load~input_o\ : std_logic;
SIGNAL \int_enable~0_combout\ : std_logic;
SIGNAL \regloop:7:bit_n|int_q~q\ : std_logic;
SIGNAL \muxloop:6:mux_n|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:6:bit_n|int_q~q\ : std_logic;
SIGNAL \muxloop:5:mux_n|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:5:bit_n|int_q~q\ : std_logic;
SIGNAL \muxloop:4:mux_n|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:4:bit_n|int_q~q\ : std_logic;
SIGNAL \muxloop:3:mux_n|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:3:bit_n|int_q~q\ : std_logic;
SIGNAL \muxloop:2:mux_n|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:2:bit_n|int_q~q\ : std_logic;
SIGNAL \muxloop:1:mux_n|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:1:bit_n|int_q~q\ : std_logic;
SIGNAL \mux_0|mux2|selX0~combout\ : std_logic;
SIGNAL \regloop:0:bit_n|int_q~q\ : std_logic;
SIGNAL \serial_out~0_combout\ : std_logic;

BEGIN

ww_i_resetBar <= i_resetBar;
ww_i_clock <= i_clock;
ww_i_load <= i_load;
ww_i_shift_right <= i_shift_right;
ww_i_shift_left <= i_shift_left;
ww_serial_in <= serial_in;
ww_parallel_in <= parallel_in;
parallel_out <= ww_parallel_out;
serial_out <= ww_serial_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\i_resetBar~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_resetBar~input_o\);

\i_clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_clock~input_o\);

-- Location: IOIBUF_X5_Y73_N1
\parallel_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(0),
	o => \parallel_in[0]~input_o\);

-- Location: IOIBUF_X1_Y73_N1
\parallel_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(1),
	o => \parallel_in[1]~input_o\);

-- Location: IOIBUF_X1_Y73_N15
\parallel_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(2),
	o => \parallel_in[2]~input_o\);

-- Location: IOIBUF_X0_Y69_N8
\parallel_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(3),
	o => \parallel_in[3]~input_o\);

-- Location: IOIBUF_X1_Y73_N8
\parallel_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(4),
	o => \parallel_in[4]~input_o\);

-- Location: IOIBUF_X0_Y67_N22
\parallel_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(5),
	o => \parallel_in[5]~input_o\);

-- Location: IOIBUF_X9_Y73_N8
\parallel_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(6),
	o => \parallel_in[6]~input_o\);

-- Location: IOOBUF_X1_Y73_N23
\parallel_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:0:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[0]~output_o\);

-- Location: IOOBUF_X0_Y66_N16
\parallel_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:1:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[1]~output_o\);

-- Location: IOOBUF_X0_Y68_N2
\parallel_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:2:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[2]~output_o\);

-- Location: IOOBUF_X0_Y66_N23
\parallel_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:3:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[3]~output_o\);

-- Location: IOOBUF_X7_Y73_N16
\parallel_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:4:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[4]~output_o\);

-- Location: IOOBUF_X5_Y73_N23
\parallel_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:5:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[5]~output_o\);

-- Location: IOOBUF_X0_Y68_N16
\parallel_out[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:6:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[6]~output_o\);

-- Location: IOOBUF_X0_Y68_N9
\parallel_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \regloop:7:bit_n|int_q~q\,
	devoe => ww_devoe,
	o => \parallel_out[7]~output_o\);

-- Location: IOOBUF_X0_Y67_N16
\serial_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \serial_out~0_combout\,
	devoe => ww_devoe,
	o => \serial_out~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\i_clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clock,
	o => \i_clock~input_o\);

-- Location: CLKCTRL_G2
\i_clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X3_Y73_N22
\i_shift_left~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_shift_left,
	o => \i_shift_left~input_o\);

-- Location: IOIBUF_X7_Y73_N22
\serial_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serial_in,
	o => \serial_in~input_o\);

-- Location: LCCOMB_X1_Y69_N0
\regloop:0:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:0:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\serial_in~input_o\))) # (!\i_shift_left~input_o\ & (\parallel_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[0]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \serial_in~input_o\,
	combout => \regloop:0:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X1_Y69_N10
\regloop:1:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:1:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\regloop:0:bit_n|int_q~q\))) # (!\i_shift_left~input_o\ & (\parallel_in[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[1]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \regloop:0:bit_n|int_q~q\,
	combout => \regloop:1:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X1_Y69_N12
\regloop:2:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:2:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\regloop:1:bit_n|int_q~q\))) # (!\i_shift_left~input_o\ & (\parallel_in[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[2]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \regloop:1:bit_n|int_q~q\,
	combout => \regloop:2:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X1_Y69_N6
\regloop:3:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:3:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\regloop:2:bit_n|int_q~q\))) # (!\i_shift_left~input_o\ & (\parallel_in[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[3]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \regloop:2:bit_n|int_q~q\,
	combout => \regloop:3:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X1_Y69_N28
\regloop:4:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:4:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\regloop:3:bit_n|int_q~q\))) # (!\i_shift_left~input_o\ & (\parallel_in[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[4]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \regloop:3:bit_n|int_q~q\,
	combout => \regloop:4:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X1_Y69_N18
\regloop:5:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:5:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\regloop:4:bit_n|int_q~q\))) # (!\i_shift_left~input_o\ & (\parallel_in[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[5]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \regloop:4:bit_n|int_q~q\,
	combout => \regloop:5:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X1_Y69_N20
\regloop:6:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:6:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & ((\regloop:5:bit_n|int_q~q\))) # (!\i_shift_left~input_o\ & (\parallel_in[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \parallel_in[6]~input_o\,
	datab => \i_shift_left~input_o\,
	datad => \regloop:5:bit_n|int_q~q\,
	combout => \regloop:6:bit_n|int_q~0_combout\);

-- Location: IOIBUF_X5_Y73_N8
\parallel_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_parallel_in(7),
	o => \parallel_in[7]~input_o\);

-- Location: LCCOMB_X1_Y69_N2
\regloop:7:bit_n|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \regloop:7:bit_n|int_q~0_combout\ = (\i_shift_left~input_o\ & (\regloop:6:bit_n|int_q~q\)) # (!\i_shift_left~input_o\ & ((\parallel_in[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regloop:6:bit_n|int_q~q\,
	datab => \i_shift_left~input_o\,
	datad => \parallel_in[7]~input_o\,
	combout => \regloop:7:bit_n|int_q~0_combout\);

-- Location: LCCOMB_X2_Y69_N30
\mux_msb|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux_msb|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \serial_in~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_shift_left~input_o\,
	datac => \serial_in~input_o\,
	combout => \mux_msb|mux2|selX0~combout\);

-- Location: IOIBUF_X0_Y36_N15
\i_resetBar~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_resetBar,
	o => \i_resetBar~input_o\);

-- Location: CLKCTRL_G4
\i_resetBar~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_resetBar~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_resetBar~inputclkctrl_outclk\);

-- Location: IOIBUF_X3_Y73_N1
\i_shift_right~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_shift_right,
	o => \i_shift_right~input_o\);

-- Location: IOIBUF_X3_Y73_N8
\i_load~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_load,
	o => \i_load~input_o\);

-- Location: LCCOMB_X2_Y69_N12
\int_enable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_enable~0_combout\ = (\i_shift_right~input_o\) # ((\i_shift_left~input_o\) # (\i_load~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_shift_right~input_o\,
	datac => \i_shift_left~input_o\,
	datad => \i_load~input_o\,
	combout => \int_enable~0_combout\);

-- Location: FF_X1_Y69_N3
\regloop:7:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:7:bit_n|int_q~0_combout\,
	asdata => \mux_msb|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:7:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N26
\muxloop:6:mux_n|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \muxloop:6:mux_n|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:7:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:7:bit_n|int_q~q\,
	combout => \muxloop:6:mux_n|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N21
\regloop:6:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:6:bit_n|int_q~0_combout\,
	asdata => \muxloop:6:mux_n|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:6:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N4
\muxloop:5:mux_n|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \muxloop:5:mux_n|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:6:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:6:bit_n|int_q~q\,
	combout => \muxloop:5:mux_n|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N19
\regloop:5:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:5:bit_n|int_q~0_combout\,
	asdata => \muxloop:5:mux_n|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:5:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N30
\muxloop:4:mux_n|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \muxloop:4:mux_n|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:5:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:5:bit_n|int_q~q\,
	combout => \muxloop:4:mux_n|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N29
\regloop:4:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:4:bit_n|int_q~0_combout\,
	asdata => \muxloop:4:mux_n|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:4:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N24
\muxloop:3:mux_n|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \muxloop:3:mux_n|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:4:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:4:bit_n|int_q~q\,
	combout => \muxloop:3:mux_n|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N7
\regloop:3:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:3:bit_n|int_q~0_combout\,
	asdata => \muxloop:3:mux_n|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:3:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N14
\muxloop:2:mux_n|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \muxloop:2:mux_n|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:3:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:3:bit_n|int_q~q\,
	combout => \muxloop:2:mux_n|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N13
\regloop:2:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:2:bit_n|int_q~0_combout\,
	asdata => \muxloop:2:mux_n|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:2:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N8
\muxloop:1:mux_n|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \muxloop:1:mux_n|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:2:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:2:bit_n|int_q~q\,
	combout => \muxloop:1:mux_n|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N11
\regloop:1:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:1:bit_n|int_q~0_combout\,
	asdata => \muxloop:1:mux_n|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:1:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N22
\mux_0|mux2|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux_0|mux2|selX0~combout\ = (!\i_shift_left~input_o\ & \regloop:1:bit_n|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_shift_left~input_o\,
	datad => \regloop:1:bit_n|int_q~q\,
	combout => \mux_0|mux2|selX0~combout\);

-- Location: FF_X1_Y69_N1
\regloop:0:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clock~inputclkctrl_outclk\,
	d => \regloop:0:bit_n|int_q~0_combout\,
	asdata => \mux_0|mux2|selX0~combout\,
	clrn => \i_resetBar~inputclkctrl_outclk\,
	sload => \i_shift_right~input_o\,
	ena => \int_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \regloop:0:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y69_N16
\serial_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \serial_out~0_combout\ = (\i_shift_left~input_o\ & (\regloop:7:bit_n|int_q~q\)) # (!\i_shift_left~input_o\ & ((\regloop:0:bit_n|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regloop:7:bit_n|int_q~q\,
	datac => \i_shift_left~input_o\,
	datad => \regloop:0:bit_n|int_q~q\,
	combout => \serial_out~0_combout\);

ww_parallel_out(0) <= \parallel_out[0]~output_o\;

ww_parallel_out(1) <= \parallel_out[1]~output_o\;

ww_parallel_out(2) <= \parallel_out[2]~output_o\;

ww_parallel_out(3) <= \parallel_out[3]~output_o\;

ww_parallel_out(4) <= \parallel_out[4]~output_o\;

ww_parallel_out(5) <= \parallel_out[5]~output_o\;

ww_parallel_out(6) <= \parallel_out[6]~output_o\;

ww_parallel_out(7) <= \parallel_out[7]~output_o\;

ww_serial_out <= \serial_out~output_o\;
END structure;


