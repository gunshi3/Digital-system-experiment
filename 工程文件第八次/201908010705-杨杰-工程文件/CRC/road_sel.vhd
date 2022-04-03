library ieee;
use ieee.std_logic_1164.all;
entity road_sel is
port(din:in std_logic_vector(7 downto 0);
	--clk:in std_logic;
	o:out std_logic_vector(7 downto 0));
end entity;
architecture bhv of road_sel is
signal input:std_logic_vector(13 downto 0);
signal a_in:std_logic_vector(8 downto 0);
signal p:std_logic_vector(5 downto 0);
begin
process(din,input,a_in,p)
variable d:std_logic_vector(5 downto 0);
variable c:std_logic_vector(4 downto 0);
begin
p<="110101";
c:="00000";
a_in(7 downto 0)<=din(7 downto 0);
input<=a_in&c;
d(5):=input(12);
d(4):=input(11);
d(3):=input(10);
d(2):=input(9);
d(1):=input(8);
d(0):=input(7);
for i in 7 downto 1 loop
if d(5)='0' then
for j in 4 downto 0 loop
c(j):=d(j) xor '0';
end loop;
else
for j in 4 downto 0 loop
c(j):=d(j) xor p(j);
end loop;
end if;
d:=c&input(i-1);
end loop;
if d(5)='0' then
for j in 4 downto 0 loop
c(j):=d(j) xor '0';
end loop;
else
for j in 4 downto 0 loop
c(j):=d(j) xor p(j);
end loop;
end if;
o(4 downto 0)<=c(4 downto 0);
o(7 downto 5)<="000";
end process;
end bhv;