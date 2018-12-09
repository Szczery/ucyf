library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wave_gen is
	generic (
			pulse_len:integer
		);
port (
		clk,reset,trigger,stopper : in std_logic;
		wave: out std_logic
	);
end entity wave_gen;

architecture wave_gen_arc of wave_gen is
signal counter:integer;
signal load: std_logic;
type pulse is (wav,nowav);
signal pulse_pres,pulse_next:pulse:=nowav;
begin

process(reset,clk)
begin
	if clk'event and clk='1' then
		if reset='1' then
			pulse_pres<=nowav;
		else
			pulse_pres<=pulse_next;
		end if;
	end if;
end process;


process(trigger,pulse_pres,counter)
begin
	case pulse_pres is
	when nowav=>
		if trigger='1' then
			load<='0';
			wave<='0';
			pulse_next<=wav;
		else
			wave<='0';
			pulse_next<=nowav;
		end if;
	when wav=>
		if counter=1 then
			pulse_next<=nowav;
		else
			load<='1';
			wave<='1';
		end if;
	end case;
end process;

process(load,counter,clk)
begin 
	if load='0' then
		counter<=pulse_len;
	elsif load='1' then
		if rising_edge(clk) then
			counter<=counter-1;
		end if;
	end if;
end process;

end wave_gen_arc;
