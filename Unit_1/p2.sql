/*     Write a PL/SQL  block to accept product name ,qty and price from user 
and then calculate discount in Rs.based on the given (%) 
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT PN PROMPT "Enter product name :- "
DECLARE
	P_NAME	 VARCHAR(20);
	QTY	NUMBER(5);
	PRICE	NUMBER(7,2);
	TP	NUMBER(7,2);
	DISCOUNT	NUMBER(5);
	FP	NUMBER(7,2);
BEGIN
	P_NAME:='&PN';
	QTY:=&QTY;
	PRICE:=&PRICE;
	DISCOUNT:=&DISCOUNT;

	TP:=PRICE*QTY;
	FP:=TP-(TP*DISCOUNT/100);
	DBMS_OUTPUT.PUT_LINE('	');
	DBMS_OUTPUT.PUT_LINE('Product name is := '||P_NAME);
	DBMS_OUTPUT.PUT_LINE('Total qty is := '||QTY);
	DBMS_OUTPUT.PUT_LINE('Price is := '||PRICE);
	DBMS_OUTPUT.PUT_LINE('Total Price is := '||TP);
	DBMS_OUTPUT.PUT_LINE('Discount is := '||DISCOUNT);
	DBMS_OUTPUT.PUT_LINE('Final Price is := '||FP);
	
END;
/
SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON
