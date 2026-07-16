## Database Setup

Pehle ye table bana lo.

CREATE DATABASE company;
USE company;

CREATE TABLE employees(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary INT,
    department VARCHAR(30)
);

## Data Insert karo

INSERT INTO employees VALUES
(1,'Abdullah',21,50000,'IT'),
(2,'Ali',23,45000,'HR'),
(3,'Sara',20,60000,'IT'),
(4,'Zoya',25,70000,'Finance'),
(5,'Aman',22,55000,'IT'),
(6,'John',28,80000,'Finance'),
(7,'Iram',24,48000,'HR'),
(8,'Rohan',27,75000,'IT');
Topic 1 SELECT

Professional Definition

SELECT database se data retrieve karta hai.

Syntax

SELECT column_name
FROM table_name;

Example

SELECT * FROM employees;

Specific column

SELECT name,salary
FROM employees;
Topic 2 WHERE

Professional Definition

WHERE records ko filter karta hai.

Example

Salary greater than 50000

SELECT *
FROM employees
WHERE salary > 50000;

Age equal to 21

SELECT *
FROM employees
WHERE age = 21;

Department IT

SELECT *
FROM employees
WHERE department='IT';
## Topic 3 ORDER BY

Ascending

SELECT *
FROM employees
ORDER BY salary;

Descending

SELECT *
FROM employees
ORDER BY salary DESC;

Age ascending

SELECT *
FROM employees
ORDER BY age ASC;
## Topic 4 DISTINCT

Duplicate values hata deta hai.

SELECT DISTINCT department
FROM employees;
## Topic 5 LIMIT

Top 3 employees

SELECT *
FROM employees
LIMIT 3;

Highest salary

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;
## Topic 6 INSERT

Single Row

INSERT INTO employees
VALUES
(9,'Pooja',26,65000,'Marketing');
## Topic 7 UPDATE

Salary increase

UPDATE employees
SET salary=52000
WHERE id=1;

Department change

UPDATE employees
SET department='Finance'
WHERE id=2;
## Topic 8 DELETE

Delete employee

DELETE FROM employees
WHERE id=9;

Delete IT department

DELETE FROM employees
WHERE department='IT';

⚠️ Kabhi bhi bina WHERE ke DELETE mat chalana:

DELETE FROM employees;

Ye pura table ka data delete kar dega.

## Topic 9 Aliases

Temporary naam dena.

Column Alias

SELECT salary AS Income
FROM employees;

Table Alias

SELECT e.name,e.salary
FROM employees e;

## Topic 10 Arithmetic Operators

SELECT salary+5000
FROM employees;
SELECT salary-5000
FROM employees;
SELECT salary*2
FROM employees;
SELECT salary/2
FROM employees;
## Topic 11 Comparison Operators

Equal

SELECT *
FROM employees
WHERE age=22;

Not Equal

SELECT *
FROM employees
WHERE age!=22;

Greater

SELECT *
FROM employees
WHERE salary>60000;

Less

SELECT *
FROM employees
WHERE salary<60000;

Greater Equal

SELECT *
FROM employees
WHERE salary>=60000;

Less Equal

SELECT *
FROM employees
WHERE salary<=60000;

## Topic 12 Logical Operators

AND

SELECT *
FROM employees
WHERE department='IT'
AND salary>55000;

OR

SELECT *
FROM employees
WHERE department='HR'
OR department='Finance';

NOT

SELECT *
FROM employees
WHERE NOT department='IT';