library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity hxjsq is
	port(clk1,clr,echo:in std_logic;
		t:out std_logic_vector(15 downto 0));
end hxjsq;

architecture exa of hxjsq is
signal x:std_logic_vector(15 downto 0):="0000000000000000";
begin
	process(clk1,clr,echo)
	begin
	if(clr='1')then
		x<="0000000000000000";
	elsif x="1111111111111111" then
		x<="0000000000000000";
	elsif clk1'event and clk1='1' then
		if echo='1'then
			x<=x+1;
		else 
			t<=x;
		end if;
	end if;
	end process;
end exa;