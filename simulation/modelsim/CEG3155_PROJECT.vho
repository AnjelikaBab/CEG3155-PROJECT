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

-- DATE "12/04/2024 11:20:12"

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

ENTITY 	transmitterTopLevel IS
    PORT (
	clk : IN std_logic;
	txStart : IN std_logic;
	reset : IN std_logic;
	TX_in : IN std_logic_vector(7 DOWNTO 0);
	TDRE : OUT std_logic;
	TX_out : OUT std_logic
	);
END transmitterTopLevel;

-- Design Ports Information
-- TDRE	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_out	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- txStart	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[0]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[1]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[2]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[3]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[4]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[5]	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[6]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_in[7]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF transmitterTopLevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_txStart : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_TX_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_TDRE : std_logic;
SIGNAL ww_TX_out : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \TSR|regloop:1:bit_n|int_q~q\ : std_logic;
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ : std_logic;
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \TSR|regloop:2:bit_n|int_q~q\ : std_logic;
SIGNAL \TDR|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \TSR|muxloop:1:mux_n|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TSR|regloop:3:bit_n|int_q~q\ : std_logic;
SIGNAL \TDR|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \TSR|muxloop:2:mux_n|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TSR|regloop:4:bit_n|int_q~q\ : std_logic;
SIGNAL \TDR|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \TSR|muxloop:3:mux_n|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TSR|regloop:5:bit_n|int_q~q\ : std_logic;
SIGNAL \TDR|reg_n_bits:4:b|int_q~q\ : std_logic;
SIGNAL \TSR|muxloop:4:mux_n|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TSR|regloop:6:bit_n|int_q~q\ : std_logic;
SIGNAL \TDR|reg_n_bits:5:b|int_q~q\ : std_logic;
SIGNAL \TSR|muxloop:5:mux_n|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TSR|regloop:7:bit_n|int_q~q\ : std_logic;
SIGNAL \TDR|reg_n_bits:6:b|int_q~q\ : std_logic;
SIGNAL \TSR|muxloop:6:mux_n|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TDR|reg_n_bits:7:b|int_q~q\ : std_logic;
SIGNAL \TSR|mux_msb|muxfinal|selX0~combout\ : std_logic;
SIGNAL \txStart~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \TX_in[1]~input_o\ : std_logic;
SIGNAL \TX_in[2]~input_o\ : std_logic;
SIGNAL \TX_in[3]~input_o\ : std_logic;
SIGNAL \TX_in[4]~input_o\ : std_logic;
SIGNAL \TX_in[5]~input_o\ : std_logic;
SIGNAL \TX_in[6]~input_o\ : std_logic;
SIGNAL \TX_in[7]~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \TDR|reg_n_bits:2:b|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg_n_bits:3:b|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg_n_bits:4:b|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg_n_bits:5:b|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg_n_bits:7:b|int_q~feeder_combout\ : std_logic;
SIGNAL \TDRE~output_o\ : std_logic;
SIGNAL \TX_out~output_o\ : std_logic;
SIGNAL \fsm|i_y0~1_combout\ : std_logic;
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \incrementer_reset~combout\ : std_logic;
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \fsm|i_y0~2_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \fsm|y0|int_q~q\ : std_logic;
SIGNAL \fsm|y1|int_q~0_combout\ : std_logic;
SIGNAL \fsm|y1|int_q~q\ : std_logic;
SIGNAL \fsm|i_y0~0_combout\ : std_logic;
SIGNAL \TX_in[0]~input_o\ : std_logic;
SIGNAL \fsm|i_y1~0_combout\ : std_logic;
SIGNAL \TDR|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \TSR|mux_0|muxfinal|y~0_combout\ : std_logic;
SIGNAL \TSR|regloop:0:bit_n|int_q~q\ : std_logic;
SIGNAL \txMux|muxfinal|y~combout\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_incrementer_reset~combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_txStart <= txStart;
ww_reset <= reset;
ww_TX_in <= TX_in;
TDRE <= ww_TDRE;
TX_out <= ww_TX_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_incrementer_reset~combout\ <= NOT \incrementer_reset~combout\;

-- Location: FF_X1_Y1_N23
\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\,
	clrn => \ALT_INV_incrementer_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\);

-- Location: FF_X1_Y1_N31
\fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_incrementer_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\);

-- Location: FF_X2_Y1_N11
\TSR|regloop:1:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|muxloop:1:mux_n|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:1:bit_n|int_q~q\);

-- Location: LCCOMB_X1_Y1_N22
\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ = \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\);

