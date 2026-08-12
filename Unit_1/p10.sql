/*
Write a PL/SQL block to calculate the square and cube
of the given number.
*/

SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

DECLARE
    N NUMBER;
    SQUARE NUMBER;
    CUBE NUMBER;
BEGIN
    N := &N;
    SQUARE := N * N;
    CUBE := N * N * N;

    DBMS_OUTPUT.PUT_LINE('Given Number : ' || N);
    DBMS_OUTPUT.PUT_LINE('Square       : ' || SQUARE);
    DBMS_OUTPUT.PUT_LINE('Cube         : ' || CUBE);

END;
/

SET SERVEROUTPUT OFF
SET FEEDBACK ON
SET VERIFY ON