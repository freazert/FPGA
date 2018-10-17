
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity timer is
	port( 
		clk: in std_logic;
		outtimer_20ms: out natural range 0 to 20000
		);
		
end timer;

architecture behavioral of timer is
	signal prescaler: natural range 0 to 99 := 0; --getal dat zorgt dat er gerekend wordt in 탎econden.
	signal count_20ms: natural range 0 to 20000;	 --getal dat de aantaal 탎econden bijhoudt tot er een nieuwe cycle is.
begin

	counter_process: process(clk)
	begin
		if rising_edge(clk) then
			
			if prescaler = 99 then -- er is een 탎econden voorbij.
				prescaler <= 0;
				if count_20ms = 20000 then -- Er zijn 20 mseconden voorbij.
					count_20ms <= 0; 			-- de cycle begint opnieuw.
				else
					count_20ms <= count_20ms + 1; -- Er wordt een 1 bijgeteld bij de cycle
				end if;
			end if;
			if prescaler < 99  then  -- Er moet geteld worden op de 탎econden, niks laten gebeuren want we zitten tussen een 탎econd
				prescaler <= prescaler + 1;
			end if;
		end if;
	end process;
	outtimer_20ms <= count_20ms; --We geven de aantal 탎econden terug van een huidige cycle
end behavioral;

