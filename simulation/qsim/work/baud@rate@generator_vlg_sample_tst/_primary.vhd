library verilog;
use verilog.vl_types.all;
entity baudRateGenerator_vlg_sample_tst is
    port(
        baudSel         : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end baudRateGenerator_vlg_sample_tst;
