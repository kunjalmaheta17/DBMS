/* Write a PL/SQL block to accept an employee's Basic salary and calculate:
    HRA = 20%
    DA = 45%
    TA = 8%
    PF = 12%
    Net salary 
    display all salary components.
    */

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

DECLARE
    SAL NUMBER(7,2);
    HRA NUMBER(7,2);
    DA NUMBER(7,2);
    TA NUMBER(7,2);
    PF NUMBER(7,2);
    NET_SALARY NUMBER(7,2);
BEGIN
    SAL:=&SAL;
    HRA:= SAL*20/100;
    DA:= SAL*45/100;
    TA:= SAL*8/100;
    PF:= SAL*12/100;
    NET_SALARY:=(SAL+HRA+DA+TA)-PF;

    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('Basic salary is : '||SAL);
    DBMS_OUTPUT.PUT_LINE('HRA is : '||HRA);
    DBMS_OUTPUT.PUT_LINE('DA is : '||DA);
    DBMS_OUTPUT.PUT_LINE('TA is : '||TA);
    DBMS_OUTPUT.PUT_LINE('PF is : '||PF);
    DBMS_OUTPUT.PUT_LINE('Net salary is : '||NET_SALARY);
    
END;
/
SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON
