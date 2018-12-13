library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lights_tb is
end entity lights_tb;

architecture lights_tb_arc of lights_tb is
component lights
	generic(n:integer:=2);
	port (
		clk,button,reset : in std_logic;
		cars,people: out std_logic_vector(2 downto 0)
	);
end component;
	signal clk,reset,button : std_logic;
	signal n:unsigned(4 downto 0);
	constant CLK_PERIOD:time:=10 ns;
begin
	dut: lights
		port map(
			clk=>clk,
			button=>button,
			reset=>reset);
	process
	begin
		clk<='1';
		wait for CLK_PERIOD/2;
		clk<='0';
		wait for CLK_PERIOD/2;
	end process;

	button<='0','1' after 20 ns,'0' after 30 ns,'1' after 40 ns,'0' after 45 ns,'1' after 70 ns, '0' after 90 ns;
	reset<='0','1' after 30 ns,'0' after 45 ns;

end lights_tb_arc;
