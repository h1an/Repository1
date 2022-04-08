library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adctrl is --recieve and send data from/to ad
    PORT(
    CLOCK,RST :IN STD_LOGIC;--divided clock 
    W_SIG:IN STD_LOGIC;--write control signal from upper computer
    TX :OUT STD_LOGIC;--DOUT
    CS :OUT STD_LOGIC;--select sig
    DATA :OUT STD_LOGIC_VECTOR(15 DOWNTO 0);--
    TX_OK :OUT STD_LOGIC);--读完标志位
    END adctrl;
architecture behavior of adctrl is
    begin
 
    process(CLOCK,RST)
    
