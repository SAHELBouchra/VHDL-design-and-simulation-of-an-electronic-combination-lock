Library ieee;
use ieee.std_logic_1164.all;

entity memoire is
port(
    Data_s0 : in std_logic_vector(3 downto 0) ;
    Detect0 : in std_logic ;
    Data_s1 : in std_logic_vector(3 downto 0) ;
    Detect1 : in std_logic ;
    Data_s2 : in std_logic_vector(3 downto 0) ;
    Detect2 : in std_logic ;
    Data_s3 : in std_logic_vector(3 downto 0) ;
    Detect3 : in std_logic ;
    w : in std_logic ;
    clock : in std_logic ;
    clear : in std_logic ;
    Code_sig : out std_logic_vector( 15 downto 0)
);
end memoire ;

architecture arc_memoire of memoire is 

signal s0,s1,s2,s3 : std_logic_vector(3 downto 0);

component Registre_4bit 
port(
   Entre : in std_logic_vector(3 downto 0);
   W : in std_logic ;
   R : in std_logic;
   clock : in std_logic ;
   clear : in std_logic;
   Q : out std_logic_vector(3 downto 0)
); 
end component;


begin 

inst0 : Registre_4bit port map (Data_s0,w,Detect0,clock,clear,s0);
inst1 : Registre_4bit port map (Data_s1,w,Detect1,clock,clear,s1);
inst2 : Registre_4bit port map (Data_s2,w,Detect2,clock,clear,s2);
inst3 : Registre_4bit port map (Data_s3,w,Detect3,clock,clear,s3);

Code_sig <= s0 & s1 & s2 & s3 ;

end arc_memoire ;