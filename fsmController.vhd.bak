LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fsmController is
    PORT(
        clk, greset: IN STD_LOGIC;
        mst, sst, sscs, msc, ssc: IN STD_LOGIC; 
        mstl, sstl: OUT STD_LOGIC_VECTOR(2 downto 0);
        state: OUT STD_LOGIC_VECTOR(1 downto 0);
        MScolour, SScolour : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        reset_timer: OUT STD_LOGIC
        );
END fsmController;

ARCHITECTURE structural OF fsmController IS
    SIGNAL y0, y1, w: STD_LOGIC;
    SIGNAL not_y0, not_y1, not_w: STD_LOGIC;
    SIGNAL input_d0, input_d1: STD_LOGIC;
    SIGNAL green, yellow, red: STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL A, C, D, E: STD_LOGIC;
    SIGNAL gresetbar: STD_LOGIC;
    SIGNAL output_mux_mstl, output_mux_sstl: STD_LOGIC_VECTOR(2 downto 0);


    COMPONENT enardFF_2
        PORT(
            i_resetBar  : IN  STD_LOGIC;
            i_d         : IN  STD_LOGIC;
            i_enable    : IN  STD_LOGIC;
            i_clock     : IN  STD_LOGIC;
            o_q, o_qBar : OUT STD_LOGIC);
    END COMPONENT;


    COMPONENT nBitMux41
        GENERIC (n: INTEGER := 3);
        PORT ( s0, s1: IN STD_LOGIC;
            x0, x1, x2, x3: IN STD_LOGIC_VECTOR(n-1 downto 0);
            y: OUT STD_LOGIC_VECTOR(n-1 downto 0));
    END COMPONENT;

BEGIN 

    -- D Flip Flops

    enardFF_y0: enARdFF_2
			PORT MAP(
				i_resetBar	=> gresetbar,
				i_d		=> input_d0,
				i_enable	=> '1',
				i_clock		=> clk,
				o_q		=> y0,
				o_qBar		=> not_y0);
    
       enardFF_y1: enARdFF_2
			PORT MAP(
				i_resetBar	=> gresetbar,
				i_d		=> input_d1,
				i_enable	=> '1',
				i_clock		=> clk,
				o_q		=> y1,
				o_qBar		=> not_y1);

        reset_latch: enardFF_2
            PORT MAP(
                i_resetBar => gresetbar,
                i_d => w,
                i_enable => '1',
                i_clock => clk,
                o_q => reset_timer,
                o_qBar => open);

    -- Multiplexers
   
    mstl_mux: nBitMux41
        GENERIC MAP (n => 3)
        PORT MAP(s0 => y0, s1 => y1, x0 => green, x1 => yellow, x2 => red, x3 => red, y => output_mux_mstl);

    sstl_mux: nBitMux41
        GENERIC MAP (n => 3)
        PORT MAP(s0 => y0, s1 => y1, x0 => red, x1 => red, x2 => green, x3 => yellow, y => output_mux_sstl);

    gresetbar <= NOT(greset);

    green <= "100";
    yellow <= "010";
    red <= "001";

    A <= not_y1 AND not_y0;
    C <= not_y1 AND y0;
    D <= y1 AND not_y0;
    E <= y1 AND y0;

    w <= (msc AND A AND sscs) OR (mst AND C) OR (ssc AND D) OR (sst AND E);
    not_w <= NOT(w);

    input_d0 <= (y0 AND not_w) OR (not_y0 AND w);
    input_d1 <= (y1 AND not_w) OR (y1 AND not_y0) OR (y0 AND not_y1 AND w);
   
    -- Output Drivers
    mstl <= output_mux_mstl;
    sstl <= output_mux_sstl;
    state(0) <= y0;
    state(1) <= y1;

    g <= "01100111";
    y <= "01111001";
    r <= "01110010";

    MScolour <= g when A = '1' else
                y when C = '1' else
                r when (D = '1' OR E = '1');

    SScolour <= g when D = '1' else
                y when E = '1' else
                r when (A = '1' OR C = '1');


END structural;