
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
11 rows in set (0.10 sec)

mysql> SELECT * FROM  company.employees;
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
6 rows in set (0.06 sec)


mysql> WITH AvgAge AS
    ->
    -> (
    -> SELECT AVG(age) AS avg_age
    ->
    -> FROM  college.students
    -> )
    ->
    -> SELECT *
    ->
    -> FROM college.students
    ->
    -> WHERE age>
    ->
    -> (
    -> SELECT avg_age
    ->
    -> FROM AvgAge
    -> );
+----+-------+------+-------+
| id | name  | age  | dept  |
+----+-------+------+-------+
|  9 | Jhon  |   33 | Sales |
|  7 | pooja |   34 | Sales |
|  8 | saif  |   45 | Sales |
| 10 | Ajaye |   56 | Sales |
+----+-------+------+-------+
4 rows in set (0.05 sec)

mysql> use college;
Database changed
mysql> SELECT
    ->
    -> name,
    ->
    -> ROW_NUMBER()
    ->
    -> OVER(ORDER BY age)
    ->
    -> FROM students;
+----------+----------------------------------+
| name     | ROW_NUMBER()

OVER(ORDER BY age) |
+----------+----------------------------------+
| Iram     |                                1 |
| Sara     |                                2 |
| Abdullah |                                3 |
| Ali      |                                4 |
| Zoya     |                                5 |
| Sadik    |                                6 |
| Arsh     |                                7 |
| Jhon     |                                8 |
| pooja    |                                9 |
| saif     |                               10 |
| Ajaye    |                               11 |
+----------+----------------------------------+
11 rows in set (0.03 sec)


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
6 rows in set (0.04 sec)

mysql> USE COLLEGE ;
Database changed
mysql> SHOW COLLEGE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'COLLEGE' at line 1
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
7 rows in set (0.01 sec)

mysql>
mysql> SELECT
    ->
    -> name,
    ->
    -> RANK()
    ->
    -> OVER(ORDER BY marks DESC)
    ->
    -> FROM marks;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
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
7 rows in set (0.07 sec)

mysql> SELECT  id,
    -> RANK() OVER(ORDER BY marks DESC)
    -> FROM marks;
+------+----------------------------------+
| id   | RANK() OVER(ORDER BY marks DESC) |
+------+----------------------------------+
|    5 |                                1 |
|    2 |                                2 |
|    1 |                                2 |
|    1 |                                4 |
|    3 |                                4 |
|    4 |                                6 |
|   11 |                                6 |
+------+----------------------------------+
7 rows in set (0.00 sec)

mysql> SELECT
    ->
    -> name,
    ->
    -> DENSE_RANK()
    ->
    -> OVER(ORDER BY marks DESC)
    ->
    -> FROM marks;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
mysql> SELECT
    ->
    -> id,
    ->
    -> DENSE_RANK()
    ->
    -> OVER(ORDER BY marks DESC)
    ->
    -> FROM marks;
+------+-----------------------------------------+
| id   | DENSE_RANK()

OVER(ORDER BY marks DESC) |
+------+-----------------------------------------+
|    5 |                                       1 |
|    2 |                                       2 |
|    1 |                                       2 |
|    1 |                                       3 |
|    3 |                                       3 |
|    4 |                                       4 |
|   11 |                                       4 |
+------+-----------------------------------------+
7 rows in set (0.00 sec)

mysql> SELECT *  FROM students;
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

mysql> SELECT
    ->
    -> name,
    ->
    -> age,
    ->
    -> LEAD(age)
    ->
    -> OVER(ORDER BY age)
    ->
    -> FROM students;
+----------+------+-------------------------------+
| name     | age  | LEAD(age)

OVER(ORDER BY age) |
+----------+------+-------------------------------+
| Iram     |   18 |                            19 |
| Sara     |   19 |                            21 |
| Abdullah |   21 |                            21 |
| Ali      |   21 |                            22 |
| Zoya     |   22 |                            23 |
| Sadik    |   23 |                            25 |
| Arsh     |   25 |                            33 |
| Jhon     |   33 |                            34 |
| pooja    |   34 |                            45 |
| saif     |   45 |                            56 |
| Ajaye    |   56 |                          NULL |
+----------+------+-------------------------------+
11 rows in set (0.00 sec)

mysql> SELECT
    ->
    -> name,
    ->
    -> age,
    ->
    -> LAG(age)
    ->
    -> OVER(ORDER BY age)
    ->
    -> FROM students;
+----------+------+------------------------------+
| name     | age  | LAG(age)

