library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is
port(
sw: in std_logic_vector(2 downto 0);
ledr: out std_logic_vector(9 downto 0));
end decoder;

architecture rtl of decoder is
begin
	process(sw)
	begin
		ledr <= "0011111111";
		
		if (sw = "000") then
			ledr(0) <= '0';
		elsif (sw = "001") then
			ledr(1) <= '0';
		elsif (sw = "010") then
			ledr(2) <= '0';
		elsif (sw = "011") then
			ledr(3) <= '0';
		elsif (sw = "100") then
			ledr(4) <= '0';
		elsif (sw = "101") then
			ledr(5) <= '0';
		elsif (sw = "110") then
			ledr(6) <= '0';
		elsif (sw = "111") then
			ledr(7) <= '0';
		end if;
	end process;
end rtl;