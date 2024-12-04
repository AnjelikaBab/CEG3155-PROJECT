library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity transmitterTopLevel is
    Port (
		  clk : in STD_LOGIC;
		  load_TDR : in STD_LOGIC;
		  TX_in : in STD_LOGIC_VECTOR(7 downto 0);
		  TX_out : out STD_LOGIC;
		  reset : in STD_LOGIC
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
        o_Value: OUT STD_LOGIC_VECTOR(n-1 downto 0));
end component;

component transmitterFSM
    Port (
        txStart, endData : in  STD_LOGIC;
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;
        txSel            : out STD_LOGIC_VECTOR(1 downto 0);
        tsrShift, tdre, tdrLoad, tsrLoad : out STD_LOGIC
    );
end component;

    COMPONENT enardFF_2
        PORT(
            i_resetBar  : IN  STD_LOGIC;
            i_d         : IN  STD_LOGIC;
            i_enable    : IN  STD_LOGIC;
            i_clock     : IN  STD_LOGIC;
            o_q, o_qBar : OUT STD_LOGIC);
    END COMPONENT;


    COMPONENT mux41
         PORT (s0, s1, x0, x1, x2, x3: IN STD_LOGIC ;
         y: OUT STD_LOGIC) ;
    END COMPONENT;

    COMPONENT nBitIncrementer
        GENERIC (n : INTEGER := 8);
            PORT ( clk, reset, increment: IN STD_LOGIC;
            y: OUT STD_LOGIC_VECTOR(n-1 downto 0) ) ;
    END COMPONENT;

signal int_y1, int_y0, int_not_y0, int_shift_out_en, int_not_reset : STD_LOGIC;
signal int_TSR_output, int_TDR_output: STD_LOGIC_VECTOR(7 downto 0);

begin
	int_not_reset <= not reset;
	fsm : transmitterFSM
    Port map(
        txStart  => ,
        endData  => , 
        clk      => clk,     
        reset    => int_not_reset,       
        txSel    => ,      
        tsrShift => , 
        tdre => , 
        tdrLoad => , 
        tsrLoad => , 
    );

	 TDR :  nBitShiftRegister
        GENERIC MAP (n => 8)
        PORT MAP(
		   i_resetBar => int_not_reset,
			i_clock => clk,
			i_load => load_TDR,
			i_shift_right => '0',
			i_shift_left => '0',
			serial_in => '0',
			parallel_in => TDR_in,
			o_Value => int_TDR_output
		  );
	 
	TSR :  nBitShiftRegister
        GENERIC MAP (n => 8)
        PORT MAP(
		   i_resetBar => int_not_reset,
			i_clock => clk,
			i_load => int_y0,
			i_shift_right => int_y1,
			i_shift_left => '0',
			serial_in => '1',
			parallel_in => int_TDR_output,
			o_Value => int_TSR_output
		  );

	int_not_y0 <= not int_y0;
	txdff_reset <= not (reset or not(int_y0 or int_y1));
	txdff_input <= int_TSR_output(0) and int_y1;

    mux1: mux41
        PORT MAP(s0 => TxSel(0), s1 => TxSel(1), x0 => 1, x1 => 1, x2 => 0, x3 => int_TSR_output, y => TX_out);


	
end rtl;
