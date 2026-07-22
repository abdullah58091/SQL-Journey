## 1. CTE (Common Table Expression)
Professional Definition

A Common Table Expression (CTE) is a temporary named result set that simplifies complex SQL queries and improves readability.

## 2. ROW_NUMBER()

Definition

Assigns a unique sequential number to each row.


## 3. RANK()

Definition

Same values get same rank.

Gap comes after duplicate ranks.

Example

Marks

95

95

90

Ranks

1

1

3

## 4. DENSE_RANK()

Definition

No gap after duplicate ranks.

Ranks

1

1

2

Practice

SELECT

name,

DENSE_RANK()

OVER(ORDER BY marks DESC)

FROM marks;
## 5. LEAD()

Definition

Returns the next row's value.

Practice

SELECT

name,

age,

LEAD(age)

OVER(ORDER BY age)

FROM students;
## 6. LAG()

Definition

Returns the previous row's value.

Practice

SELECT

name,

age,

LAG(age)

OVER(ORDER BY age)

FROM students;
## 7. Views

Definition

A View is a virtual table created from the result of an SQL query. It stores the query, not the actual data.

Practice

CREATE VIEW student_view AS

SELECT

name,

age

FROM students;
## 8. Indexing Basics

Definition

An Index is a data structure that improves the speed of data retrieval operations by allowing the database to locate rows efficiently without scanning the entire table.

Practice

CREATE INDEX idx_age

ON students(age);
## 9. Query Optimization Basics

Definition

Query optimization is the process of improving SQL query performance by selecting the most efficient execution plan.

Practice

EXPLAIN

SELECT *

FROM students

WHERE age=21;
## 10. Stored Procedure

Definition

A Stored Procedure is a precompiled collection of SQL statements stored in the database that can be executed repeatedly with a single call.


## 11. Trigger

Definition

A Trigger is a database object that automatically executes when a specific event (INSERT, UPDATE, or DELETE) occurs on a table.

