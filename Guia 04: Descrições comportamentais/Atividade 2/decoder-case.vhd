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
		case (sw) is
			when "000" => ledr <= "0011111110";
			when "001" => ledr <= "0011111101";
			when "010" => ledr <= "0011111011";
			when "011" => ledr <= "0011110111";
			when "100" => ledr <= "0011101111";
			when "101" => ledr <= "0011011111";
			when "110" => ledr <= "0010111111";
			when others => ledr <= "0001111111";
		end case;
	end process;
end rtl;