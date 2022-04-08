library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity TX is 
    port(   clk :in  std_logic;
            EN   :in  std_logic;
		    BUF  :in  std_logic_vector(7 downto 0);
	    	TXD  :out std_logic);
end TX;
architecture behaviour of TX is 
begin
process(clk)--baud15200,clk50Mhz,frequence division434
begin
    if rising_edge(clk) and EN='1' then
        
            case cnt is
                when 0 => TXD<='0'; cnt:=cnt+1;
				when 9 => TXD<='1'; cnt:=0;
				when others => TXD <=BUF(cnt-1); cnt:=cnt+1;   
            end case;
			
        end if;
	end if;
end process;
end architecture;