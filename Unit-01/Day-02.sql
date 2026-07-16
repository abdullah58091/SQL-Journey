
mysql> SELECT * FROM marks ;
+------+-------+
| id   | marks |
+------+-------+
|    1 |    80 |
|    2 |    90 |
|    4 |    70 |
|    1 |    90 |
|    3 |    80 |
|    5 |    95 |
|   11 |    70 |
+------+-------+
7 rows in set (0.07 sec)

mysql> SELECT * FROM users;
+----+---------------+
| id | email         |
+----+---------------+
|  2 | ali@gmail.com |
+----+---------------+
1 row in set (0.02 sec)

mysql> CREATE DATABASE company;
Query OK, 1 row affected (0.01 sec)

mysql> USE company;
Database changed
mysql>
mysql> CREATE TABLE employees(
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     age INT,
    ->     salary INT,
    ->     department VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO employees VALUES
    -> (1,'Abdullah',21,50000,'IT'),
    -> (2,'Ali',23,45000,'HR'),
    -> (3,'Sara',20,60000,'IT'),
    -> (4,'Zoya',25,70000,'Finance'),
    -> (5,'Aman',22,55000,'IT'),
    -> (6,'John',28,80000,'Finance'),
    -> (7,'Iram',24,48000,'HR'),
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 9
mysql> INSERT INTO employees VALUES
    -> (1,'Abdullah',21,50000,'IT'),
    -> (2,'Ali',23,45000,'HR'),
    -> (3,'Sara',20,60000,'IT'),
    -> (4,'Zoya',25,70000,'Finance'),
    -> (5,'Aman',22,55000,'IT'),
    -> (6,'John',28,80000,'Finance'),
    -> (7,'Iram',24,48000,'HR'),
    -> (8,'Rohan',27,75000,'IT');
Query OK, 8 rows affected (0.05 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT name
    -> FROM employees
    -> WHERE id = ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> UPDATE employees
    -> SET name  = 'Iram'
    -> WHERE id = 2;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employees
    -> SET age = 20
    -> WHERE id = 2;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employees;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |
|  2 | Iram     |   20 |  45000 | HR         |
|  3 | Sara     |   20 |  60000 | IT         |
|  4 | Zoya     |   25 |  70000 | Finance    |
|  5 | Aman     |   22 |  55000 | IT         |
|  6 | John     |   28 |  80000 | Finance    |
|  7 | Iram     |   24 |  48000 | HR         |
|  8 | Rohan    |   27 |  75000 | IT         |
+----+----------+------+--------+------------+
8 rows in set (0.00 sec)

mysql> UPDATE employees
    -> SET name = 'Ali'
    -> WHERE id = 7;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employees;
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

mysql> INSERT INTO employees
    -> VALUES
    -> (9,'Pooja',26,65000,'Marketing');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT salary AS Income
    -> FROM employees;
+--------+
| Income |
+--------+
|  50000 |
|  45000 |
|  60000 |
|  70000 |
|  55000 |
|  80000 |
|  48000 |
|  75000 |
|  65000 |
+--------+
9 rows in set (0.00 sec)

mysql> SELECT e.name,e.salary
    -> FROM employees e;
+----------+--------+
| name     | salary |
+----------+--------+
| Abdullah |  50000 |
| Iram     |  45000 |
| Sara     |  60000 |
| Zoya     |  70000 |
| Aman     |  55000 |
| John     |  80000 |
| Ali      |  48000 |
| Rohan    |  75000 |
| Pooja    |  65000 |
+----------+--------+
9 rows in set (0.00 sec)

mysql> SELECT salary+5000
    -> FROM employees;
+-------------+
| salary+5000 |
+-------------+
|       55000 |
|       50000 |
|       65000 |
|       75000 |
|       60000 |
|       85000 |
|       53000 |
|       80000 |
|       70000 |
+-------------+
9 rows in set (0.04 sec)

mysql> SELECT salary-5000
    -> FROM employees;
+-------------+
| salary-5000 |
+-------------+
|       45000 |
|       40000 |
|       55000 |
|       65000 |
|       50000 |
|       75000 |
|       43000 |
|       70000 |
|       60000 |
+-------------+
9 rows in set (0.03 sec)

mysql> SELECT salary*2
    -> FROM employees;
+----------+
| salary*2 |
+----------+
|   100000 |
|    90000 |
|   120000 |
|   140000 |
|   110000 |
|   160000 |
|    96000 |
|   150000 |
|   130000 |
+----------+
9 rows in set (0.03 sec)

mysql> SELECT salary/2
    -> FROM employees;
+------------+
| salary/2   |
+------------+
| 25000.0000 |
| 22500.0000 |
| 30000.0000 |
| 35000.0000 |
| 27500.0000 |
| 40000.0000 |
| 24000.0000 |
| 37500.0000 |
| 32500.0000 |
+------------+
9 rows in set (0.03 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE age=22;
+----+------+------+--------+------------+
| id | name | age  | salary | department |
+----+------+------+--------+------------+
|  5 | Aman |   22 |  55000 | IT         |
+----+------+------+--------+------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE age!=22;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |
|  2 | Iram     |   20 |  45000 | HR         |
|  3 | Sara     |   20 |  60000 | IT         |
|  4 | Zoya     |   25 |  70000 | Finance    |
|  6 | John     |   28 |  80000 | Finance    |
|  7 | Ali      |   24 |  48000 | HR         |
|  8 | Rohan    |   27 |  75000 | IT         |
|  9 | Pooja    |   26 |  65000 | Marketing  |
+----+----------+------+--------+------------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE salary>60000;
+----+-------+------+--------+------------+
| id | name  | age  | salary | department |
+----+-------+------+--------+------------+
|  4 | Zoya  |   25 |  70000 | Finance    |
|  6 | John  |   28 |  80000 | Finance    |
|  8 | Rohan |   27 |  75000 | IT         |
|  9 | Pooja |   26 |  65000 | Marketing  |
+----+-------+------+--------+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE salary<=60000;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |
|  2 | Iram     |   20 |  45000 | HR         |
|  3 | Sara     |   20 |  60000 | IT         |
|  5 | Aman     |   22 |  55000 | IT         |
|  7 | Ali      |   24 |  48000 | HR         |
+----+----------+------+--------+------------+
5 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE department='IT'
    -> AND salary>55000;
+----+-------+------+--------+------------+
| id | name  | age  | salary | department |
+----+-------+------+--------+------------+
|  3 | Sara  |   20 |  60000 | IT         |
|  8 | Rohan |   27 |  75000 | IT         |
+----+-------+------+--------+------------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE department='HR'
    -> OR department='Finance';
+----+------+------+--------+------------+
| id | name | age  | salary | department |
+----+------+------+--------+------------+
|  2 | Iram |   20 |  45000 | HR         |
|  4 | Zoya |   25 |  70000 | Finance    |
|  6 | John |   28 |  80000 | Finance    |
|  7 | Ali  |   24 |  48000 | HR         |
+----+------+------+--------+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE NOT department='IT';
+----+-------+------+--------+------------+
| id | name  | age  | salary | department |
+----+-------+------+--------+------------+
|  2 | Iram  |   20 |  45000 | HR         |
|  4 | Zoya  |   25 |  70000 | Finance    |
|  6 | John  |   28 |  80000 | Finance    |
|  7 | Ali   |   24 |  48000 | HR         |
|  9 | Pooja |   26 |  65000 | Marketing  |
+----+-------+------+--------+------------+
5 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> ORDER BY salary;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  2 | Iram     |   20 |  45000 | HR         |
|  7 | Ali      |   24 |  48000 | HR         |
|  1 | Abdullah |   21 |  50000 | IT         |
|  5 | Aman     |   22 |  55000 | IT         |
|  3 | Sara     |   20 |  60000 | IT         |
|  9 | Pooja    |   26 |  65000 | Marketing  |
|  4 | Zoya     |   25 |  70000 | Finance    |
|  8 | Rohan    |   27 |  75000 | IT         |
|  6 | John     |   28 |  80000 | Finance    |
+----+----------+------+--------+------------+
9 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> ORDER BY salary DESC;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  6 | John     |   28 |  80000 | Finance    |
|  8 | Rohan    |   27 |  75000 | IT         |
|  4 | Zoya     |   25 |  70000 | Finance    |
|  9 | Pooja    |   26 |  65000 | Marketing  |
|  3 | Sara     |   20 |  60000 | IT         |
|  5 | Aman     |   22 |  55000 | IT         |
|  1 | Abdullah |   21 |  50000 | IT         |
|  7 | Ali      |   24 |  48000 | HR         |
|  2 | Iram     |   20 |  45000 | HR         |
+----+----------+------+--------+------------+
9 rows in set (0.00 sec)

mysql> SELECT DISTINCT department
    -> FROM employees;
+------------+
| department |
+------------+
| IT         |
| HR         |
| Finance    |
| Marketing  |
+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> LIMIT 3;
+----+----------+------+--------+------------+
| id | name     | age  | salary | department |
+----+----------+------+--------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |
|  2 | Iram     |   20 |  45000 | HR         |
|  3 | Sara     |   20 |  60000 | IT         |
+----+----------+------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> ORDER BY salary DESC
    -> LIMIT 1;
+----+------+------+--------+------------+
| id | name | age  | salary | department |
+----+------+------+--------+------------+
|  6 | John |   28 |  80000 | Finance    |
+----+------+------+--------+------------+
1 row in set (0.00 sec)

mysql> DELETE
    -> FROM employees
    -> WHERE id=9;
Query OK, 1 row affected (0.04 sec)

mysql> SELECT *
    -> FROM employees;
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

mysql>