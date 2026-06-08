create database practice_db;
use practice_db;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    experience INT,
    hire_date DATE
);
INSERT INTO Employees VALUES
(1,'Ravi',55000,101,5,'2024-01-15'),
(2,'Suresh',65000,102,8,'2023-06-20'),
(3,'Sunita',75000,101,10,'2022-03-10'),
(4,'Kiran',45000,103,3,'2024-07-01'),
(5,'Sneha',75000,102,9,'2021-12-05');

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO Departments VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO Products VALUES
(1,'Laptop','Electronics',60000),
(2,'Mouse','Electronics',500),
(3,'Keyboard','Electronics',1500),
(4,'Chair','Furniture',3000),
(5,'Table','Furniture',5000);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);
INSERT INTO Students VALUES
(1,'Akhil',85),
(2,'Priya',92),
(3,'Rahul',78),
(4,'Meena',95),
(5,'Arjun',88);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO Customers VALUES
(1,'Ramesh','ramesh@gmail.com'),
(2,'Anita','anita@gmail.com'),
(3,'Vijay','vijay@gmail.com');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    delivery_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders VALUES
(101,1,'2025-01-10','2025-01-15'),
(102,2,'2025-02-05','2025-02-08'),
(103,1,'2025-03-12','2025-03-18');

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount DECIMAL(10,2)
);
INSERT INTO Sales VALUES
(1,'2025-01-01',1000),
(2,'2025-01-02',1500),
(3,'2025-01-03',2000),
(4,'2025-01-04',2500);

#1. Display employees whose salary is greater than the average salary of all employees.
select *
from employees
where salary > (select avg(salary) from employees);

#2. Find employees who work in the same department as employee 'Ravi'.
select * from employees
where department_id in (select department_id from employees 
where emp_name='Ravi');

#3. Display products whose price is higher than the minimum product price.
select * from products
where price > (select min(price) from products);

#4. Find students who scored more than the average marks.
select * from students
where marks > (select avg(marks) from students);

#5. Display employees whose salary is equal to the highest salary.
select *from employees 
where salary = (select max(salary) from employees);

#6.Find customers who placed at least one order.
select *from orders;
select *from customers;
select DISTINCT c.*
from customers as c
inner join orders as o 
on c.customer_id=o.customer_id;

select * from customers c 
where customer_id in (select customer_id from orders);

#7. Display employees who are not working in department 101.
select emp_id,emp_name,e.department_id
from employees e 
where department_id in (select department_id from departments where department_id <> 101);

select * from employees
where department_id <> 101;

#8. Find products that belong to the same category as product 'Laptop'.
select * from products 
where category in (select  category from products where product_name = "laptop");

#9. Display employees whose experience is greater than the minimum experience.
select *from employees
where experience > (select min(experience) from employees);

#10. Find departments where the average salary is greater than 50000.
select department_id,avg(salary) as avg_salary
from employees 
group by department_id 
having avg_salary > 50000;

select d.department_name,avg(salary) as avg_salary
from employees e 
join departments d 
on e.department_id=d.department_id
group by d.department_name
having avg_salary > 50000;


#11. Display employee names in uppercase using a string function.
select upper(emp_name) as employee_name from employees;

#12. Display the first 3 characters of each product name.
select substr(product_name,1,3) as str 
from products;

#13. Find the length of each customer name.
select customer_name,length(customer_name) as len  from customers;

#14. Replace 'gmail.com' with 'yahoo.com' in customer emails.
select email,replace(email,'gmail.com','yahoo.com') as new_mail 
from customers;

#15. Display employee names after removing leading and trailing spaces.
select emp_name,trim(emp_name) as new
from employees;

#16. Concatenate first name and last name as full name.
select concat("deepak"," ","kumar") as name;

#17. Display product names in lowercase. 
select product_id,lower(product_name) as product_name
from products;

#18. Find employees whose names start with letter 'S'.
select emp_id,emp_name
from employees
where emp_name like "s%";

#19. Display current system date.
select curdate() as date;

#20. Find employees hired in the year 2024.
select emp_id,emp_name,hire_date
from employees
where year(hire_date)=2024;

#21. Display the month from each order date.
select order_id,order_date,
month(order_date) as month 
from orders;

#22. Find the difference in days between order date and delivery date.
select order_id,
(delivery_date-order_date) as diff_days
from orders;

select order_id,order_date,delivery_date,
datediff(delivery_date,order_date) as days
from orders;

#23. Display current date and current time separately.
select curdate() as date,
curtime() as time;

#24. Find employees who joined in the current month.
select *from employees;
select emp_id,emp_name,hire_date
from employees
where month(hire_date)=month(curdate());

#25. Assign row numbers to employees based on salary in descending order.
select *,row_number() over(order by salary desc) as row_numbers
from employees;

#26. Assign ranks to students based on marks. 
select *,rank() over(order by marks desc) as ranks
from students;

#27. Assign dense ranks to employees based on salary.
select *,dense_rank() over(order by salary desc) as ranks
from employees;

#28. Display the total salary of all employees beside each employee record using a window function.
select emp_id,emp_name,salary,
sum(salary) over() as total_salary
from employees;

#29. Display department-wise average salary beside each employee.
select department_id,
avg(salary) over(partition by department_id) as avg_salary
from employees;


#30. Find cumulative sales total ordered by sale date.
select sale_id,sale_date,
sum(amount) over(order by amount) as cumulative_sales
from sales;