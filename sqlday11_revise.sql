use interview;
/*1.Create a table with the following structure:
 • id (INT, PRIMARY KEY, UNIQUE, AUTO_INCREMENT)
 • sno (AUTO_INCREMENT)
 • salary (DECIMAL)
 • address (TEXT)
 • status (BOOLEAN) 
• department (VARCHAR)*/
CREATE TABLE employee1(
id int primary key auto_increment,
sno int,
salary dec(8,2),
address text,
status bool,
department varchar(50));

#2.Insert at least 8 records into the above table.
INSERT INTO employee1(sno, salary, address, status, department)
VALUES
(101, 25000.50, 'Hyderabad', TRUE, 'HR'),
(102, 32000.75, 'Bangalore', TRUE, 'IT'),
(103, 28000.00, 'Chennai', FALSE, 'Finance'),
(104, 45000.25, 'Mumbai', TRUE, 'Marketing'),
(105, 22000.00, 'Delhi', FALSE, 'HR'),
(106, 38000.80, 'Pune', TRUE, 'IT'),
(107, 27000.60, 'Kolkata', TRUE, 'Sales'),
(108, 50000.00, 'Visakhapatnam', FALSE, 'Management');

#4.Write a query to salary by adding a bonus of 1000 where salary is greater than 20000.
update employee1
set salary=salary+1000
where salary>30000;
SET SQL_SAFE_UPDATES =0;

#5.Rename the existing table using ALTER
ALTER TABLE employee1
rename employee2;

#6.Add a new column 'email' using ALTER TABLE
ALTER TABLE employee2
ADD COLUMN email varchar(50);

#7.Update email values using CASE statement in a single query. 
update employee2
SET email=CASE 
          WHEN id=1 THEN "deepak@gmail.com"
          WHEN id=2 THEN "bunny@gmail.com"
          WHEN id=3 THEN "kittu@gmail.com"
          WHEN id=4 THEN "rahul@gmail.com"
          WHEN id=5 THEN "raju@gmail.com"
          WHEN id=6 THEN "nikhil@gmail.com"
          WHEN id=7 THEN "cherry@gmail.com"
          WHEN id=8 THEN "naveeen@gmail.com"
		ELSE email
END;
          
#8.Modify the status column datatype from BOOLEAN to VARCHAR
ALTER TABLE employee2
modify  status  varchar(10);

#9.Count employees in each department.?
select department,count(id)
from employee2
group by department;

#10.Count employees in a specific department that “It”?
select department,count(id)
from employee2
where department="IT"
group by department ;

#11.write a query to retrieve the second highest salary?
select max(salary)
from employee2 
where salary <(select max(salary) from employee2);

#How can I find the data types of all columns in a table in MySQL? 
desc employee2;

# 22. Write a query to delete rows where salary is less than the average salary of its department.? 
DELETE
FROM employee2
WHERE salary < (
    SELECT AVG(salary)
    FROM (
        SELECT department, AVG(salary) AS avg_salary
        FROM employee2
        GROUP BY department
    ) AS dept_avg
    WHERE dept_avg.department = employee2.department
);


