library ieee;
use ieee.std_logic_1164.all;

entity eight_tb is
end eight_tb;

architecture eight_tb_arc of eight_tb is
component clock_gen
	port (
			freq_select: in std_logic_vector(1 downto 0);
			clock : out std_logic
	);
end component;
component eight_reg
	port (
		clock,reset: in std_logic;
		D: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0)
	);
end component;


	signal clock_sig,reset_sig:std_logic;
	signal D_sig,Q_sig:std_logic_vector(7 downto 0);
	signal freq_sig:std_logic_vector(1 downto 0);

begin
	gen: clock_gen
	port map(
			freq_select=>freq_sig,
			clock=>clock_sig
		);
	dut: eight_reg
	port map(
			clock=>clock_sig,
			reset=>reset_sig,
			D=>D_sig,
			Q=>Q_sig
		);
	reset_sig<='0';
	D_sig<="01010101", "00000000" after 40 ms;
	freq_sig<="10";

end eight_tb_arc;