-- Location: LCCOMB_X1_Y1_N30
\fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ = \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (((\fsm|y1|int_q~q\ & \fsm|y0|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|y1|int_q~q\,
	datac => \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \fsm|y0|int_q~q\,
	combout => \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: FF_X2_Y1_N21
\TSR|regloop:2:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|muxloop:2:mux_n|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:2:bit_n|int_q~q\);

-- Location: FF_X1_Y1_N11
\TDR|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \TX_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N10
\TSR|muxloop:1:mux_n|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxloop:1:mux_n|muxfinal|y~0_combout\ = (\fsm|y0|int_q~q\ & ((\fsm|y1|int_q~q\ & (\TSR|regloop:2:bit_n|int_q~q\)) # (!\fsm|y1|int_q~q\ & ((\TDR|reg_n_bits:1:b|int_q~q\))))) # (!\fsm|y0|int_q~q\ & (((\TDR|reg_n_bits:1:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datab => \TSR|regloop:2:bit_n|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \TDR|reg_n_bits:1:b|int_q~q\,
	combout => \TSR|muxloop:1:mux_n|muxfinal|y~0_combout\);

-- Location: FF_X2_Y1_N3
\TSR|regloop:3:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|muxloop:3:mux_n|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:3:bit_n|int_q~q\);

-- Location: FF_X1_Y1_N17
\TDR|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TDR|reg_n_bits:2:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N20
\TSR|muxloop:2:mux_n|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxloop:2:mux_n|muxfinal|y~0_combout\ = (\fsm|y0|int_q~q\ & ((\fsm|y1|int_q~q\ & (\TSR|regloop:3:bit_n|int_q~q\)) # (!\fsm|y1|int_q~q\ & ((\TDR|reg_n_bits:2:b|int_q~q\))))) # (!\fsm|y0|int_q~q\ & (((\TDR|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datab => \TSR|regloop:3:bit_n|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \TDR|reg_n_bits:2:b|int_q~q\,
	combout => \TSR|muxloop:2:mux_n|muxfinal|y~0_combout\);

-- Location: FF_X2_Y1_N1
\TSR|regloop:4:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|muxloop:4:mux_n|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:4:bit_n|int_q~q\);

-- Location: FF_X1_Y1_N3
\TDR|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TDR|reg_n_bits:3:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N2
\TSR|muxloop:3:mux_n|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxloop:3:mux_n|muxfinal|y~0_combout\ = (\fsm|y1|int_q~q\ & ((\fsm|y0|int_q~q\ & ((\TSR|regloop:4:bit_n|int_q~q\))) # (!\fsm|y0|int_q~q\ & (\TDR|reg_n_bits:3:b|int_q~q\)))) # (!\fsm|y1|int_q~q\ & (\TDR|reg_n_bits:3:b|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TDR|reg_n_bits:3:b|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \TSR|regloop:4:bit_n|int_q~q\,
	combout => \TSR|muxloop:3:mux_n|muxfinal|y~0_combout\);

-- Location: FF_X2_Y1_N27
\TSR|regloop:5:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|muxloop:5:mux_n|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:5:bit_n|int_q~q\);

-- Location: FF_X1_Y1_N21
\TDR|reg_n_bits:4:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TDR|reg_n_bits:4:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:4:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N0
\TSR|muxloop:4:mux_n|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxloop:4:mux_n|muxfinal|y~0_combout\ = (\fsm|y1|int_q~q\ & ((\fsm|y0|int_q~q\ & (\TSR|regloop:5:bit_n|int_q~q\)) # (!\fsm|y0|int_q~q\ & ((\TDR|reg_n_bits:4:b|int_q~q\))))) # (!\fsm|y1|int_q~q\ & (((\TDR|reg_n_bits:4:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TSR|regloop:5:bit_n|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \TDR|reg_n_bits:4:b|int_q~q\,
	combout => \TSR|muxloop:4:mux_n|muxfinal|y~0_combout\);

-- Location: FF_X2_Y1_N13
\TSR|regloop:6:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|muxloop:6:mux_n|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:6:bit_n|int_q~q\);

-- Location: FF_X1_Y1_N27
\TDR|reg_n_bits:5:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TDR|reg_n_bits:5:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:5:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N26
\TSR|muxloop:5:mux_n|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxloop:5:mux_n|muxfinal|y~0_combout\ = (\fsm|y0|int_q~q\ & ((\fsm|y1|int_q~q\ & ((\TSR|regloop:6:bit_n|int_q~q\))) # (!\fsm|y1|int_q~q\ & (\TDR|reg_n_bits:5:b|int_q~q\)))) # (!\fsm|y0|int_q~q\ & (((\TDR|reg_n_bits:5:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \TDR|reg_n_bits:5:b|int_q~q\,
	datad => \TSR|regloop:6:bit_n|int_q~q\,
	combout => \TSR|muxloop:5:mux_n|muxfinal|y~0_combout\);

-- Location: FF_X2_Y1_N23
\TSR|regloop:7:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|mux_msb|muxfinal|selX0~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:7:bit_n|int_q~q\);

-- Location: FF_X1_Y1_N29
\TDR|reg_n_bits:6:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \TX_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:6:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N12
\TSR|muxloop:6:mux_n|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxloop:6:mux_n|muxfinal|y~0_combout\ = (\fsm|y1|int_q~q\ & ((\fsm|y0|int_q~q\ & (\TSR|regloop:7:bit_n|int_q~q\)) # (!\fsm|y0|int_q~q\ & ((\TDR|reg_n_bits:6:b|int_q~q\))))) # (!\fsm|y1|int_q~q\ & (((\TDR|reg_n_bits:6:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TSR|regloop:7:bit_n|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \TDR|reg_n_bits:6:b|int_q~q\,
	combout => \TSR|muxloop:6:mux_n|muxfinal|y~0_combout\);

-- Location: FF_X1_Y1_N19
\TDR|reg_n_bits:7:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TDR|reg_n_bits:7:b|int_q~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:7:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N22
\TSR|mux_msb|muxfinal|selX0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|mux_msb|muxfinal|selX0~combout\ = (\TDR|reg_n_bits:7:b|int_q~q\ & ((!\fsm|y0|int_q~q\) # (!\fsm|y1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TDR|reg_n_bits:7:b|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \fsm|y0|int_q~q\,
	combout => \TSR|mux_msb|muxfinal|selX0~combout\);

-- Location: IOIBUF_X1_Y0_N8
\txStart~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_txStart,
	o => \txStart~input_o\);

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

-- Location: IOIBUF_X5_Y0_N15
\TX_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(1),
	o => \TX_in[1]~input_o\);

-- Location: IOIBUF_X1_Y0_N1
\TX_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(2),
	o => \TX_in[2]~input_o\);

-- Location: IOIBUF_X3_Y0_N1
\TX_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(3),
	o => \TX_in[3]~input_o\);

