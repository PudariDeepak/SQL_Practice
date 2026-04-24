CREATE DATABASE college2;
USE college2;

CREATE TABLE student(
 rollno INT PRIMARY KEY,
 name VARCHAR(50),
 marks INT NOT NULL,
 grade VARCHAR(1),
 city VARCHAR(20)
);

SELECT *FROM student;

INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");
SELECT *FROM student;

UPDATE student
SET grade="A"
WHERE grade="o";
SET SQL_SAFE_UPDATES=0;

SELECT * FROM student
WHERE marks>70 LIMIT 3;

SELECT *FROM student
ORDER BY marks DESC;

SELECT max(marks) 
FROM student;

SELECT city,avg(marks)
FROM student
GROUP BY city
ORDER BY city DESC;

SELECT count(name),city
FROM student
GROUP BY city
HAVING max(marks)>90;

UPDATE student
SET grade="o"
WHERE grade="A";

DELETE FROM student
WHERE marks=77;

ALTER TABLE student
ADD COLUMN age INT DEFAULT(21);
SELECT * FROM student;

CREATE TABLE stu(
stu_id INT PRIMARY KEY,
name VARCHAR(50)
);
INSERT INTO stu VALUES
(101,"adam"),
(102,"bob"),
(103,"casey");

CREATE TABLE course(
stu_id INT PRIMARY KEY,
course VARCHAR(50)
);
INSERT INTO course VALUES 
(102,"english"),
(105,"math"),
(103,"science"),
(107,"com science");
SELECT *FROM course;

SELECT * 
FROM stu
INNER JOIN course
ON stu.stu_id=course.stu_id;

SELECT * 
FROM stu as a
RIGHT JOIN course as b
ON a.stu_id=b.stu_id;

SELECT * FROM stu as a
LEFT JOIN course as b
ON a.stu_id=b.stu_id
UNION
SELECT * FROM stu as a
RIGHT JOIN course as b
ON a.stu_id=b.stu_id;

SELECT * FROM stu as a 
LEFT JOIN course as b
ON a.stu_id=b.stu_id
WHERE b.stu_id IS NULL;

SELECT * FROM stu as a 
RIGHT  JOIN course as b
ON a.stu_id=b.stu_id
WHERE a.stu_id IS NULL;


CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT 
);
INSERT INTO employee VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);
SELECT *FROM employee;

SELECT a.name as manager_name ,b.name 
FROM employee as a
JOIN employee as b
ON a.id=b.manager_id;

 SELECT name,marks
 FROM student
 WHERE marks> (SELECT AVG(marks) FROM student);
 
 SELECT name,rollno
 FROM student 
 WHERE rollno IN(
 SELECT rollno 
 FROM student
 WHERE rollno % 2=0);

SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city="Delhi") AS temp;
