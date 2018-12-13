library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lights is
	generic(n:integer);
	port (
		button,reset,clk:in std_logic;
		cars,people: out std_logic_vector(2 downto 0)
	);
end entity lights;

architecture behav of lights is	

type state is (idle,wait1,yellow1,go,yellow2,drive);
signal next_state,present_state: state :=idle;
signal counter,counter_max: integer:=1;
signal load: std_logic;

begin
process(clk,reset,counter) 
begin
	if clk'event and clk='1' then
		if reset='1' then
			present_state<=idle;	
		else
			present_state<=next_state;
		end if;
	end if;
end process;

process(present_state,button,counter)
begin
if present_state=idle then
	load<='0';
else load<='1';
end if;
	case present_state is
		when idle =>
			cars<="001";
			people<="100";
			if button='1' then
				next_state<=wait1;
				counter_max<=2*n;
				load<='0';
			end if;
		when wait1 =>
			cars<="001";
			people<="100";
			if counter=1 then
				next_state<=yellow1;
				counter_max<=n;
				load<='0';
			end if;
		when yellow1 =>
			cars<="010";
			people<="010";
			if counter=1 then
				next_state<=go;
				counter_max<=4*n;
				load<='0';
			end if;
		when go =>
			cars<="100";
			people<="001";
			if counter=1 then
				next_state<=yellow2;
				counter_max<=n;
				load<='0';
			end if;
		when yellow2 =>
			cars<="010";
			people<="010";
			if counter=1 then
				next_state<=drive;
				counter_max<=12*n;
				load<='0';
			end if;
		when drive =>
			cars<="001";
			people<="100";
			if counter=1 then
				next_state<=idle;
				counter_max<=n;
				load<='0';
			end if;
	end case;
end process;

process(counter_max,load,clk)
begin
	if rising_edge(clk) then
		if load='0' then
			counter<=counter_max;
		elsif load='1' then
			counter<=counter-1;
		end if;
	end if;
end process;
	
end architecture behav;