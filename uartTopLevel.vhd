library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uartTopLevel is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        txStart : in STD_LOGIC;
        TXin : in STD_LOGIC_VECTOR(7 downto 0);
        RX : in STD_LOGIC;
        clrRDRF : in STD_LOGIC;
        RXout : out STD_LOGIC_VECTOR(7 downto 0);
        TDRE : out STD_LOGIC;
        TXout : out STD_LOGIC;
        RDRF : out STD_LOGIC
    );
end uartTopLevel;

architecture Structural of uartTopLevel is

    signal baudClock : STD_LOGIC;
    signal baudRateDivisor : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    signal txStartInternal : STD_LOGIC;
    signal txDataInternal : STD_LOGIC_VECTOR(7 downto 0);
    signal txReady : STD_LOGIC;

    component BaudRateGenerator is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            baudRateDivisor : in STD_LOGIC_VECTOR(15 downto 0);
            baudClock : out STD_LOGIC
        );
    end component;

    component Transmitter is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            txStart : in STD_LOGIC;
            TX_in : in STD_LOGIC_VECTOR(7 downto 0);
            TDRE : out STD_LOGIC;
            TX_out : out STD_LOGIC
        );
    end component;

    component Receiver is
        Port (
            RX : in STD_LOGIC;
            clrRDRF : in STD_LOGIC;
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            RXout : out STD_LOGIC_VECTOR(7 downto 0);
            RDRF : out STD_LOGIC
        );
    end component;

begin

    baudGen : BaudRateGenerator
        Port map (
            clk => clk,
            reset => reset,
            baudRateDivisor => baudRateDivisor,
            baudClock => baudClock
        );

    txInst : Transmitter
        Port map (
            clk => baudClock,
            reset => reset,
            txStart => txStartInternal,
            TX_in => txDataInternal,
            TDRE => TDRE,
            TX_out => TXout
        );

    rxInst : Receiver
        Port map (
            RX => RX,
            clrRDRF => clrRDRF,
            clk => baudClock,
            reset => reset,
            RXout => RXout,
            RDRF => RDRF
        );

    -- process(clk, reset)
    -- begin
    --     if reset = '1' then
    --         txStartInternal <= '0';
    --         txDataInternal <= (others => '0');
    --     elsif rising_edge(clk) then
    --         if txStart = '1' then
    --             txStartInternal <= '1';
    --             txDataInternal <= txData;
    --         else
    --             txStartInternal <= '0';
    --         end if;
    --     end if;
    -- end process;

end Structural;
