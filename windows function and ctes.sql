use companydb;
select 
employeeid,
firstname,
lastname,
department,
row_number() over (partition by department order by lastname) AS row_num
From employees;

update employees set department =102 where employeeid=11;
select * from employees;

insert into employees(employeeid,firstname,lastname,department,hiredate,salary, phonenumbers) values
(13, "Angel", "Machael", 102, "2024-12-30",45000, "0701000000"),
(14, "ANN", "Washera", 101, "2023-12-30", 45000, "0189075756");

set SQL_safe_updates =0;

UPDATE employees set salary = 45000 where employeeid=1;
set SQL_safe_updates =0;

select employeeid, firstname,lastname,department,salary,
rank() over (partition by department order by salary desc) AS ranks
From employees;

update emplooyees
set salary= round(rand()*100000),2;

set SQL_safe_updates =1;

select 
employeeid,
firstname,
lastname,
department,
salary
sum (salary) over (partition by department) as total_salary
from employees;

select employeeid, firstname,lastname,salary, AVG(salary) over (order by employeeid Rows between 2 preceding and current row) as moving_avg
from employees;


-- cte  store results temporaly
WITH employeesSalaries AS( select employeeid, firstname,lastname,salary,department
from employees
where salary> 50000)
select department, AVG(salary) AS avg_salary
from employeesSalaries
group by department;

select* from employees;

-- how to handle duplicates in excel
-- 8/8/2024

select distinct
employeeid, trim(firstname) as firstname,
trim(lastname) as lastname
from employees;
 
 select*
 from employees
 where phonenumbers is null;