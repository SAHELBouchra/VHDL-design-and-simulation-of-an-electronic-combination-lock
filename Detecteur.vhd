library ieee;
use ieee.std_logic_1164.all;

entity Detecteur is
    port(
        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic
    );
end Detecteur;

architecture arc_Detecteur of Detecteur is
begin
    process(data_in)
    begin
        case data_in is
            when "0000000000000000" => data_out <= '0'; 	
            when others => data_out <= '1';
        end case;
    end process;
end arc_Detecteur;																																																									