create database interview;
use interview;
select *from departments;
select *from employees;

#1. Show employee names along with their department names.
select emp_id,emp_name,dept_name
from departments d
join employees e 
on d.dept_id=e.dept_id;

#2. Display all orders with their corresponding customer names.
select o.order_id,c.customer_name,o.order_amount,o.order_date
from orders o
inner join customers c
on o.customer_id=c.customer_id;

#3. List students who are enrolled in any course.
select stu_id,stu_name,course_name
from students s
inner join courses c 
on s.stu_id=c.stu_id;

#4. Show products that are present in orders.
select product_name,order_id
from products p 
inner join orders o
on p.order_id=o.order_id;

#5. Display employees along with their salary details.
select e.emp_id,emp_name,salary
from employees e 
inner join salaries s 
on e.emp_id=s.emp_id; 

#MEDIUM LEVEL (INNER JOIN)
#6. Find employees who belong to the 'IT' department.
select emp_id,emp_name,dept_name
from employees e 
inner join departments d 
on e.dept_id=d.dept_id
where dept_name="IT";

#7. Show customers who have placed orders worth more than ₹5000.
select o.customer_id,customer_name,o.order_id,order_amount
from customers c 
inner join orders o 
on c.customer_id=o.customer_id where order_amount>5000;

#8. Count the number of orders placed by each customer.
select c.customer_id,count(o.customer_id) as total_count
from customers c 
inner join orders o
on c.customer_id=o.customer_id group by o.customer_id;

#9. List employees whose salary is greater than 50,000.
select e.emp_id,emp_name,salary
from employees e 
inner join salaries  s
on e.emp_id=s.emp_id where salary > 50000;

#10. Display students who are enrolled in the 'Python' course.
select s.student_id,student_name,course_name
from students s 
inner join courses c 
on s.student_id=c.student_id where course_name="Python";


#HARD LEVEL (INNER JOIN)
#11. Find employees who work in departments located in 'Hyderabad'.
select emp_id,emp_name,dept_name,location
from employees e 
inner join departments d 
on e.dept_id=d.dept_id where d.location ="Hyderabad";

#12. Get the highest-paid employee in each department. 
SELECT 
    d.dept_name,
    e.emp_name,
    s.salary
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id
INNER JOIN Salaries s
ON e.emp_id = s.emp_id
WHERE s.salary = (
    SELECT MAX(s2.salary)
    FROM Employees e2
    INNER JOIN Salaries s2
    ON e2.emp_id = s2.emp_id
    WHERE e2.dept_id = e.dept_id
);

#13. List customers who have placed more than 2 or more orders.
select c.customer_id,count(o.order_id) as total_orders
from customers c 
inner join orders o 
on c.customer_id=o.customer_id group by o.customer_id 
having total_orders >=2;

#14. Show each product along with the total quantity sold
select p.product_id,product_name,sum(o.quantity)
from products p 
inner join order_items o
on p.product_id=o.product_id
group by p.product_id,product_name;


#15. Find employees whose salary is above the average salary.
select emp_name,salary
from employees e 
inner join salaries s 
on e.emp_id=s.emp_id 
where salary > (select avg(salary) from salaries);


#EASY LEVEL (Basic Understanding)(LJ)
#1. Show all employees along with their department names, even if some employees are not assigned to any department
select e.emp_id,emp_name,dept_name
from employees e 
left join departments d 
on e.dept_id=d.dept_id;

#2. Display all orders and their corresponding payment details, even if payment has not been made.
select o.order_id,order_date,payment_id,payment_status
from orders o 
left join payments p 
on o.order_id=p.order_id;

#3. List all customers and their contact details, even if some customers have not provided phone numbers.
SELECT c.customer_name,cd.phone
FROM Customers c
LEFT JOIN Contact_Details cd
ON c.customer_id = cd.customer_id;

#4. Show all products and their categories, even if some products are not assigned to any category.
select product_id,product_name,category_name
from products p 
left join categories c 
on p.category_id=c.category_id;

#5. Display all students and their attendance records, even if attendance is missing.
select s.student_id,student_name,attendance_id,a.status
from students s 
left join attendance a 
on s.student_id=a.student_id;

#MEDIUM LEVEL (Concept Clarity + Filtering)
#6. Find all employees who do NOT have a department assigned.
select emp_id,emp_name,dept_name
from employees e 
left  join departments d 
on e.dept_id=d.dept_id where d.dept_id is NULL;

#7. Display all orders where payment has NOT been completed.
select o.order_id,payment_id,payment_status
from orders o 
left join payments p 
on o.order_id=p.order_id 
where NOT(payment_status="Completed") or payment_status is NULL;

#8. List all customers who have never placed an order.
select c.customer_id,customer_name,order_id
from customers c 
left join orders o 
on c.customer_id=o.customer_id where o.customer_id is null;

