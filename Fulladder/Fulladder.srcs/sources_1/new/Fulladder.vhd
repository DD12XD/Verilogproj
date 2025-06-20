library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Fulladder is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        C  : in  STD_LOGIC;
        SUM  : out STD_LOGIC;
        Carry : out STD_LOGIC
    );
end Fulladder;

architecture Behavioral of FullAdder is
begin
    SUM <= A XOR B XOR C;
    Carry <= (A AND B) OR (B AND C) OR (C AND A);
end Behavioral;
