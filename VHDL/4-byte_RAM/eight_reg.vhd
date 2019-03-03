library ieee;
use ieee.std_logic_1164.all;

entity eight_reg is
	port (
		enable,reset: in bit;
		D: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0)
	);
end eight_reg;

architecture eight_reg_arc of eight_reg is
signal reg:std_logic_vector(7 downto 0);
begin
	Q<=reg;
	process(enable)
	begin
		case enable is when '1' => reg<=D;
						when '0' => reg<=reg;
		end case;
	end process;
end eight_reg_arc;