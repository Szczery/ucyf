library ieee;
use ieee.std_logic_1164.all;

entity clock_tb is
end clock_tb;

architecture clock_tb_arc of clock_tb is
component clock_gen
	port (
		freq_select: in std_logic_vector(1 downto 0);
		clock : out std_logic		
	);
end component;
signal freq_sig:std_logic_vector(1 downto 0);
signal clock_sig: std_logic;

begin
	dut: clock_gen 
	port map(
		freq_select=>freq_sig,
		clock=>clock_sig
		);
	freq_sig<="00","01" after 50 ms, "10" after 100 ms,"11" after 150 ms,"00" after 200 ms;

end clock_tb_arc;

