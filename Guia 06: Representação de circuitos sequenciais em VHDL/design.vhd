library IEEE;
use IEEE.std_logic_1164.all;

entity t_ff_s is
	port ( T, S, CLK : in std_logic;
	Q 	: 	out std_logic);
end t_ff_s;

architecture my_t_ff_s of t_ff_s is
	signal tsig : std_logic;
begin
  tff: process (S, CLK)
  begin
    if (S = '0') then
    	tsig <= '1';
    elsif (rising_edge(CLK)) then
    	tsig <= T XOR tsig;
    end if;
  end process tff;
  Q <= tsig;
end my_t_ff_s;