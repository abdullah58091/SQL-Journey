##	Topic
	COUNT()
	SUM()
	AVG()
	MIN() & MAX()
	GROUP BY
	HAVING
  ##  🔹 String Functions
UPPER()
LOWER()
LENGTH()
CONCAT()
SUBSTRING()
TRIM()
## 🔹 Numeric Functions
ROUND()
CEIL()
FLOOR()
MOD()
## 🔹 Date Functions
CURDATE()
NOW()
DATEDIFF()
YEAR()
MONTH()
## 🔹 NULL Functions
IFNULL()
COALESCE()

| id | name     | age | salary | department |
| -- | -------- | --- | ------ | ---------- |
| 1  | Abdullah | 21  | 50000  | IT         |
| 2  | Iram     | 20  | 45000  | HR         |
| 3  | Sara     | 20  | 60000  | IT         |
| 4  | Zoya     | 25  | 70000  | Finance    |
| 5  | Aman     | 22  | 55000  | IT         |
| 6  | John     | 28  | 80000  | Finance    |
| 7  | Ali      | 24  | 48000  | HR         |
| 8  | Rohan    | 27  | 75000  | IT         |


## 1. COUNT()
Professional Definition

COUNT() table me kitni rows hain ya kisi column me kitni non-NULL values hain, ye count karta hai.

Syntax
SELECT COUNT(*)
FROM employees;

Output

8
Count Employees
SELECT COUNT(*)
FROM employees;
Count IT Employees
SELECT COUNT(*)
FROM employees
WHERE department='IT';

Expected Output

4
## 2. SUM()

Total salary.

SELECT SUM(salary)
FROM employees;

Expected

483000

Sirf IT Department

SELECT SUM(salary)
FROM employees
WHERE department='IT';

Expected

240000
## 3. AVG()

Average salary.

SELECT AVG(salary)
FROM employees;

HR Average Salary

SELECT AVG(salary)
FROM employees
WHERE department='HR';
## 4. MIN()

Lowest salary.

SELECT MIN(salary)
FROM employees;

Expected

45000
## 5. MAX()

Highest salary.

SELECT MAX(salary)
FROM employees;

Expected

80000
Aggregate Functions Together

Industry me bahut common hai.

SELECT
COUNT(*) AS TotalEmployees,
SUM(salary) AS TotalSalary,
AVG(salary) AS AverageSalary,
MIN(salary) AS LowestSalary,
MAX(salary) AS HighestSalary
FROM employees;
## 6. GROUP BY
Professional Definition

GROUP BY same values ko ek group me convert karta hai aur har group par aggregate function apply karta hai.

Department-wise Employee Count

SELECT department,
COUNT(*) AS TotalEmployees
FROM employees
GROUP BY department;

Expected

Department	Employees
Finance	2
HR	2
IT	4

Department-wise Salary

SELECT department,
SUM(salary) AS TotalSalary
FROM employees
GROUP BY department;

Department-wise Average Salary

SELECT department,
AVG(salary) AS AverageSalary
FROM employees
GROUP BY department;
## 7. HAVING
Difference
WHERE

↓

Rows Filter

↓

GROUP BY

↓

HAVING

↓

Groups Filter

Departments jinke employees 2 ya usse zyada hain

SELECT department,
COUNT(*) AS Employees
FROM employees
GROUP BY department
HAVING COUNT(*)>=2;

Departments jinka total salary 150000 se zyada hai

SELECT department,
SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary)>150000;

Expected

IT
Finance
## WHERE vs HAVING
Answer:

WHERE individual rows ko filter karta hai aur GROUP BY se pehle execute hota hai.
HAVING grouped data ko filter karta hai aur aggregate functions (COUNT, SUM, AVG etc.) ke saath use hota hai.
🎯 Aaj ka Practical Task

Ye queries bina dekhe likho:

-- 1
SELECT COUNT(*) FROM employees;

-- 2
SELECT COUNT(*) FROM employees WHERE department='IT';

-- 3
SELECT SUM(salary) FROM employees;

-- 4
SELECT AVG(salary) FROM employees;

-- 5
SELECT MIN(salary) FROM employees;

-- 6
SELECT MAX(salary) FROM employees;

-- 7
SELECT department,COUNT(*)
FROM employees
GROUP BY department;

-- 8
SELECT department,SUM(salary)
FROM employees
GROUP BY department;

-- 9
SELECT department,AVG(salary)
FROM employees
GROUP BY department;

-- 10
SELECT department,COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*)>=2;

-- 11
SELECT department,SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary)>150000;


## Part 1 : String Functions
1. UPPER()
Professional Definition

UPPER() kisi string ko uppercase me convert karta hai.

Syntax
SELECT UPPER(name)
FROM employees;
Output
ABDULLAH
IRAM
SARA
...
2. LOWER()

Sab lowercase me.

SELECT LOWER(name)
FROM employees;

Output

abdullah
iram
sara
3. LENGTH()

String ki length batata hai.

SELECT name,
LENGTH(name)
FROM employees;

Output

Abdullah     8
Iram         4
Sara         4
4. CONCAT()

Do ya usse zyada strings ko jodta hai.

SELECT CONCAT(name,' works in ',department)
FROM employees;

Output

Abdullah works in IT

Sara works in IT

John works in Finance
5. SUBSTRING()

String ka kuch part nikalta hai.

SELECT name,
SUBSTRING(name,1,3)
FROM employees;

Output

Abdullah   Abd

Iram       Ira

Rohan      Roh

1 = starting position, 3 = kitne characters.

6. TRIM()

Extra spaces hata deta hai.

Example

SELECT TRIM('    Abdullah     ');

Output

Abdullah
Part 2 : Numeric Functions
ROUND()
SELECT ROUND(123.5678,2);

Output

123.57
CEIL()

Upper integer.

SELECT CEIL(12.2);

Output

13
FLOOR()

Lower integer.

SELECT FLOOR(12.9);

Output

12
MOD()

Remainder.

SELECT MOD(25,4);

Output

1
## Part 3 : Date Functions

Current date

SELECT CURDATE();

Example

2026-07-17

Current Date & Time

SELECT NOW();

Example

2026-07-17 15:42:11

Current Year

SELECT YEAR(CURDATE());

Output

2026

Current Month

SELECT MONTH(CURDATE());

Output

7

Days Difference

SELECT DATEDIFF('2026-12-31',
'2026-07-17');

Output

167
## Part 4 : NULL Functions
IFNULL()

Agar value NULL ho to replacement dega.

Example

SELECT IFNULL(NULL,'No Value');

Output

No Value
COALESCE()

Jo pehli non-NULL value milegi wahi return karega.

SELECT COALESCE(NULL,NULL,'Abdullah');

Output

Abdullah
🎯 Practical Task

Sab queries khud run karo.

-- 1
SELECT UPPER(name)
FROM employees;

-- 2
SELECT LOWER(name)
FROM employees;

-- 3
SELECT name,LENGTH(name)
FROM employees;

-- 4
SELECT CONCAT(name,' works in ',department)
FROM employees;

-- 5
SELECT name,SUBSTRING(name,1,3)
FROM employees;

-- 6
SELECT TRIM('     Abdullah      ');

-- 7
SELECT ROUND(123.5678,2);

-- 8
SELECT CEIL(12.2);

-- 9
SELECT FLOOR(12.9);

-- 10
SELECT MOD(25,4);

-- 11
SELECT CURDATE();

-- 12
SELECT NOW();

-- 13
SELECT YEAR(CURDATE());

-- 14
SELECT MONTH(CURDATE());

-- 15
SELECT DATEDIFF('2026-12-31','2026-07-17');

-- 16
SELECT IFNULL(NULL,'No Value');

-- 17
SELECT COALESCE(NULL,NULL,'Abdullah');
## 💼 Software Engineer Tip

Ye functions real projects me bahut common hain:

UPPER() / LOWER() → Case-insensitive search aur login systems.
CONCAT() → Full name, messages aur reports banane ke liye.
SUBSTRING() → IDs, phone numbers, OTP masking.
ROUND() → Banking aur e-commerce me prices.
CURDATE() / NOW() → Orders, login history, timestamps.
IFNULL() / COALESCE() → Missing data ko handle karne ke liye.