library ieee;
use ieee.std_logic_1164.all;

entity sALU_tb is
end sALU_tb;

architecture sALU_tb_arc of sALU_tb is
component sALU
	port (
		opcode: in std_logic_vector(2 downto 0);
		inp1,inp2: in std_logic_vector(7 downto 0);
		outp: out std_logic_vector(7 downto 0)
	);
end component;
signal opcode_sig:std_logic_vector(2 downto 0);
signal inp1_sig,inp2_sig,outp_sig:std_logic_vector(7 downto 0);

begin
	dut: sALU
	port map(
			opcode=>opcode_sig,
			inp1=>inp1_sig,
			inp2=>inp2_sig,
			outp=>outp_sig
		);
	opcode_sig<="000", "010" after 10 ns,"100" after 20 ns,"000" after 40 ns,"101" after 70 ns,"000" after 80 ns;
	inp1_sig<="00100001";
	inp2_sig<="00001010";

end sALU_tb_arc;