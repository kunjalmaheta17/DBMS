/*
 Write a PL/SQL block to calculate the total, percentage and grade of 
student based on his/her Rollno from RESULT table. (Create RESULT 
table with Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Total, Per, 
Grade attributes with appropriate data type). 
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

DECLARE
	  ROLL_NO NUMBER(5);
	  NAME VARCHAR2(30);
  	  SUB1 NUMBER(3);
   	 SUB2 NUMBER(3);
 	   SUB3 NUMBER(3);
  	  SUB4 NUMBER(3);
  	  SUB5 NUMBER(3);
  	 TOTAL NUMBER(5);   
	 PER NUMBER(7,2);    
	GRADE VARCHAR2(30);
BEGIN
	ROLL_NO:=&ROLL_NO;
	NAME:='&NAME';
	SUB1:=&SUB1;
	SUB2 :=&SUB2 ;
	SUB3 :=&SUB3 ;
	SUB4:=&SUB4;
	SUB5:=&SUB5;
	
	TOTAL:=SUB1+SUB2+SUB3+SUB4+SUB5;
	PER:=TOTAL/5;
	
	IF (PER>=75) THEN
		GRADE:='O';
	ELSIF (PER<=75)AND(PER>=70) THEN
		GRADE:='A';	
	ELSIF (PER<=60)AND(PER>=70) THEN
		GRADE:='B';
	ELSIF (PER<=50)AND(PER>=60) THEN
		GRADE:='C';
	ELSE
		GRADE:='PASS CLASS';
	END IF;
		
	INSERT INTO RESULT(ROLLNO,NAME,SUB1,SUB2,SUB3,SUB4,SUB5,TOTAL,PER,GRADE)VALUES(ROLL_NO,NAME,SUB1,SUB2,SUB3,SUB4,SUB5,TOTAL,PER,GRADE);

	DBMS_OUTPUT.PUT_LINE('	');
	DBMS_OUTPUT.PUT_LINE('Roll no:-'||ROLL_NO);
	DBMS_OUTPUT.PUT_LINE('Name:-'||NAME);
	DBMS_OUTPUT.PUT_LINE('	');
	DBMS_OUTPUT.PUT_LINE('---------------------Result--------------------------');
	DBMS_OUTPUT.PUT_LINE('Marks of sub1:-'||SUB1);
	DBMS_OUTPUT.PUT_LINE('Marks of sub2:-'||SUB2);
	DBMS_OUTPUT.PUT_LINE('Marks of sub3:-'||SUB3);
	DBMS_OUTPUT.PUT_LINE('Marks of sub4:-'||SUB4);
	DBMS_OUTPUT.PUT_LINE('Marks of sub5:-'||SUB5);
	
	DBMS_OUTPUT.PUT_LINE('	');
	DBMS_OUTPUT.PUT_LINE('-----------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Your total marks : '||TOTAL);
	DBMS_OUTPUT.PUT_LINE('Percentage :'||PER||'%');
	DBMS_OUTPUT.PUT_LINE('Grade:'||GRADE);
	
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON

