
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity servo is
port( 
		clk: in std_logic; 
		pico_in: in std_logic_vector(7 downto 0); -- data die binnenkomt van de RS232
		servo_out: out std_logic;                 -- bit die gebruikt wordt voor de status van de PWM
		outtimer_20ms : in natural range 0 to 20000 --gebruiken voor 20000 µsecoden(cycle)
		);
end servo;

architecture behavioral of servo is

signal time_servo : integer range 1000 to 2000 := 1500; -- Hoelang een pulse moet duren; 1500 is a neutral pulse 
signal data_in : std_logic_vector( 7 downto 0); --extra signaal voor pic_in
signal output : std_logic:= '0'; --extra signaal voor servo_out

begin

	servo_time: process(clk, pico_in, outtimer_20ms) -- Bereken de aantal µseconden van een pulse
	begin
		if rising_edge(clk) then
			if outtimer_20ms = 0 then -- nieuwe cycle begint dit zorgt ervoor dat als er een andere signaal niet kan verstoren
				if pico_in > "11111010" then	-- 255. Anders gaat de pb over de 20000 µseconde zitten.
					data_in <= "11111010";     -- data gelijk zetten aan 250
				else
					data_in <= pico_in;
				end if;
				time_servo <= 1000+(to_integer(unsigned(data_in)))*4; --Bereken de tijd van de pulse (tussen 1000-2000)
			end if;
		end if;
	end process;
	
	servoprocess: process(clk, outtimer_20ms, time_servo)
	begin 
		if rising_edge(clk) then
			if time_servo > outtimer_20ms then -- zolang de time_servo niet boven de lengte van de cycle zit worden er een 1 doorgestuurd.
				output <= '1'; 	
			else
				output <= '0';   -- anders een 0 sturen
			end if;
		end if;
	end process;

servo_out <= output;	-- signaal terug doorgeven;
	
end behavioral;

