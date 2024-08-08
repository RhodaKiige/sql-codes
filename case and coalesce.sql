use companydb;
select employeeid, firstname, lastname, department,
Case department
	when 101 then "HR"
    when 102 then "IT"
    when 103 then "Finance"
    else "other"
    end as DepartmentName
from employees;

select * from employees;
select employeeid, firstname,lastname,salary,
case
	when salary<50000 then "low"
    when salary between 50000 and 70000 then "medium"
    else "high"
    end as salary_level
from employees;
