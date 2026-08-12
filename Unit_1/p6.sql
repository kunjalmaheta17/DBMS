/*
Write a PL/SQL block which accepts measurement in feet and displays it 
in cm, inch and meter.

Formulas:-
	1)Inches :-feet * 12
	2)Centimeters :- feet * 30.48
	3)Meters:-feet*0.3045
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

DECLARE
    FEET   NUMBER;
    CM     NUMBER;
    INCH   NUMBER;
    METER  NUMBER;
BEGIN
    FEET := &FEET;

    CM := FEET * 30.48;
    INCH := FEET * 12;
    METER := FEET * 0.3048;

    DBMS_OUTPUT.PUT_LINE('Feet       : ' || FEET);
    DBMS_OUTPUT.PUT_LINE('Centimeter : ' || CM);
    DBMS_OUTPUT.PUT_LINE('Inch       : ' || INCH);
    DBMS_OUTPUT.PUT_LINE('Meter      : ' || METER);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON


