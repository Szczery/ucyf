library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity rev_mux is
	port (
		enable: in bit;
		A: in std_logic_vector(7 downto 0);
		O1,O2,O3,O4: out std_logic_vector(7 downto 0);
		SEL: in std_logic_vector(1 downto 0)
	);
end rev_mux;

architecture rev_mux_arc of rev_mux is

begin
	process(SEL,enable)
		begin
		if enable='1' then
			case SEL is
				when "00" => O1<=A;
				when "01" => O2<=A;
				when "10" => O3<=A;
				when "11" => O4<=A;
				when others => O1<= (others =>'0');
			end case;
		else
			O1<=(others=>'0');
			O2<=(others=>'0');
			O3<=(others=>'0');
			O4<=(others=>'0');
		end if;
	end process;
end rev_mux_arc;