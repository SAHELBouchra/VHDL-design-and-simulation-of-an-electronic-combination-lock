library ieee;
use ieee.std_logic_1164.all;

entity D_FF is 
port(
     D : in std_logic ;
     reset : in std_logic ;
     enable : in std_logic ;
     clock : in std_logic ;
     Q : out std_logic 
);
end D_FF;

architecture arc_basculeD of D_FF is

begin

process(enable, reset)

begin
if  reset = '1' then Q <= '0';
   elsif rising_edge(clock) then
            if enable = '1' then
                Q <= D;
            end if;
        end if;

end process;

end arc_basculeD;