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
    signal cnt:std_logic_vector(4 downto 0);

    
    begin
    process(main_clk)
    
    begin 
    if rising_edge(main_clk) then        
        if cnt="110110010" then
            cnt <= (others => '0');
        else
            cnt<=cnt+'1';
        end if ;
        if cnt1="11001"then
            cnt <= (others => '0');
        else
            cnt1<=cnt1+'1';
        end if ;
    end if;
    uart_clk<=cnt(9);--div_factor: 434
    ad_cl<=cnt1(4);--div_factor：25（11001）
    end process;
end architecture;
 