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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "12/03/2024 00:43:23"

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

ENTITY 	fsmTopLevel IS
    PORT (
	gclk : IN std_logic;
	greset : IN std_logic;
	i_msc_val : IN std_logic_vector(3 DOWNTO 0);
	i_ssc_val : IN std_logic_vector(3 DOWNTO 0);
	i_sscs : IN std_logic;
	o_mstl : BUFFER std_logic_vector(2 DOWNTO 0);
	o_sstl : BUFFER std_logic_vector(2 DOWNTO 0);
	o_state : BUFFER std_logic_vector(1 DOWNTO 0);
	o_bcd1 : BUFFER std_logic_vector(6 DOWNTO 0);
	o_bcd2 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END fsmTopLevel;

-- Design Ports Information
-- o_mstl[0]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_mstl[1]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_mstl[2]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_sstl[0]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_sstl[1]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_sstl[2]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_state[0]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_state[1]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[0]	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[1]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[2]	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[3]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[4]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[5]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd1[6]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[0]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[1]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[2]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[3]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[4]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[5]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_bcd2[6]	=>  Location: PIN_AB2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_ssc_val[0]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_ssc_val[1]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_ssc_val[2]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_ssc_val[3]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_msc_val[0]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_msc_val[1]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_msc_val[2]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_msc_val[3]	=>  Location: PIN_AB1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gclk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- greset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_sscs	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fsmTopLevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_gclk : std_logic;
SIGNAL ww_greset : std_logic;
SIGNAL ww_i_msc_val : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_i_ssc_val : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_i_sscs : std_logic;
SIGNAL ww_o_mstl : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_o_sstl : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_o_state : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_o_bcd1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_o_bcd2 : std_logic_vector(6 DOWNTO 0);
SIGNAL \greset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \gclk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \o_mstl[0]~output_o\ : std_logic;
SIGNAL \o_mstl[1]~output_o\ : std_logic;
SIGNAL \o_mstl[2]~output_o\ : std_logic;
SIGNAL \o_sstl[0]~output_o\ : std_logic;
SIGNAL \o_sstl[1]~output_o\ : std_logic;
SIGNAL \o_sstl[2]~output_o\ : std_logic;
SIGNAL \o_state[0]~output_o\ : std_logic;
SIGNAL \o_state[1]~output_o\ : std_logic;
SIGNAL \o_bcd1[0]~output_o\ : std_logic;
SIGNAL \o_bcd1[1]~output_o\ : std_logic;
SIGNAL \o_bcd1[2]~output_o\ : std_logic;
SIGNAL \o_bcd1[3]~output_o\ : std_logic;
SIGNAL \o_bcd1[4]~output_o\ : std_logic;
SIGNAL \o_bcd1[5]~output_o\ : std_logic;
SIGNAL \o_bcd1[6]~output_o\ : std_logic;
SIGNAL \o_bcd2[0]~output_o\ : std_logic;
SIGNAL \o_bcd2[1]~output_o\ : std_logic;
SIGNAL \o_bcd2[2]~output_o\ : std_logic;
SIGNAL \o_bcd2[3]~output_o\ : std_logic;
SIGNAL \o_bcd2[4]~output_o\ : std_logic;
SIGNAL \o_bcd2[5]~output_o\ : std_logic;
SIGNAL \o_bcd2[6]~output_o\ : std_logic;
SIGNAL \gclk~input_o\ : std_logic;
SIGNAL \gclk~inputclkctrl_outclk\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \greset~input_o\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \fsmController1|w~3_combout\ : std_logic;
SIGNAL \fsmController1|A~combout\ : std_logic;
SIGNAL \i_sscs~input_o\ : std_logic;
SIGNAL \sscsDebouncer|int_d1Input~0_combout\ : std_logic;
SIGNAL \greset~inputclkctrl_outclk\ : std_logic;
SIGNAL \sscsDebouncer|first|int_q~q\ : std_logic;
SIGNAL \sscsDebouncer|int_d2Input~combout\ : std_logic;
SIGNAL \sscsDebouncer|second|int_q~q\ : std_logic;
SIGNAL \fsmController1|w~1_combout\ : std_logic;
SIGNAL \i_msc_val[1]~input_o\ : std_logic;
SIGNAL \i_msc_val[0]~input_o\ : std_logic;
SIGNAL \i_msc_val[3]~input_o\ : std_logic;
SIGNAL \i_msc_val[2]~input_o\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \mscTimer|comparator|o_AeqB~1_combout\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \mscTimer|comparator|o_AeqB~0_combout\ : std_logic;
SIGNAL \fsmController1|w~2_combout\ : std_logic;
SIGNAL \i_ssc_val[0]~input_o\ : std_logic;
SIGNAL \i_ssc_val[1]~input_o\ : std_logic;
SIGNAL \i_ssc_val[2]~input_o\ : std_logic;
SIGNAL \i_ssc_val[3]~input_o\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ : std_logic;
SIGNAL \sscTimer|comparator|o_AeqB~1_combout\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ : std_logic;
SIGNAL \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \sscTimer|comparator|o_AeqB~0_combout\ : std_logic;
SIGNAL \fsmController1|w~0_combout\ : std_logic;
SIGNAL \fsmController1|w~4_combout\ : std_logic;
SIGNAL \fsmController1|reset_latch|int_q~q\ : std_logic;
SIGNAL \int_rst_timer~combout\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ : std_logic;
SIGNAL \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ : std_logic;
SIGNAL \fsmController1|enardFF_y0|int_q~0_combout\ : std_logic;
SIGNAL \fsmController1|enardFF_y0|int_q~1_combout\ : std_logic;
SIGNAL \fsmController1|enardFF_y0|int_q~q\ : std_logic;
SIGNAL \fsmController1|input_d1~0_combout\ : std_logic;
SIGNAL \fsmController1|enardFF_y1|int_q~q\ : std_logic;
SIGNAL \fsmController1|D~0_combout\ : std_logic;
SIGNAL \fsmController1|D~1_combout\ : std_logic;
SIGNAL \fsmController1|D~2_combout\ : std_logic;
SIGNAL \mscBcd|Mux0~0_combout\ : std_logic;
SIGNAL \mscBcd|Mux1~0_combout\ : std_logic;
SIGNAL \mscBcd|Mux2~0_combout\ : std_logic;
SIGNAL \mscBcd|Mux3~0_combout\ : std_logic;
SIGNAL \mscBcd|Mux4~0_combout\ : std_logic;
SIGNAL \mscBcd|Mux5~0_combout\ : std_logic;
SIGNAL \mscBcd|Mux6~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux0~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux1~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux2~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux3~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux4~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux5~0_combout\ : std_logic;
SIGNAL \sscBcd|Mux6~0_combout\ : std_logic;
SIGNAL \ALT_INV_greset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_int_rst_timer~combout\ : std_logic;
SIGNAL \sscBcd|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \mscBcd|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \fsmController1|ALT_INV_A~combout\ : std_logic;
SIGNAL \fsmController1|enardFF_y1|ALT_INV_int_q~q\ : std_logic;

BEGIN

ww_gclk <= gclk;
ww_greset <= greset;
ww_i_msc_val <= i_msc_val;
ww_i_ssc_val <= i_ssc_val;
ww_i_sscs <= i_sscs;
o_mstl <= ww_o_mstl;
o_sstl <= ww_o_sstl;
o_state <= ww_o_state;
o_bcd1 <= ww_o_bcd1;
o_bcd2 <= ww_o_bcd2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\greset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \greset~input_o\);

