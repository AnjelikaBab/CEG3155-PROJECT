library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Parity_Generator is
    Port (
        data_in    : in  STD_LOGIC_VECTOR(7 downto 0);  
        parity_out : out STD_LOGIC                     
    );
end Parity_Generator;

architecture Structural of Parity_Generator is
    signal xor1, xor2, xor3, xor4, xor5, xor6, xor7 : STD_LOGIC;
begin
    xor1 <= data_in(0) xor data_in(1);
    xor2 <= xor1 xor data_in(2);
    xor3 <= xor2 xor data_in(3);
    xor4 <= xor3 xor data_in(4);
    xor5 <= xor4 xor data_in(5);
    xor6 <= xor5 xor data_in(6);
    xor7 <= xor6 xor data_in(7);

    parity_out <= xor7;  -- Even parity

end Structural;
