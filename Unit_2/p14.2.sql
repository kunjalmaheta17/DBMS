/*
Write a function to return the experience category of an
employee using the SCOTT EMP table.
Categories:
● Fresher – Less than 5 years
● Middle Experienced – 5 to 10 years
● Senior – More than 10 years
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

CREATE OR REPLACE FUNCTION GET_EXPERIENCE_CATEGORY (
    P_EMPNO IN NUMBER
)
RETURN VARCHAR2
IS
    V_HIREDATE EMP.HIREDATE%TYPE;
    V_YEARS NUMBER;
BEGIN
    SELECT HIREDATE
    INTO V_HIREDATE
    FROM EMP
    WHERE EMPNO = P_EMPNO;

    V_YEARS := MONTHS_BETWEEN(SYSDATE, V_HIREDATE) / 12;

    IF V_YEARS < 5 THEN
        RETURN 'Fresher';
    ELSIF V_YEARS <= 10 THEN
        RETURN 'Middle Experienced';
    ELSE
        RETURN 'Senior';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Employee not found';
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON
/*
To run this :

- @ D:\92600584022\DBMS\Unit_2\p14.2.sql
- VARIABLE v_empno NUMBER;
  VARIABLE v_result VARCHAR2(50);
- EXEC :v_empno := 7902;
- EXEC :v_result := GET_EXPERIENCE_CATEGORY(:v_empno);
- PRINT v_result;

*/