library IEEE;
use IEEE.std_logic_1164.all;

entity adder_tb is
end adder_tb;

architecture sim of adder_tb is

    component adder is
        port(
            sw: in std_logic_vector(5 downto 0);
            ledr: out std_logic_vector(3 downto 0)
        );
    end component;

    signal sw_tb: std_logic_vector(5 downto 0) := (others => '0');
    signal ledr_tb: std_logic_vector(3 downto 0);

begin

    UUT: adder port map (
        sw => sw_tb,
        ledr => ledr_tb
    );

    stim_proc: process
    begin
        -- Teste 1: 000 + 000 = 0000
        sw_tb <= "000000";
        wait for 10 ns;

        -- Teste 2: 001 + 001 = 0010
        sw_tb <= "001001";
        wait for 10 ns;

        -- Teste 3: 011 + 010 = 0101
        sw_tb <= "011010";
        wait for 10 ns;

        -- Teste 4: 111 + 001 = 1000
        sw_tb <= "111001";
        wait for 10 ns;

        -- Teste 5: 111 + 111 = 1110
        sw_tb <= "111111";
        wait for 10 ns;

        wait;
    end process;

end sim;