\gclk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \gclk~input_o\);
\ALT_INV_greset~inputclkctrl_outclk\ <= NOT \greset~inputclkctrl_outclk\;
\ALT_INV_int_rst_timer~combout\ <= NOT \int_rst_timer~combout\;
\sscBcd|ALT_INV_Mux6~0_combout\ <= NOT \sscBcd|Mux6~0_combout\;
\mscBcd|ALT_INV_Mux6~0_combout\ <= NOT \mscBcd|Mux6~0_combout\;
\fsmController1|ALT_INV_A~combout\ <= NOT \fsmController1|A~combout\;
\fsmController1|enardFF_y1|ALT_INV_int_q~q\ <= NOT \fsmController1|enardFF_y1|int_q~q\;

-- Location: IOOBUF_X0_Y32_N16
\o_mstl[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|enardFF_y1|int_q~q\,
	devoe => ww_devoe,
	o => \o_mstl[0]~output_o\);

-- Location: IOOBUF_X0_Y25_N23
\o_mstl[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|D~0_combout\,
	devoe => ww_devoe,
	o => \o_mstl[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\o_mstl[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|ALT_INV_A~combout\,
	devoe => ww_devoe,
	o => \o_mstl[2]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\o_sstl[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|enardFF_y1|ALT_INV_int_q~q\,
	devoe => ww_devoe,
	o => \o_sstl[0]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\o_sstl[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|D~1_combout\,
	devoe => ww_devoe,
	o => \o_sstl[1]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\o_sstl[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|D~2_combout\,
	devoe => ww_devoe,
	o => \o_sstl[2]~output_o\);

-- Location: IOOBUF_X0_Y29_N23
\o_state[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|enardFF_y0|int_q~q\,
	devoe => ww_devoe,
	o => \o_state[0]~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\o_state[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsmController1|enardFF_y1|int_q~q\,
	devoe => ww_devoe,
	o => \o_state[1]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\o_bcd1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[0]~output_o\);

-- Location: IOOBUF_X0_Y22_N23
\o_bcd1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[1]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\o_bcd1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[2]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\o_bcd1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[3]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\o_bcd1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[4]~output_o\);

-- Location: IOOBUF_X0_Y28_N16
\o_bcd1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[5]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\o_bcd1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mscBcd|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd1[6]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\o_bcd2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[0]~output_o\);

-- Location: IOOBUF_X0_Y30_N9
\o_bcd2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[1]~output_o\);

-- Location: IOOBUF_X0_Y28_N23
\o_bcd2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[2]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\o_bcd2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[3]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\o_bcd2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[4]~output_o\);

-- Location: IOOBUF_X0_Y19_N9
\o_bcd2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[5]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\o_bcd2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sscBcd|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \o_bcd2[6]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\gclk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gclk,
	o => \gclk~input_o\);

-- Location: CLKCTRL_G2
\gclk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \gclk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \gclk~inputclkctrl_outclk\);

