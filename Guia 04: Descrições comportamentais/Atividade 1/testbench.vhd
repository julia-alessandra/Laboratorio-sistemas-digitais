library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_logic_function is
end tb_logic_function;

architecture sim of tb_logic_function is
    
    component logic_function
        port (
            A, B, C, D    : in  std_logic;
            F_simultanea  : out std_logic;
            F_condicional : out std_logic;
            F_selecionada : out std_logic
        );
    end component;

    signal A, B, C, D : std_logic := '0';
    signal F_sim, F_cond, F_sel : std_logic;

begin
    
    uut: logic_function port map (
        A => A, B => B, C => C, D => D,
        F_simultanea  => F_sim,
        F_condicional => F_cond,
        F_selecionada => F_sel
    );

    stim_proc: process
        variable vec : unsigned(3 downto 0);
    begin
        for i in 0 to 15 loop
            vec := to_unsigned(i, 4);
            A <= vec(3);
            B <= vec(2);
            C <= vec(1);
            D <= vec(0);
            wait for 10 ns;
        end loop;
        
        wait;
    end process;

end sim;