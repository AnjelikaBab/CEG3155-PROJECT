library verilog;
use verilog.vl_types.all;
entity uartTopLevel_vlg_sample_tst is
    port(
        baudSelect      : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        loopback        : in     vl_logic;
        MScolor         : in     vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        RXD             : in     vl_logic;
        SScolor         : in     vl_logic_vector(7 downto 0);
        state_change    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end uartTopLevel_vlg_sample_tst;
