library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity transmitterTopLevel is
    Port (
		  clk : in STD_LOGIC;
		  txStart : in STD_LOGIC;
		  reset : in STD_LOGIC;
		  TX_in : in STD_LOGIC_VECTOR(7 downto 0);
          TDRE: out STD_LOGIC;
		  TX_out : out STD_LOGIC
    );
end transmitterTopLevel;

architecture rtl of transmitterTopLevel is

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

    component nBitRegister
        GENERIC(n : INTEGER := 8);
        PORT(
            i_resetBar, i_load	: IN	STD_LOGIC;
            i_clock			: IN	STD_LOGIC;
            i_Value			: IN	STD_LOGIC_VECTOR(n-1 downto 0);
            o_Value			: OUT	STD_LOGIC_VECTOR(n-1 downto 0));
    END component;

    component transmitterFSM
        Port (
            txStart, endData : in  STD_LOGIC;
            clk              : in  STD_LOGIC;
            reset            : in  STD_LOGIC;
            txSel            : out STD_LOGIC_VECTOR(1 downto 0);
            tsrShift, TDRE, tdrLoad, tsrLoad, clrInc : out STD_LOGIC
        );
    end component;

    COMPONENT mux41
         PORT (s0, s1, x0, x1, x2, x3: IN STD_LOGIC ;
         y: OUT STD_LOGIC) ;
    END COMPONENT;

    COMPONENT nBitTargetIncrementer
        GENERIC(n : INTEGER := 4);
        PORT(
            i_clk, i_reset, i_increment: IN STD_LOGIC;
            i_targetCount: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
            o_done: OUT STD_LOGIC;
            o_count: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
    END COMPONENT;

    signal int_endData, int_tsrShift, int_tdrLoad, int_tsrLoad, int_clrInc, int_not_reset : STD_LOGIC;
	signal incrementer_reset: STD_LOGIC;
    signal int_txSel : STD_LOGIC_VECTOR(1 downto 0);

    signal int_TSR_output: STD_LOGIC;
    signal int_TDR_output: STD_LOGIC_VECTOR(7 downto 0);

begin
	int_not_reset <= not reset;
	incrementer_reset <= reset OR int_clrInc;
	
	fsm : transmitterFSM
        Port map(
            txStart  => txStart,
            endData  => int_endData, 
            clk      => clk,     
            reset    => reset,       
            txSel    => int_txSel,      
            tsrShift => int_tsrShift, 
            tdre => TDRE, 
            tdrLoad => int_tdrLoad, 
            tsrLoad => int_tsrLoad, 
            clrInc => int_clrInc
        );

    TDR :  nBitRegister
        GENERIC MAP (n => 8)
        PORT MAP(
            i_resetBar => int_not_reset,
            i_load => int_tdrLoad,
            i_clock => clk,
            i_Value => TX_in,
            o_Value => int_TDR_output
        );
	 
	TSR :  nBitShiftRegister
        GENERIC MAP (n => 8)
        PORT MAP(
            i_resetBar => int_not_reset,
			i_clock => clk,
			i_load => int_tsrLoad,
			i_shift_right => int_tsrShift,
			i_shift_left => '0',
			serial_in => '0',
			parallel_in => int_TDR_output,
            parallel_out => open,
			serial_out => int_TSR_output
		);

    fourBitInc: nBitTargetIncrementer
        GENERIC MAP (n => 3)
        PORT MAP(
            i_clk => clk,
            i_reset => incrementer_reset,
            i_increment => int_tsrShift,
            i_targetCount => "111",
            o_done => int_endData,
            o_count => open
        );

    txMux: mux41
        PORT MAP(
            s0 => int_txSel(0), 
            s1 => int_txSel(1), 
            x0 => '1', 
            x1 => '0', 
            x2 => '0', -- default value, but this should never be taken 
            x3 => int_TSR_output, 
            y => TX_out
        );
	
end rtl;