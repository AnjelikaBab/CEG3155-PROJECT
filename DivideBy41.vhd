library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divideby41 is
    port(i_clk : in std_logic; 
         o_clk: out std_logic);
end Divideby41;

architecture behav of Divideby41 is
signal int_count : integer range 0 to 40 := 0;
signal int_clk: std_logic := '0';
begin
    process(i_clk)
    begin
        if i_clk'EVENT and i_clk = '1' then 
            if int_count = 40 then
                int_count <= 0;
                int_clk <= not(int_clk);
            else 
                int_count <= int_count + 1;
            end if;
        end if;
    end process;
	 
	 --output
	 o_clk <= int_clk;
end behav;