library ieee;
use ieee.std_logic_1164.all;     --50ms\100ms\200ms
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity bjpl is
port(
	clkcf:in std_logic;
	jl:in std_logic_vector(15 downto 0);
	clk3:out std_logic);		--privode vcc to buzzer
end entity;

architecture exa of bjpl is
signal s:integer:=0;
signal j1:integer:=100;  --100cm
signal j2:integer:=50;	 --50cm
signal j3:integer:=25;	 --25cm
signal count1:integer:=0;
signal count2:integer:=0;
signal count3:integer:=0;
signal out0:std_logic:='0';
signal out1:std_logic:='0';
signal out2:std_logic:='0';
signal out3:std_logic:='0';
begin
	process(clkcf,jl)
		begin
		s<=conv_integer(jl);
	end process;
	
	process(clkcf,jl)
		begin
			out0<='0';
	end process;
	
	process(clkcf,count1)
		begin
			if clkcf'event and clkcf='0' then
				if count1=2400 then                    --200ms
					count1<=0;
				else
					if count1<800 then
						out1<=not out1;
					else
						out1<='0';
					end if;
					count1<=count1+1;
				end if;
			end if;
	end process;
	
	process(clkcf,count2)
		begin
			if clkcf'event and clkcf='0' then
				if count2=1200 then                    --50ms
					count2<=0;
				else
					if count2<300 then
						out2<=not out2;
					else
						out2<='0';
					end if;
					count2<=count2+1;
				end if;
			end if;
	end process;

	process(clkcf,count3)
		begin
			if clkcf'event and clkcf='0' then
				if count3=600 then                    --25ms
					count3<=0;
				else
					if count3<100 then
						out3<=not out3;
					else
						out3<='0';
					end if;
					count3<=count3+1;
				end if;
			end if;
	end process;
	
	process(s)
	begin
		if s>j1 then			
			clk3<=out0;
		elsif s<=j1 and s>j2 then 
			clk3<=out1;
		elsif s<=j2 and s>j3 then
			clk3<=out2;
		else 
			clk3<=out3;
		end if;
	end process;
end exa;