/*
Write a PL/SQL program to generate the multiplication table of a 
user-entered number using: 
 FOR LOOP  
 WHILE LOOP 
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

DECLARE
    n NUMBER;
BEGIN
    n := &n;

    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' x ' || i || ' = ' || (n * i));
    END LOOP;
END;
/


SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON