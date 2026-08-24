/*
Write a PL/SQL block to remove an employee record
for the given Employee ID.
*/

SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

DECLARE
    EMP_ID EMP.EID%TYPE;
    CNT NUMBER;
BEGIN
    EMP_ID := &EID;

    SELECT COUNT(*) INTO CNT FROM EMP WHERE EID = EMP_ID;

    IF CNT > 0 THEN
        DELETE FROM EMP WHERE EID = EMP_ID;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE( 'Employee ID ' || EMP_ID || ' deleted successfully.' );

    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee ID ' || EMP_ID || ' does not exist.' );

    END IF;

END;
/

SET SERVEROUTPUT OFF
SET FEEDBACK ON
SET VERIFY ON