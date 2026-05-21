create database practice;
use practice;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    manager_id INT,
    join_date DATE
);

INSERT INTO employees VALUES
(1,'Deepak','IT',50000,NULL,'2022-01-10'),
(2,'Ravi','HR',40000,1,'2023-03-15'),
(3,'Anu','IT',60000,1,'2021-06-20'),
(4,'Kiran','Finance',45000,2,'2024-02-12'),
(5,'Sneha','HR',42000,2,'2022-08-19'),
(6,'John','IT',60000,1,'2023-11-11'),
(7,'Priya','Finance',70000,4,'2020-05-25'),
(8,'Rahul','IT',55000,3,'2024-01-01');


#1. Retrieve all employee details
SELECT *FROM employees;

#2.Find employees with salary greater than 50000
SELECT *FROM employees 
WHERE salary > 50000;

#3. Find employees from IT department
SELECT *FROM employees
WHERE department="IT";

#4. Find employees whose names start with 'R'
SELECT *FROM employees 
WHERE emp_name LIKE "R%";

#5. Find total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;

#6. Find average salary
SELECT AVG(salary) as average_salary 
from employees;

#7. Find highest salary
SELECT MAX(salary) as highest_salary 
from employees;

#8. Find second highest salary
SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

#9. Find third highest salary
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC LIMIT 1 OFFSET 2;

#10. Find duplicate salaries
SELECT salary,count(*)
FROM employees 
GROUP BY salary HAVING count(*) > 1;

#11. Find department-wise employee count
SELECT department,count(*)
FROM employees
GROUP BY department;

#12. Find departments having more than 2 employees
SELECT department,count(*) as total_emps
FROM employees
GROUP BY department 
HAVING count(*) >2;

#13. Find highest salary in each department
SELECT department,MAX(salary) as highest_salary 
FROM employees 
GROUP BY department;

#14. Find employees earning more than department average
SELECT *FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees
                WHERE department=e.department);
                
#15. Find employees without managers       
SELECT *FROM employees
WHERE manager_id IS NULL;    

#16. Retrieve employees joined after 2023
SELECT *FROM employees
WHERE join_date > '2023-01-01' ;


