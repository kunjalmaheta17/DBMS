/*
Write a PL/SQL block that accepts three numbers and displays: 
 Largest number  
 Smallest number  
 Average  
 Check also whether all numbers are equal. 
*/

SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := &num1;
    b NUMBER := &num2;
    c NUMBER := &num3;

    largest  NUMBER;
    smallest NUMBER;
    average  NUMBER;
BEGIN
    largest := GREATEST(a, b, c);
    smallest := LEAST(a, b, c);
    average := (a + b + c) / 3;

    DBMS_OUTPUT.PUT_LINE('First Number  : ' || a);
    DBMS_OUTPUT.PUT_LINE('Second Number : ' || b);
    DBMS_OUTPUT.PUT_LINE('Third Number  : ' || c);
    DBMS_OUTPUT.PUT_LINE('Largest       : ' || largest);
    DBMS_OUTPUT.PUT_LINE('Smallest      : ' || smallest);
    DBMS_OUTPUT.PUT_LINE('Average       : ' || average);

    IF a = b AND b = c THEN
        DBMS_OUTPUT.PUT_LINE('All three numbers are equal.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('All three numbers are not equal.');
    END IF;
END;
/