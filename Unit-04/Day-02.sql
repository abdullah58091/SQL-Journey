SELECT s.name,
       m.marks
FROM students s
INNER JOIN marks m
ON s.id = m.id;


SELECT s.name,
       m.marks
FROM students s
LEFT JOIN marks m
ON s.id=m.id;

SELECT s.name,
       m.marks
FROM students s
RIGHT JOIN marks m
ON s.id=m.id;



SELECT *
FROM students
LEFT JOIN marks
ON students.id=marks.id

UNION

SELECT *
FROM students
RIGHT JOIN marks
ON students.id=marks.id;



SELECT
A.name,
B.name
FROM employees A
JOIN employees B
ON A.manager_id=B.id;

SELECT *
FROM students
CROSS JOIN subjects;

SELECT name
FROM students

UNION

SELECT name
FROM teachers;

SELECT name
FROM students

UNION ALL

SELECT name
FROM teachers;


SELECT *
FROM students

WHERE age >

(
SELECT AVG(age)
FROM students
);

SELECT name

FROM students s

WHERE age>

(
SELECT AVG(age)

FROM students

WHERE dept=s.dept
);








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

mysql> USE COLLEGE ;
Database changed
mysql> SHOW TABLES ;
+-------------------+
| Tables_in_college |
+-------------------+
| marks             |
| students          |
| users             |
+-------------------+
3 rows in set (0.04 sec)

mysql> SELECT * FROM students ;
+----+----------+------+
| id | name     | age  |
+----+----------+------+
|  2 | Iram     |   18 |
|  5 | Sara     |   19 |
|  1 | Abdullah |   21 |
|  4 | Ali      |   21 |
|  6 | Zoya     |   22 |
| 11 | Sadik    |   23 |
|  3 | Arsh     |   25 |
|  9 | Jhon     |   33 |
|  7 | pooja    |   34 |
|  8 | saif     |   45 |
| 10 | Ajaye    |   56 |
+----+----------+------+
11 rows in set (0.09 sec)

mysql> SELECT id
    -> FROM students
    -> ORDER BY id ASC;
+----+
| id |
+----+
|  1 |
|  2 |
|  3 |
|  4 |
|  5 |
|  6 |
|  7 |
|  8 |
|  9 |
| 10 |
| 11 |
+----+
11 rows in set (0.03 sec)

mysql> SELECT *
    -> FROM students
    -> ORDER BY id ASC;
+----+----------+------+
| id | name     | age  |
+----+----------+------+
|  1 | Abdullah |   21 |
|  2 | Iram     |   18 |
|  3 | Arsh     |   25 |
|  4 | Ali      |   21 |
|  5 | Sara     |   19 |
|  6 | Zoya     |   22 |
|  7 | pooja    |   34 |
|  8 | saif     |   45 |
|  9 | Jhon     |   33 |
| 10 | Ajaye    |   56 |
| 11 | Sadik    |   23 |
+----+----------+------+
11 rows in set (0.00 sec)

mysql> COMMIT ;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM students;
+----+----------+------+
| id | name     | age  |
+----+----------+------+
|  2 | Iram     |   18 |
|  5 | Sara     |   19 |
|  1 | Abdullah |   21 |
|  4 | Ali      |   21 |
|  6 | Zoya     |   22 |
| 11 | Sadik    |   23 |
|  3 | Arsh     |   25 |
|  9 | Jhon     |   33 |
|  7 | pooja    |   34 |
|  8 | saif     |   45 |
| 10 | Ajaye    |   56 |
+----+----------+------+
11 rows in set (0.00 sec)

mysql> SELECT s.name,
    ->        m.marks
    -> FROM students s
    -> INNER JOIN marks m
    -> ON s.id = m.id;
+----------+-------+
| name     | marks |
+----------+-------+
| Abdullah |    80 |
| Iram     |    90 |
| Ali      |    70 |
| Abdullah |    90 |
| Arsh     |    80 |
| Sara     |    95 |
| Sadik    |    70 |
+----------+-------+
7 rows in set (0.03 sec)

