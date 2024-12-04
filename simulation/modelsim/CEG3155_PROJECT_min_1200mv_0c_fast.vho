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

-- DATE "12/04/2024 16:34:54"

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

ENTITY 	baudRateGenerator IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	baudSel : IN std_logic_vector(2 DOWNTO 0);
	bclk : OUT std_logic;
	bclkx8 : OUT std_logic
	);
END baudRateGenerator;

-- Design Ports Information
-- bclk	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bclkx8	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- baudSel[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- baudSel[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- baudSel[2]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF baudRateGenerator IS
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_baudSel : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_bclk : std_logic;
SIGNAL ww_bclkx8 : std_logic;
SIGNAL \baudMux|muxfinal|y~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \count2|reg|reg_n_bits:7:b|int_q~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:6:b|int_q~q\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:7:b|int_q~q\ : std_logic;
SIGNAL \comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:4:b|int_q~q\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:5:b|int_q~q\ : std_logic;
SIGNAL \comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \comp41|comparatorLoop:0:comparator_n|o_GT~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\ : std_logic;
SIGNAL \comp41|comparatorLoop:0:comparator_n|o_GT~1_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \comp41|comparatorLoop:0:comparator_n|o_GT~2_combout\ : std_logic;
SIGNAL \comp41|comparatorLoop:0:comparator_n|o_GT~3_combout\ : std_logic;
SIGNAL \comp41|comparatorLoop:3:comparator_n|int_GT2~0_combout\ : std_logic;
SIGNAL \comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\ : std_logic;
SIGNAL \count1|adder|loop_add:3:addrn|carryFromBoth~combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:6:b|int_q~0_combout\ : std_logic;
SIGNAL \count1_reset~combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:7:b|int_q~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:7:b|int_q~1_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:4:b|int_q~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:5:b|int_q~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:3:b|int_q~0_combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \comp41|o_AeqB~combout\ : std_logic;
SIGNAL \count1|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \baudSel[0]~input_o\ : std_logic;
SIGNAL \baudSel[2]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \bclk~output_o\ : std_logic;
SIGNAL \bclkx8~output_o\ : std_logic;
SIGNAL \baudSel[1]~input_o\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \baudMux|mux1|muxfinal|y~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:3:b|int_q~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \baudMux|mux1|muxfinal|y~1_combout\ : std_logic;
SIGNAL \baudMux|mux1|muxfinal|y~2_combout\ : std_logic;
SIGNAL \count2|adder|loop_add:3:addrn|carryFromBoth~combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:5:b|int_q~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:5:b|int_q~q\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:4:b|int_q~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:4:b|int_q~q\ : std_logic;
SIGNAL \baudMux|mux2|muxfinal|y~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:7:b|int_q~1_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:7:b|int_q~q\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:6:b|int_q~0_combout\ : std_logic;
SIGNAL \count2|reg|reg_n_bits:6:b|int_q~q\ : std_logic;
SIGNAL \baudMux|mux2|muxfinal|y~1_combout\ : std_logic;
SIGNAL \baudMux|mux2|muxfinal|y~2_combout\ : std_logic;
SIGNAL \baudMux|muxfinal|y~combout\ : std_logic;
SIGNAL \baudMux|muxfinal|y~clkctrl_outclk\ : std_logic;
SIGNAL \count3|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \count3|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \count3|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \count3|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \count3|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \count3|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_count1_reset~combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_baudSel <= baudSel;
bclk <= ww_bclk;
bclkx8 <= ww_bclkx8;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\baudMux|muxfinal|y~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \baudMux|muxfinal|y~combout\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_count1_reset~combout\ <= NOT \count1_reset~combout\;

-- Location: LCCOMB_X29_Y72_N10
\count2|reg|reg_n_bits:7:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:7:b|int_q~0_combout\ = (!\count2|reg|reg_n_bits:6:b|int_q~q\) # (!\count2|reg|reg_n_bits:5:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count2|reg|reg_n_bits:5:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:6:b|int_q~q\,
	combout => \count2|reg|reg_n_bits:7:b|int_q~0_combout\);

-- Location: FF_X27_Y72_N15
\count1|reg|reg_n_bits:6:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \count1|reg|reg_n_bits:6:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:6:b|int_q~q\);

-- Location: FF_X28_Y72_N31
\count1|reg|reg_n_bits:7:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \count1|reg|reg_n_bits:7:b|int_q~1_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:7:b|int_q~q\);

-- Location: LCCOMB_X28_Y72_N8
\comp41|comparatorLoop:4:comparator_n|int_GT1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\ = (!\count1|reg|reg_n_bits:7:b|int_q~q\ & !\count1|reg|reg_n_bits:6:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count1|reg|reg_n_bits:7:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:6:b|int_q~q\,
	combout => \comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\);

-- Location: FF_X27_Y72_N17
\count1|reg|reg_n_bits:4:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \count1|reg|reg_n_bits:4:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:4:b|int_q~q\);

-- Location: FF_X27_Y72_N1
\count1|reg|reg_n_bits:5:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \count1|reg|reg_n_bits:5:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:5:b|int_q~q\);

-- Location: LCCOMB_X27_Y72_N28
\comp41|comparatorLoop:4:comparator_n|int_GT1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\ = (\count1|reg|reg_n_bits:4:b|int_q~q\ & \count1|reg|reg_n_bits:5:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:5:b|int_q~q\,
	combout => \comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\);

-- Location: FF_X27_Y72_N21
\count1|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \count1|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:0:b|int_q~q\);

-- Location: FF_X27_Y72_N25
\count1|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \count1|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X27_Y72_N24
\comp41|comparatorLoop:0:comparator_n|o_GT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:0:comparator_n|o_GT~0_combout\ = (!\count1|reg|reg_n_bits:1:b|int_q~q\ & !\count1|reg|reg_n_bits:0:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count1|reg|reg_n_bits:1:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:0:b|int_q~q\,
	combout => \comp41|comparatorLoop:0:comparator_n|o_GT~0_combout\);

