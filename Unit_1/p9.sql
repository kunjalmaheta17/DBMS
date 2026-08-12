/*
Write a PL/SQL block to calculate Simple Interest
and Total Amount.
*/

SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

DECLARE
    P NUMBER;
    R NUMBER;
    T NUMBER;
    SI NUMBER;
    AMOUNT NUMBER;
BEGIN
    P := &P;
    R := &R;
    T := &T;

    -- Calculate Simple Interest
    SI := (P * R * T) / 100;

    -- Calculate Total Amount
    AMOUNT := P + SI;

    DBMS_OUTPUT.PUT_LINE('Principal Amount : ' || P);
    DBMS_OUTPUT.PUT_LINE('Rate of Interest : ' || R || '%');
    DBMS_OUTPUT.PUT_LINE('Number of Years  : ' || T);
    DBMS_OUTPUT.PUT_LINE('Simple Interest  : ' || SI);
    DBMS_OUTPUT.PUT_LINE('Total Amount     : ' || AMOUNT);

END;
/

SET SERVEROUTPUT OFF
SET FEEDBACK ON
SET VERIFY ON