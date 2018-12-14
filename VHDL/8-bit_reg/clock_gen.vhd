library ieee;
use ieee.std_logic_1164.all;

entity clock_gen is
	port (
		freq_select: in std_logic_vector(1 downto 0);
		clock : out std_logic
	);
end clock_gen;

architecture clock_gen_arc of clock_gen is
	constant CLK_PERIOD:time:=1 ms;
	signal period:time:=0 ms;
begin
	process
	begin
		clock<='0';
		wait for period/2;
		clock<='1';
		wait for period/2;
	end process;

	with freq_select select period<=
	CLK_PERIOD when "00",
	CLK_PERIOD/2 when "01",
	CLK_PERIOD/4 when "10",
	CLK_PERIOD/8 when others;

end clock_gen_arc;