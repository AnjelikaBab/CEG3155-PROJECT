library ieee;
use ieee.std_logic_1164.all;

ENTITY fsmTopLevel IS
    PORT(
        gclk, greset: IN STD_LOGIC;
        i_msc_val, i_ssc_val: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_sscs: IN STD_LOGIC;
        o_mstl, o_sstl: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        o_bcd1, o_bcd2: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);  
        o_MS_color, o_SS_color: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        o_state_changed: OUT STD_LOGIC  
		  );
END fsmTopLevel;

ARCHITECTURE rtl of fsmTopLevel is
    SIGNAL int_sscs, int_msc, int_mst, int_ssc, int_sst: STD_LOGIC;
    SIGNAL int_rst_timer, int_fsm_reset: STD_LOGIC;
    SIGNAL gresetbar: STD_LOGIC;
    SIGNAL int_msc_count, int_ssc_count: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL r_ascii, g_ascii, y_ascii: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL i_state: STD_LOGIC_VECTOR (1 DOWNTO 0);

    COMPONENT fsmController
        PORT(
            clk, greset: IN STD_LOGIC;
            mst, sst, sscs, msc, ssc: IN STD_LOGIC; 
            mstl, sstl: OUT STD_LOGIC_VECTOR(2 downto 0);
            state: OUT STD_LOGIC_VECTOR(1 downto 0);
            MScolour, SScolour : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
            reset_timer: OUT STD_LOGIC
            );

    END COMPONENT;

    COMPONENT nBitTimer
        GENERIC(n : INTEGER := 4);
        PORT(
            i_clk, i_reset: IN STD_LOGIC;
            i_targetCount: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            o_done: OUT STD_LOGIC;
            o_count: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
    END COMPONENT;

    COMPONENT debouncer_2
        PORT(
            i_resetBar: IN STD_LOGIC;
            i_clock: IN STD_LOGIC;
            i_raw: IN STD_LOGIC;
            o_clean: OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT dec_7seg
        PORT(
            i_hexDigit: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            o_segment_a, o_segment_b, o_segment_c, o_segment_d, o_segment_e, o_segment_f, o_segment_g: OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT enardFF_2
        PORT(
            i_resetBar: IN STD_LOGIC;
            i_d: IN STD_LOGIC;
            i_enable: IN STD_LOGIC;
            i_clock: IN STD_LOGIC;
            o_q, o_qBar: OUT STD_LOGIC);
    END COMPONENT;

    component nbitmux41
        GENERIC ( n: INTEGER := 8 ) ;
        PORT ( s0, s1: IN STD_LOGIC ;
            x0, x1, x2, x3: IN STD_LOGIC_VECTOR(n-1 downto 0) ;
            y: OUT STD_LOGIC_VECTOR(n-1 downto 0) ) ;
    END component ;

BEGIN
    gresetbar <= not greset;
    int_rst_timer <= int_fsm_reset OR greset;

    fsmController1: fsmController
        PORT MAP(
            clk => gclk,
            greset => greset,
            mst => int_mst,
            sst => int_sst,
            sscs => int_sscs,
            msc => int_msc,
            ssc => int_ssc,
            mstl => o_mstl,
            sstl => o_sstl,
            state => i_state,
            reset_timer => int_fsm_reset
            );

    mstTimer: nBitTimer
        GENERIC MAP (n => 4)
        PORT MAP(
            i_clk => gclk,
            i_reset => int_rst_timer,
            i_targetCount => "0010",
            o_done => int_mst,
            o_count => open
            );

    sstTimer: nBitTimer
        GENERIC MAP (n => 4)
        PORT MAP(
            i_clk => gclk,
            i_reset => int_rst_timer,
            i_targetCount => "0010",
            o_done => int_sst,
				o_count => open
            );

    mscTimer: nBitTimer
        GENERIC MAP (n => 4)
        PORT MAP(
            i_clk => gclk,
            i_reset => int_rst_timer,
            o_count => int_msc_count,
            i_targetCount => i_msc_val,
            o_done => int_msc
            );

    sscTimer: nBitTimer
        GENERIC MAP (n => 4)
        PORT MAP(
            i_clk => gclk,
            i_reset => int_rst_timer,
            o_count => int_ssc_count,
            i_targetCount => i_ssc_val,
            o_done => int_ssc
            );

    sscsDebouncer: debouncer_2
        PORT MAP(
            i_resetBar => gresetbar,
            i_clock => gclk,
            i_raw => i_sscs,
            o_clean => int_sscs
            );

    mscBcd: dec_7seg
        PORT MAP(
            i_hexDigit => int_msc_count,
            o_segment_a => o_bcd1(0),
            o_segment_b => o_bcd1(1),
            o_segment_c => o_bcd1(2),
            o_segment_d => o_bcd1(3),
            o_segment_e => o_bcd1(4),
            o_segment_f => o_bcd1(5),
            o_segment_g => o_bcd1(6)
            );

    sscBcd: dec_7seg
        PORT MAP(
            i_hexDigit => int_ssc_count,
            o_segment_a => o_bcd2(0),
            o_segment_b => o_bcd2(1),
            o_segment_c => o_bcd2(2),
            o_segment_d => o_bcd2(3),
            o_segment_e => o_bcd2(4),
            o_segment_f => o_bcd2(5),
            o_segment_g => o_bcd2(6)
            );

    msColorMux: nbitMux41
        GENERIC MAP (n => 8)
        PORT MAP(
            s0 => i_state(0),
            s1 => i_state(1),
            x0 => g_ascii,
            x1 => y_ascii,
            x2 => r_ascii,
            x3 => r_ascii,
            y => o_MS_color
        );
    
    ssColorMux: nbitMux41
        GENERIC MAP (n => 8)
        PORT MAP(
            s0 => i_state(0),
            s1 => i_state(1),
            x0 => r_ascii,
            x1 => r_ascii,
            x2 => g_ascii,
            x3 => y_ascii,
            y => o_SS_color
        );

    -- ASCII values for colors
    y_ascii <= "01111001";
    g_ascii <= "01100111";
    r_ascii <= "01110010";

    -- Output drivers
    o_state_changed <= int_fsm_reset;
    
end rtl;