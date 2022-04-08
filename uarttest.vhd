library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity uart is --分频9600*16
    Port (	 clk :in  std_logic;
	         bclk:out std_logic
         	 BAUD :in  std_logic;
		     EN   :in  std_logic;
		     BUF  :in  std_logic_vector(7 downto 0);
	    	 TXD  :out std_logic);
end uart;
architecture behavior of baud is
begin
process(clk)
variable cnt:integer;
begin                           
  if rising_edge(clk) then
     if cnt>=325 then cnt:=0; bclk<='1';                        --设置分频系数305ori
	 else cnt:=cnt+1; bclk<='0';
	 end if;
  end if;
end process;
end behavior;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
////
entity TX2 is
	port(
		BAUD :in  std_logic;
		EN   :in  std_logic;
		BUF  :in  std_logic_vector(7 downto 0);
		TXD  :out std_logic
	);
end TX2;

architecture BV of TX2 is
begin

	process(BAUD)
   	variable cnt :integer:= 0;
	begin
--		if EN = '1' then 
		  if rising_edge(BAUD) then
			  case cnt is
			  	  when 0 => TXD<='0'; cnt:=cnt+1;
				  when 9 => TXD<='1'; cnt:=0;
				  when others => TXD <=BUF(cnt-1); cnt:=cnt+1;   
			  end case;
		  end if;
	--	else
	--		TXD <='1';

--		end if;
		
	end process;
	
end architecture;
