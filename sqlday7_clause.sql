use d13r;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, customer_name, order_date, amount) VALUES
(101, 1, 'Ravi',   '2026-01-01', 2500.00),
(102, 2, 'Sita',   '2026-01-02', 1800.50),
(103, 3, 'Ram',    '2026-01-03', 3200.75),
(104, 4, 'John',   '2026-01-04', 1500.00),
(105, 5, 'Anu',    '2026-01-05', 2750.25),
(106, 6, 'Kiran',  '2026-01-06', 4100.00),
(107, 1, 'Ravi',   '2026-01-07', 950.00),
(108, 2, 'Sita',   '2026-01-08', 5200.50),
(109, 3, 'Ram',    '2026-01-09', 3000.00),
(110, 4, 'John',   '2026-01-10', 1250.75),

(111, 5, 'Anu',    '2026-01-11', 2200.00),
(112, 6, 'Kiran',  '2026-01-12', 4100.25),
(113, 1, 'Ravi',   '2026-01-13', 1750.00),
(114, 2, 'Sita',   '2026-01-14', 2800.00),
(115, 3, 'Ram',    '2026-01-15', 3600.50),
(116, 4, 'John',   '2026-01-16', 1400.00),
(117, 5, 'Anu',    '2026-01-17', 2650.75),
(118, 6, 'Kiran',  '2026-01-18', 3900.00),
(119, 1, 'Ravi',   '2026-01-19', 1100.00),
(120, 2, 'Sita',   '2026-01-20', 4700.00),

(121, 3, 'Ram',    '2026-01-21', 3300.25),
(122, 4, 'John',   '2026-01-22', 2100.00),
(123, 5, 'Anu',    '2026-01-23', 2950.00),
(124, 6, 'Kiran',  '2026-01-24', 4300.50),
(125, 1, 'Ravi',   '2026-01-25', 1800.00),
(126, 2, 'Sita',   '2026-01-26', 2400.75),
(127, 3, 'Ram',    '2026-01-27', 5100.00),
(128, 4, 'John',   '2026-01-28', 1600.00),
(129, 5, 'Anu',    '2026-01-29', 3500.25),
(130, 6, 'Kiran',  '2026-01-30', 4200.00),

(131, 1, 'Ravi',   '2026-01-31', 1300.00),
(132, 2, 'Sita',   '2026-02-01', 2750.00),
(133, 3, 'Ram',    '2026-02-02', 3900.00),
(134, 4, 'John',   '2026-02-03', 1450.50),
(135, 5, 'Anu',    '2026-02-04', 3100.00),
(136, 6, 'Kiran',  '2026-02-05', 4500.00),
(137, 1, 'Ravi',   '2026-02-06', 2000.00),
(138, 2, 'Sita',   '2026-02-07', 4800.25),
(139, 3, 'Ram',    '2026-02-08', 3400.00),
(140, 4, 'John',   '2026-02-09', 1700.75);

SELECT *FROM orders;

