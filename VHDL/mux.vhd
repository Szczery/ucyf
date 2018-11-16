library ieee;
use ieee.std_logic_1164.all;

entity mux is
	Port(
		SEL: in STD_LOGIC_VECTOR(2 downto 0);
		inp: in std_logic_vector (7 downto 0);
		outp: out std_logic
		);
end entity mux;

architecture mux_behav of mux is

begin
	with SEL select 
	outp<=	inp(0) when "000",
			inp(1) when "001",
			inp(2) when "010",
			inp(3) when "011"
			inp(4) when "100",
			inp(5) when "101",
			inp(6) when "110",
			inp(7) when "111";
end architecture mux_behav;