use company_db;

CREATE TABLE Company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

CREATE TABLE Employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    company_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

INSERT INTO Company VALUES
(1, 'TechSoft', 'Hyderabad'),
(2, 'InfoSys', 'Bangalore'),
(3, 'TCS', 'Mumbai'),
(4, 'Wipro', 'Chennai'),
(5, 'Google', 'Pune'),
(6, 'Amazon', 'Delhi'),
(7, 'Microsoft', 'Noida'),
(8, 'Accenture', 'Kolkata'),
(9, 'IBM', 'Ahmedabad'),
(10, 'Oracle', 'Jaipur');

SELECT * FROM Company;

INSERT INTO Department VALUES
(101, 'HR', 1),
(102, 'Finance', 2),
(103, 'IT', 3),
(104, 'Marketing', 4),
(105, 'Sales', 5),
(106, 'Testing', 6),
(107, 'Development', 7),
(108, 'Support', 8),
(109, 'Security', 9),
(110, 'Admin', 10);
SELECT * FROM Department;

INSERT INTO Employee VALUES
(1, 'Ravi', 45000, 101, 1),
(2, 'Suresh', 55000, 102, 2),
(3, 'Priya', 60000, 103, 3),
(4, 'Anjali', 50000, 106, 6),
(5, 'Kiran', 70000, 105, 5),
(6, 'Deepak', 48000, 106, 6),
(7, 'Rahul', 75000, 107, 7),
(8, 'Sneha', 52000, 108, 8),
(9, 'Vijay', 68000, 103, 3),
(10, 'Pooja', 47000, 110, 10);
SELECT * FROM Employee;

#1. Retrieve all employees along with their department names
SELECT emp_name,dept_name 
FROM Department as d
RIGHT JOIN employee as e
ON d.dept_id=e.dept_id;

#2. Display employee name, salary, and company name.
SELECT e.emp_name,e.salary,c.company_name,c.company_id
FROM Company c
RIGHT JOIN Employee e
ON  c.company_id=e.company_id;

#3.List all employees who are assigned to a department.
SELECT emp_id,emp_name,dept_name
FROM employee e
LEFT JOIN Department d
ON e.dept_id=d.dept_id;

#4.Show employee details along with department location.
SELECT  emp_id,emp_name,salary,dept_name,location
FROM Employee e
JOIN Department d
JOIN Company c
ON e.dept_id=d.dept_id and d.company_id=c.company_id;

#5.Get all employees working in a specific department (e.g., "Testiing").
SELECT emp_id,emp_name,dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id=d.dept_id WHERE dept_name="Testing";

#6. Display employee name and company name where employees belong to a department.
SELECT e.emp_name,c.company_name
FROM Employee e
JOIN  Department d
ON e.dept_id=d.dept_id
JOIN Company c
ON e.company_id=c.company_id;


#7. Find employees whose department exists in the company table.
SELECT emp_id,emp_name,dept_name
FROM Employee e
JOIN Department d
ON e.dept_id=d.dept_id
JOIN Company c
ON d.company_id=c.company_id;

#8. Show all employees with their department and company details
SELECT emp_id,emp_name,dept_name,company_name
FROM employee e
JOIN  Department d
JOIN Company c
ON e.dept_id=d.dept_id and e.company_id=c.company_id;


#9. Retrieve employees and their department names where salary > 50,000.
SELECT emp_id,emp_name,salary,dept_name
FROM Employee e
JOIN Department d
ON e.dept_id=d.dept_id WHERE salary > 50000; 

#10. List employees who are working in departments under a specific company.
SELECT emp_id,emp_name,dept_name,company_name
FROM Company c
JOIN Department d
JOIN Employee e 
ON c.company_id=e.company_id and d.dept_id=e.dept_id 
WHERE company_name="TCS" or company_name="Amazon";



CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(50),
    language VARCHAR(30),
    duration_mins INT
);

CREATE TABLE Theatre (
    theatre_id INT PRIMARY KEY,
    theatre_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    movie_id INT,
    theatre_id INT,
    seats_booked INT,
    booking_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id)
);

