use string_db;
#1. Mask a credit card number so only the last 4 digits are visible using `REPEAT()`, `LENGTH()`, and `RIGHT()`.
select payment_id,
concat(repeat('*',length(card_number)-4),right(card_number,4)) as new
from payments;

#2. Create employee codes in the format `EMP000123` using `CONCAT()` and `LPAD()`.
select emp_id,
concat('EMP',lpad(emp_id,6,0)) as new_id
from employees;

#3.Write a query to identify names stored with leading or trailing spaces.
select customer_id,customer_name
from customers
where customer_name <> trim(customer_name) ;

#4. Check whether a product code starts with an uppercase letter using `ASCII()`.
select product_code,
case
    when ascii(product_code)  between 65 and 90
    then 'starts with uppercase'
    else 'does not start with uppercase'
end as status
from products;

#5. Extract year, month, and day separately from a `YYYYMMDD` string using `SUBSTRING()`.
select order_id,order_date,
substr(order_date,1,4) as year,
substr(order_date,5,2) as month,
substr(order_date,7,2) as date
from orders;


#6. Find palindrome words using `REVERSE()`.
select word,reverse(word) as palindrome
from words
where reverse(word) = word ;

#7. Create a comma-separated list of all products in each category using `GROUP_CONCAT()`
select category,
group_concat(product_name separator ',') as products_list
from products
group by category;

#8. Extract the username part from an email address using `LEFT()` and `POSITION()`.
select customer_id,email,
left(email,position('@' in email)-1) as username
from customers;

select emp_id,email,
left(email,instr(email,'@')-1) as username
from employees;

#9. Generate work email addresses in the format `firstname.lastname@company.com` using `LOWER()` and `CONCAT()`.
select emp_id,first_name,last_name,
concat(lower(first_name),'.',lower(last_name),'@company.com') as work_email
from employees;

#10. Write a query to find duplicate customer names after applying `TRIM()` and `LOWER()`.
select trim(lower(customer_name)) as new,count(*)
from customers
group by trim(lower(customer_name))
having count(*) >1;

#11. A CSV file contains employee IDs like `45`, `123`, `8`. Convert them to `000045`, `000123`, and `000008`.
select *from customers;
select customer_id,
lpad(customer_id,6,0) as new_id
from customers;

#12. Find customers whose email addresses contain more than one '@' symbol.
select emp_id,email
from employees
where length(email) - length(replace(email,'@','')) > 1;


#13. Generate a report where all city names appear in uppercase and fixed width of 20 characters.
select  emp_id,city,
rpad(upper(city),20,' ') as new
from employees;


#14.Extract the last word from a full name column.
select emp_id,
concat(upper(first_name),upper(last_name)) as fullname,
right(concat(upper(first_name),upper(last_name)),1) as word
from employees;

#15 Create a progress bar like `[=====     ]` using `REPEAT()`.
SELECT order_id,
       CONCAT(
           '[',
           REPEAT('=',order_id/10),
           REPEAT(' ', 10 - order_id / 10),
           ']'
       ) AS progress_bar
FROM orders;

#16.Find rows where the first character of a code is numeric.
select order_id,order_code
from orders
where ascii(order_code) between 48 and 57;

#17.Display customer names as `LASTNAME, FIRSTNAME`.
select customer_id,customer_name,
concat(substring(customer_name,position(' ' in customer_name)+1),',',left(customer_name,position(' ' in customer_name)-1)) as new_name
from customers;

#18. Remove all leading zeros from account numbers.
select account_no,
trim(leading '0' from account_no) as new_number
from accounts;

#19.Find the second occurrence of '-' in a product code.
select product_id,product_code,
position('_' in product_code)
from products;

#20.Build a formatted address string from city, state, and country while ignoring NULL values.
select concat_ws(',','Hyderabad','Telangana','India') as address;


