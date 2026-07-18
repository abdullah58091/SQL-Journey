Unit 4 – SQL Joins
Learning Objectives

After completing this unit, you will be able to:

Understand why joins are required.
Combine data from multiple tables.
Use INNER JOIN, LEFT JOIN, RIGHT JOIN, and CROSS JOIN.
Write industry-standard SQL join queries.
Answer join-related interview questions.
What is a JOIN?
Professional Definition

A JOIN is an SQL operation used to combine rows from two or more tables based on a related column.

In relational databases, data is usually stored in multiple tables to avoid duplication. Joins allow us to retrieve related data from those tables.

Real-World Example

Imagine you are building an Employee Management System.

Instead of storing department names in every employee record, you create a separate department table.

Employees Table
emp_id	employee_name	dept_id
1	Abdullah	101
2	Iram	102
3	Sara	101
4	Zoya	103
Departments Table
dept_id	department_name
101	IT
102	HR
103	Finance
104	Marketing

Suppose the manager asks:

"Show each employee with the name of their department."

The employees table only stores the department ID.

The departments table stores the department name.

To combine both pieces of information, we use a JOIN.

Step 1 — Create the Department Table

Run the following query:

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(30)
);
Step 2 — Insert Data
INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing');
Step 3 — Modify the Employees Table

Currently, your employees table contains the department column.

Now add a new column called dept_id.

ALTER TABLE employees
ADD dept_id INT;
Step 4 — Update Department IDs
UPDATE employees
SET dept_id = 101
WHERE department = 'IT';
UPDATE employees
SET dept_id = 102
WHERE department = 'HR';
UPDATE employees
SET dept_id = 103
WHERE department = 'Finance';

Now verify your table.

SELECT *
FROM employees;

Expected structure:

id	name	department	dept_id
1	Abdullah	IT	101
2	Iram	HR	102
3	Sara	IT	101
...	...	...	...
INNER JOIN
Professional Definition

An INNER JOIN returns only the rows that have matching values in both tables.

Syntax
SELECT
    e.name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
Understanding the Query
employees e

e is an alias for the employees table.

departments d

d is an alias for the departments table.

ON e.dept_id = d.dept_id

This condition tells MySQL how the two tables are related.

Expected Output
Employee	Department
Abdullah	IT
Iram	HR
Sara	IT
Zoya	Finance
Aman	IT
John	Finance
Ali	HR
Rohan	IT

Only matching records are displayed.

Interview Question

Q: Why do we use INNER JOIN?

Answer:

We use INNER JOIN to retrieve only the records that have matching values in both tables based on a common column.


Today's Practical Task

Run these commands in order:

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(30)
);

INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing');

ALTER TABLE employees
ADD dept_id INT;

UPDATE employees
SET dept_id = 101
WHERE department = 'IT';

UPDATE employees
SET dept_id = 102
WHERE department = 'HR';

UPDATE employees
SET dept_id = 103
WHERE department = 'Finance';

SELECT * FROM employees;

SELECT
    e.name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;