INSERT INTO Movie VALUES
(1, 'Leo', 'Tamil', 165),
(2, 'Salaar', 'Telugu', 175),
(3, 'Jawan', 'Hindi', 170),
(4, 'KGF 2', 'Kannada', 168),
(5, 'RRR', 'Telugu', 182),
(6, 'Pushpa', 'Telugu', 179),
(7, 'Avengers Endgame', 'English', 181),
(8, 'Interstellar', 'English', 169),
(9, 'Bahubali', 'Telugu', 159),
(10, 'Master', 'Tamil', 172); 

INSERT INTO Theatre VALUES
(101, 'PVR Cinemas', 'Hyderabad'),
(102, 'INOX', 'Bangalore'),
(103, 'Asian Cinemas', 'Vijayawada'),
(104, 'Cinepolis', 'Chennai'),
(105, 'Miraj Cinemas', 'Mumbai'),
(106, 'AMB Cinemas', 'Hyderabad'),
(107, 'Prasads Multiplex', 'Hyderabad'),
(108, 'SVC Cinemas', 'Vijayawada'),
(109, 'SPI Palazzo', 'Chennai'),
(110, 'Carnival Cinemas', 'Delhi'); 

INSERT INTO Booking VALUES
(1001, 'Ravi', 1, 101, 2, '2026-05-01'),
(1002, 'Priya', 9, 108, 4, '2026-05-02'),
(1003, 'Kiran', 3, 103, 3, '2026-05-03'),
(1004, 'Sneha', 6, 109, 5, '2026-05-04'),
(1005, 'Rahul', 5, 105, 2, '2026-05-05'),
(1006, 'Anjali', 6, 106, 1, '2026-05-06'),
(1007, 'Vijay', 7, 107, 6, '2026-05-06'),
(1008, 'Pooja', 4, 105, 2, '2026-05-07'),
(1009, 'Suresh', 9, 109, 4, '2026-05-07'),
(1010, 'Deepak', 10, 110, 3, '2026-05-08');

#1. Retrieve all bookings along with movie names.
SELECT booking_id,customer_name,seats_booked,booking_date,movie_name
FROM Booking b
JOIN Movie m
ON b.movie_id=m.movie_id;


#2. Display movie name and theatre name for each booking.
SELECT booking_id,customer_name,seats_booked,booking_date,theatre_name,movie_name
FROM Booking b
JOIN Theatre t 
JOIN Movie m
ON b.theatre_id=t.theatre_id and b.movie_id=m.movie_id;

#3. List all customers who booked tickets for a movie.
SELECT customer_name,movie_name
FROM Booking b
JOIN Movie m
ON b.movie_id=m.movie_id;

#4. Show all movies that have at least one booking.
SELECT m.movie_id,m.movie_name,booking_id,customer_name
FROM Movie m
JOIN Booking b
ON b.movie_id=m.movie_id;


#5. Retrieve booking details with theatre location.
SELECT booking_id,customer_name,seats_booked,booking_date,t.city
FROM Booking b
JOIN Theatre t
ON b.theatre_id=t.theatre_id;

#6. Display movie name, booking date, and theatre name.
SELECT m.movie_name,t.theatre_name,b.booking_date
FROM Movie m
JOIN Theatre t
JOIN Booking b
ON m.movie_id=b.movie_id and t.theatre_id=b.theatre_id;

#7. Find all bookings made for a specific movie.
SELECT booking_id,customer_name,seats_booked,booking_date,movie_name
FROM Booking b
JOIN Movie m
ON b.movie_id=m.movie_id WHERE movie_name="Pushpa";

#8. Show all theatres where movies are booked
SELECT t.theatre_id,theatre_name,customer_name,movie_name
FROM Theatre t
JOIN Movie m
JOIN Booking b
ON t.theatre_id=b.theatre_id and m.movie_id=b.movie_id;

#9. Retrieve movies along with number of bookings (using INNER JOIN).
SELECT m.movie_name,COUNT(b.booking_id) AS total_bookings
FROM Movie m
INNER JOIN Booking b
ON m.movie_id = b.movie_id
GROUP BY  m.movie_name;