-- Location: LCCOMB_X2_Y24_N16
\mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ = \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (\mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datac => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	combout => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: IOIBUF_X0_Y36_N15
\greset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_greset,
	o => \greset~input_o\);

-- Location: LCCOMB_X2_Y24_N28
\mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\ = \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (((\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & 
-- \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datac => \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datad => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	combout => \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\);

-- Location: FF_X2_Y24_N29
\mstTimer|incrementer|reg|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X2_Y24_N2
\fsmController1|w~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|w~3_combout\ = (!\mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & (!\mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\fsmController1|enardFF_y0|int_q~q\ & \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datab => \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \fsmController1|enardFF_y0|int_q~q\,
	datad => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	combout => \fsmController1|w~3_combout\);

-- Location: LCCOMB_X2_Y24_N12
\fsmController1|A\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|A~combout\ = (\fsmController1|enardFF_y0|int_q~q\) # (\fsmController1|enardFF_y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsmController1|enardFF_y0|int_q~q\,
	datad => \fsmController1|enardFF_y1|int_q~q\,
	combout => \fsmController1|A~combout\);

-- Location: IOIBUF_X0_Y32_N22
\i_sscs~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sscs,
	o => \i_sscs~input_o\);

-- Location: LCCOMB_X2_Y24_N8
\sscsDebouncer|int_d1Input~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscsDebouncer|int_d1Input~0_combout\ = (\i_sscs~input_o\ & ((\sscsDebouncer|second|int_q~q\) # (\sscsDebouncer|first|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscsDebouncer|second|int_q~q\,
	datac => \sscsDebouncer|first|int_q~q\,
	datad => \i_sscs~input_o\,
	combout => \sscsDebouncer|int_d1Input~0_combout\);

-- Location: CLKCTRL_G4
\greset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \greset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \greset~inputclkctrl_outclk\);

-- Location: FF_X2_Y24_N9
\sscsDebouncer|first|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \sscsDebouncer|int_d1Input~0_combout\,
	clrn => \ALT_INV_greset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sscsDebouncer|first|int_q~q\);

-- Location: LCCOMB_X2_Y24_N30
\sscsDebouncer|int_d2Input\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscsDebouncer|int_d2Input~combout\ = (!\sscsDebouncer|first|int_q~q\ & (!\sscsDebouncer|second|int_q~q\ & \i_sscs~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscsDebouncer|first|int_q~q\,
	datac => \sscsDebouncer|second|int_q~q\,
	datad => \i_sscs~input_o\,
	combout => \sscsDebouncer|int_d2Input~combout\);

-- Location: FF_X2_Y24_N31
\sscsDebouncer|second|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \sscsDebouncer|int_d2Input~combout\,
	clrn => \ALT_INV_greset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sscsDebouncer|second|int_q~q\);

