
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| college            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.03 sec)

mysql> USE COLLEGE;
Database changed
mysql> SHOW TABLES;
+-------------------+
| Tables_in_college |
+-------------------+
| marks             |
| students          |
| users             |
+-------------------+
3 rows in set (0.03 sec)

mysql> SELECT * FROM STUDENTS ;
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
11 rows in set (0.04 sec)

mysql> SELECT name
    -> FROM Student
    -> WHERE age > 18;

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT name
    -> FROM Students
    -> WHERE age > 18 ;
+----------+
| name     |
+----------+
| Sara     |
| Abdullah |
| Ali      |
| Zoya     |
| Sadik    |
| Arsh     |
| Jhon     |
| pooja    |
| saif     |
| Ajaye    |
+----------+
10 rows in set (0.00 sec)

mysql> SELECT name
    -> FROM students
    -> WHERE age = 21;
+----------+
| name     |
+----------+
| Abdullah |
| Ali      |
+----------+
2 rows in set (0.00 sec)

mysql> SELECT id FROM students
    -> SELECT name FROM students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT name FROM students' at line 2
mysql> SELECT * FROM students
    -> WHERE id
    -> WHERE name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE name' at line 3
mysql> SELECT age
    -> FROM students
    -> WHERE age > 25;
+------+
| age  |
+------+
|   33 |
|   34 |
|   45 |
|   56 |
+------+
4 rows in set (0.00 sec)

mysql> SELECT students
    -> FROM students
    -> WHERE age >25;
ERROR 1054 (42S22): Unknown column 'students' in 'field list'
mysql> SELECT TABLES
    -> FROM students
    -> ORDER BY AECS;
ERROR 1054 (42S22): Unknown column 'TABLES' in 'field list'
mysql> SELECT *
    -> FROM students
    -> WHERE age >= 25;
+----+-------+------+
| id | name  | age  |
+----+-------+------+
|  3 | Arsh  |   25 |
|  9 | Jhon  |   33 |
|  7 | pooja |   34 |
|  8 | saif  |   45 |
| 10 | Ajaye |   56 |
+----+-------+------+
5 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM students
    -> ORDER BY age ASC;
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

mysql> SELECT *
    -> FROM students
    -> ORDER BY name DESC;
+----+----------+------+
| id | name     | age  |
+----+----------+------+
|  6 | Zoya     |   22 |
|  5 | Sara     |   19 |
|  8 | saif     |   45 |
| 11 | Sadik    |   23 |
|  7 | pooja    |   34 |
|  9 | Jhon     |   33 |
|  2 | Iram     |   18 |
|  3 | Arsh     |   25 |
|  4 | Ali      |   21 |
| 10 | Ajaye    |   56 |
|  1 | Abdullah |   21 |
+----+----------+------+
11 rows in set (0.03 sec)

mysql>