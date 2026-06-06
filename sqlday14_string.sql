create database string_db;
use string_db;
CREATE TABLE employees (
    emp_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1,'John','Smith','John.Smith@Company.com','Sales','Delhi'),
(2,'alice','Johnson','ALICE.J@Company.com','HR','Mumbai'),
(3,'Robert','Brown','robert.brown@Company.com','IT','Hyderabad'),
(4,'Emma','Wilson','Emma.Wilson@Company.com','Finance','Chennai'),
(5,'Michael','Davis','MICHAEL.D@Company.com','Marketing','Bangalore');

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'  Alice Smith  ','Alice@Gmail.COM','9876543210','Delhi'),
(102,'Bob Johnson','BOB@yahoo.com','987654321','Mumbai'),
(103,'  Charlie Brown','charlie@outlook.com','98765432101','Hyderabad'),
(104,'David Wilson ','DAVID@gmail.com','9123456789','Chennai'),
(105,'Alice Smith','alice@gmail.com','9988776655','Delhi');

CREATE TABLE products (
    product_id INT,
    product_code VARCHAR(20),
    product_name VARCHAR(100),
    category VARCHAR(50),
    description VARCHAR(200)
);

INSERT INTO products VALUES
(1,'ABC123','Laptop Pro','Electronics','High performance laptop'),
(2,'XYZ456','Smart Phone','Electronics','Latest smartphone'),
(3,'DEF789','Office Chair','Furniture','Comfortable office chair'),
(4,'SALE001','Sale Laptop','Electronics','Discounted laptop'),
(5,'CAT111','Table','Furniture','Wooden dining table');

CREATE TABLE orders (
    order_id INT,
    order_code VARCHAR(20),
    customer_id INT,
    order_date VARCHAR(8)
);

INSERT INTO orders VALUES
(1,'ORD-2024-001',101,'20240115'),
(2,'ORD-2024-002',102,'20240220'),
(3,'ORD-2024-003',103,'20240310'),
(4,'ORD-2025-001',104,'20250105');

CREATE TABLE payments (
    payment_id INT,
    card_number VARCHAR(20)
);

INSERT INTO payments VALUES
(1,'4111111111111234'),
(2,'5555444433332222'),
(3,'9876543210123456');

CREATE TABLE words (
    word VARCHAR(50)
);

INSERT INTO words VALUES
('level'),
('radar'),
('madam'),
('hello'),
('world');

CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(100),
    roll_no VARCHAR(20)
);

INSERT INTO students VALUES
(1,'Ravi Kumar','STU2024001'),
(2,'Priya Sharma','STU2024002'),
(3,'Anil Reddy','STU2024003');

CREATE TABLE order_items (
    order_id INT,
    product_name VARCHAR(100)
);

INSERT INTO order_items VALUES
(1,'Laptop'),
(1,'Mouse'),
(1,'Keyboard'),
(2,'Phone'),
(2,'Charger'),
(3,'Table'),
(3,'Chair');

select *from customers;
select *from employees;
select *from order_items;
select *from payments;
select *from products;
select *from students;
select *from words;

#1.Convert all employee names to uppercase using UPPER().
update employees
set first_name=upper(first_name),
 last_name=upper(last_name);
select *from employees;
SET SQL_SAFE_UPDATES=0;

#2.Convert all email addresses to lowercase using LOWER().
update employees
set email=lower(email);
select *from employees;
update customers
set email=lower(email);
select *from customers;

#3.Pad employee IDs with leading zeros to make them 6 digits using LPAD().
select *from employees;
select emp_id,
lpad(emp_id,6,0) as padded
from employees;

#4.Pad product names with spaces on the right to make them 20 characters using RPAD().
select product_name,rpad(product_name,20,' ') as padded
from products;

#5.Extract the first 3 characters of a product code using SUBSTRING().
select product_code,substring(product_code,1,3) as substring
from products;

#6.Remove leading and trailing spaces from customer names using TRIM().
select customer_name,trim(customer_name) as trimmed
from customers;

#7.Display the character represented by ASCII value 65 using CHAR().
select char(65) as charactor;

#8.Find the ASCII value of the first character in a product code using ASCII().
select product_code,ascii(product_code) as ascii_value
from products;

#9.Remove only leading spaces from an address using `LTRIM()`.
select *from customers;
select customer_name,ltrim(customer_name) as trimmed 
from customers;

#10. Remove only trailing spaces from a department name using `RTRIM()`.
select *from employees;
select department,rtrim(department) as trimmed
from employees;

#11. Find all phone numbers that are not exactly 10 characters long using `LENGTH()`.
select *from customers;
select customer_id,customer_name,phone
from customers 
where length(phone) != 10;

#12. Create a full name by combining first_name and last_name using `CONCAT()`.
select emp_id,concat(first_name,' ',last_name) as full_name
from employees;

#13. Reverse each product code using `REVERSE()`.
select product_id,product_code,reverse(product_code) as reversed
from products;

#14. Generate a string of 10 asterisks using `REPEAT()`.
select repeat('*',10) as star;


#15. Find the position of '@' in email addresses using `POSITION()` or `INSTR()`.
select customer_id,email,position('@' in email) as position
from customers;

select emp_id,email,instr(email,'@') as position
from employees;

#16. Extract the domain name from an email address.
select *from customers;
select customer_id,email,substring(email,position('@' in email)+1 ) as domain
from customers;
select emp_id,email,substr(email,instr(email,'@')+1) as domain 
from employees;

#17. Find all product names containing the word "sale" using `POSITION()`.
select *from products;
select product_id,product_name
from products
where position('sale' in product_name) >0;

#18. Display only the first 5 characters of customer names using `LEFT()`.
select customer_id,customer_name,left(trim(customer_name),5) as new
from customers;

#19. Display only the last 4 digits of account numbers using `RIGHT()`.
select payment_id,card_number,right(card_number,4) as new
from payments;

#20. Count the length of each customer name after trimming spaces.
select customer_id,customer_name,length(trim(customer_name)) as name_length
from customers;




