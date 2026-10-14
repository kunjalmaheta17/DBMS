/*
Write a trigger to restrict user form using the table on Sunday.
*/


SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER TR_HOLIDAY
BEFORE INSERT OR UPDATE OR DELETE ON EMP
FOR EACH ROW

BEGIN
	IF TRIM (TO_CHAR(SYSDATE,'Day'))='Sunday' THEN 
		RAISE_APPLICATION_ERROR(-20420, 'You cannot modify data on Sunday');
	ELSE
		IF TRIM(TO_CHAR(SYSDATE,'HH')) < 12 OR TRIM (TO_CHAR(SYSDATE,'HH'))>5 THEN
			RAISE_APPLICATION_ERROR (-20420, 'You cannot access the table before 12 am and after 5 pm');
		END IF;
	END IF;

END;
/