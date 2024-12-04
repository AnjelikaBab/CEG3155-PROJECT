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

-- DATE "12/04/2024 08:04:01"

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

ENTITY 	transmitterFSM IS
    PORT (
	txStart : IN std_logic;
	endData : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	txSel : OUT std_logic_vector(1 DOWNTO 0);
	tsrShift : OUT std_logic;
	TDRE : OUT std_logic;
	tdrLoad : OUT std_logic;
	tsrLoad : OUT std_logic;
	clrInc : OUT std_logic
	);
END transmitterFSM;

-- Design Ports Information
-- txSel[0]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- txSel[1]	=>  Location: PIN_AF2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tsrShift	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TDRE	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tdrLoad	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tsrLoad	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clrInc	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- txStart	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endData	=>  Location: PIN_AC5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF transmitterFSM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_txStart : std_logic;
SIGNAL ww_endData : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_txSel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_tsrShift : std_logic;
SIGNAL ww_TDRE : std_logic;
SIGNAL ww_tdrLoad : std_logic;
SIGNAL ww_tsrLoad : std_logic;
SIGNAL ww_clrInc : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \txStart~input_o\ : std_logic;
SIGNAL \txSel[0]~output_o\ : std_logic;
SIGNAL \txSel[1]~output_o\ : std_logic;
SIGNAL \tsrShift~output_o\ : std_logic;
SIGNAL \TDRE~output_o\ : std_logic;
SIGNAL \tdrLoad~output_o\ : std_logic;
SIGNAL \tsrLoad~output_o\ : std_logic;
SIGNAL \clrInc~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \endData~input_o\ : std_logic;
SIGNAL \i_y1~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \y1|int_q~q\ : std_logic;
SIGNAL \y0|int_q~0_combout\ : std_logic;
SIGNAL \y0|int_q~q\ : std_logic;
SIGNAL \C~0_combout\ : std_logic;
SIGNAL \A~0_combout\ : std_logic;
SIGNAL \tsrLoad~0_combout\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_A~0_combout\ : std_logic;

BEGIN

ww_txStart <= txStart;
ww_endData <= endData;
ww_clk <= clk;
ww_reset <= reset;
txSel <= ww_txSel;
tsrShift <= ww_tsrShift;
TDRE <= ww_TDRE;
tdrLoad <= ww_tdrLoad;
tsrLoad <= ww_tsrLoad;
clrInc <= ww_clrInc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_A~0_combout\ <= NOT \A~0_combout\;

-- Location: IOIBUF_X0_Y4_N8
\txStart~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_txStart,
	o => \txStart~input_o\);

-- Location: IOOBUF_X1_Y0_N16
\txSel[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y0|int_q~q\,
	devoe => ww_devoe,
	o => \txSel[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N2
\txSel[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y1|int_q~q\,
	devoe => ww_devoe,
	o => \txSel[1]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\tsrShift~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C~0_combout\,
	devoe => ww_devoe,
	o => \tsrShift~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\TDRE~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_A~0_combout\,
	devoe => ww_devoe,
	o => \TDRE~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\tdrLoad~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_A~0_combout\,
	devoe => ww_devoe,
	o => \tdrLoad~output_o\);

-- Location: IOOBUF_X0_Y4_N2
\tsrLoad~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tsrLoad~0_combout\,
	devoe => ww_devoe,
	o => \tsrLoad~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\clrInc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_A~0_combout\,
	devoe => ww_devoe,
	o => \clrInc~output_o\);

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

-- Location: IOIBUF_X0_Y5_N15
\endData~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endData,
	o => \endData~input_o\);

-- Location: LCCOMB_X1_Y4_N2
\i_y1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_y1~0_combout\ = (\y0|int_q~q\ & ((!\y1|int_q~q\) # (!\endData~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \endData~input_o\,
	datac => \y1|int_q~q\,
	datad => \y0|int_q~q\,
	combout => \i_y1~0_combout\);

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

-- Location: FF_X1_Y4_N3
\y1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \i_y1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y1|int_q~q\);

-- Location: LCCOMB_X1_Y4_N12
\y0|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \y0|int_q~0_combout\ = (\y0|int_q~q\ & (((!\y1|int_q~q\) # (!\endData~input_o\)))) # (!\y0|int_q~q\ & (\txStart~input_o\ & ((!\y1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txStart~input_o\,
	datab => \endData~input_o\,
	datac => \y0|int_q~q\,
	datad => \y1|int_q~q\,
	combout => \y0|int_q~0_combout\);

-- Location: FF_X1_Y4_N13
\y0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \y0|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y0|int_q~q\);

-- Location: LCCOMB_X1_Y4_N16
\C~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C~0_combout\ = (\y1|int_q~q\ & \y0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y1|int_q~q\,
	datac => \y0|int_q~q\,
	combout => \C~0_combout\);

-- Location: LCCOMB_X1_Y4_N26
\A~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A~0_combout\ = (\y1|int_q~q\) # (\y0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y1|int_q~q\,
	datac => \y0|int_q~q\,
	combout => \A~0_combout\);

-- Location: LCCOMB_X1_Y4_N28
\tsrLoad~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \tsrLoad~0_combout\ = (\y1|int_q~q\ & !\y0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y1|int_q~q\,
	datac => \y0|int_q~q\,
	combout => \tsrLoad~0_combout\);

ww_txSel(0) <= \txSel[0]~output_o\;

ww_txSel(1) <= \txSel[1]~output_o\;

ww_tsrShift <= \tsrShift~output_o\;

ww_TDRE <= \TDRE~output_o\;

ww_tdrLoad <= \tdrLoad~output_o\;

ww_tsrLoad <= \tsrLoad~output_o\;

ww_clrInc <= \clrInc~output_o\;
END structure;


