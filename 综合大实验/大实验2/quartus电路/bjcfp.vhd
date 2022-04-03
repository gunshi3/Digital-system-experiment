library ieee;
use ieee.std_logic_1164.all;
entity bjcfp is
port(
	clk:in std_logic;
	clkcf:out std_logic);
end entity;

architecture exa of bjcfp is
signal count0:integer:=0;
signal out1:std_logic:='0';
begin
	process(clk,count0)
		begin
		if clk'event and clk='0'then
			if count0=50 then			--50us
				count0<=0;
				out1<=not out1;
			else
				count0<=count0+1;
			end if;
		end if;
	end process;
	clkcf<=out1;
end exa;