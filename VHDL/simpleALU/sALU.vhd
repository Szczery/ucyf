library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity sALU is	
	port (
			opcode: in std_logic_vector(2 downto 0);
			inp1,inp2: in std_logic_vector(7 downto 0);
			outp: out std_logic_vector(7 downto 0) --???
	);
end sALU;

architecture sALU_arc of sALU is
signal sum,diff_1,diff_2:std_logic_vector(7 downto 0);
begin
	sum<=std_logic_vector(signed(inp1)+signed(inp2));
	diff_1<=std_logic_vector(signed(inp1)-signed(inp2));
	diff_2<=std_logic_vector(signed(inp2)-signed(inp1));

	with opcode select outp<=
		inp1 when "000"|"001"|"010",
		sum when "011",
		diff_1 when "100",
		diff_2 when "101",
		inp1 and inp2 when "110",
		inp1 or inp2 when others; --others has to be included
end sALU_arc;