
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
6 rows in set (0.03 sec)

mysql> USE COMPANY;
Database changed
mysql> SHOW TABLES ;
+-------------------+
| Tables_in_company |
+-------------------+
| departments       |
| employees         |
+-------------------+
2 rows in set (0.01 sec)

mysql> SELECT * FROM employees;
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
9 rows in set (0.01 sec)

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

mysql> EXPLAIN
    -> SELECT * FROM departments;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | departments | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql>
mysql> help content ;

Nothing found
Please try to run 'help contents' for a list of all accessible topics

mysql> CREATE DATABASE company;
ERROR 1007 (HY000): Can not  create database 'company'; database exists
mysql> SHOW DATABASES ;
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
6 rows in set (0.02 sec)

mysql> USE COMPANY ;
Database changed
mysql> CREATE TABLE meeting (
    ->     meeting_id INT PRIMARY KEY,
    ->     meeting_name VARCHAR(100),
    ->     meeting_date DATE,
    ->     meeting_time TIME,
    ->     location VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> SELECT * FROM meeting ;
Empty set (0.05 sec)

mysql> INSERT INTO meeting
    -> VALUES(101,'Abdullah',12.6.2028,12:00);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.2028,12:00)' at line 2
mysql> INSERT INTO meeting
    -> VALUES (101, 'Abdullah', '2028-06-12', '12:00:00', 'Delhi');
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * FROM meeting ;
+------------+--------------+--------------+--------------+----------+
| meeting_id | meeting_name | meeting_date | meeting_time | location |
+------------+--------------+--------------+--------------+----------+
|        101 | Abdullah     | 2028-06-12   | 12:00:00     | Delhi    |
+------------+--------------+--------------+--------------+----------+
1 row in set (0.00 sec)

mysql>