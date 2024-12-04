library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity transmitterFSM is
    Port (
        txStart, endData : in  STD_LOGIC;
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;
        txSel            : out STD_LOGIC_VECTOR(1 downto 0);
        tsrShift, tdre, tdrLoad, tsrLoad : out STD_LOGIC
    );
end transmitterFSM;

architecture rtl of transmitterFSM is

    -- Internal Signals
    signal int_reset, int_not_reset : STD_LOGIC;
    signal i_y0, i_y1 : STD_LOGIC;
    signal o_y0, o_y1, o_not_y0, o_not_y1 : STD_LOGIC;
    signal A, D, w, not_w : STD_LOGIC;

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

    int_reset <= reset;
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
    D <= o_y1 AND o_y0;

    w <= (txStart AND A) OR (endData AND D);
    not_w <= NOT w;

    i_y0 <= (o_y1 AND not_w) OR (o_not_y0 AND w);
    i_y1 <= (o_y0 AND not_w) OR (o_not_y1 AND o_y0) OR (o_y1 AND o_not_y0);

    -- Output Drivers
    txSel    <= o_y1 & o_y0;  
    tsrShift <= o_y1 AND o_y0;
    tdre     <= o_not_y1 AND o_not_y0;
    tdrLoad  <= o_not_y1 AND o_y0;
    tsrLoad  <= o_y1 AND o_not_y0;

end rtl;
