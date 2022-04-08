library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adctrl is --recieve and send data from/to ad
    PORT(
    CLOCK,RST :IN STD_LOGIC;--divided clock 
    --W_SIG:IN STD_LOGIC;--write control signal from upper computer
    TX :OUT STD_LOGIC;--DOUT
    CS :OUT STD_LOGIC;--select sig
    DATA :OUT STD_LOGIC_VECTOR(15 DOWNTO 0);--
    RD_OK :OUT STD_LOGIC);--读完标志位
    END adctrl;
	
architecture behavior of adctrl is
	component adinit
    port(clk :in  std_logic;
         EN   :in  std_logic;
         TXD  :out std_logic);
    end component adinit;
    component fre_div
    port(main_clk:IN std_logic;
        ad_clk:OUT std_logic;
        uart_clk:OUT std_logic );
    end component fre_div;
    

    
    
	begin
    div :fre_div port map(CLOCK,ad_clk,uart_clk);
    adinit1: adinit port map(ad_clk,RST,TX);--clock应该分频到2M hz
    process(CLOCK)
    if RST='1' then
        if rising_edge(clk) then
            
        end if;
    end if ;
    
end architecture;
            
        

    
