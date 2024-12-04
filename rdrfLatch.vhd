LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rdrfLatch IS
	PORT(
		i_clear, i_set	: IN	STD_LOGIC;
		o_rdrf, o_rdrfBar	: OUT	STD_LOGIC);
END rdrfLatch;

ARCHITECTURE rtl OF rdrfLatch IS
	SIGNAL int_q : STD_LOGIC;

BEGIN

oneBitReg:
PROCESS(i_clear, i_set)
BEGIN
	IF (i_clear = '1') THEN
		int_q	<= '0';
    ELSIF (i_set = '1') THEN
        int_q	<= '1';
	END IF;
END PROCESS oneBitReg;
	--  Output Driver
	o_rdrf		<=	int_q;
	o_rdrfBar		<=	not(int_q);

END rtl;