#9. Show all products that are NOT linked to any supplier.
select p.product_id,product_name,supplier_id
from products p 
left join product_suppliers ps 
on p.product_id=ps.product_id where supplier_id is null;

#10. Display all employees and count how many projects they are assigned to, including employees with zero projects.
select e.emp_id,emp_name,count(project_id) as total_projects
from employees e 
left join employee_projects ep 
on e.emp_id=ep.emp_id 
group by e.emp_id,emp_name;

#HARD LEVEL (Interview + Real-time Thinking)
#11. Find all customers who placed orders but never made any payment.
select c.customer_id,customer_name,o.order_id,p.payment_id,payment_status
from customers c 
inner join orders o 
on c.customer_id=o.customer_id
left join payments p 
on o.order_id=p.order_id where payment_status is null;

#12. Display all employees and their latest salary, even if some employees don’t have salary records
select e.emp_id,emp_name,salary,salary_date
from employees e 
left join salaries s 
on e.emp_id=s.emp_id
where salary_date=(select max(s2.salary_date) from salaries s2 where s2.emp_id=e.emp_id);

#13. List all products along with total sales amount, including products that were never sold.
select p.product_id,product_name,sum(p.price*oi.quantity) as total_amount
from products p 
left  join order_items oi 
on p.product_id=oi.product_id
group by p.product_id,product_name;

#14. Find all users who signed up but never logged in.
select u.user_id,username,signup_date
from users u 
left join login_logs l 
on u.user_id=l.user_id where log_id is null;

#15. Display all departments and the number of employees in each department, including departments with zero employees.
select d.dept_id,dept_name,count(emp_id) as toatal_employees
from departments d 
left join employees e 
on d.dept_id=e.dept_id 
group by d.dept_id,dept_name;

#EASY (5 Questions)(RJ)
#1. Show all payments, even if there is no matching order.
select o.order_id,payment_id,payment_status
from orders o
right join payments p 
on o.order_id=p.order_id;

#2. Display all transactions even if customer details are missing.
select c.customer_id,transaction_id,amount
from customers c 
right join transactions t 
on c.customer_id=t.customer_id;

#3. List all invoices, even if invoice is not linked to any order
select invoice_id,invoice_amount,i.order_id
from orders o 
right join invoices i 
on o.order_id=i.order_id;

#4. Show all attendance records, even if employee details are not available.
select attendance_id,attendance_date,status,s.student_id
from students s 
right join attendance a 
on s.student_id=a.student_id;

#5. Display all shipment records, even if order information is missing.
select shipment_id,shipment_status,o.order_id
from orders o 
right join shipments s 
on o.order_id=s.order_id;

#MEDIUM (5 Questions)
#6. Show all payments and their corresponding order details; include payments without orders.
select payment_id,payment_amount,payment_status,o.order_id,order_amount,order_date
from orders o 
right join payments p 
on o.order_id=p.order_id;

#7. List all transactions with customer names; include transactions where customer is not found.
select transaction_id,amount,c.customer_name
from customers c 
right join transactions t 
on c.customer_id=t.customer_id;

#8. Display all refund records along with order details; include refunds without orders.
#9. Show all logs with system details; include logs where system info is missing.
select log_id,s.system_id,log_message,system_name
from systems s 
right join audit_logs a 
on s.system_id=a.system_id;

#10. List all booking records along with user details; include bookings without users.

#HARD (5 Questions)
#11. Show all payments that do not have matching orders along with available order data if present.
select payment_id,payment_amount,payment_status,o.order_id,order_amount,order_date
from orders o
right join payments p
on o.order_id=p.order_id where o.order_id is null;

#12. Retrieve all transactions and identify which ones are not linked to any customer.
select transaction_id,amount,c.customer_id,customer_name,
case 
    when c.customer_id is null then "not linked"
	else "linked"
end as transaction_status
from customers c 
right join transactions t 
on c.customer_id=t.customer_id;

#13. Display all audit logs and indicate missing system references for each record.
select log_id,log_message,system_name,
case
    when l.system_id is null then "missing"
    else "referenced"
end as system_references
from systems s 
right join audit_logs l 
on s.system_id=l.system_id;

#14. List all invoices and highlight those where no corresponding order exists.
select invoice_id,invoice_amount,o.order_id,
case 
    when i.order_id is null then "invoice missing"
    else "not missing"
end as invoice_status
from orders o 
right join invoices i 
on o.order_id=i.order_id;

#15. Show all shipment records and classify them based on whether order details are available or not.
select shipment_id,shipment_status,s.order_id,
case 
	when s.order_id is null then "order details unavailable"
    else "order details available"
end as order_status
from orders o 
right join shipments s 
on o.order_id=s.order_id;