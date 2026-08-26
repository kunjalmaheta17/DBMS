/*
Write a function that returns the age, category of an employee.
Categories:
● Age < 18 → Minor
● 18–60 → Adult
● 60 → Senior
*/
SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

CREATE OR REPLACE FUNCTION GET_AGE_CATEGORY (
    P_EID IN NUMBER
)
RETURN VARCHAR2
IS
    V_AGE EMP.AGE%TYPE;
    V_CATEGORY VARCHAR2(20);
BEGIN
    SELECT AGE
    INTO V_AGE
    FROM EMP
    WHERE EID = P_EID;

    IF V_AGE < 18 THEN
        V_CATEGORY := 'Minor';
    ELSIF V_AGE <= 60 THEN
        V_CATEGORY := 'Adult';
    ELSE
        V_CATEGORY := 'Senior';
    END IF;

    RETURN 'Age: ' || V_AGE || ', Category: ' || V_CATEGORY;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Employee not found';
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON
/*
To run this :-

VARIABLE v_eid NUMBER;
VARIABLE v_result VARCHAR2(100);
EXEC :v_eid := 101;
EXEC :v_result := GET_AGE_CATEGORY(:v_eid);
PRINT v_result;

*/