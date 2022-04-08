library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adinit is 
    port(   clk :in  std_logic;
            EN   :in  std_logic;
            OK  :out std_logic;
				TXD  :out std_logic);
end entity;
architecture behavior of adinit is
    
    --signal  com1:std_logic_vector(7 downto 0):=X"20";
    --signal  time1:std_logic_vector(7 downto 0):=X"08";--时钟寄存器，CLKDIV为1，时钟频率2Mhz,更新频率50hz
    --signal  com2:std_logic_vector(7 downto 0):=X"10";
    --signal  set1:std_logic_vector(7 downto 0):=X"40";
    --signal  com3:std_logic_vector(7 downto 0):=X"38";
    signal  ref_buffer:std_logic_vector(39 downto 0):=X"2008104038";
	signal  ref:std_logic;
    signal  init_ok:std_logic_vector(5 downto 0):="000000";--101000
    
    begin

    process(clk,EN)
	 variable cnt:std_logic_vector(5 downto 0);
    begin
	 if EN='0' then
        if clk'event and clk='1' then
            if init_ok="101000"then
                
            else
		    ref<=ref_buffer(39);
		    ref_buffer(39 downto 1)<=ref_buffer(38 downto 0);
            init_ok<=init_ok+'1';
            end if;
		end if;
    end if;   
     

    end process;
    TXD<=ref;
    Ok<=init_ok(5) and init_ok(3);
end architecture;




