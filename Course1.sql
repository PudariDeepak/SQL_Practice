CREATE DATABASE college;
USE college;

CREATE TABLE student (
  rollno INT PRIMARY KEY,
  name VARCHAR(50)
);

SELECT * FROM student;

CREATE DATABASE XYZ;
USE XYZ;

CREATE TABLE employeeinfo(
id INT PRIMARY KEY,
name VARCHAR(50),
salary INT);

INSERT INTO employeeinfo 
(id,name,salary)
VALUES 
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

select *FROM employeeinfo;

CREATE TABLE emp(
id INT,
salary INT DEFAULT  2500);

INSERT INTO emp(id) VALUES(101);
SELECT *FROM emp;
SELECT max(marks) FROM student;


create table pupil(
  id int primary key,
  name varchar(50),
  age int,
  department varchar(50),
  marks int
  );
  
  insert into pupil
  (id,name,age,department,marks)
  values
  (1,"ravi",20,"cse",85),
  (2,"anu",21,"ece",78),
  (3,"kiran",19,"eee",88),
  (4,"sista",20,"cse",92),
  (5,"rahul",22,"mech",70),
  (6,"priya",21,"cse",90),
  (7,"amit",23,"ce",65),
  (8,"neha",20,"ece",80),
  (9,"viijay",22,"eee",75),
  (10,"pooja",19,"cse",95);
  
  select *from pupil;
  select name,marks from pupil;
  
  select * from pupil
  where marks>80;

select *from pupil where department="cse";

update pupil
set marks=100 where id=5;
select *from pupil;

delete from pupil where id=7;

select count(*)
from pupil;

select  max(marks) from pupil;

select * from pupil 
order by marks desc;

alter table pupil 
add email varchar(50);

select *from pupil;

update pupil 
set email=concat(lower(name),@gmail.com);

set sql_safe_updates=0;
select *from pupil;

update pupil
set email=CONCAT(LOWER(name),'@gmail.com');

select department,sum(marks)
from pupil
group by department;

create table employees(
emp_id int primary key,
emp_name varchar(50),
dept varchar(50),
salary int,
manager_id int,
hire_date date
);

insert into  employees
(emp_id,emp_name,dept,salary,manager_id,hire_date)
values
(1,"Ravi","IT",50000,3,'2021-01-10'),
(2,"Anu","HR",40000,4,'2020-06-15'),
(3,"Kiran","IT",60000,NULL,'2019-03-20'),
(4,"Sunita","HR",55000,NULL,'2018-11-05'),
(5,"Manoj","Finance",45000,4,'2022-07-01');

select *from employees;

select emp_name from employees;

select * from employees
where dept="IT";

select *from employees
where salary>50000;

select *from employees
where dept<> "HR";

select *from employees
where  hire_date > '2020-01-01';

select distinct dept 
from employees;

select *from employees
order by salary desc;

select *from employees 
limit 3;

select *from employees
where salary<=60000 and salary>=40000;

select *from employees
where emp_name like '%a%';

select *from employees 
where dept in ("IT","HR");

select count(*)
from employees;

select sum(salary)
from employees;

select avg(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;

select dept,count(*)
from employees
group by dept;

select dept,sum(salary) as total
from employees
group by dept
order by total desc
limit 2;

select year(hire_date),count(*) from employees
group by year(hire_date)
order by year(hire_date);

select dept,max(salary)
from employees
group by dept;

select count(*) from employees where manager_id IS NOT NULL;

select *from employees where manager_id IS  NULL;

select *from employees
where salary>(select avg(salary) from employees);

select max(salary) from employees 
where salary<(select max(salary) from employees);

select *from employees where salary=(select max(salary) from employees);










create table Grade(
ID int,
Major varchar(50),
GPA decimal(10,1)
);

insert into Grade
(ID,Major,GPA)
values
(1001,'computer',3.8),
(1002,'history',3.4),
(1003,'business',3.2),
(1004,'business',3.9),
(1005,'math',3.5),
(1006,'literature',3.3),
(1007,'physics',3.7),
(1008,'chemistry',3.6),
(1009,'psychology',3.5),
(1010,'political science',3.6);

select *from Grade;

select ID,Major from Grade 
where GPA> (select avg(GPA) from Grade);

select Major,avg(GPA) as avgpa from Grade 
group by Major 
order by avgpa desc
limit 3;

select *from Grade 
where Major IN ('computer','math') AND  GPA > 3.5
order by GPA desc;

select sum(GPA) from Grade;
select count(*) from Grade;
select avg(GPA) from Grade;

select Major,sum(GPA)
from Grade
where Major='computer';


select count(Major) from Grade where Major='business';

select avg(GPA) from Grade where Major='math';

select min(GPA),max(GPA) from Grade where Major='math';

select Major,avg(GPA) as abc from Grade
group by Major
order by abc desc;

create table courses(
 ID int,
 Course varchar(100)
 );

insert into courses
(ID,Course)
values
(1001,'csci101'),
(1002,'hist101'),
(1003,'biol101'),
(1004,'bus101'),
(1005,'math101'),
(1012,'eng201'),
(1013,'csci101'),
(1014,'bus101'),
(1015,'bus101');

select *From courses;

select *
from Grade as a
inner join Courses as b
on a.ID=b.ID
where a.Major='computer';

select a.ID,b.course
from Grade a
left join Courses b
on a.ID=b.ID
UNION
select a.ID,b.course
from Grade a 
right join Courses b
on a.ID=b.ID;

-- joinss--

select g.ID,c.course
from Grade g
join Courses c
on g.ID=c.ID
where c.Course='bus101' AND g.GPA>3.5;

select avg(GPA) from Grade;
select count(DISTINCT Major) from Grade;

select count(Major)
from Grade 
where Major='computer';

select ID 
from Grade
where GPA > (select avg(GPA) from Grade);

select Major
from (select Major,avg(GPA)
      from Grade 
      group by Major
      order by avg(GPA) desc) as t
limit 1;

select Major 
from Grade 
group by Major
having count(ID)= (select count(ID) from Grade group by Major  order by count(ID) desc limit 1);

select *
from Courses
where Course like '%BUS%';

select avg(GPA) as BUS101_GPA,(select avg(GPA) from Grade) as Overall_GPA
from Grade 
where ID in (select ID from Courses where Course like '%BUS%');


select g1.ID,G1.Major 
from Grade g1
where g1.GPA > (select avg(g2.GPA) from grade g2 group by g2.Major order by avg(g2.GPA) desc limit 1);


create index idx_grade_major on Grade(Major);
select *from Grade where Major='computer';

create view high_gpa_students as 
select *from Grade 
where GPA>3.5;

select *from high_gpa_students;

DELIMITER //
create procedure countstudents(in major_name varchar(200))
begin
select count(*) from Grade where Major=major_name;
end //
DELIMITER ;

create index idx_grade_major_gpa on Grade(Major,GPA);

DELIMITER //
create procedure getstudentsgpa(in student_id int)
begin
select GPA from Grade where ID=studeny_id;
end //
DELIMITER ;

create or replace view high_gpa_students as 
select *from Grade 
where GPA>3.3;


create view studentcourses as
select g.*,c.Course
from Grade g 
join Courses c on g.ID=c.ID;

select * from studentcourses;

insert into Grade 
values(1011,'economics',3.7);
select * from Grade;

update Grade
set GPA=3.5
where ID=1002;

set SQL_SAFE_UPDATES=0;
select *from Grade;






























