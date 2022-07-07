LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY SCHEMATIC1 IS PORT (
	P_PCLK : IN std_logic;
	PD0 : IN std_logic;
	P_PREn : IN std_logic;
	PD1 : IN std_logic;
	PD2 : IN std_logic;
	PD3 : IN std_logic;
	PD4 : IN std_logic;
	PD5 : IN std_logic;
	P_PWEn : IN std_logic;
	PD6 : IN std_logic;
	PD7 : IN std_logic
); END SCHEMATIC1;



ARCHITECTURE STRUCTURE OF SCHEMATIC1 IS

-- COMPONENTS

COMPONENT \74ACT175\
	PORT (
	D1 : IN std_logic;
	D2 : IN std_logic;
	D3 : IN std_logic;
	D4 : IN std_logic;
	CLK : IN std_logic;
	CLR : IN std_logic;
	Q1 : OUT std_logic;
	\Q\\1\\\ : OUT std_logic;
	Q2 : OUT std_logic;
	\Q\\2\\\ : OUT std_logic;
	Q3 : OUT std_logic;
	\Q\\3\\\ : OUT std_logic;
	Q4 : OUT std_logic;
	\Q\\4\\\ : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic
	); END COMPONENT;

COMPONENT \74ACT283\
	PORT (
	A1 : IN std_logic;
	A2 : IN std_logic;
	A3 : IN std_logic;
	A4 : IN std_logic;
	B1 : IN std_logic;
	B2 : IN std_logic;
	B3 : IN std_logic;
	B4 : IN std_logic;
	C0 : IN std_logic;
	S1 : OUT std_logic;
	S2 : OUT std_logic;
	S3 : OUT std_logic;
	S4 : OUT std_logic;
	C4 : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic
	); END COMPONENT;

COMPONENT \74ACT244\
	PORT (
	\1A1\ : IN std_logic;
	\1A2\ : IN std_logic;
	\1A3\ : IN std_logic;
	\1A4\ : IN std_logic;
	\2A1\ : IN std_logic;
	\2A2\ : IN std_logic;
	\2A3\ : IN std_logic;
	\2A4\ : IN std_logic;
	\1G\ : IN std_logic;
	\2G\ : IN std_logic;
	\1Y1\ : OUT std_logic;
	\1Y2\ : OUT std_logic;
	\1Y3\ : OUT std_logic;
	\1Y4\ : OUT std_logic;
	\2Y1\ : OUT std_logic;
	\2Y2\ : OUT std_logic;
	\2Y3\ : OUT std_logic;
	\2Y4\ : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic
	); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL N02560 : std_logic;
SIGNAL N03923 : std_logic;
SIGNAL N05107 : std_logic;
SIGNAL N03710 : std_logic;
SIGNAL N03608 : std_logic;
SIGNAL N04302 : std_logic;
SIGNAL N04185 : std_logic;
SIGNAL N04071 : std_logic;
SIGNAL GND : std_logic;
SIGNAL VCC : std_logic;
SIGNAL N03576 : std_logic;
SIGNAL N03815 : std_logic;
SIGNAL REN : std_logic;
SIGNAL CLK : std_logic;
SIGNAL WEN : std_logic;
SIGNAL PD : std_logic_vector(7 DOWNTO 0);
SIGNAL DOUT : std_logic_vector(7 DOWNTO 0);
SIGNAL DIN : std_logic_vector(7 DOWNTO 0);

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
PD(0)<=PD0;
PD(1)<=PD1;
PD(2)<=PD2;
PD(3)<=PD3;
PD(4)<=PD4;
PD(5)<=PD5;
PD(6)<=PD6;
PD(7)<=PD7;
U1 : \74ACT175\	PORT MAP(
	D1 => DIN(0), 
	D2 => DIN(1), 
	D3 => DIN(2), 
	D4 => DIN(3), 
	CLK => CLK, 
	CLR => GND, 
	Q1 => N03576, 
	Q2 => N03608, 
	Q3 => N03710, 
	Q4 => N03815, 
	VCC => VCC, 
	GND => GND
);
U2 : \74ACT283\	PORT MAP(
	A1 => N03576, 
	A2 => N03608, 
	A3 => N03710, 
	A4 => N03815, 
	B1 => VCC, 
	B2 => GND, 
	B3 => GND, 
	B4 => GND, 
	C0 => GND, 
	S1 => DOUT(0), 
	S2 => DOUT(1), 
	S3 => DOUT(2), 
	S4 => DOUT(3), 
	C4 => N05107, 
	VCC => VCC, 
	GND => GND
);
U3 : \74ACT244\	PORT MAP(
	\1A1\ => PD(0), 
	\1A2\ => PD(1), 
	\1A3\ => PD(2), 
	\1A4\ => PD(3), 
	\2A1\ => PD(4), 
	\2A2\ => PD(5), 
	\2A3\ => PD(6), 
	\2A4\ => PD(7), 
	\1G\ => WEN, 
	\2G\ => WEN, 
	\1Y1\ => DIN(0), 
	\1Y2\ => DIN(1), 
	\1Y3\ => DIN(2), 
	\1Y4\ => DIN(3), 
	\2Y1\ => DIN(4), 
	\2Y2\ => DIN(5), 
	\2Y3\ => DIN(6), 
	\2Y4\ => DIN(7), 
	VCC => VCC, 
	GND => GND
);
U4 : \74ACT283\	PORT MAP(
	A1 => N03923, 
	A2 => N04071, 
	A3 => N04185, 
	A4 => N04302, 
	B1 => GND, 
	B2 => GND, 
	B3 => GND, 
	B4 => VCC, 
	C0 => N05107, 
	S1 => DOUT(4), 
	S2 => DOUT(5), 
	S3 => DOUT(6), 
	S4 => DOUT(7), 
	VCC => VCC, 
	GND => GND
);
U5 : \74ACT244\	PORT MAP(
	\1A1\ => DOUT(0), 
	\1A2\ => DOUT(1), 
	\1A3\ => DOUT(2), 
	\1A4\ => DOUT(3), 
	\2A1\ => DOUT(4), 
	\2A2\ => DOUT(5), 
	\2A3\ => DOUT(6), 
	\2A4\ => DOUT(7), 
	\1G\ => REN, 
	\2G\ => REN, 
	\1Y1\ => PD(0), 
	\1Y2\ => PD(1), 
	\1Y3\ => PD(2), 
	\1Y4\ => PD(3), 
	\2Y1\ => PD(4), 
	\2Y2\ => PD(5), 
	\2Y3\ => PD(6), 
	\2Y4\ => PD(7), 
	VCC => VCC, 
	GND => GND
);
U6 : \74ACT175\	PORT MAP(
	D1 => DIN(4), 
	D2 => DIN(5), 
	D3 => DIN(6), 
	D4 => DIN(7), 
	CLK => CLK, 
	CLR => GND, 
	Q1 => N03923, 
	Q2 => N04071, 
	Q3 => N04185, 
	Q4 => N04302, 
	VCC => VCC, 
	GND => GND
);
U7 : \74ACT244\	PORT MAP(
	\1A1\ => P_PWEN, 
	\1A2\ => P_PCLK, 
	\1A3\ => P_PREN, 
	\1G\ => GND, 
	\2G\ => GND, 
	\1Y1\ => WEN, 
	\1Y2\ => CLK, 
	\1Y3\ => REN, 
	VCC => VCC, 
	GND => GND
);
END STRUCTURE;

