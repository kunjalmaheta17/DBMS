/* 
1.write a package which includes one procedure and one function 
*for procedure:
-procedure will accept joining date from the user and shows total no. of months of experience for given employee

2.write a function which accepts date from the user and check wheather the year is leap year or not.
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF
create or replace package pkgchecks as
	procedure experience_check(p_eid number);
	function check_leapyear(d date) return varchar2;
end pkgchecks;
/

create or replace package body pkgchecks as
	procedure experience_check(p_eid number) is
		v_ename employee.ename%type;
		v_join_date employee.joining_date%type;
		v_months number;
	begin
		select ename, joining_date into v_ename, v_join_date from employee where eid=p_eid;
		v_months:=trunc(months_between(sysdate,v_join_date));
		dbms_output.put_line('total months of experience: '||v_months);
end experience_check;

function check_leapyear(d date) return varchar2 is
	v_year number;
	begin
		v_year:=to_number(to_char(d,'yyyy'));
		if mod(v_year,400)=0 or (mod(v_year,4)=0 and mod(v_year,100)<>0) then
	return 'leap year';
else
return 'not a leap year';
end if;
end check_leapyear;

end pkgchecks;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON


/*
exec pkgchecks.experience_check(105);

select pkgchecks.check_leapyear(date '2024-01-01') from dual;
select pkgchecks.check_leapyear(date '2025-01-01') from dual;
select * from employee;
*/
