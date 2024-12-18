library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity baudRateGenerator is
    Port (
        clk, reset: in  STD_LOGIC;
        baudSel: in STD_LOGIC_VECTOR(2 downto 0);
        bclk: out STD_LOGIC;
        bclkx8: out STD_LOGIC 
    );
end baudRateGenerator;

architecture rtl of baudRateGenerator is
    component nBitIncrementer
        GENERIC (n : INTEGER := 3);
        PORT ( clk, reset, increment: IN STD_LOGIC;
                y: OUT STD_LOGIC_VECTOR(n-1 downto 0) ) ;
    END component ;

    component nbitcomparator
        GENERIC(n : INTEGER := 4);
        PORT(
            i_A, i_B	: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            o_AeqB, o_AgtB, o_AltB : OUT STD_LOGIC);
    END component;

    component mux81
        PORT (s0, s1, s2, x0, x1, x2, x3, x4, x5, x6, x7: IN STD_LOGIC ;
            y: OUT STD_LOGIC) ;
    END component;

    component Divideby41
        port(i_clk : in std_logic; --assumed to be 25MHz
             o_clk: out std_logic);
    end component;

    -- Internal signals
    signal div41CLK, int_bclk8: STD_LOGIC;
    signal count2_out: STD_LOGIC_VECTOR(7 downto 0);
    signal bclk_count: STD_LOGIC_VECTOR(2 downto 0);

begin

    div41: Divideby41
        port map(i_clk => clk, o_clk => div41CLK);

    count2: nBitIncrementer
        GENERIC MAP (n => 8)
        PORT MAP (clk => div41CLK, reset => reset, increment => '1', y => count2_out);

    baudMux : mux81
        PORT MAP (s0 => baudSel(0), s1 => baudSel(1), s2 => baudSel(2),
            x0 => count2_out(0), x1 => count2_out(1), x2 => count2_out(2), x3 => count2_out(3),
            x4 => count2_out(4), x5 => count2_out(5), x6 => count2_out(6), x7 => count2_out(7),
            y => int_bclk8);

    count3: nBitIncrementer
        GENERIC MAP (n => 3)
        PORT MAP (clk => int_bclk8, reset => reset, increment => '1', y => bclk_count);

    bclk <= bclk_count(2);
    bclkx8 <= int_bclk8;

end rtl;