-- Location: IOIBUF_X1_Y0_N22
\TX_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(4),
	o => \TX_in[4]~input_o\);

-- Location: IOIBUF_X0_Y4_N1
\TX_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(5),
	o => \TX_in[5]~input_o\);

-- Location: IOIBUF_X0_Y4_N8
\TX_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(6),
	o => \TX_in[6]~input_o\);

-- Location: IOIBUF_X0_Y4_N22
\TX_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(7),
	o => \TX_in[7]~input_o\);

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

-- Location: LCCOMB_X1_Y1_N16
\TDR|reg_n_bits:2:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg_n_bits:2:b|int_q~feeder_combout\ = \TX_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_in[2]~input_o\,
	combout => \TDR|reg_n_bits:2:b|int_q~feeder_combout\);

-- Location: LCCOMB_X1_Y1_N2
\TDR|reg_n_bits:3:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg_n_bits:3:b|int_q~feeder_combout\ = \TX_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_in[3]~input_o\,
	combout => \TDR|reg_n_bits:3:b|int_q~feeder_combout\);

-- Location: LCCOMB_X1_Y1_N20
\TDR|reg_n_bits:4:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg_n_bits:4:b|int_q~feeder_combout\ = \TX_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_in[4]~input_o\,
	combout => \TDR|reg_n_bits:4:b|int_q~feeder_combout\);

-- Location: LCCOMB_X1_Y1_N26
\TDR|reg_n_bits:5:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg_n_bits:5:b|int_q~feeder_combout\ = \TX_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_in[5]~input_o\,
	combout => \TDR|reg_n_bits:5:b|int_q~feeder_combout\);

-- Location: LCCOMB_X1_Y1_N18
\TDR|reg_n_bits:7:b|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg_n_bits:7:b|int_q~feeder_combout\ = \TX_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_in[7]~input_o\,
	combout => \TDR|reg_n_bits:7:b|int_q~feeder_combout\);

-- Location: IOOBUF_X3_Y0_N16
\TDRE~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm|i_y0~0_combout\,
	devoe => ww_devoe,
	o => \TDRE~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\TX_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \txMux|muxfinal|y~combout\,
	devoe => ww_devoe,
	o => \TX_out~output_o\);

