LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY fa_sch IS PORT (
	i1 : IN std_logic;
	i2 : IN std_logic;
	i3 : IN std_logic;
	s2 : OUT std_logic;
	c2 : OUT std_logic
); END fa_sch;



ARCHITECTURE STRUCTURE OF fa_sch IS

-- COMPONENTS

COMPONENT \74AS86\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT \74AS00\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT \74AS10\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	I2_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	I2_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	I2_C : IN std_logic;
	O_C : OUT std_logic
	); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL GND : std_logic;
SIGNAL VCC : std_logic;
SIGNAL N00057 : std_logic;
SIGNAL N00198 : std_logic;
SIGNAL N00173 : std_logic;
SIGNAL N00225 : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U1 : \74AS86\	PORT MAP(
	I0_A => I1, 
	I1_A => I2, 
	O_A => N00057, 
	VCC => VCC, 
	GND => GND, 
	I0_B => N00057, 
	I1_B => I3, 
	O_B => S2
);
U2 : \74AS00\	PORT MAP(
	I0_A => I1, 
	I1_A => I2, 
	O_A => N00225, 
	VCC => VCC, 
	GND => GND, 
	I0_B => I1, 
	I1_B => I3, 
	O_B => N00198, 
	I0_C => I3, 
	I1_C => I2, 
	O_C => N00173
);
U3 : \74AS10\	PORT MAP(
	I0_A => N00225, 
	I1_A => N00198, 
	I2_A => N00173, 
	O_A => C2, 
	VCC => VCC, 
	GND => GND
);
END STRUCTURE;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY SCHEMATIC1 IS PORT (
	e4 : OUT std_logic;
	b1 : IN std_logic;
	a1 : IN std_logic;
	b2 : IN std_logic;
	a2 : IN std_logic;
	zero : IN std_logic;
	e1 : OUT std_logic;
	e2 : OUT std_logic;
	e3 : OUT std_logic
); END SCHEMATIC1;



ARCHITECTURE STRUCTURE OF SCHEMATIC1 IS

-- COMPONENTS

COMPONENT \74AS08\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT fa_sch	 PORT (
	i1 : IN std_logic;
	i2 : IN std_logic;
	i3 : IN std_logic;
	s2 : OUT std_logic;
	c2 : OUT std_logic
); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL N00508 : std_logic;
SIGNAL N01017 : std_logic;
SIGNAL N00431 : std_logic;
SIGNAL N00361 : std_logic;
SIGNAL VCC : std_logic;
SIGNAL GND : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U4 : \74AS08\	PORT MAP(
	I0_A => B1, 
	I1_A => A2, 
	O_A => N00361, 
	VCC => VCC, 
	GND => GND, 
	I0_B => B2, 
	I1_B => A2, 
	O_B => N00508, 
	I0_C => A1, 
	I1_C => B2, 
	O_C => N00431, 
	I0_D => A1, 
	I1_D => B1, 
	O_D => E1
);
FA1 : fa_sch	PORT MAP(
	i1 => ZERO, 
	i2 => N00508, 
	i3 => ZERO, 
	s2 => E3, 
	c2 => E4
);
END STRUCTURE;