-- Location: FF_X27_Y72_N11
\count1|reg|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \count1|reg|reg_n_bits:3:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X27_Y72_N18
\comp41|comparatorLoop:3:comparator_n|o_LT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\ = (!\count1|reg|reg_n_bits:6:b|int_q~q\ & (!\count1|reg|reg_n_bits:7:b|int_q~q\ & ((!\count1|reg|reg_n_bits:5:b|int_q~q\) # (!\count1|reg|reg_n_bits:3:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count1|reg|reg_n_bits:3:b|int_q~q\,
	datab => \count1|reg|reg_n_bits:6:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:7:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:5:b|int_q~q\,
	combout => \comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\);

-- Location: LCCOMB_X27_Y72_N26
\comp41|comparatorLoop:0:comparator_n|o_GT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:0:comparator_n|o_GT~1_combout\ = (((\comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\ & \comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\)) # (!\comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\)) # 
-- (!\comp41|comparatorLoop:0:comparator_n|o_GT~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\,
	datab => \comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\,
	datac => \comp41|comparatorLoop:0:comparator_n|o_GT~0_combout\,
	datad => \comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\,
	combout => \comp41|comparatorLoop:0:comparator_n|o_GT~1_combout\);

-- Location: FF_X27_Y72_N29
\count1|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \count1|reg|reg_n_bits:2:b|int_q~0_combout\,
	clrn => \ALT_INV_count1_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count1|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X27_Y72_N20
\comp41|comparatorLoop:0:comparator_n|o_GT~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:0:comparator_n|o_GT~2_combout\ = (\count1|reg|reg_n_bits:1:b|int_q~q\) # ((\count1|reg|reg_n_bits:0:b|int_q~q\) # (\count1|reg|reg_n_bits:2:b|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count1|reg|reg_n_bits:1:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:0:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:2:b|int_q~q\,
	combout => \comp41|comparatorLoop:0:comparator_n|o_GT~2_combout\);

-- Location: LCCOMB_X27_Y72_N2
\comp41|comparatorLoop:0:comparator_n|o_GT~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:0:comparator_n|o_GT~3_combout\ = (\comp41|comparatorLoop:0:comparator_n|o_GT~2_combout\ & (((\comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\ & \comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\)) # 
-- (!\comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp41|comparatorLoop:0:comparator_n|o_GT~2_combout\,
	datab => \comp41|comparatorLoop:4:comparator_n|int_GT1~1_combout\,
	datac => \comp41|comparatorLoop:4:comparator_n|int_GT1~0_combout\,
	datad => \comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\,
	combout => \comp41|comparatorLoop:0:comparator_n|o_GT~3_combout\);

-- Location: LCCOMB_X27_Y72_N4
\comp41|comparatorLoop:3:comparator_n|int_GT2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:3:comparator_n|int_GT2~0_combout\ = (!\count1|reg|reg_n_bits:7:b|int_q~q\ & (!\count1|reg|reg_n_bits:6:b|int_q~q\ & ((!\count1|reg|reg_n_bits:5:b|int_q~q\) # (!\count1|reg|reg_n_bits:4:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count1|reg|reg_n_bits:7:b|int_q~q\,
	datab => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:6:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:5:b|int_q~q\,
	combout => \comp41|comparatorLoop:3:comparator_n|int_GT2~0_combout\);

-- Location: LCCOMB_X27_Y72_N12
\comp41|comparatorLoop:0:comparator_n|o_GT~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\ = (\comp41|comparatorLoop:3:comparator_n|int_GT2~0_combout\ & ((\comp41|comparatorLoop:0:comparator_n|o_GT~3_combout\))) # (!\comp41|comparatorLoop:3:comparator_n|int_GT2~0_combout\ & 
-- (\comp41|comparatorLoop:0:comparator_n|o_GT~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \comp41|comparatorLoop:3:comparator_n|int_GT2~0_combout\,
	datac => \comp41|comparatorLoop:0:comparator_n|o_GT~1_combout\,
	datad => \comp41|comparatorLoop:0:comparator_n|o_GT~3_combout\,
	combout => \comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\);

-- Location: LCCOMB_X27_Y72_N22
\count1|adder|loop_add:3:addrn|carryFromBoth\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|adder|loop_add:3:addrn|carryFromBoth~combout\ = (\count1|reg|reg_n_bits:3:b|int_q~q\ & (\count1|reg|reg_n_bits:1:b|int_q~q\ & (\count1|reg|reg_n_bits:0:b|int_q~q\ & \count1|reg|reg_n_bits:2:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count1|reg|reg_n_bits:3:b|int_q~q\,
	datab => \count1|reg|reg_n_bits:1:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:0:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:2:b|int_q~q\,
	combout => \count1|adder|loop_add:3:addrn|carryFromBoth~combout\);

-- Location: LCCOMB_X27_Y72_N14
\count1|reg|reg_n_bits:6:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:6:b|int_q~0_combout\ = \count1|reg|reg_n_bits:6:b|int_q~q\ $ (((\count1|reg|reg_n_bits:4:b|int_q~q\ & (\count1|reg|reg_n_bits:5:b|int_q~q\ & \count1|adder|loop_add:3:addrn|carryFromBoth~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datab => \count1|reg|reg_n_bits:5:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:6:b|int_q~q\,
	datad => \count1|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count1|reg|reg_n_bits:6:b|int_q~0_combout\);

-- Location: LCCOMB_X27_Y72_N6
count1_reset : cycloneive_lcell_comb
-- Equation(s):
-- \count1_reset~combout\ = (\reset~input_o\) # (\comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\,
	combout => \count1_reset~combout\);

-- Location: LCCOMB_X28_Y72_N28
\count1|reg|reg_n_bits:7:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:7:b|int_q~0_combout\ = (!\count1|reg|reg_n_bits:6:b|int_q~q\) # (!\count1|reg|reg_n_bits:4:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:6:b|int_q~q\,
	combout => \count1|reg|reg_n_bits:7:b|int_q~0_combout\);

-- Location: LCCOMB_X28_Y72_N30
\count1|reg|reg_n_bits:7:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:7:b|int_q~1_combout\ = \count1|reg|reg_n_bits:7:b|int_q~q\ $ (((\count1|reg|reg_n_bits:5:b|int_q~q\ & (!\count1|reg|reg_n_bits:7:b|int_q~0_combout\ & \count1|adder|loop_add:3:addrn|carryFromBoth~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count1|reg|reg_n_bits:5:b|int_q~q\,
	datab => \count1|reg|reg_n_bits:7:b|int_q~0_combout\,
	datac => \count1|reg|reg_n_bits:7:b|int_q~q\,
	datad => \count1|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count1|reg|reg_n_bits:7:b|int_q~1_combout\);

-- Location: LCCOMB_X27_Y72_N16
\count1|reg|reg_n_bits:4:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:4:b|int_q~0_combout\ = \count1|reg|reg_n_bits:4:b|int_q~q\ $ (\count1|adder|loop_add:3:addrn|carryFromBoth~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datad => \count1|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count1|reg|reg_n_bits:4:b|int_q~0_combout\);

-- Location: LCCOMB_X27_Y72_N0
\count1|reg|reg_n_bits:5:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:5:b|int_q~0_combout\ = \count1|reg|reg_n_bits:5:b|int_q~q\ $ (((\count1|reg|reg_n_bits:4:b|int_q~q\ & \count1|adder|loop_add:3:addrn|carryFromBoth~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:5:b|int_q~q\,
	datad => \count1|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count1|reg|reg_n_bits:5:b|int_q~0_combout\);

-- Location: LCCOMB_X27_Y72_N10
\count1|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:1:b|int_q~0_combout\ = \count1|reg|reg_n_bits:0:b|int_q~q\ $ (\count1|reg|reg_n_bits:1:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count1|reg|reg_n_bits:0:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:1:b|int_q~q\,
	combout => \count1|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: LCCOMB_X27_Y72_N8
\count1|reg|reg_n_bits:3:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:3:b|int_q~0_combout\ = \count1|reg|reg_n_bits:3:b|int_q~q\ $ (((\count1|reg|reg_n_bits:0:b|int_q~q\ & (\count1|reg|reg_n_bits:1:b|int_q~q\ & \count1|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count1|reg|reg_n_bits:0:b|int_q~q\,
	datab => \count1|reg|reg_n_bits:1:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:2:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:3:b|int_q~q\,
	combout => \count1|reg|reg_n_bits:3:b|int_q~0_combout\);

-- Location: LCCOMB_X27_Y72_N30
\count1|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:2:b|int_q~0_combout\ = \count1|reg|reg_n_bits:2:b|int_q~q\ $ (((\count1|reg|reg_n_bits:1:b|int_q~q\ & \count1|reg|reg_n_bits:0:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count1|reg|reg_n_bits:1:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:0:b|int_q~q\,
	datad => \count1|reg|reg_n_bits:2:b|int_q~q\,
	combout => \count1|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: LCCOMB_X29_Y72_N14
\comp41|o_AeqB\ : cycloneive_lcell_comb
-- Equation(s):
-- \comp41|o_AeqB~combout\ = LCELL((!\comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\ & (((\count1|reg|reg_n_bits:5:b|int_q~q\ & \count1|reg|reg_n_bits:4:b|int_q~q\)) # (!\comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp41|comparatorLoop:3:comparator_n|o_LT~0_combout\,
	datab => \count1|reg|reg_n_bits:5:b|int_q~q\,
	datac => \count1|reg|reg_n_bits:4:b|int_q~q\,
	datad => \comp41|comparatorLoop:0:comparator_n|o_GT~4_combout\,
	combout => \comp41|o_AeqB~combout\);

-- Location: LCCOMB_X28_Y72_N0
\count1|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count1|reg|reg_n_bits:0:b|int_q~0_combout\ = !\count1|reg|reg_n_bits:0:b|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count1|reg|reg_n_bits:0:b|int_q~q\,
	combout => \count1|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: IOIBUF_X29_Y73_N8
\baudSel[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_baudSel(0),
	o => \baudSel[0]~input_o\);

-- Location: IOIBUF_X27_Y73_N22
\baudSel[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_baudSel(2),
	o => \baudSel[2]~input_o\);

-- Location: IOIBUF_X27_Y73_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOOBUF_X83_Y73_N23
\bclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \count3|reg|reg_n_bits:2:b|int_q~q\,
	devoe => ww_devoe,
	o => \bclk~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\bclkx8~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \baudMux|muxfinal|y~combout\,
	devoe => ww_devoe,
	o => \bclkx8~output_o\);

-- Location: IOIBUF_X29_Y73_N1
\baudSel[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_baudSel(1),
	o => \baudSel[1]~input_o\);

-- Location: LCCOMB_X29_Y72_N26
\count2|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:0:b|int_q~0_combout\ = !\count2|reg|reg_n_bits:0:b|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count2|reg|reg_n_bits:0:b|int_q~q\,
	combout => \count2|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: IOIBUF_X0_Y36_N8
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G2
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

-- Location: FF_X29_Y72_N27
\count2|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N18
\count2|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:1:b|int_q~0_combout\ = \count2|reg|reg_n_bits:1:b|int_q~q\ $ (\count2|reg|reg_n_bits:0:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count2|reg|reg_n_bits:1:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:0:b|int_q~q\,
	combout => \count2|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: FF_X29_Y72_N19
\count2|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N22
\baudMux|mux1|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|mux1|muxfinal|y~0_combout\ = (\baudSel[0]~input_o\ & ((!\count2|reg|reg_n_bits:1:b|int_q~q\))) # (!\baudSel[0]~input_o\ & (!\count2|reg|reg_n_bits:0:b|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \baudSel[0]~input_o\,
	datac => \count2|reg|reg_n_bits:0:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:1:b|int_q~q\,
	combout => \baudMux|mux1|muxfinal|y~0_combout\);

-- Location: LCCOMB_X29_Y72_N12
\count2|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:2:b|int_q~0_combout\ = \count2|reg|reg_n_bits:2:b|int_q~q\ $ (((\count2|reg|reg_n_bits:0:b|int_q~q\ & \count2|reg|reg_n_bits:1:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count2|reg|reg_n_bits:0:b|int_q~q\,
	datac => \count2|reg|reg_n_bits:2:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:1:b|int_q~q\,
	combout => \count2|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: FF_X29_Y72_N13
\count2|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:2:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N2
\count2|reg|reg_n_bits:3:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:3:b|int_q~0_combout\ = \count2|reg|reg_n_bits:3:b|int_q~q\ $ (((\count2|reg|reg_n_bits:0:b|int_q~q\ & (\count2|reg|reg_n_bits:2:b|int_q~q\ & \count2|reg|reg_n_bits:1:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count2|reg|reg_n_bits:0:b|int_q~q\,
	datab => \count2|reg|reg_n_bits:2:b|int_q~q\,
	datac => \count2|reg|reg_n_bits:3:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:1:b|int_q~q\,
	combout => \count2|reg|reg_n_bits:3:b|int_q~0_combout\);

-- Location: FF_X29_Y72_N3
\count2|reg|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:3:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N0
\baudMux|mux1|muxfinal|y~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|mux1|muxfinal|y~1_combout\ = (\baudSel[0]~input_o\ & ((!\count2|reg|reg_n_bits:3:b|int_q~q\))) # (!\baudSel[0]~input_o\ & (!\count2|reg|reg_n_bits:2:b|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \baudSel[0]~input_o\,
	datac => \count2|reg|reg_n_bits:2:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:3:b|int_q~q\,
	combout => \baudMux|mux1|muxfinal|y~1_combout\);

-- Location: LCCOMB_X29_Y72_N20
\baudMux|mux1|muxfinal|y~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|mux1|muxfinal|y~2_combout\ = (\baudSel[1]~input_o\ & ((\baudMux|mux1|muxfinal|y~1_combout\))) # (!\baudSel[1]~input_o\ & (\baudMux|mux1|muxfinal|y~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \baudSel[1]~input_o\,
	datac => \baudMux|mux1|muxfinal|y~0_combout\,
	datad => \baudMux|mux1|muxfinal|y~1_combout\,
	combout => \baudMux|mux1|muxfinal|y~2_combout\);

-- Location: LCCOMB_X29_Y72_N16
\count2|adder|loop_add:3:addrn|carryFromBoth\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|adder|loop_add:3:addrn|carryFromBoth~combout\ = (\count2|reg|reg_n_bits:2:b|int_q~q\ & (\count2|reg|reg_n_bits:1:b|int_q~q\ & (\count2|reg|reg_n_bits:0:b|int_q~q\ & \count2|reg|reg_n_bits:3:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count2|reg|reg_n_bits:2:b|int_q~q\,
	datab => \count2|reg|reg_n_bits:1:b|int_q~q\,
	datac => \count2|reg|reg_n_bits:0:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:3:b|int_q~q\,
	combout => \count2|adder|loop_add:3:addrn|carryFromBoth~combout\);

-- Location: LCCOMB_X29_Y72_N4
\count2|reg|reg_n_bits:5:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:5:b|int_q~0_combout\ = \count2|reg|reg_n_bits:5:b|int_q~q\ $ (((\count2|reg|reg_n_bits:4:b|int_q~q\ & \count2|adder|loop_add:3:addrn|carryFromBoth~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count2|reg|reg_n_bits:4:b|int_q~q\,
	datac => \count2|reg|reg_n_bits:5:b|int_q~q\,
	datad => \count2|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count2|reg|reg_n_bits:5:b|int_q~0_combout\);

-- Location: FF_X29_Y72_N5
\count2|reg|reg_n_bits:5:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:5:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:5:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N6
\count2|reg|reg_n_bits:4:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:4:b|int_q~0_combout\ = \count2|reg|reg_n_bits:4:b|int_q~q\ $ (\count2|adder|loop_add:3:addrn|carryFromBoth~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count2|reg|reg_n_bits:4:b|int_q~q\,
	datad => \count2|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count2|reg|reg_n_bits:4:b|int_q~0_combout\);

-- Location: FF_X29_Y72_N7
\count2|reg|reg_n_bits:4:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:4:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:4:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N8
\baudMux|mux2|muxfinal|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|mux2|muxfinal|y~0_combout\ = (\baudSel[0]~input_o\ & (!\count2|reg|reg_n_bits:5:b|int_q~q\)) # (!\baudSel[0]~input_o\ & ((!\count2|reg|reg_n_bits:4:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \baudSel[0]~input_o\,
	datac => \count2|reg|reg_n_bits:5:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:4:b|int_q~q\,
	combout => \baudMux|mux2|muxfinal|y~0_combout\);

-- Location: LCCOMB_X29_Y72_N30
\count2|reg|reg_n_bits:7:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:7:b|int_q~1_combout\ = \count2|reg|reg_n_bits:7:b|int_q~q\ $ (((!\count2|reg|reg_n_bits:7:b|int_q~0_combout\ & (\count2|reg|reg_n_bits:4:b|int_q~q\ & \count2|adder|loop_add:3:addrn|carryFromBoth~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count2|reg|reg_n_bits:7:b|int_q~0_combout\,
	datab => \count2|reg|reg_n_bits:4:b|int_q~q\,
	datac => \count2|reg|reg_n_bits:7:b|int_q~q\,
	datad => \count2|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count2|reg|reg_n_bits:7:b|int_q~1_combout\);

-- Location: FF_X29_Y72_N31
\count2|reg|reg_n_bits:7:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:7:b|int_q~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:7:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N28
\count2|reg|reg_n_bits:6:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count2|reg|reg_n_bits:6:b|int_q~0_combout\ = \count2|reg|reg_n_bits:6:b|int_q~q\ $ (((\count2|reg|reg_n_bits:4:b|int_q~q\ & (\count2|reg|reg_n_bits:5:b|int_q~q\ & \count2|adder|loop_add:3:addrn|carryFromBoth~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count2|reg|reg_n_bits:4:b|int_q~q\,
	datab => \count2|reg|reg_n_bits:5:b|int_q~q\,
	datac => \count2|reg|reg_n_bits:6:b|int_q~q\,
	datad => \count2|adder|loop_add:3:addrn|carryFromBoth~combout\,
	combout => \count2|reg|reg_n_bits:6:b|int_q~0_combout\);

-- Location: FF_X29_Y72_N29
\count2|reg|reg_n_bits:6:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \comp41|o_AeqB~combout\,
	d => \count2|reg|reg_n_bits:6:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count2|reg|reg_n_bits:6:b|int_q~q\);

-- Location: LCCOMB_X29_Y72_N24
\baudMux|mux2|muxfinal|y~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|mux2|muxfinal|y~1_combout\ = (\baudSel[0]~input_o\ & (!\count2|reg|reg_n_bits:7:b|int_q~q\)) # (!\baudSel[0]~input_o\ & ((!\count2|reg|reg_n_bits:6:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \baudSel[0]~input_o\,
	datac => \count2|reg|reg_n_bits:7:b|int_q~q\,
	datad => \count2|reg|reg_n_bits:6:b|int_q~q\,
	combout => \baudMux|mux2|muxfinal|y~1_combout\);

-- Location: LCCOMB_X28_Y72_N24
\baudMux|mux2|muxfinal|y~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|mux2|muxfinal|y~2_combout\ = (\baudSel[1]~input_o\ & ((\baudMux|mux2|muxfinal|y~1_combout\))) # (!\baudSel[1]~input_o\ & (\baudMux|mux2|muxfinal|y~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \baudSel[1]~input_o\,
	datac => \baudMux|mux2|muxfinal|y~0_combout\,
	datad => \baudMux|mux2|muxfinal|y~1_combout\,
	combout => \baudMux|mux2|muxfinal|y~2_combout\);

-- Location: LCCOMB_X28_Y72_N6
\baudMux|muxfinal|y\ : cycloneive_lcell_comb
-- Equation(s):
-- \baudMux|muxfinal|y~combout\ = LCELL((\baudSel[2]~input_o\ & ((!\baudMux|mux2|muxfinal|y~2_combout\))) # (!\baudSel[2]~input_o\ & (!\baudMux|mux1|muxfinal|y~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \baudSel[2]~input_o\,
	datac => \baudMux|mux1|muxfinal|y~2_combout\,
	datad => \baudMux|mux2|muxfinal|y~2_combout\,
	combout => \baudMux|muxfinal|y~combout\);

-- Location: CLKCTRL_G12
\baudMux|muxfinal|y~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \baudMux|muxfinal|y~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \baudMux|muxfinal|y~clkctrl_outclk\);

-- Location: LCCOMB_X83_Y72_N2
\count3|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count3|reg|reg_n_bits:0:b|int_q~0_combout\ = !\count3|reg|reg_n_bits:0:b|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count3|reg|reg_n_bits:0:b|int_q~q\,
	combout => \count3|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: FF_X83_Y72_N3
\count3|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \baudMux|muxfinal|y~clkctrl_outclk\,
	d => \count3|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count3|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X83_Y72_N0
\count3|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count3|reg|reg_n_bits:1:b|int_q~0_combout\ = \count3|reg|reg_n_bits:1:b|int_q~q\ $ (\count3|reg|reg_n_bits:0:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count3|reg|reg_n_bits:1:b|int_q~q\,
	datad => \count3|reg|reg_n_bits:0:b|int_q~q\,
	combout => \count3|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: FF_X83_Y72_N1
\count3|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \baudMux|muxfinal|y~clkctrl_outclk\,
	d => \count3|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count3|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X83_Y72_N12
\count3|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count3|reg|reg_n_bits:2:b|int_q~0_combout\ = \count3|reg|reg_n_bits:2:b|int_q~q\ $ (((\count3|reg|reg_n_bits:1:b|int_q~q\ & \count3|reg|reg_n_bits:0:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count3|reg|reg_n_bits:1:b|int_q~q\,
	datac => \count3|reg|reg_n_bits:2:b|int_q~q\,
	datad => \count3|reg|reg_n_bits:0:b|int_q~q\,
	combout => \count3|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: FF_X83_Y72_N13
\count3|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \baudMux|muxfinal|y~clkctrl_outclk\,
	d => \count3|reg|reg_n_bits:2:b|int_q~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count3|reg|reg_n_bits:2:b|int_q~q\);

ww_bclk <= \bclk~output_o\;

ww_bclkx8 <= \bclkx8~output_o\;
END structure;


