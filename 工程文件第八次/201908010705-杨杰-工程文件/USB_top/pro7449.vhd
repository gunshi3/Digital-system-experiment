library ieee;
use ieee.std_logic_1164.all;

entity pro7449 is
    port(qin:in std_logic_vector(6 downto 0);
         qout:out std_logic_vector(6 downto 0));
end pro7449;

architecture pro7449_arch of pro7449 is
begin
    process(qin)
    begin
      if(qin="0011111") then
         qout<="1011111";
      elsif(qin="1110011") then
         qout<="1111011";
      elsif(qin="0001101") then
         qout<="1110111";
      elsif(qin="0011001") then
         qout<="0011111";
      elsif(qin="0100011") then
         qout<="1001110";    
      elsif(qin="1001011") then
         qout<="0111101"; 
      elsif(qin="0001111") then
         qout<="1001111";
      elsif(qin="0000000") then
         qout<="1000111";
      else
         qout<=qin;
      end if;
    end process;
end pro7449_arch;
          
          
          