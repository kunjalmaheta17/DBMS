/* Write a PL/SQL block that find 
	1.Area of circle(pi*radius*radius)
	2.Area of Rectangle(length*width)
	3.Circumference of circle(2*PI*RADIUS)
*/

ACCEPT CHOICE PROMPT "Enter Your Choice: 1.Area of circle ,2.Area of Rectangle ,3.Circumference of circle :-  "
SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

DECLARE
	CHOICE NUMBER:=&CHOICE;
	PI NUMBER(7,2):=3.14;
	RADIUS NUMBER(5);
	LENGTH NUMBER(5);
	WIDTH NUMBER(5);

BEGIN
	
	--CHOICE:=&CHOICE;
	RADIUS:=&RADIUS;
	LENGTH:=&LENGTH;
	WIDTH:=&WIDTH;
	DBMS_OUTPUT.PUT_LINE('	');
	IF (CHOICE=1) THEN
		DBMS_OUTPUT.PUT_LINE('Area of circle is : ' ||PI*(POWER(RADIUS,2)));
	ELSIF (CHOICE=2) THEN
		DBMS_OUTPUT.PUT_LINE('Area of Rectangle is : ' ||LENGTH*WIDTH);
	ELSIF (CHOICE=3) THEN
		 DBMS_OUTPUT.PUT_LINE( 'Circumference of circle is : ' || 2 * PI * RADIUS  );
	ELSE
		DBMS_OUTPUT.PUT_LINE('Invalid Choice');
	END IF;	
END;
/
SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON