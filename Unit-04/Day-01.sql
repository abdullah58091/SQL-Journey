Todays Practical Task

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
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| college            |
| company            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.01 sec)

mysql> USE COMPANY ;
Database changed
mysql> SHOW TABLES;
+-------------------+
| Tables_in_company |
+-------------------+
| employees         |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employees ;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |
|  2 | Iram     |   20 |  45000 | HR         |
|  3 | Sara     |   20 |  60000 | IT         |
|  4 | Zoya     |   25 |  70000 | Finance    |
|  5 | Aman     |   22 |  55000 | IT         |
|  6 | John     |   28 |  80000 | Finance    |
|  7 | Ali      |   24 |  48000 | HR         |
|  8 | Rohan    |   27 |  75000 | IT         |
+----+----------+------+--------+------------+
8 rows in set (0.00 sec)


mysql> UPDATE employees
    -> SET dept_id = 101
    -> WHERE department = 'IT';
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> UPDATE employees
    -> SET dept_id = 102
    -> WHERE department = 'HR';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE employees
    -> SET dept_id = 103
    -> WHERE department = 'Finance';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT *
    -> FROM employees;
+----+----------+------+--------+------------+---------+
| id | name     | age  | salary | department | dept_id |
+----+----------+------+--------+------------+---------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |
|  2 | Iram     |   20 |  45000 | HR         |     102 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |
|  6 | John     |   28 |  80000 | Finance    |     103 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |
+----+----------+------+--------+------------+---------+
8 rows in set (0.00 sec)

mysql> SELECT ...
    -> WHERE salary >
    -> (
    ->     SELECT AVG(salary)
    ->     FROM employees
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '...
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
)' at line 1
mysql> SELECT
    -> e.name,
    -> d.department_name
    -> FROM employees e
    -> INNER JOIN departments d
    -> ON e.dept_id=d.dept_id;
ERROR 1146 (42S02): Table 'company.departments' doesnt exist
mysql> SELECT *
    -> FROM employees
    -> WHERE salary >
    -> (
    ->     SELECT AVG(salary)
    ->     FROM employees
    -> );
+----+-------+------+--------+------------+---------+
| id | name  | age  | salary | department | dept_id |
+----+-------+------+--------+------------+---------+
|  4 | Zoya  |   25 |  70000 | Finance    |     103 |
|  6 | John  |   28 |  80000 | Finance    |     103 |
|  8 | Rohan |   27 |  75000 | IT         |     101 |
+----+-------+------+--------+------------+---------+
3 rows in set (0.01 sec)

mysql> SELECT name, salary
    -> FROM employees
    -> WHERE salary >
    -> (
    ->     SELECT AVG(salary)
    ->     FROM employees
    -> );
