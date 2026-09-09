/*
Create a procedure to update the salary of an employee using the 
employee ID. Handle the exception if the employee ID does not exist. 
*/

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SALARY (
    P_EMPNO IN NUMBER,
    P_NEW_SAL IN NUMBER
)
IS
    V_OLD_SAL EMP.SAL%TYPE;
BEGIN

    SELECT SAL
    INTO V_OLD_SAL
    FROM EMP
    WHERE EMPNO = P_EMPNO;

    DBMS_OUTPUT.PUT_LINE('Employee Number: ' || P_EMPNO);
    DBMS_OUTPUT.PUT_LINE('Old Salary: ' || V_OLD_SAL);

    UPDATE EMP
    SET SAL = P_NEW_SAL
    WHERE EMPNO = P_EMPNO;

    DBMS_OUTPUT.PUT_LINE('New Salary: ' || P_NEW_SAL);
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee Number ' || P_EMPNO || ' does not exist.'
        );
END UPDATE_EMP_SALARY;
/

BEGIN
    UPDATE_EMP_SALARY(
        &ENTER_EMPNO,
        &ENTER_NEW_SAL
    );
END;
/

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE EMPNO = &ENTER_EMPNO;