-- Location: LCCOMB_X1_Y1_N4
\fsm|i_y0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|i_y0~1_combout\ = (\txStart~input_o\ & (!\fsm|y1|int_q~q\ & !\fsm|y0|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txStart~input_o\,
	datac => \fsm|y1|int_q~q\,
	datad => \fsm|y0|int_q~q\,
	combout => \fsm|i_y0~1_combout\);

-- Location: LCCOMB_X1_Y1_N0
\fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ = \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (((\fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\fsm|y1|int_q~q\ & \fsm|y0|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \fsm|y0|int_q~q\,
	combout => \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: LCCOMB_X1_Y1_N24
incrementer_reset : cycloneive_lcell_comb
-- Equation(s):
-- \incrementer_reset~combout\ = (\reset~input_o\) # ((!\fsm|y0|int_q~q\ & !\fsm|y1|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \fsm|y0|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \incrementer_reset~combout\);

-- Location: FF_X1_Y1_N1
\fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_incrementer_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X1_Y1_N12
\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ = (\fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\fsm|y0|int_q~q\ & (\fsm|y1|int_q~q\ & \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fourBitInc|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \fsm|y0|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \fourBitInc|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	combout => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: LCCOMB_X1_Y1_N8
\fsm|i_y0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|i_y0~2_combout\ = (\fsm|i_y0~1_combout\) # ((\fsm|y1|int_q~q\ & ((!\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\) # (!\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \fsm|i_y0~1_combout\,
	datad => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \fsm|i_y0~2_combout\);

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

-- Location: FF_X1_Y1_N9
\fsm|y0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm|i_y0~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|y0|int_q~q\);

-- Location: LCCOMB_X1_Y1_N6
\fsm|y1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|y1|int_q~0_combout\ = (\fsm|y0|int_q~q\ & (((!\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)) # (!\fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\))) # (!\fsm|y0|int_q~q\ & (((\fsm|y1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datab => \fsm|y0|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \fourBitInc|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \fsm|y1|int_q~0_combout\);

-- Location: FF_X1_Y1_N7
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

-- Location: LCCOMB_X2_Y1_N24
\fsm|i_y0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|i_y0~0_combout\ = (!\fsm|y1|int_q~q\ & !\fsm|y0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsm|y1|int_q~q\,
	datad => \fsm|y0|int_q~q\,
	combout => \fsm|i_y0~0_combout\);

-- Location: IOIBUF_X1_Y0_N15
\TX_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_in(0),
	o => \TX_in[0]~input_o\);

-- Location: LCCOMB_X1_Y1_N14
\fsm|i_y1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|i_y1~0_combout\ = (\fsm|y0|int_q~q\ & !\fsm|y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|y0|int_q~q\,
	datad => \fsm|y1|int_q~q\,
	combout => \fsm|i_y1~0_combout\);

-- Location: FF_X1_Y1_N15
\TDR|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \TX_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \fsm|i_y1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X2_Y1_N18
\TSR|mux_0|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|mux_0|muxfinal|y~0_combout\ = (\fsm|y1|int_q~q\ & ((\fsm|y0|int_q~q\ & (\TSR|regloop:1:bit_n|int_q~q\)) # (!\fsm|y0|int_q~q\ & ((\TDR|reg_n_bits:0:b|int_q~q\))))) # (!\fsm|y1|int_q~q\ & (((\TDR|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TSR|regloop:1:bit_n|int_q~q\,
	datab => \fsm|y1|int_q~q\,
	datac => \fsm|y0|int_q~q\,
	datad => \TDR|reg_n_bits:0:b|int_q~q\,
	combout => \TSR|mux_0|muxfinal|y~0_combout\);

-- Location: FF_X2_Y1_N19
\TSR|regloop:0:bit_n|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \TSR|mux_0|muxfinal|y~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \fsm|y1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|regloop:0:bit_n|int_q~q\);

-- Location: LCCOMB_X2_Y1_N8
\txMux|muxfinal|y\ : cycloneive_lcell_comb
-- Equation(s):
-- \txMux|muxfinal|y~combout\ = ((\fsm|y0|int_q~q\ & \TSR|regloop:0:bit_n|int_q~q\)) # (!\fsm|y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|y0|int_q~q\,
	datac => \fsm|y1|int_q~q\,
	datad => \TSR|regloop:0:bit_n|int_q~q\,
	combout => \txMux|muxfinal|y~combout\);

ww_TDRE <= \TDRE~output_o\;

ww_TX_out <= \TX_out~output_o\;
END structure;


