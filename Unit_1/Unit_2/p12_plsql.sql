DECLARE
    V_ENAME  VARCHAR2(30);
    V_SALARY NUMBER;
    V_DEPTNO NUMBER;
BEGIN
    SEARCH_EMP(101, V_ENAME, V_SALARY, V_DEPTNO);

    IF V_ENAME IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Employee Name : ' || V_ENAME);
        DBMS_OUTPUT.PUT_LINE('Salary        : ' || V_SALARY);
        DBMS_OUTPUT.PUT_LINE('Department No : ' || V_DEPTNO);
    END IF;
END;
/