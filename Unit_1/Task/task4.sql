/*
Write a PL/SQL block to accept an employee ID and: 
 Retrieve employee details  
 Calculate yearly salary  
 Display whether employee belongs to High Income (> 
₹600000/year) or Normal Income. 

*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF

CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);

INSERT INTO employee VALUES (101, 'Rahul', 60000);
INSERT INTO employee VALUES (102, 'Priya', 40000);
INSERT INTO employee VALUES (103, 'Amit', 30000);

SET SERVEROUTPUT ON;

DECLARE
    v_emp_id        employee.emp_id%TYPE;
    v_emp_name      employee.emp_name%TYPE;
    v_salary        employee.salary%TYPE;
    v_yearly_salary NUMBER;
BEGIN

    v_emp_id := &emp_id;

    SELECT emp_name, salary
    INTO v_emp_name, v_salary
    FROM employee
    WHERE emp_id = v_emp_id;

    v_yearly_salary := v_salary * 12;

 
    DBMS_OUTPUT.PUT_LINE('Employee ID    : ' || v_emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name  : ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Monthly Salary : ₹' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Yearly Salary  : ₹' || v_yearly_salary);

    IF v_yearly_salary > 600000 THEN
        DBMS_OUTPUT.PUT_LINE('Income         : High Income');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Income         : Normal Income');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON