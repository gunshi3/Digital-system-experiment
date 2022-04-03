library ieee;
use ieee.std_logic_1164.all;
entity fp_xs is
port(
	clk:in std_logic;
	clk2:out std_logic);
end entity;

architecture exa of fp_xs is
signal count0:integer:=0;
signal out1:std_logic:='0';
begin
	process(clk,count0)
		begin
		if clk'event and clk='0'then
			if count0=2500 then             --1ms
				count0<=0;
				out1<=not out1;
			else
				count0<=count0+1;
			end if;
		end if;
	end process;
	clk2<=out1;
end exa;