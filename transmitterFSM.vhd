library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity transmitterFSM is
    Port (
        txStart, endData : in  STD_LOGIC;
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;
        txSel            : out STD_LOGIC_VECTOR(1 downto 0);
        tsrShift, TDRE, tdrLoad, tsrLoad, clrInc : out STD_LOGIC
    );
end transmitterFSM;

architecture rtl of transmitterFSM is

    -- Internal Signals
    signal int_not_reset : STD_LOGIC;
    signal i_y0, i_y1 : STD_LOGIC;
    signal o_y0, o_y1, o_not_y0, o_not_y1 : STD_LOGIC;
    signal A, C, w, not_w : STD_LOGIC;

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

	int_not_reset <= not reset;

    y0: enARdFF_2
    PORT MAP (
        i_resetBar => int_not_reset,
        i_d        => i_y0,
        i_enable   => '1',
        i_clock    => clk,
        o_q        => o_y0,
        o_qBar     => o_not_y0
    );

   
    y1: enARdFF_2
    PORT MAP (
        i_resetBar => int_not_reset,
        i_d        => i_y1,
        i_enable   => '1',
        i_clock    => clk,
        o_q        => o_y1,
        o_qBar     => o_not_y1
    );

    -- Combinational Logic
    A <= o_not_y1 AND o_not_y0;  
    C <= o_y1 AND o_y0;

    w <= (txStart AND A) OR (endData AND C);
    not_w <= NOT w;

    i_y0 <= (w AND o_not_y1) OR (not_w AND o_y0);
    i_y1 <= (o_not_y1 AND o_y0) OR (not_w AND o_y0);

    -- Output Drivers
    txSel(0)    <= o_y0;
    txSel(1)    <= o_y1;

    TDRE     <= A;
    tdrLoad  <= A;
    clrInc   <= A;
    tsrLoad  <= o_not_y1 AND o_y0; -- state B
    tsrShift <= C;

end rtl;