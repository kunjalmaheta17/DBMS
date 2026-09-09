/*
Create a package named PKG_EMPLOYEE containing:
1. Function to calculate annual salary of an employee.
2. Procedure to show employee information using employee ID.
3. Call each package object separately.
*/


CREATE OR REPLACE PACKAGE PKG_EMPLOYEE
AS

    FUNCTION GET_ANNUAL_SALARY (
        P_EMPNO IN NUMBER
    )
    RETURN NUMBER;

    PROCEDURE SHOW_EMPLOYEE_INFO (
        P_EMPNO IN NUMBER
    );

END PKG_EMPLOYEE;
/


CREATE OR REPLACE PACKAGE BODY PKG_EMPLOYEE
AS

    FUNCTION GET_ANNUAL_SALARY (
        P_EMPNO IN NUMBER
    )
    RETURN NUMBER
    IS
        V_SAL EMP.SAL%TYPE;
    BEGIN

        SELECT SAL
        INTO V_SAL
        FROM EMP
        WHERE EMPNO = P_EMPNO;

        RETURN V_SAL * 12;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;

    END GET_ANNUAL_SALARY;

    PROCEDURE SHOW_EMPLOYEE_INFO (
        P_EMPNO IN NUMBER
    )
    IS
        V_ENAME EMP.ENAME%TYPE;
        V_SAL   EMP.SAL%TYPE;
    BEGIN

        SELECT ENAME, SAL
        INTO V_ENAME, V_SAL
        FROM EMP
        WHERE EMPNO = P_EMPNO;

        DBMS_OUTPUT.PUT_LINE(
            'Employee Number : ' || P_EMPNO
        );

        DBMS_OUTPUT.PUT_LINE(
            'Employee Name   : ' || V_ENAME
        );

        DBMS_OUTPUT.PUT_LINE(
            'Salary          : ' || V_SAL
        );

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE(
                'Employee Number ' || P_EMPNO || ' does not exist.'
            );

    END SHOW_EMPLOYEE_INFO;

END PKG_EMPLOYEE;
/


SELECT EMPNO,
       ENAME,
       SAL,
       PKG_EMPLOYEE.GET_ANNUAL_SALARY(EMPNO)
           AS ANNUAL_SALARY
FROM EMP;


BEGIN
    PKG_EMPLOYEE.SHOW_EMPLOYEE_INFO(101);
END;
/