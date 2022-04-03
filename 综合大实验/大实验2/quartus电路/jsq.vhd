library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity jsq is
	port(clk:in std_logic;
		 trig,clr:out std_logic);
end entity jsq;
architecture exa of jsq is
signal x:std_logic_vector(15 downto 0):="1111111111111111";
begin 
process(clk)
	begin
	if(x="1111111111111111")then
		trig<='1';clr<='1';x<="0000000000000000";		-->1s
	elsif clk'event and clk='1' then
		x<=x+1;
		if x="0000000000011111" then
			trig<='0';clr<='0';					-->10us
		end if;
	end if;
end process;
end exa;