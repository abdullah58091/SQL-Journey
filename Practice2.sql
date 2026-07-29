
mysql> SHOW DATABASE
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASE' at line 1
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

mysql> USE college;
Database changed
mysql> SHOW TABLES ;
+-------------------+
| Tables_in_college |
+-------------------+
| employees         |
| marks             |
| student_view      |
| students          |
| subjects          |
| teachers          |
| users             |
+-------------------+
7 rows in set (0.01 sec)

mysql> SELECT *  FROM users;
+----+---------------+
| id | email         |
+----+---------------+
|  2 | ali@gmail.com |
+----+---------------+
1 row in set (0.00 sec)

mysql> INSERT INTO company.employees
    -> VALUES(11,'Joe',23,13000,'sell',111,2);
Query OK, 1 row affected (0.05 sec)

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
| 11 | Joe      |   23 |  13000 | sell       |     111 |          2 |
+----+----------+------+--------+------------+---------+------------+
11 rows in set (0.00 sec)

mysql> UPDATE company.employees
    -> SET  salary = 13599
    -> WHERE id = 11;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

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
11 rows in set (0.02 sec)

mysql> DELETE FROM company.employees
    -> WHERE id = 11;
Query OK, 1 row affected (0.01 sec)

mysql> DELETE FROM college.users;
Query OK, 1 row affected (0.04 sec)

mysql> SELECT salary AS  income
    -> FROM company.employees;
+--------+
| income |
+--------+
|  50000 |
|  45000 |
|  60000 |
|  70000 |
|  55000 |
|  80000 |
|  48000 |
|  75000 |
|  52000 |
|  34000 |
+--------+
10 rows in set (0.00 sec)

mysql> SELECT salary +299
    -> FROM company.employees;
+-------------+
| salary +299 |
+-------------+
|       50299 |
|       45299 |
|       60299 |
|       70299 |
|       55299 |
|       80299 |
|       48299 |
|       75299 |
|       52299 |
|       34299 |
+-------------+
10 rows in set (0.04 sec)

mysql> SELECT *
    -> FROM  company.employees
    -> WHERE  age =  56666;
Empty set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE age  = 50000;
ERROR 1054 (42S22): Unknown column 'age' in 'where clause'
mysql> SELECT *
    -> FROM company.employees
    -> WHERE age =  22;
+----+------+------+--------+------------+---------+------------+
| id | name | age  | salary | department | dept_id | manager_id |
+----+------+------+--------+------------+---------+------------+
|  5 | Aman |   22 |  55000 | IT         |     101 |          2 |
+----+------+------+--------+------------+---------+------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE department='IT'
    -> AND salary>55000;
ERROR 1054 (42S22): Unknown column 'department' in 'where clause'
mysql> SELECT *
    -> FROM  company.employees
    -> WHERE department = 'IT'
    -> AND salary >= 40000;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
+----+----------+------+--------+------------+---------+------------+
4 rows in set (0.00 sec)


mysql> SELECT UPPER(name)
    -> FROM company.employees;
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
| DAVID       |
| RAVI        |
+-------------+
10 rows in set (0.00 sec)

mysql> SELECT LOWER(name)
    -> FROM college.students;
+-------------+
| LOWER(name) |
+-------------+
| abdullah    |
| ajaye       |
| ali         |
| arsh        |
| iram        |
| jhon        |
| pooja       |
| sadik       |
| saif        |
| sara        |
| zoya        |
+-------------+
11 rows in set (0.03 sec)

mysql> SELECT LENGTH(name)
    -> FROM company.employees;
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
|            5 |
|            4 |
+--------------+
10 rows in set (0.03 sec)

mysql> SELECT SUBSTRING(name)
    -> FROM company.employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')
FROM company.employees' at line 1
mysql> SELECT  name ,
    -> SUBSTRING( name ,1,1)
    -> FROM company.employees;
+----------+-----------------------+
| name     | SUBSTRING( name ,1,1) |
+----------+-----------------------+
| Abdullah | A                     |
| Iram     | I                     |
| Sara     | S                     |
| Zoya     | Z                     |
| Aman     | A                     |
| John     | J                     |
| Ali      | A                     |
| Rohan    | R                     |
| David    | D                     |
| Ravi     | R                     |
+----------+-----------------------+
10 rows in set (0.00 sec)

mysql> SELECT TRIM('    Abdullah     ');
+---------------------------+
| TRIM('    Abdullah     ') |
+---------------------------+
| Abdullah                  |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT(name,'-',department)
    -> FROM company.employees;
+----------------------------------+
| CONCAT(name,'-',department)     | 
+----------------------------------+
| Abdullah-IT                     |
| Iram-HR                         |
| Sara-IT                         |
| Zoya-Finance                    |
| Aman-IT                         |
| John-Finance                    |
| Ali-HR                          |
| Rohan-IT                        |
| David-Unknown                   |
| Ravi-HR                         |
+----------------------------------+
10 rows in set (0.00 sec)

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
mysql> SHOW TABLES ;
+-------------------+
| Tables_in_company |
+-------------------+
| departments       |
| employees         |
| meeting           |
+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM employees ;
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
| DAVID       |
| RAVI        |
+-------------+
10 rows in set (0.00 sec)

mysql>