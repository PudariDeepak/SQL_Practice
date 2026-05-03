use d13r;
select *from employees_tb;

#1. Fetch all employees who earn more than ₹40,000.
SELECT count(*)
FROM employees_tb
where salary>40000;

#2. Get all employees whose names start with the letter 'A'.
SELECT name
FROM employees_tb
WHERE name LIKE ("a%");


#3.Retrieve all employees where the department is either 'HR' or 'Finance'.
SELECT name,dept
FROM employees_tb
WHERE dept="HR" or dept="Finance";

#4.Find all employees where the manager field has no value (is NULL).
SELECT count(*)
FROM employees_tb
WHERE name= null;

/*5.Count the number of employees in each department, but only include 
employees earning more than ₹30,000.*/
SELECT dept,count(*)
FROM employees_tb
WHERE salary>30000 
GROUP BY dept;
select *from employees_tb;


#6.Find the average salary for each job_role in the 'IT' department.
SELECT job_role,avg(salary)
FROM employees_tb
WHERE dept="IT"
GROUP BY job_role;


/*7. Show the total salary paid per department and per job_role for
employees aged under 35.*/
SELECT dept,job_role,sum(salary)
FROM employees_tb
WHERE age<35
GROUP BY  dept,job_role;

#8.Find the total salary paid to employees in each department.
SELECT dept,sum(salary)
FROM employees_tb
GROUP BY dept;

#9.Count the total number of employees in each department.
SELECT dept,count(*)
FROM employees_tb
GROUP BY dept;

#10. Find the average salary of employees in each department.
SELECT dept,avg(salary)
FROM employees_tb
GROUP BY dept;

#11.Show the count of employees for each department and job_role combination.
SELECT dept,job_role,count(*)
FROM employees_tb
GROUP BY dept,job_role;
