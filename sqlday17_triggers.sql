use practice;
drop table employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    updated_at TIMESTAMP
);

INSERT INTO employees (employee_name,department,salary,hire_date)
VALUES
('John','IT',50000,'2024-01-15'),
('Priya','HR',45000,'2024-03-20'),
('Rahul','Finance',NULL,'2024-03-10'),
('Deepak','IT',44000,'2025-05-10'),
('Nithin','HR',30000,'2025-02-15');

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    product_code VARCHAR(20) NOT NULL,
    price DECIMAL(10,2),
    quantity INT
);

INSERT INTO products (product_name, product_code, price, quantity)
VALUES
('Laptop', 'LP101', 55000, 10),
('Mouse', 'MS102', 500, 50),
('Keyboard', 'KB103', 1200, 30),
('Earpods','EA104',1500,20),
('Screen glass','SG105',2000,15);

#creating trigger
DELIMITER //
CREATE TRIGGER update_timestamp
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN 
     SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;

update employees
set employee_name='Cherry'
where employee_id=4;

select *from employees;


INSERT INTO employees(employee_name,department,hire_date)
VALUES ('Nikhil','Finance','2024-06-10');

#Creating trigger for the duplicate values
DELIMITER //
CREATE TRIGGER prevent_duplicate_products
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM products
        WHERE product_name = NEW.product_name
          AND product_code = NEW.product_code
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate product not allowed';
    END IF;
END //

DELIMITER ;

show triggers;
INSERT INTO products(product_name,product_code,price,quantity)
Values ('Laptop','LP101',55000,15);

select *from products;


#Creating trigger for the default salary
DELIMITER //
CREATE TRIGGER default_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN 
    IF NEW.salary IS NULL THEN 
      SET NEW.salary = 30000;
	END IF;
END //
DELIMITER ;

INSERT INTO employees(employee_name,department,hire_date)
VALUES ('Venu','HR','2025-04-11');
select *from employees;