-- Location: LCCOMB_X2_Y24_N4
\fsmController1|w~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|w~1_combout\ = (!\sscsDebouncer|second|int_q~q\ & \sscsDebouncer|first|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sscsDebouncer|second|int_q~q\,
	datad => \sscsDebouncer|first|int_q~q\,
	combout => \fsmController1|w~1_combout\);

-- Location: IOIBUF_X0_Y24_N1
\i_msc_val[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_msc_val(1),
	o => \i_msc_val[1]~input_o\);

-- Location: IOIBUF_X0_Y21_N15
\i_msc_val[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_msc_val(0),
	o => \i_msc_val[0]~input_o\);

-- Location: IOIBUF_X0_Y27_N22
\i_msc_val[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_msc_val(3),
	o => \i_msc_val[3]~input_o\);

-- Location: IOIBUF_X0_Y20_N15
\i_msc_val[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_msc_val(2),
	o => \i_msc_val[2]~input_o\);

-- Location: LCCOMB_X1_Y24_N18
\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\mscTimer|comparator|o_AeqB~1_combout\) # (\mscTimer|comparator|o_AeqB~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datab => \mscTimer|comparator|o_AeqB~1_combout\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \mscTimer|comparator|o_AeqB~0_combout\,
	combout => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: LCCOMB_X1_Y24_N4
\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ = \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\);

