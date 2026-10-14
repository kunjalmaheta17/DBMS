/*
Write a trigger to restrict user form using the table on before 09:00
am and after 05:00 pm. ( between 09 am onwards and till 5 pm )
*/

SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER TR_HOLIDAY
BEFORE INSERT OR UPDATE OR DELETE ON EMP
FOR EACH ROW
BEGIN
IF TRIM(TO_CHAR (SYSDATE, 'HH')) < 9 OR TRIM(TO_CHAR (SYSDATE,
'HH')) >17 THEN

RAISE_APPLICATION_ERROR (-20420, 'You cannot access the

table before 9 am and after 5 pm');
END IF;
END;
/