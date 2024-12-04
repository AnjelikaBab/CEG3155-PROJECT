LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux81 IS
    PORT (s0, s1, s2, x0, x1, x2, x3, x4, x5, x6, x7: IN STD_LOGIC ;
         y: OUT STD_LOGIC) ;
END mux81;

ARCHITECTURE structural OF mux81 IS 
    SIGNAL mux1out, mux2out, muxfinalout: STD_LOGIC;
    
    COMPONENT mux21
    PORT (s, x0, x1: IN STD_LOGIC ;
         y: OUT STD_LOGIC ) ;
    END COMPONENT;

    COMPONENT mux41
    PORT (s0, s1, x0, x1, x2, x3: IN STD_LOGIC ;
         y: OUT STD_LOGIC) ;
    END COMPONENT;

BEGIN
    -- Root multiplexers that output based on s0
    mux1: mux41 PORT MAP (s0, s1, x0, x1, x2, x3, mux1out);
    mux2: mux41 PORT MAP (s0, s1, x4, x5, x6, x7, mux2out);
    -- Final multiplexer that outputs based on s1
    muxfinal: mux21 PORT MAP (s2, mux1out, mux2out, muxfinalout);
    -- Output
    y <= muxfinalout;

END structural;