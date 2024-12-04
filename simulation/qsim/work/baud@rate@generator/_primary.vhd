library verilog;
use verilog.vl_types.all;
entity baudRateGenerator is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        baudSel         : in     vl_logic_vector(2 downto 0);
        bclk            : out    vl_logic;
        bclkx8          : out    vl_logic
    );
end baudRateGenerator;
