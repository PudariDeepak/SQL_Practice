CREATE DATABASE VIEW_DB;
USE VIEW_DB;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    status VARCHAR(20)
);
INSERT INTO employees VALUES
(101,'Deepak',45000,'Active'),
(102,'Rahul',28000,'Inactive'),
(103,'Priya',55000,'Active'),
(104,'Kiran',32000,'Active'),
(105,'Anjali',25000,'Inactive'),
(106,'Vikram',70000,'Active'),
(107,'Sneha',38000,'Active'),
(108,'Ravi',29000,'Inactive'),
(109,'Pooja',48000,'Active'),
(110,'Arjun',60000,'Active');

#1.Creating view for the salary above 30000
CREATE VIEW emp_sal as
SELECT * FROM employees 
WHERE salary > 30000;

SELECT *FROM emp_sal;

#2.Creating view for the acive employees
CREATE VIEW emp_status AS
SELECT *FROM employees
WHERE status ='Active';

 SELECT * FROM emp_status;
 
 CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    delivery_date DATE
);
INSERT INTO suppliers VALUES
(1,'ABC Traders','2025-01-05'),
(2,'XYZ Supplies','2025-01-12'),
(3,'Prime Goods','2025-02-10'),
(4,'Global Mart','2025-02-15'),
(5,'Fast Delivery','2025-03-01'),
(6,'Best Supplier','2025-03-05'),
(7,'Smart Traders','2025-03-10'),
(8,'Quick Supply','2025-04-01'),
(9,'Mega Distributors','2025-04-15'),
(10,'Elite Goods','2025-05-01');

#3.Creating view name as supplier displaying supplier_name and delivery_date
CREATE VIEW supplier AS 
SELECT supplier_name,delivery_date 
FROM suppliers;
SELECT * FROM supplier;

CREATE TABLE product_sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    revenue DECIMAL(10,2)
);
INSERT INTO product_sales VALUES
(1,'Laptop',50000),
(2,'Mobile',30000),
(3,'Laptop',45000),
(4,'Tablet',20000),
(5,'Mobile',35000),
(6,'Laptop',40000),
(7,'Tablet',25000),
(8,'Mobile',28000),
(9,'Laptop',55000),
(10,'Tablet',22000);

#4.Creating the view to calculate accumulate revenue for products
CREATE VIEW accumulated_revenue AS
SELECT product_name,SUM(revenue) as Total_revenue 
FROM product_sales 
GROUP BY product_name;

SELECT *FROM accumulated_revenue;

CREATE TABLE category_revenue (
    revenue_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    revenue_year INT,
    revenue DECIMAL(10,2)
);
INSERT INTO category_revenue VALUES
(1,'Electronics',2025,50000),
(2,'Furniture',2025,30000),
(3,'Clothing',2025,25000),
(4,'Electronics',2024,45000),
(5,'Furniture',2024,28000),
(6,'Clothing',2024,20000),
(7,'Electronics',2023,40000),
(8,'Furniture',2023,22000),
(9,'Clothing',2023,18000),
(10,'Electronics',2025,35000);

#5.Creating a view showing  only yearly revenue by category
CREATE VIEW yearly_revenue AS
SELECT category_name,revenue_year,SUM(revenue) as total_revenue 
FROM category_revenue 
GROUP BY category_name,revenue_year;

SELECT *FROM yearly_revenue;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE
);
INSERT INTO orders VALUES
(1001,'Amit','2025-01-05'),
(1002,'Priya','2025-02-10'),
(1003,'Rahul','2024-12-20'),
(1004,'Sneha','2025-03-15'),
(1005,'Arjun','2024-11-10'),
(1006,'Pooja','2025-04-01'),
(1007,'Vikram','2025-05-12'),
(1008,'Kiran','2024-10-08'),
(1009,'Deepak','2025-06-20'),
(1010,'Anjali','2025-07-01');

#6.Creating a view name recent orders listing orders placed january 1 2025
CREATE VIEW recent_orders AS
SELECT * FROM orders 
WHERE order_date > '2025-01-01'; 

SELECT *FROM recent_orders;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
);
INSERT INTO projects VALUES
(1,'E-Commerce App',101),
(2,'Banking System',103),
(3,'Inventory System',104),
(4,'CRM Tool',NULL),
(5,'Healthcare App',106),
(6,'HR Portal',NULL),
(7,'School Management',107),
(8,'Payroll System',NULL),
(9,'Travel Portal',109),
(10,'Hospital Management',NULL);

#Creating a view name unassign project that list project with no employee assign
CREATE VIEW unassign_project AS
SELECT * FROM projects
WHERE emp_id IS NULL;

SELECT * FROM unassign_project;