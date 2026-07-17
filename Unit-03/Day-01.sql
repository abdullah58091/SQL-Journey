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
6 rows in set (0.07 sec)

mysql> USE COLLEGE ;
Database changed
mysql> SHOW TABLES;
+-------------------+
| Tables_in_college |
+-------------------+
| marks             |
| students          |
| users             |
+-------------------+
3 rows in set (0.05 sec)

mysql> SELECT  * FROM employees;
ERROR 1146 (42S02): Table 'college.employees' doesnt exist
mysql> USE company;
Database changed
mysql> SHOW TABLES ;
+-------------------+
| Tables_in_company |
+-------------------+
| employees         |
+-------------------+
1 row in set (0.00 sec)

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
8 rows in set (0.03 sec)

mysql> SELECT  COUNT(*)
    -> FROM employees;
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+
1 row in set (0.03 sec)

mysql> SELECT COUNT(*)
    -> FROM employees
    -> WHERE department='IT';
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT SUM(salary)
    -> FROM employees;
+-------------+
| SUM(salary) |
+-------------+
|      483000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(salary)
    -> FROM employees
    -> WHERE department = 'IT';
+-------------+
| SUM(salary) |
+-------------+
|      240000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary)
    -> FROM employees;
+-------------+
| AVG(salary) |
+-------------+
|  60375.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary)
    -> FROM employees
    -> WHERE department='HR';
+-------------+
| AVG(salary) |
+-------------+
|  46500.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary)
    -> FROM employees;
+-------------+
| MIN(salary) |
+-------------+
|       45000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary)
    -> FROM employees;
+-------------+
| MAX(salary) |
+-------------+
|       80000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT
    -> COUNT(*) AS TotalEmployees,
    -> SUM(salary) AS TotalSalary,
    -> AVG(salary) AS TotalSalary,
    -> MIN(salary) AS TotalSalary,
    -> MAX(salary) AS HighestSalary
    -> FROM employees;
+----------------+-------------+-------------+-------------+---------------+
| TotalEmployees | TotalSalary | TotalSalary | TotalSalary | HighestSalary |
+----------------+-------------+-------------+-------------+---------------+
|              8 |      483000 |  60375.0000 |       45000 |         80000 |
+----------------+-------------+-------------+-------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT
    -> COUNT(*) AS TotalEmployees,
    -> SUM(salary) AS TotalSalary,
    -> AVG(salary) AS AverageSalary,
    -> MIN(salary) AS LowestSalary,
    -> MAX(salary) AS HighestSalary
    -> FROM employees;
+----------------+-------------+---------------+--------------+---------------+
| TotalEmployees | TotalSalary | AverageSalary | LowestSalary | HighestSalary |
+----------------+-------------+---------------+--------------+---------------+
|              8 |      483000 |    60375.0000 |        45000 |         80000 |
+----------------+-------------+---------------+--------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT department,
    -> COUNT(*) AS TotalEmployees
    -> FROM employees
    -> GROUP BY department;
+------------+----------------+
| department | TotalEmployees |
+------------+----------------+
| IT         |              4 |
| HR         |              2 |
| Finance    |              2 |
+------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT department,
    -> SUM(salary) AS TotalSalary
    -> FROM employees
    -> GROUP BY department;
+------------+-------------+
| department | TotalSalary |
+------------+-------------+
| IT         |      240000 |
| HR         |       93000 |
| Finance    |      150000 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT department,
    -> AVG(salary) AS AverageSalary
    -> FROM employees
    -> GROUP BY department;
+------------+---------------+
| department | AverageSalary |
+------------+---------------+
| IT         |    60000.0000 |
| HR         |    46500.0000 |
| Finance    |    75000.0000 |
+------------+---------------+
3 rows in set (0.01 sec)

mysql> SELECT department,
    -> COUNT(*) AS Employees
    -> FROM employees
    -> GROUP BY department
    -> HAVING COUNT(*)>=2;
+------------+-----------+
| department | Employees |
+------------+-----------+
| IT         |         4 |
| HR         |         2 |
| Finance    |         2 |
+------------+-----------+
3 rows in set (0.01 sec)

mysql> SELECT department,
    -> SUM(salary)
    -> FROM employees
    -> GROUP BY department
    -> HAVING SUM(salary)>150000;
+------------+-------------+
| department | SUM(salary) |
+------------+-------------+
| IT         |      240000 |
+------------+-------------+
1 row in set (0.01 sec)

mysql>

mysql> SELECT UPPER(name)
    -> FROM employees;
