/*
Write a procedure that search whether the given employee number is 
present or not in the table if present then print name, salary and 
department number of that employee. (Use both IN and OUT mode 
variables) and also Write a PL/SQL block to call the SEARCH_EMP 
procedure.
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

CREATE OR REPLACE PROCEDURE SEARCH_EMP (
    P_EID       IN NUMBER,
    P_ENAME     OUT VARCHAR2,
    P_SALARY    OUT NUMBER,
    P_DEPTNO    OUT NUMBER
)
IS
BEGIN
    SELECT ENAME, BASICSAL, DEPTNO
    INTO P_ENAME, P_SALARY, P_DEPTNO
    FROM EMP
    WHERE EID = P_EID;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        P_ENAME := NULL;
        P_SALARY := NULL;
        P_DEPTNO := NULL;

        DBMS_OUTPUT.PUT_LINE(
            'Employee number ' || P_EID || ' not found.'
        );
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON

/*
TO run this program :-

1)create global variables:
	VARIABLE v_eid NUMBER;
	VARIABLE v_ename VARCHAR2(30);
	VARIABLE v_salary NUMBER;
	VARIABLE v_deptno NUMBER;
2)Enter employee ID:
	EXEC :v_eid := 101;
3)Call the procedure:
	EXEC SEARCH_EMP(:v_eid, :v_ename, :v_salary, :v_deptno);
4)@ D:\92600584022\DBMS\Unit_2\p12_plsql.sql
	
*/