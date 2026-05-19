library ieee;
use ieee.std_logic_1164.all;

entity logic_function is
    port (
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        D : in  std_logic;
        
        F_simultanea  : out std_logic;
        F_condicional : out std_logic;
        F_selecionada : out std_logic
    );
end logic_function;

architecture rtl of logic_function is
    signal ABCD : std_logic_vector(3 downto 0);
begin
    F_simultanea <= (not A and C and not D) or (not B and C) or (B and C and not D);

    F_condicional <= '1' when (((not A and C and not D) or (not B and C) or (B and C and not D)) = '1') else '0';

    ABCD <= A & B & C & D;
    
    with ABCD select
        F_selecionada <= '1' when "0010" | "0011" | "0110" | "1010" | "1011" | "1110",
                         '0' when others;

end rtl;