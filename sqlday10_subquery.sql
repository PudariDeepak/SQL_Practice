use interview;

CREATE TABLE employee1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary INT
);

INSERT INTO employee1 (emp_id,emp_name,department,job_role,salary)
VALUES
(1, 'Arun', 'HR', 'HR Manager', 55000),
(2, 'Bhanu', 'HR', 'Recruiter', 40000),
(3, 'Charan', 'HR', 'HR Executive', 35000),
(4, 'Deepak', 'IT', 'Developer', 75000),
(5, 'Esha', 'IT', 'Tester', 50000),
(6, 'Farhan', 'IT', 'Team Lead', 90000),
(7, 'Gopi', 'IT', 'Support Engineer', 45000),
(8, 'Harsha', 'Finance', 'Accountant', 60000),
(9, 'Ishita', 'Finance', 'Finance Manager', 95000),
(10, 'Jagan', 'Finance', 'Auditor', 65000),
(11, 'Kiran', 'Sales', 'Sales Executive', 40000),
(12, 'Lavanya', 'Sales', 'Sales Manager', 85000),
(13, 'Manoj', 'Sales', 'Sales Associate', 38000),
(14, 'Nikhil', 'Marketing', 'Marketing Executive', 48000),
(15, 'Oviya', 'Marketing', 'Marketing Manager', 82000),
(16, 'Pavan', 'Marketing', 'SEO Analyst', 42000),
(17, 'Qadir', 'Admin', 'Administrator', 30000),
(18, 'Renu', 'Admin', 'Office Assistant', 28000),
(19, 'Sandeep', 'Operations', 'Operations Manager', 88000),
(20, 'Teja', 'Operations', 'Coordinator', 52000);


#1.Write a SQL query to find all employees who earn a salary greater than the average salary of their department.
select *from employee1 e
where salary > (select avg(salary) from employee1 
where department=e.department);

#2.Use a subquery to find the department with the highest average salary and list all employees working in that department.
select * from employee1 
where department =(select department from employee1 
group by department order by avg(salary) desc limit 1);

#3.Create a query to find all employees whose salary is above the average salary of the company, using a subquery to calculate the average company salary.
select *from employee1
where salary > (select avg(salary) from employee1);

#4.Write a query that finds the top 3 departments with the highest total salaries, using a subquery to calculate the total salary for each department.
select department,total_salary
from (select department,sum(salary) as total_salary
      from employee1 
      group by department
      )as dept_salary
order by total_salary desc limit 3 ;

