library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
port(
a, b, cin: in std_logic;
s, cout: out std_logic);
end fulladder;

architecture rtl of fulladder is
begin
	process(a, b, cin)
		variable aux: std_logic;
	begin
		aux := a xor b;
		s <= aux xor cin;
		cout <= (aux and cin) or (a and b);
	end process;
end rtl;