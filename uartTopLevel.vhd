library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uartTopLevel is
    Port (
        clk, reset, loopback: in STD_LOGIC;
        RXD, state_change: in STD_LOGIC;
        MScolor, SScolor: in STD_LOGIC_VECTOR(7 downto 0);
        baudSelect: in STD_LOGIC_VECTOR(2 downto 0);
        TXD: out STD_LOGIC
    );
end uartTopLevel;

architecture Structural of uartTopLevel is
    
    component transmitterTopLevel
        Port (
              clk : in STD_LOGIC;
              txStart : in STD_LOGIC;
              reset : in STD_LOGIC;
              TX_in : in STD_LOGIC_VECTOR(7 downto 0);
              TDRE: out STD_LOGIC;
              TX_out : out STD_LOGIC
        );
    end component;

    component receiverTopLevel
        Port (
            RXD, clrRDRF: in  STD_LOGIC;
            clk, reset: in  STD_LOGIC; 
            RXout: out STD_LOGIC_VECTOR(7 downto 0);
            RDRF: out STD_LOGIC
        );
    end component;

    component baudRateGenerator
        Port (
            clk, reset: in  STD_LOGIC;
            baudSel: in STD_LOGIC_VECTOR(2 downto 0);
            bclk: out STD_LOGIC;
            bclkx8: out STD_LOGIC 
        );
    end component;

    component nBitTargetIncrementer
        GENERIC(n : INTEGER := 4);
        PORT(
            i_clk, i_reset, i_increment: IN STD_LOGIC;
            i_targetCount: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            o_done: OUT STD_LOGIC;
            o_count: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
    END component;

    component nbitmux81
        GENERIC ( n: INTEGER := 8 ) ;
        PORT ( s0, s1, s2: IN STD_LOGIC ;
            x0, x1, x2, x3, x4, x5, x6, x7: IN STD_LOGIC_VECTOR(n-1 downto 0) ;
            y: OUT STD_LOGIC_VECTOR(n-1 downto 0) ) ;
    END component;

    component nbitmux21
    GENERIC ( n: INTEGER := 8 );
    PORT ( s: IN STD_LOGIC ;
        x0, x1: IN STD_LOGIC_VECTOR(n-1 downto 0) ;
        y: OUT STD_LOGIC_VECTOR(n-1 downto 0) ) ;
    END component;

    component enARdFF_2
        PORT(
            i_resetBar	: IN	STD_LOGIC;
            i_d		: IN	STD_LOGIC;
            i_enable	: IN	STD_LOGIC;
            i_clock		: IN	STD_LOGIC;
            o_q, o_qBar	: OUT	STD_LOGIC);
    END component;

    signal not_reset, reset_inc: STD_LOGIC;
    signal inc_eq6, increment, inc_en: STD_LOGIC;
    signal bclk, bclkx8 : STD_LOGIC;
    signal int_txStart, int_tdre, int_tdreDelay: STD_LOGIC;
    signal int_trafficLightChar, int_TXin : STD_LOGIC_VECTOR(7 downto 0);
    signal int_debugCharSel : STD_LOGIC_VECTOR(2 downto 0);
    signal int_rdrf: STD_LOGIC;
    signal int_RXout : STD_LOGIC_VECTOR(7 downto 0);

begin

    not_reset <= NOT reset;
    
    reset_inc <= reset OR state_change;
    increment <= NOT inc_eq6 AND int_tdre;

    int_txStart <= int_tdreDelay AND ((NOT loopback AND NOT inc_eq6) OR (loopback AND int_rdrf));

    tdreDelayFF: enARdFF_2
        PORT MAP (
            i_resetBar => not_reset,
            i_d => int_tdre,
            i_enable => '1',
            i_clock => bclk,
            o_q => int_tdreDelay,
            o_qBar => open
        );

    loopbackMux: nbitmux21
        GENERIC MAP (n => 8)
        PORT MAP (s => loopback, x0 => int_trafficLightChar, x1 => int_RXout, y => int_TXin);

    txInst : transmitterTopLevel
        Port map (
            clk => bclk,
            reset => reset,
            txStart => int_txStart,
            TX_in => int_TXin,
            TDRE => int_tdre,
            TX_out => TXD
        );

    rxInst : receiverTopLevel
        Port map (
            RXD => RXD,
            clrRDRF => int_txStart,
            clk => bclkx8,
            reset => reset,
            RXout => int_RXout,
            RDRF => int_rdrf
        );

    baudRateGen : baudRateGenerator
        Port map (
            clk => clk,
            reset => reset,
            baudSel => baudSelect,
            bclk => bclk,
            bclkx8 => bclkx8
        );

    inc : nBitTargetIncrementer
        GENERIC MAP (n => 3)
        PORT MAP (
            i_clk => inc_en,
            i_reset => reset_inc,
            i_increment => increment,
            i_targetCount => "110",
            o_done => inc_eq6,
            o_count => open
        );

    incEnFF : enARdFF_2
        PORT MAP (
            i_resetBar => not_reset,
            i_d => int_tdre,
            i_enable => '1',
            i_clock => clk,
            o_q => inc_en,
            o_qBar => int_debugCharSel(0)
        );

    debugCharMux: nbitmux81
        GENERIC MAP (n => 8)
        PORT MAP (s0 => int_debugCharSel(0), s1 => int_debugCharSel(1), s2 => int_debugCharSel(2),
            x0 => "01001101", x1 => MScolor, x2 => "01011111", x3 => "01010011",
            x4 => SScolor, x5 => "00001101", x6 => "11111111", x7 => "11111111",
            y => int_trafficLightChar);

end Structural;
