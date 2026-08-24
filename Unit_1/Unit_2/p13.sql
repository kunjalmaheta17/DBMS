/*
Write a procedure that accept employee ID and remove records from 
employee table. Also create a calling program to call procedure.
*/

CREATE OR REPLACE PROCEDURE REMOVE_EMPLOYEE (
    P_EID IN EMP.EID%TYPE
)
IS
BEGIN
    DELETE FROM EMP
    WHERE EID = P_EID;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID ' || P_EID || ' not found.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID ' || P_EID || ' deleted successfully.'
        );
    END IF;

    COMMIT;
END;
/

/*
To run this program:-
1) @ D:\92600584022\DBMS\Unit_2\p13.sql
2) VARIABLE v_eid NUMBER;
3) EXEC :v_eid := 102;
4) EXEC REMOVE_EMPLOYEE(:v_eid);
*/