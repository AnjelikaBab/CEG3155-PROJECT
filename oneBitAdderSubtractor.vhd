-------------------------------------------------------------------------------
-- Title         : 1-bit Adder/Subtractor
-- Project       : VHDL Synthesis Overview
-------------------------------------------------------------------------------
-- File          : oneBitAdderSubtractor.vhd
-- Author        : Rami Abielmona
-- Created       : 2003/05/17
-- Last modified : 2024/10/02
-------------------------------------------------------------------------------
-- Description : This file creates a 1-bit binary full adder/subtractor. The 
--               operationFlag selects between addition (0) and subtraction (1).
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY oneBitAdderSubtractor IS
	PORT(
		i_CarryIn       : IN  STD_LOGIC;
		operationFlag   : IN  STD_LOGIC;
		i_Ai, i_Bi      : IN  STD_LOGIC;
		o_Sum, o_CarryOut : OUT STD_LOGIC);
END oneBitAdderSubtractor;

ARCHITECTURE rtl OF oneBitAdderSubtractor IS
	SIGNAL carryFromAi, carryFromBi, carryFromBoth: STD_LOGIC;
	SIGNAL xor_Bi: STD_LOGIC;

BEGIN
	-- XOR Bi based on operationFlag (1 for subtraction, 0 for addition)
	xor_Bi <= i_Bi xor operationFlag;

	-- Internal carry signals
	carryFromAi <= i_CarryIn xor i_Ai;
	carryFromBi <= carryFromAi and xor_Bi;
	carryFromBoth <= i_CarryIn and i_Ai;

	-- Output carry and sum
	o_CarryOut <= carryFromBi or carryFromBoth;
	o_Sum <= i_CarryIn xor i_Ai xor xor_Bi;

END rtl;