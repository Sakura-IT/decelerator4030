LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
ENTITY main IS
	PORT (	RESET_CPLD : IN STD_LOGIC;			-- reset
		NO_FLASH : IN STD_LOGIC;			-- flash disable jumper

		PGA_QFP_SEL : IN STD_LOGIC;				-- PGA/QFP jumper
		BG_PGA : IN STD_LOGIC;				-- bus grant PGA		XXX
		BG_QFP : IN STD_LOGIC;				-- bus grant QFP		XXX
		BGACK_PGA : OUT STD_LOGIC;			-- bus grant acknowledge PGA	XXX
		BGACK_QFP : OUT STD_LOGIC;			-- bus grant acknowledge QFP	XXX

		LED_D1 : OUT STD_LOGIC;
		LED_D2 : OUT STD_LOGIC;

		CLK68030 : IN STD_LOGIC;			-- CPU clock
		CLKLOGIC : IN STD_LOGIC;			-- Logic clock
		CLKEXP : IN STD_LOGIC;				-- Main board clock

		DSACK0 : OUT STD_LOGIC;
		DSACK1 : OUT STD_LOGIC;
		STERM : OUT STD_LOGIC;				-- synchronous cycle termination
		BERR : OUT STD_LOGIC;				-- bus error
		HLT : INOUT STD_LOGIC;				-- CPU halt
		CBACK : OUT STD_LOGIC;
		CBREQ : IN STD_LOGIC;
		DS : IN STD_LOGIC;
		AS : IN STD_LOGIC;
		SIZ0 : IN STD_LOGIC;
		SIZ1 : IN STD_LOGIC;
		RESET : IN STD_LOGIC;
		OCS : IN STD_LOGIC;
		ECS : IN STD_LOGIC;
		BG : OUT STD_LOGIC;
		BR : IN STD_LOGIC;
		BGACK : IN STD_LOGIC;
		RMC : IN STD_LOGIC;
		R_W : IN STD_LOGIC;

		RAMSLOT : IN STD_LOGIC;
		MAPEN : OUT STD_LOGIC;				-- enable MAPROM	
		AWAIT : INOUT STD_LOGIC;
		SBR : IN STD_LOGIC;				-- SCSI bus request
		INT2 : OUT STD_LOGIC;				-- INT2 to Paula

		I2C_INT : IN STD_LOGIC;				-- Interrupt caused by I2C 
		I2C_CE : OUT STD_LOGIC;				-- I2C chip enable
		I2C_RD : OUT STD_LOGIC;				-- I2C bus read
		I2C_WR : OUT STD_LOGIC;				-- I2C bus write

		FLASH_HI_CE : OUT STD_LOGIC;
		FLASH_LO_CE : OUT STD_LOGIC;
		FLASH_BUSY : IN STD_LOGIC;
		FLASH_OE : OUT STD_LOGIC;
		FLASH_WE : OUT STD_LOGIC;
		
		SRAM_OE : OUT STD_LOGIC;
		SRAM_WE : OUT STD_LOGIC;
		SRAM_HI_CE : OUT STD_LOGIC;
		SRAM_LO_CE : OUT STD_LOGIC;

		IDBUS_DIR : OUT STD_LOGIC;
		IDBUS_UUB : OUT STD_LOGIC;
		IDBUS_ULB : OUT STD_LOGIC;
		IDBUS_LUB : OUT STD_LOGIC;
		IDBUS_LLB : OUT STD_LOGIC;
	
		ARM : OUT STD_LOGIC_VECTOR(21 downto 0);	-- internal address bus	
		A : IN STD_LOGIC_VECTOR(31 downto 0);		-- CPU address bus 
		D : INOUT STD_LOGIC_VECTOR(31 downto 24) );	-- CPU data lines, in fact 31-24
		   
END main;

ARCHITECTURE behavioral OF main IS

signal sig_cpu_bgack : STD_LOGIC;	-- BGACK from Amiga to CPU
signal sig_cpu_bg : STD_LOGIC;		-- BG from CPU to Amiga

BEGIN

	-- connect BGACK and BG signals between CPU and Amiga
	sig_cpu_bgack <= BGACK;
	sig_cpu_bg <= BG_QFP when PGA_QFP_SEL = '1'
		else BG_PGA;
	BGACK_QFP <= sig_cpu_bgack when PGA_QFP_SEL = '1'
		else '0';
	BGACK_PGA <= sig_cpu_bgack when PGA_QFP_SEL = '0'
		else '0';
	BG <= sig_cpu_bg;

	-- light up D1
	LED_D1 <= '0';
	LED_D2 <= '1';

	-- don't cause interrupt accidentally
	INT2 <= 'Z';

	-- internal data bus to high impedance
	IDBUS_DIR <= 'Z';
	IDBUS_LLB <= 'Z';
	IDBUS_ULB <= 'Z';
	IDBUS_LUB <= 'Z';
	IDBUS_UUB <= 'Z';

	-- internal address bus to high impedance
	ARM <= "ZZZZZZZZZZZZZZZZZZZZZZ";
	-- amiga data lines to high impedance
	D <= "ZZZZZZZZ";

	-- every other cpu control line to high impedance
	DSACK0 <= 'Z';
	DSACK1 <= 'Z';
	STERM <= 'Z';
	BERR <= 'Z';
	HLT <= 'Z';
	CBACK <= 'Z';

	AWAIT <= 'Z';

END behavioral;

