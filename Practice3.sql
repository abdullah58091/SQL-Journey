mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM company.employees e
    -> INNER JOIN departments d
    -> ON e.dept_id = d.dept_id;
ERROR 1046 (3D000): No database selected
mysql> USE COMPANY;
Database changed
mysql> SELECT
    ->     e.name,
    ->     d.department_name
    -> FROM company.employees e
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
| Ravi     | HR              |
+----------+-----------------+
9 rows in set (0.07 sec)

mysql> UPDATE company.employees
    -> SET dept_id = 101
    -> WHERE department = 'Tech';
Query OK, 0 rows affected (0.04 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SELECT * FROM company.employees;
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
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.00 sec)


mysql> SHOW TABLES;
+-------------------+
| Tables_in_company |
+-------------------+
| departments       |
| employees         |
| meeting           |
+-------------------+
3 rows in set (0.06 sec)

mysql> SELECT * FROM DEPARTMENTS;
+---------+-----------------+
| dept_id | department_name |
+---------+-----------------+
|     101 | IT              |
|     102 | HR              |
|     103 | Finance         |
|     104 | Marketing       |
+---------+-----------------+
4 rows in set (0.00 sec)

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
| David    | NULL            |
| Ravi     | HR              |
+----------+-----------------+
10 rows in set (0.00 sec)

mysql> SELECT
    ->  e.name,
    ->  d.department_name
    -> FROM company.employees e
    -> RIGHT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------------+
| name     | department_name |
+----------+-----------------+
| Rohan    | IT              |
| Aman     | IT              |
| Sara     | IT              |
| Abdullah | IT              |
| Ravi     | HR              |
| Ali      | HR              |
| Iram     | HR              |
| John     | Finance         |
| Zoya     | Finance         |
| NULL     | Marketing       |
+----------+-----------------+
10 rows in set (0.03 sec)

mysql> SELECT
    ->     ->     e.name,
    ->     ->     d.department_name
    ->     -> FROM employees e
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '->     e.name,
    ->     d.department_name
    -> FROM employees e' at line 2
mysql>  SELECT
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
| Ravi     | Marketing       |
| Ravi     | Finance         |
| Ravi     | HR              |
| Ravi     | IT              |
+----------+-----------------+
40 rows in set (0.00 sec)

mysql>

mysql> SELECT * FROM company.employees;
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
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.01 sec)


mysql> SELECT * FROM college.employees;
+----+-----------+------------+
| id | name      | manager_id |
+----+-----------+------------+
|  1 | CEO       |       NULL |
|  2 | Manager A |          1 |
|  3 | Manager B |          1 |
|  4 | Developer |          2 |
|  5 | Tester    |          2 |
|  6 | Designer  |          3 |
+----+-----------+------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM college.students;
+----+----------+------+-------+
| id | name     | age  | dept  |
+----+----------+------+-------+
|  1 | Abdullah |   21 | IT    |
|  2 | Iram     |   18 | IT    |
|  3 | Arsh     |   25 | IT    |
|  4 | Ali      |   21 | HR    |
|  5 | Sara     |   19 | HR    |
|  6 | Zoya     |   22 | HR    |
|  7 | pooja    |   34 | Sales |
|  8 | saif     |   45 | Sales |
|  9 | Jhon     |   33 | Sales |
| 10 | Ajaye    |   56 | Sales |
| 11 | Sadik    |   23 | Sales |
+----+----------+------+-------+
11 rows in set (0.00 sec)

mysql> SELECT * FROM college.Teachers;
+-------+
| name  |
+-------+
| Ali   |
| Sara  |
| David |
+-------+
3 rows in set (0.03 sec)

mysql>