OVER(ORDER BY age) |
+----------+------+------------------------------+
| Iram     |   18 |                         NULL |
| Sara     |   19 |                           18 |
| Abdullah |   21 |                           19 |
| Ali      |   21 |                           21 |
| Zoya     |   22 |                           21 |
| Sadik    |   23 |                           22 |
| Arsh     |   25 |                           23 |
| Jhon     |   33 |                           25 |
| pooja    |   34 |                           33 |
| saif     |   45 |                           34 |
| Ajaye    |   56 |                           45 |
+----------+------+------------------------------+
11 rows in set (0.00 sec)

mysql> SHOW FULL TABLES;
+-------------------+------------+
| Tables_in_college | Table_type |
+-------------------+------------+
| employees         | BASE TABLE |
| marks             | BASE TABLE |
| student_view      | VIEW       |
| students          | BASE TABLE |
| subjects          | BASE TABLE |
| teachers          | BASE TABLE |
| users             | BASE TABLE |
+-------------------+------------+
7 rows in set (0.00 sec)

mysql> SHOW CREATE VIEW student_view;
+--------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View         | Create View                                                                                                                                                                    | character_set_client | collation_connection |
+--------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| student_view | CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_view` AS select `students`.`name` AS `name`,`students`.`age` AS `age` from `students` | cp850                | cp850_general_ci     |
+--------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> CREATE OR REPLACE VIEW student_view AS
    -> SELECT name, age
    -> FROM students;
Query OK, 0 rows affected (0.04 sec)

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
11 rows in set (0.00 sec)

mysql> SHOW INDEX FROM students;
+----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| students |          0 | PRIMARY      |            1 | id          | A         |          11 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| students |          1 | idx_name     |            1 | name        | A         |          11 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| students |          1 | idx_age_name |            1 | age         | A         |          10 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| students |          1 | idx_age_name |            2 | name        | A         |          11 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| students |          1 | idx_age      |            1 | age         | A         |          10 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
5 rows in set (0.06 sec)


mysql> SELECT *
    ->
    -> FROM students
    ->
    -> WHERE age=21;
+----+----------+------+------+
| id | name     | age  | dept |
+----+----------+------+------+
|  1 | Abdullah |   21 | IT   |
|  4 | Ali      |   21 | HR   |
+----+----------+------+------+
2 rows in set (0.00 sec)

mysql>
mysql> CALL GetStudents();
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
11 rows in set (0.07 sec)

Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TRIGGER
    ->

    
mysql> SELECT *
    ->
    -> FROM students
    ->
    -> WHERE age=21;
+----+----------+------+------+
| id | name     | age  | dept |
+----+----------+------+------+
|  1 | Abdullah |   21 | IT   |
|  4 | Ali      |   21 | HR   |
+----+----------+------+------+
2 rows in set (0.00 sec)

mysql>
mysql> CALL GetStudents();
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
11 rows in set (0.07 sec)

Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TRIGGER
    ->
    -> CREATE TRIGGER trigger_name
    -> BEFORE INSERT ON students
    -> FOR EACH ROW
    -> BEGIN
    ->     -- action
    -> END;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREATE TRIGGER trigger_name
BEFORE INSERT ON students
FOR EACH ROW
BEGIN

EN' at line 3
mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-08-11 15:45:38 |
+---------------------+
1 row in set (0.00 sec)

mysql>  SELECT
    -> name,
    ->
    ->  ROW_NUMBER()
    ->
    ->      OVER(ORDER BY age)
    ->
    ->  FROM students;
+----------+-------------------------------------------+
| name     | ROW_NUMBER()

     OVER(ORDER BY age) |
+----------+-------------------------------------------+
| Iram     |                                         1 |
| Sara     |                                         2 |
| Abdullah |                                         3 |
| Ali      |                                         4 |
| Zoya     |                                         5 |
| Sadik    |                                         6 |
| Arsh     |                                         7 |
| Jhon     |                                         8 |
| pooja    |                                         9 |
| saif     |                                        10 |
| Ajaye    |                                        11 |
+----------+-------------------------------------------+
11 rows in set (0.00 sec)

mysql>


mysql> SHOW DATABASES ;
+--------------------+
| Database           |
+--------------------+
| college            |
| company            |
| information_schema |
| log_sentinel       |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.13 sec)

mysql> USE log_sentinel;
Database changed
mysql> SHOW TABLES;
+------------------------+
| Tables_in_log_sentinel |
+------------------------+
| logs                   |
+------------------------+
1 row in set (0.02 sec)

mysql> SELECT * FROM logs;
+----+-------+----------------------------+-----------------+----------------------------+
| id | level | message                    | source          | timestamp                  |
+----+-------+----------------------------+-----------------+----------------------------+
|  5 | ERROR | Database connection failed | Payment-Service | 2026-08-30 15:29:19.150194 |
+----+-------+----------------------------+-----------------+----------------------------+
1 row in set (0.01 sec)

mysql>