+-------+--------+
| name  | salary |
+-------+--------+
| Zoya  |  70000 |
| John  |  80000 |
| Rohan |  75000 |
+-------+--------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE departments (
    ->     dept_id INT PRIMARY KEY,
    ->     department_name VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO departments VALUES
    -> (101,'IT'),
    -> (102,'HR'),
    -> (103,'Finance'),
    -> (104,'Marketing');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM departments;
+---------+-----------------+
| dept_id | department_name |
+---------+-----------------+
|     101 | IT              |
|     102 | HR              |
|     103 | Finance         |
|     104 | Marketing       |
+---------+-----------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> INNER JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | IT              |
| Iram     | HR              |
| Sara     | IT              |
| Zoya     | Finance         |
| Aman     | IT              |
| John     | Finance         |
| Ali      | HR              |
| Rohan    | IT              |
+----------+-----------------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE salary >
    -> (
    ->     SELECT AVG(salary)
    ->     FROM employees
    -> );
+----+-------+------+--------+------------+---------+
| id | name  | age  | salary | department | dept_id |
+----+-------+------+--------+------------+---------+
|  4 | Zoya  |   25 |  70000 | Finance    |     103 |
|  6 | John  |   28 |  80000 | Finance    |     103 |
|  8 | Rohan |   27 |  75000 | IT         |     101 |
+----+-------+------+--------+------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT AVG(salary)
    -> FROM employees;
+-------------+
| AVG(salary) |
+-------------+
|  60375.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE salary > 60375;
+----+-------+------+--------+------------+---------+
| id | name  | age  | salary | department | dept_id |
+----+-------+------+--------+------------+---------+
|  4 | Zoya  |   25 |  70000 | Finance    |     103 |
|  6 | John  |   28 |  80000 | Finance    |     103 |
|  8 | Rohan |   27 |  75000 | IT         |     101 |
+----+-------+------+--------+------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> INNER JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | IT              |
| Iram     | HR              |
| Sara     | IT              |
| Zoya     | Finance         |
| Aman     | IT              |
| John     | Finance         |
| Ali      | HR              |
| Rohan    | IT              |
+----------+-----------------+
8 rows in set (0.00 sec)

mysql> ON e.dept_id = d.dept_id
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ON e.dept_id = d.dept_id' at line 1
mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> LEFT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | IT              |
| Iram     | HR              |
| Sara     | IT              |
| Zoya     | Finance         |
| Aman     | IT              |
| John     | Finance         |
| Ali      | HR              |
| Rohan    | IT              |
+----------+-----------------+
8 rows in set (0.00 sec)

mysql> INSERT INTO employees
    -> VALUES
    -> (9,'David',26,52000,'Unknown',999);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> INNER JOIN departments d
    -> ON e.dept_id=d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | IT              |
| Iram     | HR              |
| Sara     | IT              |
| Zoya     | Finance         |
| Aman     | IT              |
| John     | Finance         |
| Ali      | HR              |
| Rohan    | IT              |
+----------+-----------------+
8 rows in set (0.00 sec)

mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> LEFT JOIN departments d
    -> ON e.dept_id=d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | IT              |
| Iram     | HR              |
| Sara     | IT              |
| Zoya     | Finance         |
| Aman     | IT              |
| John     | Finance         |
| Ali      | HR              |
| Rohan    | IT              |
| David    | NULL            |
+----------+-----------------+
9 rows in set (0.00 sec)

mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> RIGHT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Rohan    | IT              |
| Aman     | IT              |
| Sara     | IT              |
| Abdullah | IT              |
| Ali      | HR              |
| Iram     | HR              |
| John     | Finance         |
| Zoya     | Finance         |
| NULL     | Marketing       |
+----------+-----------------+
9 rows in set (0.01 sec)

mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> CROSS JOIN departments d;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | Marketing       |
| Abdullah | Finance         |
| Abdullah | HR              |
| Abdullah | IT              |
| Iram     | Marketing       |
| Iram     | Finance         |
| Iram     | HR              |
| Iram     | IT              |
| Sara     | Marketing       |
| Sara     | Finance         |
| Sara     | HR              |
| Sara     | IT              |
| Zoya     | Marketing       |
| Zoya     | Finance         |
| Zoya     | HR              |
| Zoya     | IT              |
| Aman     | Marketing       |
| Aman     | Finance         |
| Aman     | HR              |
| Aman     | IT              |
| John     | Marketing       |
| John     | Finance         |
| John     | HR              |
| John     | IT              |
| Ali      | Marketing       |
| Ali      | Finance         |
| Ali      | HR              |
| Ali      | IT              |
| Rohan    | Marketing       |
| Rohan    | Finance         |
| Rohan    | HR              |
| Rohan    | IT              |
| David    | Marketing       |
| David    | Finance         |
| David    | HR              |
| David    | IT              |
+----------+-----------------+
36 rows in set (0.00 sec)

mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> LEFT JOIN departments d
    -> ON e.dept_id = d.dept_id
    ->
    -> UNION
    ->
    -> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM employees e
    -> RIGHT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Abdullah | IT              |
| Iram     | HR              |
| Sara     | IT              |
| Zoya     | Finance         |
| Aman     | IT              |
| John     | Finance         |
| Ali      | HR              |
| Rohan    | IT              |
| David    | NULL            |
| NULL     | Marketing       |
+----------+-----------------+
10 rows in set (0.00 sec)

mysql> ALTER TABLE employees
    -> ADD manager_id INT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE employees
    -> SET manager_id = 1
    -> WHERE id IN (2,3,4);
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql>
mysql> UPDATE employees
    -> SET manager_id = 2
    -> WHERE id IN (5,6);
Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql>
mysql> UPDATE employees
    -> SET manager_id = 3
    -> WHERE id IN (7,8,9);
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT
    ->     e.name AS Employee,
    ->     m.name AS Manager
    -> FROM employees e
    -> LEFT JOIN employees m
    -> ON e.manager_id = m.id;
+----------+----------+
| Employee | Manager  |
+----------+----------+
| Abdullah | NULL     |
| Iram     | Abdullah |
| Sara     | Abdullah |
| Zoya     | Abdullah |
| Aman     | Iram     |
| John     | Iram     |
| Ali      | Sara     |
| Rohan    | Sara     |
| David    | Sara     |
+----------+----------+
9 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE dept_id IN
    -> (
    ->     SELECT dept_id
    ->     FROM departments
    -> );
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
+----+----------+------+--------+------------+---------+------------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE salary > ANY
    -> (
    ->     SELECT salary
    ->     FROM employees
    ->     WHERE department='HR'
    -> );
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
|  9 | David    |   26 |  52000 | Unknown    |     999 |          3 |
+----+----------+------+--------+------------+---------+------------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE salary > ALL
    -> (
    ->     SELECT salary
    ->     FROM employees
    ->     WHERE department='HR'
    -> );
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
|  9 | David    |   26 |  52000 | Unknown    |     999 |          3 |
+----+----------+------+--------+------------+---------+------------+
7 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM employees e1
    -> WHERE salary >
    -> (
    ->     SELECT AVG(salary)
    ->     FROM employees e2
    ->     WHERE e1.department = e2.department
    -> );
+----+-------+------+--------+------------+---------+------------+
| id | name  | age  | salary | department | dept_id | manager_id |
+----+-------+------+--------+------------+---------+------------+
|  6 | John  |   28 |  80000 | Finance    |     103 |          2 |
|  7 | Ali   |   24 |  48000 | HR         |     102 |          3 |
|  8 | Rohan |   27 |  75000 | IT         |     101 |          3 |
+----+-------+------+--------+------------+---------+------------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees e
    -> WHERE EXISTS
    -> (
    ->     SELECT *
    ->     FROM departments d
    ->     WHERE d.dept_id = e.dept_id
    -> );
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
+----+----------+------+--------+------------+---------+------------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM departments d
    -> WHERE NOT EXISTS
    -> (
    ->     SELECT *
    ->     FROM employees e
    ->     WHERE e.dept_id = d.dept_id
    -> );
+---------+-----------------+
| dept_id | department_name |
+---------+-----------------+
|     104 | Marketing       |
+---------+-----------------+
1 row in set (0.01 sec)

mysql> CREATE VIEW IT_Employees AS
    -> SELECT *
    -> FROM employees
    -> WHERE department='IT';
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM IT_Employees;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
+----+----------+------+--------+------------+---------+------------+
4 rows in set (0.01 sec)

mysql> DROP VIEW IT_Employees;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE PROCEDURE ShowEmployees()
    -> BEGIN
    ->     SELECT * FROM employees;
    -> END $$
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL ShowEmployees();
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
|  9 | David    |   26 |  52000 | Unknown    |     999 |          3 |
+----+----------+------+--------+------------+---------+------------+
9 rows in set (0.00 sec)

Query OK, 0 rows affected (0.12 sec)

mysql>
mysql>
mysql>