mysql> SELECT s.name,
    ->        m.marks
    -> FROM students s
    -> LEFT JOIN marks m
    -> ON s.id=m.id;
+----------+-------+
| name     | marks |
+----------+-------+
| Abdullah |    90 |
| Abdullah |    80 |
| Ajaye    |  NULL |
| Ali      |    70 |
| Arsh     |    80 |
| Iram     |    90 |
| Jhon     |  NULL |
| pooja    |  NULL |
| Sadik    |    70 |
| saif     |  NULL |
| Sara     |    95 |
| Zoya     |  NULL |
+----------+-------+
12 rows in set (0.03 sec)

mysql> SELECT s.name,
    ->        m.marks
    -> FROM students s
    -> RIGHT JOIN marks m
    -> ON s.id=m.id;
+----------+-------+
| name     | marks |
+----------+-------+
| Abdullah |    80 |
| Iram     |    90 |
| Ali      |    70 |
| Abdullah |    90 |
| Arsh     |    80 |
| Sara     |    95 |
| Sadik    |    70 |
+----------+-------+
7 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM students
    -> LEFT JOIN marks
    -> ON students.id=marks.id
    ->
    -> UNION
    ->
    -> SELECT *
    -> FROM students
    -> RIGHT JOIN marks
    -> ON students.id=marks.id;
+------+----------+------+------+-------+
| id   | name     | age  | id   | marks |
+------+----------+------+------+-------+
|    2 | Iram     |   18 |    2 |    90 |
|    5 | Sara     |   19 |    5 |    95 |
|    1 | Abdullah |   21 |    1 |    90 |
|    1 | Abdullah |   21 |    1 |    80 |
|    4 | Ali      |   21 |    4 |    70 |
|    6 | Zoya     |   22 | NULL |  NULL |
|   11 | Sadik    |   23 |   11 |    70 |
|    3 | Arsh     |   25 |    3 |    80 |
|    9 | Jhon     |   33 | NULL |  NULL |
|    7 | pooja    |   34 | NULL |  NULL |
|    8 | saif     |   45 | NULL |  NULL |
|   10 | Ajaye    |   56 | NULL |  NULL |
+------+----------+------+------+-------+
12 rows in set (0.03 sec)

mysql> SELECT
    -> A.name,
    -> B.name
    -> FROM employees A
    -> JOIN employees B
    -> ON A.manager_id=B.id;
ERROR 1146 (42S02): Table 'college.employees' doesn't exist
mysql> SELECT *
    -> FROM students
    -> CROSS JOIN subjects;
ERROR 1146 (42S02): Table 'college.subjects' doesn't exist
mysql> SELECT name
    -> FROM students
    ->
    -> UNION
    ->
    -> SELECT name
    -> FROM teachers;
ERROR 1146 (42S02): Table 'college.teachers' doesn't exist
mysql>


