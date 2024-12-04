library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity receiverFSM is
    Port (
        sampleCountReached, endData, RXD : in  STD_LOGIC;
        clk, reset: in  STD_LOGIC; 
        rsrShift, Inc, clrInc, setRDRF : out STD_LOGIC 
    );
end receiverFSM;

architecture rtl of receiverFSM is
    -- internal signals
    SIGNAL not_reset: STD_LOGIC;
    SIGNAL int_y0, int_y1: STD_LOGIC;
    SIGNAL o_y0, o_y1, not_o_y0, not_o_y1: STD_LOGIC;
    SIGNAL w, not_w: STD_LOGIC;
    SIGNAL A, B, C, D: STD_LOGIC;

    COMPONENT enARdFF_2
    PORT (
        i_resetBar : IN  STD_LOGIC;
        i_d        : IN  STD_LOGIC;
        i_enable   : IN  STD_LOGIC;
        i_clock    : IN  STD_LOGIC;
        o_q        : OUT STD_LOGIC;
        o_qBar     : OUT STD_LOGIC
    );
    END COMPONENT;

begin

    not_reset <= not reset;

    y1: enARdFF_2
    PORT MAP (
        i_resetBar => not_reset,
        i_d        => int_y1,
        i_enable   => '1',
        i_clock    => clk,
        o_q        => o_y1,
        o_qBar     => not_o_y1
    );

    y0: enARdFF_2
    PORT MAP (
        i_resetBar => not_reset,
        i_d        => int_y0,
        i_enable   => '1',
        i_clock    => clk,
        o_q        => o_y0,
        o_qBar     => not_o_y0
    );

    -- Combinational Logic
    A <= not_o_y1 AND not_o_y0; -- 00 
    B <= not_o_y1 AND o_y0; -- 01
    C <= o_y1 AND not_o_y0; -- 10
    D <= o_y1 AND o_y0; -- 11

    w <= ((NOT RXD) AND A) OR (sampleCountReached AND (B OR C)) OR (endData AND D);   
    not_w <= NOT w; 

    int_y1 <= (w AND not_o_y1 AND o_y0) OR (not_w AND o_y1) OR (o_y1 AND not_o_y0);
    int_y0 <= (not_w AND not_o_y1 AND o_y0) OR (w AND not_o_y0);

    -- output signals
    clrInc <= A;
    setRDRF <= endData AND D;
    Inc <= B OR C OR D;
    rsrShift <= D;
end rtl;