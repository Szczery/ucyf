library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity tb is
end tb;

architecture tb_arc of tb is
component RAM
	port (
		write_address: in std_logic_vector(1 downto 0);
		load_address: in std_logic_vector(1 downto 0);
		din: in std_logic_vector(7 downto 0);
		enable_write : in bit;
		enable_load: in bit;
		reset: in bit;
		clock: in bit;
		dout: out std_logic_vector(7 downto 0)
		--ready: out bit
	);
end component;

	constant HALF_CLK_PERIOD:time:=10 ns;
	signal clock,reset,enable_load,enable_write: bit:='0';
	signal din,dout:std_logic_vector(7 downto 0);
	signal write_address,load_address: std_logic_vector(1 downto 0);
begin
	MEM: RAM port map(write_address=>write_address,
					 load_address=>load_address,
					 din=>din,
					 enable_write=>enable_write,
					 enable_load=>enable_load,
					 reset=>reset,
					 clock=>clock,
					 dout=>dout);

		clock<= not clock after HALF_CLK_PERIOD;
		din<="00110011";
		load_address<="00";
		reset<='1', '0' after 10 ns;
		write_address<="00";
		enable_write<='1' after 15 ns;	
		enable_load<='1' after 30 ns;
		
	--monitor_a:
    --process (clock)
    --begin
    --    report "a = " & bit'image(clock);
    --end process;
end tb_arc;