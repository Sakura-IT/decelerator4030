LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
ENTITY main IS
	PORT (	RESET_CPLD : IN STD_LOGIC;			-- reset
		NO_FLASH : IN STD_LOGIC;			-- flash disable jumper

		PGA_QFP : IN STD_LOGIC;				-- PGA/QFP jumper
		BG_PGA : INOUT STD_LOGIC;			-- bus grant PGA		XXX
		BG_QFP : INOUT STD_LOGIC;			-- bus grant QFP		XXX
		BGACK_PGA : INOUT STD_LOGIC;			-- bus grant acknowledge PGA	XXX
		BGACK_QFP : INOUT STD_LOGIC;			-- bus grant acknowledge QFP	XXX

		LED_D1 : OUT STD_LOGIC;
		LED_D2 : OUT STD_LOGIC;

		CLK68030 : IN STD_LOGIC;			-- CPU clock
		CLKLOGIC : IN STD_LOGIC;			-- Logic clock
		CLKEXP : IN STD_LOGIC;				-- Main board clock

		DSASK0 : OUT STD_LOGIC;
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
		BG : IN STD_LOGIC;
		BR : IN STD_LOGIC;
		BGACK : IN STD_LOGIC;
		RMC : IN STD_LOGIC;
		R_W : IN STD_LOGIC;

		RAMSLOT : IN STD_LOGIC;
		MAPEN : OUT STD_LOGIC;				-- enable MAPROM	
		AWAIT : IN STD_LOGIC;
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
	
		ARM : OUT STD_LOGIC_VECTOR(21 downto 0);		-- internal address bus	
		A : IN STD_LOGIC_VECTOR(31 downto 0);		-- CPU address bus 
		D : INOUT STD_LOGIC_VECTOR(7 downto 0) );	-- CPU data lines, in fact 31-24
		   
END main;

ARCHITECTURE behavioral OF main IS


-- signal foo : STD_LOGIC;

BEGIN

	LED_D1 <= '0';
	LED_D2 <= '1';

	IDBUS_DIR <= 'Z'

	ARM <= "ZZZZZZZZZZZZZZZZZZZZZ";
	D <= "ZZZZZZZZ";

END behavioral;

