/*
Write a PL/SQL block which displays gross salary of employees as per user input EID.
Consider EMP table with EID, EName, Deptno, Deptname, Gender, Age, BasicSal with appropriate data types.
Gross_Salary:= BASICSAL + (DA + HRA + Medical) – PF. 
Rules: HRA = 15% of basic, DA = 50% of basic, Medical = Rs. 500, PF = 10% of basic.
Here for practical we have used Scott users inbuilt EMP table.
*/

SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

DECLARE
    V_EID       EMP.EID%TYPE;
    V_NAME      EMP.ENAME%TYPE;
    BASIC_SAL   EMP.BASICSAL%TYPE;

    DA          NUMBER;
    HRA         NUMBER;
    MEDICAL     NUMBER := 500;
    PF          NUMBER;

    GROSS_SAL   NUMBER;

BEGIN

    V_EID := &EID;

    SELECT ENAME, BASICSAL
    INTO V_NAME, BASIC_SAL
    FROM EMP
    WHERE EID = V_EID;

    DA := BASIC_SAL * 0.50;
    HRA := BASIC_SAL * 0.15;
    PF := BASIC_SAL * 0.10;

    GROSS_SAL := BASIC_SAL + DA + HRA + MEDICAL - PF;

    DBMS_OUTPUT.PUT_LINE('--------------- SALARY SLIP ---------------');
    DBMS_OUTPUT.PUT_LINE('Employee ID     : ' || V_EID);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Basic Salary    : Rs. ' || BASIC_SAL);
    DBMS_OUTPUT.PUT_LINE('DA Amount       : Rs. ' || DA);
    DBMS_OUTPUT.PUT_LINE('HRA Amount      : Rs. ' || HRA);
    DBMS_OUTPUT.PUT_LINE('Medical Amount  : Rs. ' || MEDICAL);
    DBMS_OUTPUT.PUT_LINE('Provident Fund  : Rs. ' || PF);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Gross Salary    : Rs. ' || GROSS_SAL);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee record for given EID - ' || V_EID || ' does not exist'
        );

END;
/

SET SERVEROUTPUT OFF
SET FEEDBACK ON
SET VERIFY ON