-- Location: FF_X1_Y24_N5
\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X1_Y24_N2
\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\ = \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (((\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\);

-- Location: FF_X1_Y24_N3
\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X1_Y24_N8
\mscTimer|comparator|o_AeqB~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|comparator|o_AeqB~1_combout\ = (\i_msc_val[3]~input_o\ & ((\i_msc_val[2]~input_o\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)) # (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\))) # (!\i_msc_val[3]~input_o\ & 
-- ((\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\) # (\i_msc_val[2]~input_o\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_msc_val[3]~input_o\,
	datab => \i_msc_val[2]~input_o\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	combout => \mscTimer|comparator|o_AeqB~1_combout\);

-- Location: LCCOMB_X1_Y24_N28
\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ = \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (((\mscTimer|comparator|o_AeqB~1_combout\) # (\mscTimer|comparator|o_AeqB~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mscTimer|comparator|o_AeqB~1_combout\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \mscTimer|comparator|o_AeqB~0_combout\,
	combout => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: FF_X1_Y24_N29
\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X1_Y24_N30
\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ = \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (((\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\mscTimer|comparator|o_AeqB~0_combout\) # (\mscTimer|comparator|o_AeqB~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|comparator|o_AeqB~0_combout\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|comparator|o_AeqB~1_combout\,
	combout => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: FF_X1_Y24_N31
\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X1_Y24_N6
\mscTimer|comparator|o_AeqB~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscTimer|comparator|o_AeqB~0_combout\ = (\i_msc_val[1]~input_o\ & ((\i_msc_val[0]~input_o\ $ (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)) # (!\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\))) # (!\i_msc_val[1]~input_o\ & 
-- ((\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\) # (\i_msc_val[0]~input_o\ $ (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101111011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_msc_val[1]~input_o\,
	datab => \i_msc_val[0]~input_o\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \mscTimer|comparator|o_AeqB~0_combout\);

-- Location: LCCOMB_X2_Y24_N14
\fsmController1|w~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|w~2_combout\ = (!\fsmController1|A~combout\ & (\fsmController1|w~1_combout\ & (!\mscTimer|comparator|o_AeqB~0_combout\ & !\mscTimer|comparator|o_AeqB~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|A~combout\,
	datab => \fsmController1|w~1_combout\,
	datac => \mscTimer|comparator|o_AeqB~0_combout\,
	datad => \mscTimer|comparator|o_AeqB~1_combout\,
	combout => \fsmController1|w~2_combout\);

-- Location: IOIBUF_X0_Y26_N15
\i_ssc_val[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_ssc_val(0),
	o => \i_ssc_val[0]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\i_ssc_val[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_ssc_val(1),
	o => \i_ssc_val[1]~input_o\);

-- Location: IOIBUF_X0_Y31_N15
\i_ssc_val[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_ssc_val(2),
	o => \i_ssc_val[2]~input_o\);

-- Location: IOIBUF_X0_Y30_N1
\i_ssc_val[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_ssc_val(3),
	o => \i_ssc_val[3]~input_o\);

-- Location: LCCOMB_X3_Y24_N28
\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ = \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (((\sscTimer|comparator|o_AeqB~0_combout\) # (\sscTimer|comparator|o_AeqB~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|comparator|o_AeqB~0_combout\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \sscTimer|comparator|o_AeqB~1_combout\,
	combout => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: FF_X3_Y24_N29
\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X3_Y24_N6
\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\sscTimer|comparator|o_AeqB~0_combout\) # (\sscTimer|comparator|o_AeqB~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|comparator|o_AeqB~0_combout\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \sscTimer|comparator|o_AeqB~1_combout\,
	combout => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: LCCOMB_X3_Y24_N8
\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\ = \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\);

-- Location: FF_X3_Y24_N9
\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~1_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X3_Y24_N18
\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\ = \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (((\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	combout => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\);

-- Location: FF_X3_Y24_N19
\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\);

-- Location: LCCOMB_X3_Y24_N4
\sscTimer|comparator|o_AeqB~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|comparator|o_AeqB~1_combout\ = (\i_ssc_val[2]~input_o\ & ((\i_ssc_val[3]~input_o\ $ (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\)) # (!\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))) # (!\i_ssc_val[2]~input_o\ & 
-- ((\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\) # (\i_ssc_val[3]~input_o\ $ (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101111011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_ssc_val[2]~input_o\,
	datab => \i_ssc_val[3]~input_o\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	combout => \sscTimer|comparator|o_AeqB~1_combout\);

-- Location: LCCOMB_X3_Y24_N26
\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\ = \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\sscTimer|comparator|o_AeqB~0_combout\) # (\sscTimer|comparator|o_AeqB~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|comparator|o_AeqB~0_combout\,
	datab => \sscTimer|comparator|o_AeqB~1_combout\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\);

-- Location: FF_X3_Y24_N27
\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X3_Y24_N10
\sscTimer|comparator|o_AeqB~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscTimer|comparator|o_AeqB~0_combout\ = (\i_ssc_val[0]~input_o\ & ((\i_ssc_val[1]~input_o\ $ (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\)) # (!\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))) # (!\i_ssc_val[0]~input_o\ & 
-- ((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\) # (\i_ssc_val[1]~input_o\ $ (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_ssc_val[0]~input_o\,
	datab => \i_ssc_val[1]~input_o\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscTimer|comparator|o_AeqB~0_combout\);

-- Location: LCCOMB_X2_Y24_N6
\fsmController1|w~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|w~0_combout\ = (!\fsmController1|enardFF_y0|int_q~q\ & (\fsmController1|enardFF_y1|int_q~q\ & (!\sscTimer|comparator|o_AeqB~0_combout\ & !\sscTimer|comparator|o_AeqB~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|enardFF_y0|int_q~q\,
	datab => \fsmController1|enardFF_y1|int_q~q\,
	datac => \sscTimer|comparator|o_AeqB~0_combout\,
	datad => \sscTimer|comparator|o_AeqB~1_combout\,
	combout => \fsmController1|w~0_combout\);

-- Location: LCCOMB_X2_Y24_N22
\fsmController1|w~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|w~4_combout\ = (\fsmController1|w~2_combout\) # ((\fsmController1|w~0_combout\) # ((!\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & \fsmController1|w~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \fsmController1|w~3_combout\,
	datac => \fsmController1|w~2_combout\,
	datad => \fsmController1|w~0_combout\,
	combout => \fsmController1|w~4_combout\);

-- Location: FF_X2_Y24_N1
\fsmController1|reset_latch|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	asdata => \fsmController1|w~4_combout\,
	clrn => \ALT_INV_greset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsmController1|reset_latch|int_q~q\);

-- Location: LCCOMB_X2_Y24_N18
int_rst_timer : cycloneive_lcell_comb
-- Equation(s):
-- \int_rst_timer~combout\ = (\greset~input_o\) # (\fsmController1|reset_latch|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \greset~input_o\,
	datad => \fsmController1|reset_latch|int_q~q\,
	combout => \int_rst_timer~combout\);

-- Location: FF_X2_Y24_N17
\mstTimer|incrementer|reg|reg_n_bits:1:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\);

-- Location: LCCOMB_X2_Y24_N10
\mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\ = \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (((\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datac => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	combout => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\);

-- Location: FF_X2_Y24_N11
\mstTimer|incrementer|reg|reg_n_bits:2:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\);

-- Location: LCCOMB_X2_Y24_N20
\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\ = (!\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\) # ((\mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\) # 
-- (!\mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datab => \mstTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datad => \mstTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	combout => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\);

-- Location: FF_X2_Y24_N21
\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~0_combout\,
	clrn => \ALT_INV_int_rst_timer~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\);

-- Location: LCCOMB_X2_Y24_N0
\fsmController1|enardFF_y0|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|enardFF_y0|int_q~0_combout\ = (\mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\) # (!\fsmController1|w~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mstTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \fsmController1|w~3_combout\,
	combout => \fsmController1|enardFF_y0|int_q~0_combout\);

-- Location: LCCOMB_X2_Y24_N26
\fsmController1|enardFF_y0|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|enardFF_y0|int_q~1_combout\ = \fsmController1|enardFF_y0|int_q~q\ $ ((((\fsmController1|w~0_combout\) # (\fsmController1|w~2_combout\)) # (!\fsmController1|enardFF_y0|int_q~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|enardFF_y0|int_q~0_combout\,
	datab => \fsmController1|w~0_combout\,
	datac => \fsmController1|enardFF_y0|int_q~q\,
	datad => \fsmController1|w~2_combout\,
	combout => \fsmController1|enardFF_y0|int_q~1_combout\);

-- Location: FF_X2_Y24_N27
\fsmController1|enardFF_y0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \fsmController1|enardFF_y0|int_q~1_combout\,
	clrn => \ALT_INV_greset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsmController1|enardFF_y0|int_q~q\);

-- Location: LCCOMB_X2_Y24_N24
\fsmController1|input_d1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|input_d1~0_combout\ = \fsmController1|enardFF_y1|int_q~q\ $ (((\fsmController1|enardFF_y0|int_q~q\ & \fsmController1|w~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|enardFF_y0|int_q~q\,
	datac => \fsmController1|enardFF_y1|int_q~q\,
	datad => \fsmController1|w~4_combout\,
	combout => \fsmController1|input_d1~0_combout\);

-- Location: FF_X2_Y24_N25
\fsmController1|enardFF_y1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gclk~inputclkctrl_outclk\,
	d => \fsmController1|input_d1~0_combout\,
	clrn => \ALT_INV_greset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsmController1|enardFF_y1|int_q~q\);

-- Location: LCCOMB_X1_Y25_N16
\fsmController1|D~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|D~0_combout\ = (\fsmController1|enardFF_y0|int_q~q\ & !\fsmController1|enardFF_y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|enardFF_y0|int_q~q\,
	datac => \fsmController1|enardFF_y1|int_q~q\,
	combout => \fsmController1|D~0_combout\);

-- Location: LCCOMB_X1_Y25_N14
\fsmController1|D~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|D~1_combout\ = (\fsmController1|enardFF_y0|int_q~q\ & \fsmController1|enardFF_y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|enardFF_y0|int_q~q\,
	datac => \fsmController1|enardFF_y1|int_q~q\,
	combout => \fsmController1|D~1_combout\);

-- Location: LCCOMB_X1_Y29_N16
\fsmController1|D~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsmController1|D~2_combout\ = (!\fsmController1|enardFF_y0|int_q~q\ & \fsmController1|enardFF_y1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsmController1|enardFF_y0|int_q~q\,
	datac => \fsmController1|enardFF_y1|int_q~q\,
	combout => \fsmController1|D~2_combout\);

-- Location: LCCOMB_X1_Y24_N12
\mscBcd|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux0~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))) # 
-- (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (!\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux0~0_combout\);

-- Location: LCCOMB_X1_Y24_N22
\mscBcd|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux1~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & ((\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\)) # (!\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & 
-- ((\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))) # (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ 
-- (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux1~0_combout\);

-- Location: LCCOMB_X1_Y24_N24
\mscBcd|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux2~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\) # (!\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))) # 
-- (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (!\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & !\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux2~0_combout\);

-- Location: LCCOMB_X1_Y24_N14
\mscBcd|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux3~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & ((\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))) # (!\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & 
-- (\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & !\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))) # (!\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & 
-- (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux3~0_combout\);

-- Location: LCCOMB_X1_Y24_N20
\mscBcd|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux4~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\))) # (!\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & 
-- ((\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\))) # (!\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux4~0_combout\);

-- Location: LCCOMB_X1_Y24_N26
\mscBcd|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux5~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (((\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\) # (!\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))) # 
-- (!\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (!\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & !\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux5~0_combout\);

-- Location: LCCOMB_X1_Y24_N16
\mscBcd|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mscBcd|Mux6~0_combout\ = (\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\) # (\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))) # 
-- (!\mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\) # (\mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (\mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	datab => \mscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datac => \mscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datad => \mscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	combout => \mscBcd|Mux6~0_combout\);

-- Location: LCCOMB_X3_Y24_N20
\sscBcd|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux0~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))) # 
-- (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (!\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux0~0_combout\);

-- Location: LCCOMB_X3_Y24_N22
\sscBcd|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux1~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\)) # (!\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & 
-- ((\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))) # (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ 
-- (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux1~0_combout\);

-- Location: LCCOMB_X3_Y24_N16
\sscBcd|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux2~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\) # (!\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))) # 
-- (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (!\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & !\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux2~0_combout\);

-- Location: LCCOMB_X3_Y24_N30
\sscBcd|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux3~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))) # (!\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & 
-- (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & !\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))) # (!\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & 
-- (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ $ (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux3~0_combout\);

-- Location: LCCOMB_X3_Y24_N24
\sscBcd|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux4~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))) # (!\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & 
-- ((\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\)) # (!\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux4~0_combout\);

