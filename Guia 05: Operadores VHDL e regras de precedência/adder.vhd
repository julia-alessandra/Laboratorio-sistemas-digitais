library IEEE;
use IEEE.std_logic_1164.all;

entity adder is
port(
sw: in std_logic_vector(5 downto 0);
ledr: out std_logic_vector(3 downto 0));
end adder;

architecture rtl of adder is
component fulladder is
port(
  a, b, cin: in std_logic;
  s, cout: out std_logic);
end component;

signal c1, c2: std_logic;

begin
	INST0: fulladder port map (sw(3), sw(0), '0', ledr(0), c1);
	INST1: fulladder port map (sw(4), sw(1), c1, ledr(1), c2);
	INST2: fulladder port map (sw(5), sw(2), c2, ledr(2), ledr(3));
end rtl;