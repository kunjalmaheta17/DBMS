/*
Create a STUDENT table and write a PL/SQL block that accepts Roll 
Number and: 
 Calculates Total  
 Percentage  
 Assigns Grade  
 Displays Pass/Fail status (Pass if all subjects ≥35).
*/

CREATE TABLE STUDENT (
    ROLL_NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(50),
    MARK1 NUMBER,
    MARK2 NUMBER,
    MARK3 NUMBER,
    TOTAL NUMBER,
    PERCENTAGE NUMBER(5,2),
    GRADE CHAR(1),
    STATUS VARCHAR2(10)
);

INSERT INTO STUDENT (ROLL_NO, NAME, MARK1, MARK2, MARK3)
VALUES (101, 'Rahul', 80, 70, 90);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_roll       NUMBER := &ROLL_NO;
    v_mark1      NUMBER;
    v_mark2      NUMBER;
    v_mark3      NUMBER;
    v_total      NUMBER;
    v_percentage NUMBER;
    v_grade      CHAR(1);
    v_status     VARCHAR2(10);
BEGIN
 
    SELECT MARK1, MARK2, MARK3
    INTO v_mark1, v_mark2, v_mark3
    FROM STUDENT
    WHERE ROLL_NO = v_roll;

 
    v_total := v_mark1 + v_mark2 + v_mark3;

    v_percentage := v_total / 3;

    IF v_mark1 >= 35
       AND v_mark2 >= 35
       AND v_mark3 >= 35 THEN
        v_status := 'PASS';
    ELSE
        v_status := 'FAIL';
    END IF;

    IF v_status = 'FAIL' THEN
        v_grade := 'F';
    ELSIF v_percentage >= 75 THEN
        v_grade := 'A';
    ELSIF v_percentage >= 60 THEN
        v_grade := 'B';
    ELSIF v_percentage >= 50 THEN
        v_grade := 'C';
    ELSE
        v_grade := 'D';
    END IF;


    DBMS_OUTPUT.PUT_LINE('Roll Number : ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Total       : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage  : ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Grade       : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Status      : ' || v_status);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Roll Number not found.');
END;
/