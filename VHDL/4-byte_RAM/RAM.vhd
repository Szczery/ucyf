library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity RAM is
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
end RAM;

architecture RAM_arc of RAM is
signal reg1,reg2,reg3,reg4: std_logic_vector(7 downto 0);
signal oreg1,oreg2,oreg3,oreg4: std_logic_vector(7 downto 0);

component eight_reg
	port (
		enable,reset: in bit;
		D: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0)		
	);
end component;

component mux
	port(
		clock: in bit;
		enable: in bit;
		A,B,C,D:in std_logic_vector(7 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		OUTP: out std_logic_vector(7 downto 0)
	);
end component;

component rev_mux
	port(
		enable: in bit;
		A: in std_logic_vector(7 downto 0);
		O1,O2,O3,O4: out std_logic_vector(7 downto 0);
		SEL: in std_logic_vector(1 downto 0)	
		);
end component;

begin
	MUX1: rev_mux port map(A=>din,SEL=>write_address,O1=>reg1,O2=>reg2,O3=>reg3,O4=>reg4,enable=>enable_write);
	R1: eight_reg port map(enable=>enable_write,reset=>reset,D=>reg1,Q=>oreg1);
	R2: eight_reg port map(enable=>enable_write,reset=>reset,D=>reg2,Q=>oreg2);
	R3: eight_reg port map(enable=>enable_write,reset=>reset,D=>reg3,Q=>oreg3);
	R4: eight_reg port map(enable=>enable_write,reset=>reset,D=>reg4,Q=>oreg4);
	MUX2: mux port map(A=>oreg1,B=>oreg2,C=>oreg3,D=>oreg4,SEL=>load_address,OUTP=>dout,enable=>enable_load,clock=>clock);
end RAM_arc;