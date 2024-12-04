library verilog;
use verilog.vl_types.all;
entity baudRateGenerator_vlg_check_tst is
    port(
        bclk            : in     vl_logic;
        bclkx8          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end baudRateGenerator_vlg_check_tst;