-- Location: LCCOMB_X3_Y24_N14
\sscBcd|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux5~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (!\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\) # (!\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))) # 
-- (!\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (!\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux5~0_combout\);

-- Location: LCCOMB_X3_Y24_N12
\sscBcd|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sscBcd|Mux6~0_combout\ = (\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\) # (\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\ $ (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\)))) # 
-- (!\sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\ & ((\sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\) # (\sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\ $ (\sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sscTimer|incrementer|reg|reg_n_bits:3:b|int_q~q\,
	datab => \sscTimer|incrementer|reg|reg_n_bits:1:b|int_q~q\,
	datac => \sscTimer|incrementer|reg|reg_n_bits:2:b|int_q~q\,
	datad => \sscTimer|incrementer|reg|reg_n_bits:0:b|int_q~q\,
	combout => \sscBcd|Mux6~0_combout\);

ww_o_mstl(0) <= \o_mstl[0]~output_o\;

ww_o_mstl(1) <= \o_mstl[1]~output_o\;

ww_o_mstl(2) <= \o_mstl[2]~output_o\;

ww_o_sstl(0) <= \o_sstl[0]~output_o\;

ww_o_sstl(1) <= \o_sstl[1]~output_o\;

ww_o_sstl(2) <= \o_sstl[2]~output_o\;

ww_o_state(0) <= \o_state[0]~output_o\;

ww_o_state(1) <= \o_state[1]~output_o\;

ww_o_bcd1(0) <= \o_bcd1[0]~output_o\;

ww_o_bcd1(1) <= \o_bcd1[1]~output_o\;

ww_o_bcd1(2) <= \o_bcd1[2]~output_o\;

ww_o_bcd1(3) <= \o_bcd1[3]~output_o\;

ww_o_bcd1(4) <= \o_bcd1[4]~output_o\;

ww_o_bcd1(5) <= \o_bcd1[5]~output_o\;

ww_o_bcd1(6) <= \o_bcd1[6]~output_o\;

ww_o_bcd2(0) <= \o_bcd2[0]~output_o\;

ww_o_bcd2(1) <= \o_bcd2[1]~output_o\;

ww_o_bcd2(2) <= \o_bcd2[2]~output_o\;

ww_o_bcd2(3) <= \o_bcd2[3]~output_o\;

ww_o_bcd2(4) <= \o_bcd2[4]~output_o\;

ww_o_bcd2(5) <= \o_bcd2[5]~output_o\;

ww_o_bcd2(6) <= \o_bcd2[6]~output_o\;
END structure;


