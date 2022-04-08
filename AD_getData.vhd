library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity AD_getData is
    port(ad_clk:IN std_logic;
        data:OUT std_logic_vector(15 downto 0);
        init_ok:IN std_logic 
        DOUT:IN std_logic );