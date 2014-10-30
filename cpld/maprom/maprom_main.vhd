LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY maprom_main IS
	PORT (	MA : OUT	STD_LOGIC_VECTOR (26 DOWNTO 24);
		A : IN		STD_LOGIC_VECTOR (31 DOWNTO 19);
		CLKCPU : IN	STD_LOGIC;
		CLKLOGIC : IN	STD_LOGIC;
		MAPEN : IN	STD_LOGIC;	-- enable MAPROM
		BGACK : IN	STD_LOGIC;
		RW : IN		STD_LOGIC;
		RESET : IN	STD_LOGIC;
		AS : IN		STD_LOGIC;
		ECS : IN	STD_LOGIC);
END maprom_main;


ARCHITECTURE rtl OF maprom_main IS

SIGNAL sMA : STD_LOGIC_VECTOR(26 DOWNTO 24);

BEGIN

	-- do nothing for now, just connect A lines to MA...
	sMA(26) <= A(26);
	sMA(25) <= A(25);
	sMA(24) <= A(24);
	MA <= sMA;

END rtl;

