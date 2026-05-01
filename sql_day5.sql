use d13r;
desc employees_tb;

SELECT * FROM employees_tb;

#1.counting total no.of of employess
SELECT count(name)
from employees_tb;


#2.counting how many employees have salary
select count(salary)
from employees_tb;

#3.finding no.of unique departments
select count(distinct dept) from employees_tb;

#4.Finding total salary paid to all employees.
select sum(salary) from employees_tb;

#5.Finding average salary.
select avg(salary) from employees_tb;

#6.Calculate total of distinct bonus values.
select sum(distinct bounus) from employees_tb;

#7.Finding highest salary.
select max(salary) from employees_tb;

#8.Finding  lowest salary.
select min(salary) from employees_tb;

#9.Calculate total payout (salary + bonus) for all employees.
select sum(salary+bounus) from employees_tb;

#10.Find average salary after deducting tax (10%).
select avg(salary-(salary*0.1)) from employees_tb;





