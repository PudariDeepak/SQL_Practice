use interview;
CREATE TABLE department1 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_name VARCHAR(50)
);

CREATE TABLE employee1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT NULL,
    dept_id INT,
    total_sales DECIMAL(10,2),
    
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO department1 VALUES
(1, 'HR', 'Ramesh'),
(2, 'IT', 'Suresh'),
(3, 'Finance', 'Anitha'),
(4, 'Sales', 'Kiran');

INSERT INTO employee1 VALUES
(101, 'Deepak', 45000, 201, 1, 50000),
(102, 'Rahul', 55000, 202, 2, 75000),
(103, 'Sneha', 60000, NULL, 2, 90000),
(104, 'Arun', 40000, 201, 1, 30000),
(105, 'Priya', 70000, 203, 3, 85000),
(106, 'Kavya', 35000, NULL, 4, 25000),
(107, 'Vijay', 65000, 204, 4, 95000),
(108, 'Manoj', 50000, 202, 2, 60000),
(109, 'Pooja', 48000, 203, 3, 55000),
(110, 'Ajay', 72000, 204, 4, 100000);

#1.Write a SQL query to retrieve the names of all employees who earn a salary higher than the average salary in their department, using a subquery.
select *from employee1 e
where salary > (select avg(salary) from employee1 
where dept_id= e.dept_id );

#2.Write a SQL query to get the names of all employees and the names of their corresponding department managers, using an inner join.
select emp_id,emp_name,manager_name
from employee1 e
inner join department1 d
on e.dept_id=d.dept_id;

#3.Write a SQL query to retrieve the names of all employees who do not have a manager assigned, using a left join and a subquery.
select emp_id,emp_name
from employee1 e 
left join department1 d 
on e.dept_id=d.dept_id where e.manager_id is null;

#4.Write a SQL query to get the total sales amount for each department, using a subquery to filter departments with sales above a certain threshold.
select dept_id,total_dept_sales
from (select dept_id,
        sum(total_sales) as total_dept_sales
        from employee1
        group by dept_id
        )as dept_sales
where total_dept_sales > 150000;

#5.Write a SQL query to retrieve the top 3 employees with the highest total sales in each department, using a subquery and a join.
SELECT e1.emp_name,
       e1.dept_id,
       e1.total_sales
FROM employee1 e1
JOIN employee1 e2
ON e1.dept_id = e2.dept_id
AND e2.total_sales >= e1.total_sales
GROUP BY e1.emp_id, e1.emp_name, e1.dept_id, e1.total_sales
HAVING COUNT(e2.emp_id) <= 3
ORDER BY e1.dept_id, e1.total_sales DESC;


#6.Write a SQL query to get the names of all employees who work in departments that have more than 5 employees, using a subquery and a join.
SELECT e.emp_name, d.dept_name,d.dept_id
FROM employee1 e
JOIN department1 d
ON e.dept_id = d.dept_id
WHERE e.dept_id IN (
    SELECT dept_id
    FROM employee1
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);
