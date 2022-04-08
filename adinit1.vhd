--process中更新是在process完成的
--出现在一个周期内输出均为0，目前找不到问题，更换代码逻辑
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adinit is 
    port(   clk :in  std_logic;
            EN   :in  std_logic;
				cn  :out std_logic_vector(5 downto 0);
	    	TXD  :out std_logic_vector(7 downto 0));
end entity;
architecture behavior of adinit is
    
    signal  com1:std_logic_vector(7 downto 0):=X"20";
    signal  time1:std_logic_vector(7 downto 0):=X"08";--时钟寄存器，CLKDIV为1，时钟频率2Mhz,更新频率50hz
    signal  com2:std_logic_vector(7 downto 0):=X"10";
    signal  set1:std_logic_vector(7 downto 0):=X"40";
    signal  com3:std_logic_vector(7 downto 0):=X"38";
    signal  ref_buffer:std_logic_vector(7 downto 0);
	 signal  ref:std_logic_vector(7 downto 0);
    
    begin
    process(clk,EN)
	variable cnt:integer:=0;
    begin
	 if EN='1' then
        if clk'event and clk='1'  then
            if cnt=0 then
				cnt:=cnt+1;
            ref_buffer<=com1;
				ref<=ref_buffer;
            
            elsif cnt<8 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
				cnt:=cnt+1;
            elsif cnt=8 then 
            ref_buffer<=time1;
				ref<=ref_buffer;
				cnt:=cnt+1;
            elsif cnt<16 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt:=cnt+1;
            elsif cnt=16 then 
            ref_buffer<=com2;
				ref<=ref_buffer;
				cnt:=cnt+1;
            elsif cnt<24 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt:=cnt+1;
            elsif cnt=24 then 
            ref_buffer<=set1;
				ref<=ref_buffer;
				cnt:=cnt+1;
            elsif cnt<32 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt:=cnt+1;
            elsif cnt=32 then 
            ref_buffer<=com3;
				ref<=ref_buffer;
				cnt:=cnt+1;
            elsif cnt<40 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt:=cnt+1;
            elsif cnt=40 then 
            cnt:=0;
            end if; 
        end if; 
		 end if;
     
    end process;
	 TXD<=ref; 
	
	 
    
end architecture;




