/*
Write a PL/SQL block which converts temperature from Celsius to 
Fahrenheit.

Formulas:-
	-Celsius to Fahrenheit :-(Celsius *9/2)+32
	-Fahrenheit to Celsius :-(Fahrenheit-32)/5/9
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT CH PROMPT 'Enter your choice :- 1. Celsius to Fahrenheit, 2. Fahrenheit to Celsius: '

DECLARE
	 CELSIUS NUMBER(10,2);
	FAHRENHEIT NUMBER(10,2);
   	 CHOICE NUMBER(10);
BEGIN

    CHOICE := &CH;

    IF CHOICE = 1 THEN

        CELSIUS := &CELSIUS;
        FAHRENHEIT := (CELSIUS * 9 / 5) + 32;

        DBMS_OUTPUT.PUT_LINE('Value of FAHRENHEIT :- ' || FAHRENHEIT);

    ELSIF CHOICE = 2 THEN

        FAHRENHEIT := &FAHRENHEIT;
        CELSIUS := (FAHRENHEIT - 32) * 5 / 9;

        DBMS_OUTPUT.PUT_LINE('Value of CELSIUS :- ' || CELSIUS ||'C');

    ELSE

        DBMS_OUTPUT.PUT_LINE('INVALID CHOICE... Enter 1 or 2');

    END IF;

END;
/