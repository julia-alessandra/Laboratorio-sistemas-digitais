library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is

    component t_ff_s
        port (
            T   : in  std_logic;
            S   : in  std_logic;
            CLK : in  std_logic;
            Q   : out std_logic
        );
    end component;

    signal T   : std_logic := '0';
    signal S   : std_logic := '1';
    signal CLK : std_logic := '0';
    signal Q   : std_logic;

    constant CLK_PERIOD : time := 10 ns;

begin

    uut: t_ff_s
        port map (
            T   => T,
            S   => S,
            CLK => CLK,
            Q   => Q
        );


    clk_process : process
    begin
        while now < 200 ns loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        wait for 20 ns;

        T <= '1';
        wait for 40 ns;

        T <= '0';
        wait for 40 ns;

        S <= '0';
        wait for 20 ns;

        S <= '1';
        wait for 40 ns;

        T <= '1';
        wait for 40 ns;

        wait;
    end process;

end tb;