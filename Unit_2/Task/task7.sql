/*
Create a function that returns the annual salary
of an employee (SAL × 12).
Call the function inside a SELECT statement.
*/

CREATE OR REPLACE FUNCTION GET_ANNUAL_SALARY (
    P_EID NUMBER
)
RETURN NUMBER
IS
    V_SALARY NUMBER;
BEGIN
    SELECT SAL
    INTO V_SALARY
    FROM EMP
    WHERE EMPNO = P_EID;

    RETURN V_SALARY * 12;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END GET_ANNUAL_SALARY;
/

SELECT EMPNO,
       ENAME,
       SAL,
       GET_ANNUAL_SALARY(EMPNO) AS ANNUAL_SALARY
FROM EMP;