ERROR 1146 (42S02): Table 'college.teachers' doesn't exist
mysql> CREATE TABLE employees(
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     manager_id INT
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO employees VALUES
    -> (1,'CEO',NULL),
    -> (2,'Manager A',1),
    -> (3,'Manager B',1),
    -> (4,'Developer',2),
    -> (5,'Tester',2),
    -> (6,'Designer',3);
Query OK, 6 rows affected (0.04 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT
    -> A.name AS Employee,
    -> B.name AS Manager
    -> FROM employees A
    -> JOIN employees B
    -> ON A.manager_id=B.id;
+-----------+-----------+
| Employee  | Manager   |
+-----------+-----------+
| Manager A | CEO       |
| Manager B | CEO       |
| Developer | Manager A |
| Tester    | Manager A |
| Designer  | Manager B |
+-----------+-----------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE subjects(
    -> subject VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO subjects VALUES
    -> ('Math'),
    -> ('Science'),
    -> ('English');
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT *
    -> FROM students
    -> CROSS JOIN subjects;
+----+----------+------+---------+
| id | name     | age  | subject |
+----+----------+------+---------+
|  2 | Iram     |   18 | English |
|  2 | Iram     |   18 | Science |
|  2 | Iram     |   18 | Math    |
|  5 | Sara     |   19 | English |
|  5 | Sara     |   19 | Science |
|  5 | Sara     |   19 | Math    |
|  1 | Abdullah |   21 | English |
|  1 | Abdullah |   21 | Science |
|  1 | Abdullah |   21 | Math    |
|  4 | Ali      |   21 | English |
|  4 | Ali      |   21 | Science |
|  4 | Ali      |   21 | Math    |
|  6 | Zoya     |   22 | English |
|  6 | Zoya     |   22 | Science |
|  6 | Zoya     |   22 | Math    |
| 11 | Sadik    |   23 | English |
| 11 | Sadik    |   23 | Science |
| 11 | Sadik    |   23 | Math    |
|  3 | Arsh     |   25 | English |
|  3 | Arsh     |   25 | Science |
|  3 | Arsh     |   25 | Math    |
|  9 | Jhon     |   33 | English |
|  9 | Jhon     |   33 | Science |
|  9 | Jhon     |   33 | Math    |
|  7 | pooja    |   34 | English |
|  7 | pooja    |   34 | Science |
|  7 | pooja    |   34 | Math    |
|  8 | saif     |   45 | English |
|  8 | saif     |   45 | Science |
|  8 | saif     |   45 | Math    |
| 10 | Ajaye    |   56 | English |
| 10 | Ajaye    |   56 | Science |
| 10 | Ajaye    |   56 | Math    |
+----+----------+------+---------+
33 rows in set (0.00 sec)

mysql> CREATE TABLE teachers(
    -> name VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO teachers VALUES
    -> ('Ali'),
    -> ('Sara'),
    -> ('David');
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT name
    -> FROM students
    ->
    -> UNION
    ->
    -> SELECT name
    -> FROM teachers;
+----------+
| name     |
+----------+
| Abdullah |
| Ajaye    |
| Ali      |
| Arsh     |
| Iram     |
| Jhon     |
| pooja    |
| Sadik    |
| saif     |
| Sara     |
| Zoya     |
| David    |
+----------+
12 rows in set (0.00 sec)

mysql> SELECT name
    -> FROM students
    ->
    -> UNION ALL
    ->
    -> SELECT name
    -> FROM teachers;
+----------+
| name     |
+----------+
| Abdullah |
| Ajaye    |
| Ali      |
| Arsh     |
| Iram     |
| Jhon     |
| pooja    |
| Sadik    |
| saif     |
| Sara     |
| Zoya     |
| Ali      |
| Sara     |
| David    |
+----------+
14 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM students
    ->
    -> WHERE age >
    ->
    -> (
    -> SELECT AVG(age)
    -> FROM students
    -> );
+----+-------+------+
| id | name  | age  |
+----+-------+------+
|  9 | Jhon  |   33 |
|  7 | pooja |   34 |
|  8 | saif  |   45 |
| 10 | Ajaye |   56 |
+----+-------+------+
4 rows in set (0.00 sec)

mysql> SELECT name
    ->
    -> FROM students s
    ->
    -> WHERE age>
    ->
    -> (
    -> SELECT AVG(age)
    ->
    -> FROM students
    ->
    -> WHERE dept=s.dept
    -> );
ERROR 1054 (42S22): Unknown column 'dept' in 'where clause'
mysql>




mysql> SELECT name, age, dept
    -> FROM students s
    -> WHERE age >
    -> (
    ->     SELECT AVG(age)
    ->     FROM students
    ->     WHERE dept = s.dept
    -> );
+-------+------+-------+
| name  | age  | dept  |
+-------+------+-------+
| Arsh  |   25 | IT    |
| Ali   |   21 | HR    |
| Zoya  |   22 | HR    |
| saif  |   45 | Sales |
| Ajaye |   56 | Sales |
+-------+------+-------+
5 rows in set (0.00 sec)

mysql> select * from students;
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