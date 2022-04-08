library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adinit is 
    port(   clk :in  std_logic;
            EN   :in  std_logic;
	    	TXD  :out std_logic_vector(7 downto 0));
end entity;
architecture behavior of adinit is
    
    signal  com1:bit_vector(7 downto 0):=X"20";
    signal  time1:bit_vector(7 downto 0):=X"08";--时钟寄存器，CLKDIV为1，时钟频率2Mhz,更新频率50hz
    signal  com2:bit_vector(7 downto 0):=X"10";
    signal  set1:bit_vector(7 downto 0):=X"40";
    signal  com3:bit_vector(7 downto 0):=X"38";
    signal  ref_buffer:bit_vector(7 downto 0);
   
    begin
    process(clk)
    variable cnt:integer:=0;
    begin
        if EN='1' and rising_edge(clk) then
            if cnt=0 then
            ref_buffer<=com1;
            cnt:=cnt+1;
            elsif cnt<8 then
            ref_buffer(7 downto 1) <=ref_buffer(6 downto 0);
            cnt:=cnt+1;
            elsif cnt=8 then 
            ref_buffer<=time1;
            elsif cnt<16 then
            ref_buffer(7 downto 1) <=ref_buffer(6 downto 0);
            cnt:=cnt+1;
            elsif cnt=16 then 
            ref_buffer<=com2;
            elsif cnt<24 then
            ref_buffer(7 downto 1) <=ref_buffer(6 downto 0);
            cnt:=cnt+1;
            elsif cnt=24 then 
            ref_buffer<=set1;
            elsif cnt<32 then
            ref_buffer(7 downto 1) <=ref_buffer(6 downto 0);
            cnt:=cnt+1;
            elsif cnt=32 then 
            ref_buffer<=com3;
            elsif cnt<40 then
            ref_buffer(7 downto 1) <=ref_buffer(6 downto 0);
            cnt:=cnt+1;
            elsif cnt=40 then 
            cnt:=0;
            end if; 
        end if; 
            
    end process;
    TXD<=com1;
end architecture;




