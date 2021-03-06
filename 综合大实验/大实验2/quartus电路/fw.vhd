library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity fw is
port(cin:in std_logic_vector(15 downto 0);
	 dout0,dout1,dout2:out std_logic_vector(3 downto 0));
end fw;
architecture exa of fw is
signal cin_reg:std_logic_vector(15 downto 0);
signal dout_reg:integer range 0 to 999;
signal b,s,g:integer range 0 to 9;
signal b_reg,s_reg,g_reg:std_logic_vector(3 downto 0);
begin 
	process(cin_reg)
	begin
		if cin>"0000001111100111"then
			cin_reg<="0000001111100111";
		else
			cin_reg<=cin;
		end if;
	end process;
	
	b<=dout_reg/100;
	s<=(dout_reg-b*100)/10;
	g<=dout_reg-b*100-s*10;
	b_reg<=conv_std_logic_vector(b,4);
	s_reg<=conv_std_logic_vector(s,4);
	g_reg<=conv_std_logic_vector(g,4);
	dout0<=g_reg;
	dout1<=s_reg;
	dout2<=b_reg;
end exa;
	