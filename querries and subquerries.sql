use companydb;
alter table employees add Salary int;

select* from employees;
-- disable safe update mode for the current session
set SQL_SAFE_UPDATES =0;
-- update the salary column with random values
update employees
set salary = round(rand()*(80000-40000) + 40000,2);
-- TO ENABLE SQL SAFE MODE
set SQL_SAFE_UPDATES =1;

SELECT * FROM EMPLOYEES;


SELECT DepartmentName,
(select count(*)
from employees
where employees.department= department.departmentID) AS EmployeeCount
from Department;

SELECT * from department;
select * from employees;


SELECT Department, AverageSalary
FROM (select Department, AVG(Salary) AS AverageSalary
FROM employees
Group By Department) as AVGSalaries
where averageSalary >50000;

select*
from employees
where Salary= (SELECT Max(Salary)
from employees as e
WHERE e.Department = employees.Department);

select*
from employees
where Salary= (SELECT Max(Salary)
from employees);