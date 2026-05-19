library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is
port(
a: in std_logic;
b: in std_logic;
y: out std_logic);
end or_gate;

architecture rtl of or_gate is
begin
process(a, b) is
begin
y <= a or b;
end process;
end rtl;