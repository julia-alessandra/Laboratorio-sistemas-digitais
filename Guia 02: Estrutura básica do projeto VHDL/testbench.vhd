library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench; 

architecture tb of testbench is

component and_gate is
port(
  a: in std_logic;
  b: in std_logic;
  y: out std_logic);
end component;

component nand_gate is
port(
  a: in std_logic;
  b: in std_logic;
  y: out std_logic);
end component;

component or_gate is
port(
  a: in std_logic;
  b: in std_logic;
  y: out std_logic);
end component;

component nor_gate is
port(
  a: in std_logic;
  b: in std_logic;
  y: out std_logic);
end component;

component xor_gate is
port(
  a: in std_logic;
  b: in std_logic;
  y: out std_logic);
end component;

component xnor_gate is
port(
  a: in std_logic;
  b: in std_logic;
  y: out std_logic);
end component;

component not_gate is
port(
  a: in std_logic;
  y: out std_logic);
end component;

signal a_in, b_in, and_out, nand_out, or_out, nor_out, xor_out, xnor_out, not_out: std_logic;

begin
	INST0: and_gate port map(a_in, b_in, and_out);
    INST1: nand_gate port map(a_in, b_in, nand_out);
    INST2: or_gate port map(a_in, b_in, or_out);
    INST3: nor_gate port map(a_in, b_in, nor_out);
    INST4: xor_gate port map(a_in, b_in, xor_out);
    INST5: xnor_gate port map(a_in, b_in, xnor_out);
    INST6: not_gate port map(a_in, not_out);

	process begin
    	a_in <= '0';
    	b_in <= '0';
        wait for 1 ns;
        
        a_in <= '0';
    	b_in <= '1';
        wait for 1 ns;
        
        a_in <= '1';
    	b_in <= '0';
        wait for 1 ns;
        
        a_in <= '1';
    	b_in <= '1';
        wait for 1 ns;
        
        wait;
    end process;
end tb;