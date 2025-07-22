Library ieee;
use ieee.std_logic_1164.all;

entity serrure is
port(
    chiffre1 : in std_logic_vector(15 downto 0);
    chiffre2 : in std_logic_vector(15 downto 0);
    chiffre3 : in std_logic_vector(15 downto 0);
    chiffre4 : in std_logic_vector(15 downto 0);
    w : in std_logic ;
    clock : in std_logic ;
    clear : in std_logic ;
    S : out std_logic 
);
end serrure ;

architecture arc_serrure of serrure is

signal ch1,ch2,ch3,ch4 : std_logic_vector(15 downto 0);
signal s1,s2,s3,s4 : std_logic;
signal s10,s20,s30,s40 : std_logic_vector(3 downto 0);
signal s100 : std_logic_vector(15 downto 0);

component memoire 
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
end component ;

COMPONENT Encodeur
port(
     data_in : in std_logic_vector(15 downto 0);
     data_out : out std_logic_vector(3 downto 0)
);
END COMPONENT;

component Comparateur 
port(
data_in,key: in std_logic_vector(15 downto 0);
        data_out : out std_logic
);
end component ;

COMPONENT Detecteur
port(
     data_in : in std_logic_vector(15 downto 0);
     data_out : out std_logic
);
END COMPONENT;

begin

ch1 <= chiffre1;
ch2 <= chiffre2;
ch3 <= chiffre3;
ch4 <= chiffre4;

detect1 : Detecteur port map(chiffre1,s1);
detect2 : Detecteur port map(chiffre2,s2);
detect3 : Detecteur port map(chiffre3,s3);
detect4 : Detecteur port map(chiffre4,s4);

cod1 : 	Encodeur port map(ch1,s10);
cod2 : Encodeur port map(ch2,s20);
cod3 : Encodeur port map(ch3,s30);
cod4 : Encodeur port map(ch4,s40);

memo : memoire port map(s10,s1,s20,s2,s30,s3,s40,s4,w,clock,clear,s100);
comp : Comparateur port map(s100,"0001001000110100",S);


end arc_serrure ;