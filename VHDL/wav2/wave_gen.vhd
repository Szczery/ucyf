library ieee;
use ieee.std_logic_1164.all;


entity wave_gen is
	generic (
			tlow,thigh:integer
		);
	port (
		clk,reset: in std_logic;
		w: out std_logic
	);
end wave_gen;

architecture wave_gen_arc of wave_gen is

	type state is (idle,work);
	signal pres_state,next_state:state:=idle;
	signal load:std_logic;
	signal thigh_reg,tlow_reg,high_counter,low_counter:integer;

begin
	process(reset,clk,thigh_reg,tlow_reg)
	begin 
		if reset='0' then
			pres_state<=idle;
			if clk'event and clk='1' then
				load<='1';
			end if;
		elsif thigh_reg=0 and tlow_reg=0 then
			pres_state<=idle;
		else 
			if rising_edge(clk) then
				pres_state<=next_state;
			end if;
		end if;
	end process;

	process(pres_state,reset,high_counter,low_counter)
	begin
		case pres_state is
		when idle=>
			if reset='1' then
				next_state<=work;
			end if;
		when work=>
			if high_counter/=1 then
				w<='1';
			elsif low_counter/=1 then
				w<='0';
 			end if;
 			next_state<=idle;
		end case;
	end process;

	process(load)
	begin
		if load='1' then
			thigh_reg<=thigh;
			tlow_reg<=tlow;
			thigh_reg<=high_counter;
			tlow_reg<=low_counter;
		elsif load='0' then
			high_counter<=high_counter-1;
			low_counter<=low_counter-1;
		end if;
	end process;
end wave_gen_arc;