+-------------+
| UPPER(name) |
+-------------+
| ABDULLAH    |
| IRAM        |
| SARA        |
| ZOYA        |
| AMAN        |
| JOHN        |
| ALI         |
| ROHAN       |
+-------------+
8 rows in set (0.01 sec)

mysql> SELECT LOWER(name)
    -> FROM employees;
+-------------+
| LOWER(name) |
+-------------+
| abdullah    |
| iram        |
| sara        |
| zoya        |
| aman        |
| john        |
| ali         |
| rohan       |
+-------------+
8 rows in set (0.00 sec)

mysql> SELECT UPPER(*)
    -> FROM employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*)
FROM employees' at line 1
mysql> SELECT LENGTH(*)
    -> FROM employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*)
FROM employees' at line 1
mysql> SELECT name AS LENGTH
    -> LENGTH(name)
    -> FROM employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'LENGTH(name)
FROM employees' at line 2
mysql> SELECT LENGTH(name)
    -> FROM employees;
+--------------+
| LENGTH(name) |
+--------------+
|            8 |
|            4 |
|            4 |
|            4 |
|            4 |
|            4 |
|            3 |
|            5 |
+--------------+
8 rows in set (0.01 sec)

mysql> SELECT name,
    -> LENGTH(name)
    -> FROM employees;
+----------+--------------+
| name     | LENGTH(name) |
+----------+--------------+
| Abdullah |            8 |
| Iram     |            4 |
| Sara     |            4 |
| Zoya     |            4 |
| Aman     |            4 |
| John     |            4 |
| Ali      |            3 |
| Rohan    |            5 |
+----------+--------------+
8 rows in set (0.00 sec)

mysql> SELECT CONCAT(name,' works in ',department)
    -> FROM employees;
+--------------------------------------+
| CONCAT(name,' works in ',department) |
+--------------------------------------+
| Abdullah works in IT                 |
| Iram works in HR                     |
| Sara works in IT                     |
| Zoya works in Finance                |
| Aman works in IT                     |
| John works in Finance                |
| Ali works in HR                      |
| Rohan works in IT                    |
+--------------------------------------+
8 rows in set (0.01 sec)

mysql> SELECT name,
    -> SUBSTRING(name,1,3)
    -> FROM employees;
+----------+---------------------+
| name     | SUBSTRING(name,1,3) |
+----------+---------------------+
| Abdullah | Abd                 |
| Iram     | Ira                 |
| Sara     | Sar                 |
| Zoya     | Zoy                 |
| Aman     | Ama                 |
| John     | Joh                 |
| Ali      | Ali                 |
| Rohan    | Roh                 |
+----------+---------------------+
8 rows in set (0.00 sec)

mysql> SELECT TRIM('    Abdullah     ');
+---------------------------+
| TRIM('    Abdullah     ') |
+---------------------------+
| Abdullah                  |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(123.5678,2);
+-------------------+
| ROUND(123.5678,2) |
+-------------------+
|            123.57 |
+-------------------+
1 row in set (0.01 sec)

mysql> SELECT CEIL(12.2);
+------------+
| CEIL(12.2) |
+------------+
|         13 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT FLOOR(12.9);
+-------------+
| FLOOR(12.9) |
+-------------+
|          12 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MOD(25,4);
+-----------+
| MOD(25,4) |
+-----------+
|         1 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-07-17 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-07-17 16:21:57 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT YEAR(CURDATE());
+-----------------+
| YEAR(CURDATE()) |
+-----------------+
|            2026 |
+-----------------+
1 row in set (0.01 sec)

mysql> SELECT MONTH(CURDATE());
+------------------+
| MONTH(CURDATE()) |
+------------------+
|                7 |
+------------------+
1 row in set (0.00 sec)

mysql> SELECT DATEDIFF('2026-12-31',
    -> '2026-07-17');
+--------------------------------------+
| DATEDIFF('2026-12-31',
'2026-07-17') |
+--------------------------------------+
|                                  167 |
+--------------------------------------+
1 row in set (0.01 sec)

mysql> SELECT DATEDIFF('2007-03-07','2026-07-17');
+-------------------------------------+
| DATEDIFF('2007-03-07','2026-07-17') |
+-------------------------------------+
|                               -7072 |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT IFNULL(NULL,'No Value');
+-------------------------+
| IFNULL(NULL,'No Value') |
+-------------------------+
| No Value                |
+-------------------------+
1 row in set (0.00 sec)

mysql> SELECT COALESCE(NULL,NULL,'Abdullah');
+--------------------------------+
| COALESCE(NULL,NULL,'Abdullah') |
+--------------------------------+
| Abdullah                       |
+--------------------------------+
1 row in set (0.00 sec)

mysql>