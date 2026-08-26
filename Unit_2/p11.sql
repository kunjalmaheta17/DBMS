/*
Write a simple procedure that increases by the salary of employees for the given department no. by percentage inputted by the user using IN parameter. Also handle the exception if inputted department number not found.
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

CREATE OR REPLACE PROCEDURE increase_salary (
    p_deptno  IN NUMBER,
    p_percent IN NUMBER
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM EMP
    WHERE DEPTNO = p_deptno;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Department number ' || p_deptno || ' not found'
        );
    END IF;

    UPDATE EMP
    SET BASICSAL = BASICSAL + (BASICSAL * p_percent / 100)
    WHERE DEPTNO = p_deptno;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Salary increased by ' || p_percent ||
        '% for department ' || p_deptno
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON


/*
To run this program:
1) @ D:\92600584022\DBMS\Unit_2\p11.sql
2) create global variables:-
    VARIABLE v_deptno NUMBER;
    VARIABLE v_percent NUMBER;
3)Assign value to them:-
   EXEC :v_deptno := 10;
   EXEC :v_percent := 10;
4)EXEC increase_salary(:v_deptno, :v_percent);

*/