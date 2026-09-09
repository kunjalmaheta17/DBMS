/*
Create a procedure that accepts Department Number and displays:

• Total Employees
• Average Salary
• Maximum Salary

Use OUT parameters.
*/


CREATE OR REPLACE PROCEDURE dept_statistics (
    p_dept_no IN NUMBER,
    p_total OUT NUMBER,
    p_avg_salary OUT NUMBER,
    p_max_salary OUT NUMBER
)
AS
BEGIN
    SELECT COUNT(*),
           AVG(SALARY),
           MAX(SALARY)
    INTO p_total,
         p_avg_salary,
         p_max_salary
    FROM EMP1
    WHERE DEPT_NO = p_dept_no;
END;
/

DECLARE
    v_dept_no NUMBER;
    v_total NUMBER;
    v_avg_salary NUMBER;
    v_max_salary NUMBER;
BEGIN

    v_dept_no := &dept_no;

    dept_statistics(
        v_dept_no,
        v_total,
        v_avg_salary,
        v_max_salary
    );

    DBMS_OUTPUT.PUT_LINE('Department Number = ' || v_dept_no);
    DBMS_OUTPUT.PUT_LINE('Total Employees = ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Average Salary = ' || v_avg_salary);
    DBMS_OUTPUT.PUT_LINE('Maximum Salary = ' || v_max_salary);

END;
/

