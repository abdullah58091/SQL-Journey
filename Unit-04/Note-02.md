## 1. INNER JOIN

An INNER JOIN returns only the rows that have matching values in both tables based on the specified join condition.

Example

Students

id	name
1	Ali
2	Sara

Marks

id	marks
1	90

Output

name	marks
Ali	90

## 2. LEFT JOIN
Professional Definition

A LEFT JOIN returns all rows from the left table and the matching rows from the right table. If no match exists, NULL values are returned.

## 3. RIGHT JOIN

Definition

Returns all rows from the right table.


## 4. FULL JOIN


Returns all rows from both tables.

(MySQL doesn't support FULL JOIN directly.)

## 5. SELF JOIN
Definition

A table is joined with itself.

Used in

Employee Manager
Friends
Family Tree



## 6. CROSS JOIN

Definition

Every row combines with every row.

If

Students = 5

Subjects = 4

Output

20 rows

## 7. UNION

Definition

Combines results of two queries and removes duplicates.

## 8. UNION ALL

Definition

Combines results including duplicate values.

## 9. Subquery

Definition

A query inside another query

## 10. Correlated Subquery

Definition

A subquery that depends on each row of the outer query.