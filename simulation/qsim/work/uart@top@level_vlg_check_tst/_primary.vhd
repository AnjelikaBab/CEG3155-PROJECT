library verilog;
use verilog.vl_types.all;
entity uartTopLevel_vlg_check_tst is
    port(
        TXD             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end uartTopLevel_vlg_check_tst;
