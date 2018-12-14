library ieee;
use ieee.std_logic_1164.all;

entity eight_reg is
	port (
		clock,reset: in std_logic;
		D: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0)
	);
end eight_reg;

architecture eight_reg_arc of eight_reg is

begin
	process(reset,clock)
	begin
		case reset is
		when '0' =>
			if clock'event and clock='1' then
				Q<=D;
			end if;
		when others =>
			Q<="00000000";
		end case;
	end process;

end eight_reg_arc;