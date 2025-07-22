library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Comparateur is
    port (
        data_in,key: in std_logic_vector(15 downto 0);
        data_out : out std_logic
    );
end Comparateur;
architecture Behavioral of Comparateur is
begin
    process (data_in)
    begin
        if data_in = key then
             data_out <=  '1'; -- Reset the next address to all zeros
        else
             data_out <=  '0'; 
        end if;
    end process;
end Behavioral;