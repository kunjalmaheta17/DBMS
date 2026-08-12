/*
1. Write a program that prints value 1 to 100 numbers using FOR LOOP. 
2. Write a program that prints value 1 to 100 number using LOOP 
Command. 
3. Write a program that prints value 1 to 100 number using WHILE LOOP 
Command
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

DECLARE
    i NUMBER := 1;
BEGIN

    -- FOR LOOP
    DBMS_OUTPUT.PUT_LINE('--- FOR LOOP ---');

    FOR i IN 1..100 LOOP
        DBMS_OUTPUT.PUT(i || ' ');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' 		');


    -- SIMPLE LOOP
    DBMS_OUTPUT.PUT_LINE('--- SIMPLE LOOP ---');

    i := 1;

    LOOP
        DBMS_OUTPUT.PUT(i || ' ');

        i := i + 1;

        EXIT WHEN i > 100;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('	');

   DBMS_OUTPUT.PUT_LINE('--- WHILE LOOP ---');

    i := 1;

    WHILE i <= 100 LOOP
        DBMS_OUTPUT.PUT(i || ' ');
        i := i + 1;
    END LOOP;

      DBMS_OUTPUT.PUT_LINE('	');
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON
