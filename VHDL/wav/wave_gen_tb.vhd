library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- for type conversions

entity wave_gen_tb is
end wave_gen_tb;

architecture wave_gen_tb_arc of wave_gen_tb is
component wave_gen 
generic (
		pulse_len : integer
	);
	port (
		clk,reset,trigger,stopper : in std_logic;
		wave: out std_logic
		);
end component;
signal clk_signal,reset_signal,trigger_signal,stopper_signal,wave_signal: std_logic;
constant clk_period:time:=10 ns;

begin
dut: wave_gen 
generic map(
		pulse_len => 3
	)
port map(
		clk=> clk_signal,
		reset=>reset_signal,
		trigger=>trigger_signal,
		stopper=>stopper_signal,
		wave=>wave_signal
	);

process
begin
	clk_signal<='1';
	wait for clk_period/2;
	clk_signal<='0';
	wait for clk_period/2;
end process;

process
begin
	reset_signal<='0';
	trigger_signal<='1';
	wait for 100 ns;
	reset_signal<='1';
	wait for 200 ns;
end process;

end wave_gen_tb_arc;