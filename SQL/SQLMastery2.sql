/* ==========================================================
   SQL Mastery Challenge - Hafeez
   All core patterns covered: SELECT, INSERT, UPDATE, DELETE,
   GROUP BY, HAVING, DISTINCT, BETWEEN, LIKE, IN, IS NULL,
   LIMIT, OFFSET, ORDER BY, Joins, CASE WHEN, Self Join
   ==========================================================
*/

/* ========================================
   SELECT + LIKE + IS NULL
   ======================================== */
SELECT *
FROM world.employee
WHERE city LIKE 'B%i' AND bonus IS NULL;

/* ========================================
   DISTINCT + ORDER BY
   ======================================== */
SELECT DISTINCT dept_id, city
FROM world.employee
ORDER BY city ASC;

/* ========================================
   BETWEEN + NOT BETWEEN
   ======================================== */
SELECT *
FROM world.employee
WHERE salary BETWEEN 45000 AND 60000
  AND hire_date NOT BETWEEN '2020-01-01' AND '2021-01-01';

/* ========================================
   GROUP BY + HAVING
   ======================================== */
SELECT city, COUNT(emp_id), AVG(salary)
FROM world.employee
GROUP BY city
HAVING COUNT(emp_id) > 3 AND AVG(salary) > 55000;

/* ========================================
   INSERT example
   ======================================== */
INSERT INTO world.employee (emp_id, emp_name, salary, dept_id, hire_date, city)
VALUES (16,'Hafeez1',75000,10,'2015-08-10','Hyderabad'),
       (17,'Hafeez2',75000,10,'2015-08-11','Hyderabad'),
       (18,'Hafeez3',75000,10,'2015-08-12','Hyderabad');

/* ========================================
   UPDATE example
   ======================================== */
UPDATE world.employee
SET salary = (1.15*salary)
WHERE dept_id IN (SELECT dept_id FROM world.department WHERE dept_name = 'Finance');

/* ========================================
   DELETE example
   ======================================== */
DELETE FROM world.employee
WHERE hire_date < '2021-01-01';

/* ========================================
   JOIN Examples
   ======================================== */

/* Q1 - INNER JOIN */
SELECT e.*, d.dept_name
FROM world.employee AS e
INNER JOIN world.department AS d ON e.dept_id = d.dept_id
WHERE d.city = 'Delhi';

/* Q2 - LEFT JOIN with NULL handling */
SELECT d.dept_id, COUNT(e.emp_id) AS employees_count
FROM world.department AS d
LEFT JOIN world.employee AS e ON d.dept_id = e.dept_id
GROUP BY d.dept_id;

/* Q3 - Aggregates with JOIN */
SELECT d.dept_id, SUM(e.salary) AS total_salary, AVG(e.salary) AS avg_salary
FROM world.department AS d
LEFT JOIN world.employee AS e ON d.dept_id = e.dept_id
GROUP BY d.dept_id;

/* Q4 - Self Join */
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM world.employee AS e
LEFT JOIN world.employee AS m ON e.manager_id = m.emp_id;

/* Q5 - Max salary per department */
SELECT e.emp_name, e.dept_id, d.highest_salary
FROM world.employee AS e
JOIN (
  SELECT dept_id, MAX(salary) AS highest_salary
  FROM world.employee
  GROUP BY dept_id
) AS d ON e.dept_id = d.dept_id;

/* Q6 - Multiple joins */
SELECT e.emp_name AS Employee, e.salary AS Salary,
       d.dept_name AS Department, d.dept_location AS DeptLocation
FROM world.employee AS e
JOIN world.department AS d ON e.dept_id = d.dept_id;

/* Q7 - LEFT JOIN + CASE WHEN */
SELECT e.emp_name, e.salary,
       CASE WHEN d.dept_name = 'Finance' THEN e.bonus ELSE NULL END AS bonus
FROM world.employee AS e
LEFT JOIN world.department AS d ON e.dept_id = d.dept_id;

/* Q8 - Nested join pattern */
SELECT e.emp_name, e.salary
FROM world.employee AS e
JOIN (
  SELECT dept_id, AVG(salary) AS avg_sal
  FROM world.employee
  GROUP BY dept_id
) AS d ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_sal;

/* Q9 - CROSS JOIN */
SELECT e.emp_name, d.dept_name
FROM world.employee AS e
CROSS JOIN world.department AS d;

/* Q10 - JOIN with IN clause */
SELECT e.emp_name, d.dept_name
FROM world.employee AS e
JOIN world.department AS d ON e.dept_id = d.dept_id
WHERE d.location IN ('Hyderabad', 'Bengaluru');

/* ========================================
   Correlated Subquery Example
   ======================================== */
SELECT e.emp_name, e.salary,
       (SELECT AVG(salary) FROM world.employee e2 WHERE e2.dept_id = e.dept_id) AS dept_avg
FROM world.employee e;