#10. Display booking details only for movies available in theatres.
SELECT booking_id,customer_name,movie_name,theatre_name,seats_booked,booking_date
FROM Booking b
JOIN Movie m
JOIN Theatre t
ON b.movie_id = m.movie_id and b.theatre_id = t.theatre_id;

use college_db;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    branch VARCHAR(50),
    cgpa DECIMAL(3,2)
);


CREATE TABLE Placement (
    placement_id INT PRIMARY KEY,
    student_id INT,
    company_name VARCHAR(50),
    package_lpa DECIMAL(4,2),
    placement_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students VALUES
(1, 'Ravi', 'CSE', 8.5),
(2, 'Priya', 'ECE', 8.1),
(3, 'Kiran', 'EEE', 7.8),
(4, 'Sneha', 'CSE', 9.0),
(5, 'Rahul', 'MECH', 7.5),
(6, 'Anjali', 'IT', 8.7),
(7, 'Vijay', 'CIVIL', 7.2),
(8, 'Pooja', 'CSE', 8.9),
(9, 'Suresh', 'ECE', 8.3),
(10, 'Deepak', 'IT', 9.1);

INSERT INTO Placement VALUES
(101, 1, 'TCS', 4.5, '2026-01-10'),
(102, 2, 'Infosys', 5.0, '2026-01-12'),
(103, 6, 'Wipro', 3.8, '2026-01-15'),
(104, 4, 'Google', 12.0, '2026-01-18'),
(105, 5, 'Accenture', 4.2, '2026-01-20'),
(106, 6, 'Amazon', 10.5, '2026-01-22'),
(107, 3, 'Capgemini', 3.6, '2026-01-25'),
(108, 2, 'Microsoft', 11.5, '2026-01-27'),
(109, 9, 'IBM', 4.8, '2026-01-29'),
(110, 3, 'Oracle', 9.5, '2026-02-01');

#1. Retrieve all students who got placed.
SELECT s.student_name,p.placement_id,p.company_name
FROM Students s
JOIN Placement p 
ON s.student_id=p.student_id;

#2. Display student name along with company name
SELECT student_name,company_name
FROM Students s 
JOIN Placement p 
ON s.student_id=p.student_id;

#3. List students with their placement package details.
SELECT student_name,package_lpa,company_name
FROM Students s 
JOIN Placement p 
ON s.student_id=p.student_id;

#4. Show students who are placed in a specific company.
SELECT student_name,company_name
FROM Students s 
JOIN Placement p 
ON s.student_id=p.student_id WHERE company_name="Google";

#5. Retrieve all placement records with student details.
SELECT placement_id,p.student_id,company_name,package_lpa,placement_date,student_name,branch,cgpa
FROM Students s
RIGHT JOIN Placement p 
ON s.student_id=p.student_id;

#6. Display student name, branch, and placement company
SELECT student_name,branch,company_name
FROM Students s
JOIN Placement p
ON s.student_id=p.student_id;

#7. Find students whose placement record exists.
SELECT student_name,placement_id,company_name
FROM Students s 
JOIN Placement p 
ON s.student_id=p.student_id;

#8. Show placed students with salary greater than a specific amount.
SELECT student_name,company_name,package_lpa
FROM Students s 
JOIN Placement p 
ON s.student_id=p.student_id WHERE package_lpa > 5.0; 

#9. Display all students who have valid placement records.
SELECT s.student_id,s.student_name,s.branch,p.company_name,p.package_lpa
FROM Students s
INNER JOIN Placement p
ON s.student_id = p.student_id;

use company_db;
#1. Write a query to join three tables and display combined details.
SELECT c.company_id,company_name,location,d.dept_id,e.emp_id,emp_name,salary
FROM Company c
JOIN Department d 
JOIN Employee e 
ON c.company_id=d.company_id and c.company_id=e.company_id;

#2. Find records that exist in all three tables only.
SELECT c.company_id,company_name,location,d.dept_id,e.emp_id,emp_name,salary
FROM Company c
INNER JOIN Department d 
INNER JOIN Employee e 
ON c.company_id=d.company_id and c.company_id=e.company_id;




