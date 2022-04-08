library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity fre_div is
    port(main_clk:IN std_logic;
        ad_clk:OUT std_logic;
        uart_clk:OUT std_logic );
end fre_div;
architecture behaviour of  fre_div is
    signal cnt:std_logic_vector(9 downto 0);
    begin
    process(main_clk)
    
    begin 
    if rising_edge(main_clk) then        
        if cnt="110110010" then
            cnt <= (others => '0');
        else
            cnt<=cnt+'1';
        end if ;
    end if;
    uart_clk<=cnt;--div_factor: 434
    end process;
end architecture;
 