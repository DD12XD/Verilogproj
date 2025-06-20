library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Fulladder_tb is
end Fulladder_tb;

architecture test of FullAdder_tb is
    signal A, B, C : STD_LOGIC := '0';
    signal SUM : STD_LOGIC;
    signal Carry : STD_LOGIC;

    component FullAdder
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            C : in  STD_LOGIC;
            SUM  : out STD_LOGIC;
            Carry  : out STD_LOGIC
        );
    end component;

begin
    UUT: Fulladder Port Map (A => A, B => B, C => C, SUM => SUM, Carry => Carry);

    stimulus: process
    begin
        -- 000
        A <= '0'; B <= '0'; C <= '0'; wait for 100 ns;
        -- 001
        A <= '0'; B <= '0'; C <= '1'; wait for 100 ns;
        -- 010
        A <= '0'; B <= '1'; C <= '0'; wait for 100 ns;
        -- 011
        A <= '0'; B <= '1'; C <= '1'; wait for 100 ns;
        -- 100
        A <= '1'; B <= '0'; C <= '0'; wait for 100 ns;
        -- 101
        A <= '1'; B <= '0'; C <= '1'; wait for 100 ns;
        -- 110
        A <= '1'; B <= '1'; C <= '0'; wait for 100 ns;
        -- 111
        A <= '1'; B <= '1'; C <= '1'; wait for 10 ns;

        wait;
    end process;

end test;
