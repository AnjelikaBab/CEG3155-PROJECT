LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY nbitmux81 IS
    GENERIC ( n: INTEGER := 8 ) ;
    PORT ( s0, s1, s2: IN STD_LOGIC ;
        x0, x1, x2, x3, x4, x5, x6, x7: IN STD_LOGIC_VECTOR(n-1 downto 0) ;
        y: OUT STD_LOGIC_VECTOR(n-1 downto 0) ) ;
END nbitmux81 ;

ARCHITECTURE structural OF nbitmux81 is
    COMPONENT mux81
    PORT (s0, s1, s2, x0, x1, x2, x3, x4, x5, x6, x7: IN STD_LOGIC ;
         y: OUT STD_LOGIC) ;
    END component;

BEGIN
    muxloop: for i in 0 to n-1 generate
        mux_n: mux81 PORT MAP (s0, s1, s2, x0(i), x1(i), x2(i), x3(i), x4(i), x5(i), x6(i), x7(i), y(i));
    end generate ;
    
END structural ;