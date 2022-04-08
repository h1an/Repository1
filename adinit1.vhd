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
    signal cnt:std_logic_vector(5 downto 0):="000000";
    begin
    process(clk)
	
    begin
        if EN='1' and rising_edge(clk) then
            if cnt=0 then
            ref_buffer<=com1;
				ref<=ref_buffer;
            cnt<=cnt+'1';
            elsif cnt<8 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
				cnt<=cnt+'1';
            elsif cnt=8 then 
            ref_buffer<=time1;
				ref<=ref_buffer;
            elsif cnt<16 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt<=cnt+'1';
            elsif cnt=16 then 
            ref_buffer<=com2;
				ref<=ref_buffer;
            elsif cnt<24 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt<=cnt+'1';
            elsif cnt=24 then 
            ref_buffer<=set1;
				ref<=ref_buffer;
            elsif cnt<32 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt<=cnt+'1';
            elsif cnt=32 then 
            ref_buffer<=com3;
				ref<=ref_buffer;
            elsif cnt<40 then
            ref_buffer(6 downto 0)<=ref(7 downto 1);
				ref<=ref_buffer;
            cnt<=cnt+'1';
            elsif cnt=40 then 
            cnt<="000000";
            end if; 
        end if; 
    
    end process;
	 TXD<=ref_buffer; 
	 cn<=cnt;
    
end architecture;




