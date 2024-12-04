library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity receiverTopLevel is
    Port (
        RXD, clrRDRF: in  STD_LOGIC;
        clk, reset: in  STD_LOGIC; 
        RXout: out STD_LOGIC_VECTOR(7 downto 0);
        RDRF: out STD_LOGIC
    );
end receiverTopLevel;

architecture rtl of receiverTopLevel is

    component receiverFSM
        Port (
            sampleCountReached, endData, RXD : in  STD_LOGIC;
            clk, reset: in  STD_LOGIC; 
            rsrShift, Inc, clrInc, setRDRF : out STD_LOGIC 
        );
    end component;

    component nBitRegister
        GENERIC(n : INTEGER := 8);
        PORT(
            i_resetBar, i_load	: IN	STD_LOGIC;
            i_clock			: IN	STD_LOGIC;
            i_Value			: IN	STD_LOGIC_VECTOR(n-1 downto 0);
            o_Value			: OUT	STD_LOGIC_VECTOR(n-1 downto 0));
    END component;

    component nBitShiftRegister
        GENERIC(n : INTEGER := 8);
        PORT(
            i_resetBar, i_clock: IN STD_LOGIC;
            i_load, i_shift_right, i_shift_left: IN STD_LOGIC;
            serial_in: IN STD_LOGIC;
            parallel_in: IN	STD_LOGIC_VECTOR(n-1 downto 0);
            parallel_out: OUT STD_LOGIC_VECTOR(n-1 downto 0);
            serial_out: OUT STD_LOGIC);
    END component;

    component nbitTargetIncrementer
        GENERIC(n : INTEGER := 4);
        PORT(
            i_clk, i_reset, i_increment: IN STD_LOGIC;
            i_targetCount: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            o_done: OUT STD_LOGIC;
            o_count: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
    END component;

    component rdrfLatch
	PORT(
		i_clear, i_set	: IN	STD_LOGIC;
		o_rdrf, o_rdrfBar	: OUT	STD_LOGIC);
    END component;

    -- Internal Signals
    SIGNAL int_rsrOut: STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL int_not_RDRF, int_rsrShift, int_sampleCountReached, int_endData: STD_LOGIC;
    SIGNAL int_setRDRF, int_Inc, int_clrInc: STD_LOGIC;
    SIGNAL not_reset, reset_incrementer, reset_latch: STD_LOGIC;

begin

    not_reset <= not reset;
    reset_incrementer <= reset OR int_clrInc;
    reset_latch <= reset OR clrRDRF;

    RSR: nBitShiftRegister
        GENERIC MAP(n => 8)
        PORT MAP(
            i_resetBar => not_reset,
            i_clock => clk,
            i_load => '0',
            i_shift_right => int_rsrShift,
            i_shift_left => '0',
            serial_in => RXD,
            parallel_in => (others => '0'),
            parallel_out => int_rsrOut,
            serial_out => open
        );
    
    RDR: nBitRegister
        GENERIC MAP(n => 8)
        PORT MAP(
            i_resetBar => not_reset,
            i_load => int_not_RDRF,
            i_clock => clk,
            i_Value => int_rsrOut,
            o_Value => RXout
        );
    
    fsm: receiverFSM
        PORT MAP(
            sampleCountReached => int_sampleCountReached,
            endData => int_endData,
            RXD => RXD,
            clk => clk,
            reset => reset,
            rsrShift => int_rsrShift,
            Inc => int_Inc,
            clrInc => int_clrInc,
            setRDRF => int_setRDRF
        );

    rsrShiftIncrementer: nbitTargetIncrementer
        GENERIC MAP(n => 4)
        PORT MAP(
            i_clk => clk,
            i_reset => reset_incrementer,
            i_increment => int_rsrShift,
            i_targetCount => "1000",
            o_done => int_endData,
            o_count => open
        );

    samplingIncrementer: nbitTargetIncrementer
        GENERIC MAP(n => 3)
        PORT MAP(
            i_clk => clk,
            i_reset => reset_incrementer,
            i_increment => int_Inc,
            i_targetCount => "010", -- it takes one extra clock cycle to start incrementing so targetting 010 accounts for that delay
            o_done => int_sampleCountReached,
            o_count => open
        );

    rdrf_latch: rdrfLatch
        PORT MAP(
            i_clear => reset_latch,
            i_set => int_setRDRF,
            o_rdrf => RDRF,
            o_rdrfBar => int_not_RDRF
        );

end rtl;