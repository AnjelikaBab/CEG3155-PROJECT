library verilog;
use verilog.vl_types.all;
entity uartTopLevel is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        loopback        : in     vl_logic;
        RXD             : in     vl_logic;
        state_change    : in     vl_logic;
        MScolor         : in     vl_logic_vector(7 downto 0);
        SScolor         : in     vl_logic_vector(7 downto 0);
        baudSelect      : in     vl_logic_vector(2 downto 0);
        TXD             : out    vl_logic
    );
end uartTopLevel;
