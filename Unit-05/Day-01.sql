WITH AvgAge AS

(
SELECT AVG(age) AS avg_age

FROM students
)

SELECT *

FROM students

WHERE age>

(
SELECT avg_age

FROM AvgAge
);



SELECT

name,

ROW_NUMBER()

OVER(ORDER BY age)

FROM students;


SELECT

name,

RANK()

OVER(ORDER BY marks DESC)

FROM marks;





SELECT

name,

DENSE_RANK()

OVER(ORDER BY marks DESC)

FROM marks;





SELECT

name,

age,

LEAD(age)

OVER(ORDER BY age)

FROM students;




Practice

SELECT

name,

age,

LAG(age)

OVER(ORDER BY age)

FROM students;





CREATE VIEW student_view AS

SELECT

name,

age

FROM students;






CREATE INDEX idx_age

ON students(age);






SELECT *

FROM students

WHERE age=21;





CALL GetStudents();




CREATE TRIGGER








mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-07-22 16:29:04 |
+---------------------+
1 row in set (0.00 sec)

mysql> WITH AvgAge AS
    ->
    -> (
    -> SELECT AVG(age) AS avg_age
    ->
    -> FROM students
    -> )
    ->
    -> SELECT *
    ->
    -> FROM students
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
4 rows in set (0.04 sec)

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
11 rows in set (0.00 sec)

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

mysql> CREATE VIEW student_view AS
    ->
    -> SELECT
    ->
    -> name,
    ->
    -> age
    ->
    -> FROM students;
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE INDEX idx_age
    ->
    -> ON students(age);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> EXPLAIN
    ->
    -> SELECT *
    ->
    -> FROM students
    ->
    -> WHERE age=21;
+----+-------------+----------+------------+------+----------------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type | possible_keys        | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+------+----------------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | students | NULL       | ref  | idx_age_name,idx_age | idx_age_name | 5       | const |    2 |   100.00 | NULL  |
+----+-------------+----------+------------+------+----------------------+--------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.04 sec)

mysql> CALL GetStudents();
ERROR 1305 (42000): PROCEDURE college.GetStudents does not exist
mysql>
mysql> CREATE TRIGGER
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql>

r '' at line 1
mysql> DESCRIBE marks;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| id    | int  | YES  |     | NULL    |       |
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
2 rows in set (0.05 sec)

mysql> SELECT
    -> s.name,
    -> m.marks,
    -> RANK() OVER(ORDER BY m.marks DESC) AS Rank_No
    -> FROM students s
    -> JOIN marks m
    -> ON s.id = m.id;
+----------+-------+---------+
| name     | marks | Rank_No |
+----------+-------+---------+
| Sara     |    95 |       1 |
| Iram     |    90 |       2 |
| Abdullah |    90 |       2 |
| Abdullah |    80 |       4 |
| Arsh     |    80 |       4 |
| Ali      |    70 |       6 |
| Sadik    |    70 |       6 |
+----------+-------+---------+
7 rows in set (0.00 sec)

mysql> SELECT
    -> s.name,
    -> m.marks,
    -> DENSE_RANK() OVER(ORDER BY m.marks DESC) AS Dense_Rank
    -> FROM students s
    -> JOIN marks m
    -> ON s.id = m.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Dense_Rank
FROM students s
JOIN marks m
ON s.id = m.id' at line 4
mysql> DELIMITER $$
mysql>
mysql> CREATE PROCEDURE GetStudents()
    -> BEGIN
    ->     SELECT *
    ->     FROM students;
    -> END $$
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> DELIMITER ;
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
11 rows in set (0.00 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER before_insert_student
    -> BEFORE INSERT
    -> ON students
    -> FOR EACH ROW
    -> BEGIN
    ->     SET NEW.name = UPPER(NEW.name);
    -> END $$
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> DELIMITER ;
mysql>