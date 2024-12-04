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