/*1. You have a table called orders with columns customer_id and amount. Write a query
to find all customers who have placed more than 3 orders.*/
SELECT customer_id,count(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING count(*)>3;

/*2.From an orders table (columns: order_id, customer_id, order_date, amount), write a
complete paginated query that shows the 3rd page of results (10 items per page),
sorted by order_date descending. Also write the formula you used to calculate the
offset.*/
SELECT order_id,customer_id,order_date,amount
FROM orders
ORDER BY order_date DESC
LIMIT 10 OFFSET 20;

CREATE TABLE products1 (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    discount DECIMAL(5,2)
);

INSERT INTO products1 (product_name, category, price, discount) VALUES
('Laptop Pro', 'Electronics', 75000, 10),
('Wireless Mouse', 'Electronics', 1200, 5),
('Gaming Keyboard', 'Electronics', 3500, 8),
('LED TV', 'Electronics', 45000, 12),
('Bluetooth Speaker', 'Electronics', 2500, 7),

('Office Chair', 'Furniture', 8500, 15),
('Dining Table', 'Furniture', 22000, 10),
('Sofa Set', 'Furniture', 55000, 18),
('Bookshelf', 'Furniture', 7000, 6),
('Bed Frame', 'Furniture', 30000, 20),

('Men T-Shirt', 'Clothing', 800, 5),
('Women Kurti', 'Clothing', 1500, 10),
('Jeans', 'Clothing', 2200, 12),
('Jacket', 'Clothing', 3500, 15),
('Sports Shoes', 'Clothing', 4000, 20),

('Rice Bag', 'Groceries', 1800, 3),
('Cooking Oil', 'Groceries', 1400, 4),
('Sugar', 'Groceries', 500, 2),
('Tea Powder', 'Groceries', 350, 5),
('Coffee Powder', 'Groceries', 650, 6),

('Notebook', 'Stationery', 120, 2),
('Pen Pack', 'Stationery', 80, 1),
('Marker Set', 'Stationery', 250, 4),
('Office Files', 'Stationery', 300, 5),
('Printer Paper', 'Stationery', 450, 7),

('Face Wash', 'Beauty', 250, 8),
('Shampoo', 'Beauty', 450, 10),
('Perfume', 'Beauty', 2200, 15),
('Lipstick', 'Beauty', 900, 12),
('Body Lotion', 'Beauty', 600, 5),

('Cricket Bat', 'Sports', 3500, 10),
('Football', 'Sports', 1200, 6),
('Tennis Racket', 'Sports', 4200, 14),
('Yoga Mat', 'Sports', 900, 8),
('Dumbbells', 'Sports', 2500, 11),

('Water Bottle', 'Accessories', 350, 3),
('Backpack', 'Accessories', 1800, 9),
('Sunglasses', 'Accessories', 2500, 13),
('Wrist Watch', 'Accessories', 5500, 18),
('Wallet', 'Accessories', 1200, 7);

SELECT * FROM products1;
/*3. From a products table (columns: category, price), write a query to list only those
categories where the total price of all products exceeds 50,000.*/
SELECT category,sum(price) as total_price
FROM products1
GROUP BY category
HAVING total_price > 50000;

/*4. From a products table (columns: product_name, price), write a query that shows each
product's name and its price after a 15% discount, sorted by the discounted price in
ascending order. Use a column alias.*/
SELECT product_name,price,price-(price*0.15) as discounted_price
FROM products1
ORDER BY discounted_price ASC;


/*5. From a products table (columns: product_name, price), write a query to find the top 3
most expensive products.*/
SELECT product_name,price
FROM products1
ORDER BY price DESC
LIMIT 3;

/*6. You are building a product listing page that shows 8 products per page. Write the
query for page 4.*/
SELECT * FROM products1
ORDER BY product_id ASC
LIMIT 8 OFFSET 24;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    salesperson_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE
);

INSERT INTO sales (salesperson_id, product_id, quantity, sale_date) VALUES
(101, 201, 5, '2026-01-05'),
(102, 202, 3, '2026-01-06'),
(103, 203, 8, '2026-01-07'),
(101, 204, 2, '2026-01-08'),
(104, 205, 6, '2026-01-09'),
(105, 206, 4, '2026-01-10'),
(102, 207, 7, '2026-01-11'),
(103, 208, 1, '2026-01-12'),
(104, 209, 9, '2026-01-13'),
(105, 210, 5, '2026-01-14');

SELECT * FROM sales;

/*7. From a sales table (columns: salesperson_id, product_id, quantity, sale_date), write a
query to find salespersons who have sold at least 3 distinct products AND whose total
quantity sold is above 100.*/
SELECT salesperson_id,
    COUNT(DISTINCT product_id) AS distinct_products,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY salesperson_id
HAVING distinct_products >= 2 AND total_quantity > 10;

use d13r;
/*8. From an employees table (columns: name, salary), write a query to display all
employees sorted by salary from highest to lowest.*/
SELECT name,salary
FROM employees_tb
ORDER BY salary DESC;

/*9. From an employees table (columns: name, department, salary), write a query to find
the 3 highest-paid employees in the 'Financee' department only.*/
SELECT name,dept,salary
FROM employees_tb
HAVING dept="Finance"
ORDER BY salary DESC;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    grade CHAR(1),
    score INT
);

INSERT INTO students (name, grade, score) VALUES
('Ravi',  'A', 92),
('Sita',  'B', 78),
('Ram',   'A', 88),
('John',  'C', 65),
('Anu',   'B', 81),
('Kiran', 'A', 95),
('Meena', 'C', 59),
('Arjun', 'B', 73),
('Divya', 'A', 90),
('Sneha', 'B', 84);

/*10. From a students table (columns: name, grade, score), write a query to sort students
first by grade ascending, then by score descending within each grade.*/
SELECT name,grade,score
FROM students
ORDER BY grade ASC,score DESC;

/*11. From a students table, write a query to skip the first 5 rows and return the next 5
rows.*/
SELECT * FROM students 
LIMIT 5 OFFSET 5;

use d13r;
/*12/.From a employees table, write a query to fetch only the first 5 records.*/
SELECT * FROM employees
LIMIT 5;






