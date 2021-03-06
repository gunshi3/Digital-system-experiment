library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
entity cal is
port(data:in std_logic_vector(15 downto 0);
	 qout:buffer std_logic_vector(15 downto 0));
end cal;
architecture exa of cal is
signal tn:integer;
signal ans:integer;
begin
process(tn,ans,qout)
	begin
	tn<=conv_integer(data);
	ans<=tn*425/1000;
	qout<=conv_std_logic_vector(ans,16);
end process;
end exa;