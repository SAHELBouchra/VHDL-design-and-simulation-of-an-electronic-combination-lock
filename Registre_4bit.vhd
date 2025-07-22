library ieee;
use ieee.std_logic_1164.all;

entity Registre_4bit is
port(
   Entre : in std_logic_vector(3 downto 0);
   W : in std_logic ; --write
   R : in std_logic;  --reset
   clock : in std_logic ;
   clear : in std_logic;
   Q : out std_logic_vector(3 downto 0)
); 
end Registre_4bit;

architecture arc_register_4b of Registre_4bit is

signal data_out : std_logic_vector(3 downto 0);

component D_FF 
port(
     D : in std_logic ;
     reset : in std_logic ;
     enable : in std_logic ;
     clock : in std_logic ;
     Q : out std_logic
);
end component;

begin 

inst1 : D_FF port map(Entre(3),clear,W,clock,data_out(3));
inst2 : D_FF port map(Entre(2),clear,W,clock,data_out(2));
inst3 : D_FF port map(Entre(1),clear,W,clock,data_out(1));
inst4 : D_FF port map(Entre(0),clear,W,clock,data_out(0));

Q(3) <= data_out(3) and R ;
Q(2) <= data_out(2) and R ;
Q(1) <= data_out(1) and R ;
Q(0) <= data_out(0) and R ;

end arc_register_4b;