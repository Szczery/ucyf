library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity mux is
port(
		enable: in bit;
		clock: in bit;
		A,B,C,D:in std_logic_vector(7 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		OUTP: out std_logic_vector(7 downto 0)
	);
end entity mux;


architecture mux_arc of mux is

begin
	process(clock,SEL,enable)
	begin
		if clock'event and clock='1' then
			if enable='1' then	
				case SEL is
					when "00" => OUTP<=A;
					when "01" => OUTP<=B;
					when "10" => OUTP<=C;
					when "11" => OUTP<=D;
					when others=>OUTP<="10000000";
				end case;
			end if;
	end if;
	end process;
end mux_arc;