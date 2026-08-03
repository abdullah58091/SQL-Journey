
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
