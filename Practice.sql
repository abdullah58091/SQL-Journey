
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
6 rows in set (0.02 sec)

mysql> USE company;
Database changed
mysql> SHOW TABLES;
+-------------------+
| Tables_in_company |
+-------------------+
| departments       |
| employees         |
| meeting           |
+-------------------+
3 rows in set (0.03 sec)

mysql> SELECT * FROM deparments;
ERROR 1146 (42S02): Table 'company.deparments' doesnot exist
mysql> SELECT * FROM departments;
+---------+-----------------+
| dept_id | department_name |
+---------+-----------------+
|     101 | IT              |
|     102 | HR              |
|     103 | Finance         |
|     104 | Marketing       |
+---------+-----------------+
4 rows in set (0.02 sec)

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
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.02 sec)

mysql> SELECT * FROM meeting ;
+------------+--------------+--------------+--------------+----------+
| meeting_id | meeting_name | meeting_date | meeting_time | location |
+------------+--------------+--------------+--------------+----------+
|        101 | Abdullah     | 2028-06-12   | 12:00:00     | Delhi    |
+------------+--------------+--------------+--------------+----------+
1 row in set (0.00 sec)

mysql> USE mysql;
Database changed
mysql> SHOW TABLES;
+------------------------------------------------------+
| Tables_in_mysql                                      |
+------------------------------------------------------+
| columns_priv                                         |
| component                                            |
| db                                                   |
| default_roles                                        |
| engine_cost                                          |
| func                                                 |
| general_log                                          |
| global_grants                                        |
| gtid_executed                                        |
| help_category                                        |
| help_keyword                                         |
| help_relation                                        |
| help_topic                                           |
| innodb_index_stats                                   |
| innodb_table_stats                                   |
| ndb_binlog_index                                     |
| password_history                                     |
| plugin                                               |
| procs_priv                                           |
| proxies_priv                                         |
| replication_asynchronous_connection_failover         |
| replication_asynchronous_connection_failover_managed |
| replication_group_configuration_version              |
| replication_group_member_actions                     |
| role_edges                                           |
| server_cost                                          |
| servers                                              |
| slave_master_info                                    |
| slave_relay_log_info                                 |
| slave_worker_info                                    |
| slow_log                                             |
| tables_priv                                          |
| time_zone                                            |
| time_zone_leap_second                                |
| time_zone_name                                       |
| time_zone_transition                                 |
| time_zone_transition_type                            |
| user                                                 |
+------------------------------------------------------+
38 rows in set (0.01 sec)

mysql> USE COLLEGE;
Database changed
mysql>  SHOW TABELS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TABELS' at line 1
mysql> SHOW TABLES;
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
7 rows in set (0.00 sec)

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
7 rows in set (0.00 sec)

mysql> SELECT * FROM  employees;
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
6 rows in set (0.03 sec)

mysql> SELECT * FROM marks;
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
7 rows in set (0.02 sec)

mysql> SELECT * FROM student_view;
+----------+------+
| name     | age  |
+----------+------+
| Iram     |   18 |
| Sara     |   19 |
| Abdullah |   21 |
| Ali      |   21 |
| Zoya     |   22 |
| Sadik    |   23 |
| Arsh     |   25 |
| Jhon     |   33 |
| pooja    |   34 |
| saif     |   45 |
| Ajaye    |   56 |
+----------+------+
11 rows in set (0.02 sec)

mysql> SELECT * FROM STUDENTS ;
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

mysql> SELECT * FROM subjects;
+---------+
| subject |
+---------+
| Math    |
| Science |
| English |
+---------+
3 rows in set (0.02 sec)

mysql> SELECT * FROM teachers;
+-------+
| name  |
+-------+
| Ali   |
| Sara  |
| David |
+-------+
3 rows in set (0.02 sec)

mysql> SELECT * FROM users;
+----+---------------+
| id | email         |
+----+---------------+
|  2 | ali@gmail.com |
+----+---------------+
1 row in set (0.02 sec)

mysql> SELECT name , salary
    -> FROM employees;
ERROR 1054 (42S22): Unknown column 'salary' in 'field list'

mysql> USE company;
Database changed
mysql> SELECT name, salary
    -> FROM employees;
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
| David    |  52000 |
| Ravi     |  34000 |
+----------+--------+
10 rows in set (0.00 sec)

mysql> SELECT name
    -> FROM college.teachers;
+-------+
| name  |
+-------+
| Ali   |
| Sara  |
| David |
+-------+
3 rows in set (0.00 sec)


mysql> SELECT name
    -> FROM college.teachers;
+-------+
| name  |
+-------+
| Ali   |
| Sara  |
| David |
+-------+
3 rows in set (0.00 sec)

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

mysql>
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

mysql>
mysql> SELECT * FROM college.teachers;
+-------+
| name  |
+-------+
| Ali   |
| Sara  |
| David |
+-------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM company.employees
    -> WHERE salary >= 50000;
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
7 rows in set (0.00 sec)

mysql> SELECT *
    -> FORM company.employees
    -> WHERE salary <= 50000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FORM company.employees
WHERE salary <= 50000' at line 2
mysql> SELECT *
    -> FROM company.employees
    -> WHERE salary <= 50000;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
4 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM company.employees
    -> WHERE department  = 'IT';
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
+----+----------+------+--------+------------+---------+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM college.students
    -> WHERE dept = 'IT';
+----+----------+------+------+
| id | name     | age  | dept |
+----+----------+------+------+
|  1 | Abdullah |   21 | IT   |
|  2 | Iram     |   18 | IT   |
|  3 | Arsh     |   25 | IT   |
+----+----------+------+------+
3 rows in set (0.01 sec)



mysql> SELECT *
    -> FROM employees
    -> ORDER BY salary;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  9 | David    |   26 |  52000 | Unknown    |     999 |          3 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> ORDER BY salary DESC;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  9 | David    |   26 |  52000 | Unknown    |     999 |          3 |
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM company.employees
    -> ORDER BY  age ASC;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
|  3 | Sara     |   20 |  60000 | IT         |     101 |          1 |
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  5 | Aman     |   22 |  55000 | IT         |     101 |          2 |
|  7 | Ali      |   24 |  48000 | HR         |     102 |          3 |
|  4 | Zoya     |   25 |  70000 | Finance    |     103 |          1 |
|  9 | David    |   26 |  52000 | Unknown    |     999 |          3 |
|  8 | Rohan    |   27 |  75000 | IT         |     101 |          3 |
|  6 | John     |   28 |  80000 | Finance    |     103 |          2 |
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.01 sec)


mysql> SELECT *
    -> FROM college.employees
    -> LIMIT 3;
+----+-----------+------------+
| id | name      | manager_id |
+----+-----------+------------+
|  1 | CEO       |       NULL |
|  2 | Manager A |          1 |
|  3 | Manager B |          1 |
+----+-----------+------------+
3 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM company.empolyees
    -> LIMIT 2;
ERROR 1146 (42S02): Table 'company.empolyees' doesnOt exist
mysql> USE COMPANY;
Database changed
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
| 10 | Ravi     |   45 |  34000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
10 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM company.employees
    -> LIMIT 2;
+----+----------+------+--------+------------+---------+------------+
| id | name     | age  | salary | department | dept_id | manager_id |
+----+----------+------+--------+------------+---------+------------+
|  1 | Abdullah |   21 |  50000 | IT         |     101 |       NULL |
|  2 | Iram     |   20 |  45000 | HR         |     102 |          1 |
+----+----------+------+--------+------------+---------+------------+
2 rows in set (0.00 sec)

mysql>