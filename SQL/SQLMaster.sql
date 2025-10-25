/* ==========================================================
   SQL MASTERY SCRIPT - Hafeez
   ==========================================================
   Author: Hafeez
   Purpose: Core SQL interview practice covering:
     - SELECT, INSERT, UPDATE, DELETE
     - GROUP BY, HAVING, DISTINCT
     - BETWEEN, LIKE, IN, IS NULL
     - LIMIT, OFFSET, ORDER BY
     - Correlated subqueries and joins
   Notes: Use for practice, revision, and interview prep

   SUMMARY OF CONCEPTS COVERED:
   1. SELECT queries: basic filters, LIKE, IS NULL, DISTINCT
   2. Aggregates & GROUP BY: COUNT, SUM, AVG, MIN, MAX
   3. HAVING clause for aggregate filters vs WHERE for row filters
   4. ORDER BY, NULL handling, alias usage
   5. LIMIT & OFFSET: top N, ranges, tie handling
   6. Subqueries: standard and correlated, performance considerations
   7. JOINs: inner, outer, join-based updates/deletes
   8. Updates & Deletes with conditions and joins
   9. Precedence traps: AND/OR logic, parentheses
  10. Materialization & query optimization awareness

   ==========================================================
   SQL Queries for Practice
   ========================================================== */

-- Q1 - SELECT + LIKE + IS NULL
SELECT * FROM world.employee
WHERE city LIKE 'B%i' AND bonus IS NULL;

-- Q2 - DISTINCT + ORDER BY
SELECT DISTINCT dept_id, city FROM world.employee
ORDER BY city ASC;

-- Q3 - BETWEEN + NOT BETWEEN
SELECT * FROM world.employee
WHERE salary BETWEEN 45000 AND 60000
  AND hire_date NOT BETWEEN '2020-01-01' AND '2021-01-01';

-- Q4 - GROUP BY + HAVING
SELECT city, COUNT(emp_id), AVG(salary)
FROM world.employee
GROUP BY city
HAVING COUNT(emp_id) > 3 AND AVG(salary) > 55000;

-- Q5 - INSERT
INSERT INTO world.employee (emp_id, emp_name, salary, dept_id, hire_date, city)
VALUES (16,'Hafeez1',75000,10,'2015-08-10','Hyderabad'),
       (17,'Hafeez2',75000,10,'2015-08-11','Hyderabad'),
       (18,'Hafeez3',75000,10,'2015-08-12','Hyderabad');

-- Q6 - UPDATE
UPDATE world.employee 
SET salary = salary * 1.15
WHERE dept_id IN (SELECT dept_id FROM world.department WHERE dept_name='Finance')
AND salary < 50000;

-- Q7 - DELETE
DELETE FROM world.employee
WHERE city='Chennai' AND hire_date < '2021-01-01';

-- Q8 - IN + OR precedence
SELECT emp_name, city
FROM world.employee
WHERE (city='Hyderabad' OR city='Delhi')
  AND dept_id IN (SELECT dept_id FROM world.department WHERE dept_name IN ('Finance','HR'));

-- Q9 - ORDER BY + LIMIT + OFFSET
SELECT * FROM world.employee
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

-- Q10 - GROUP BY + ORDER BY Mix
SELECT dept_id, SUM(salary) AS total_payout
FROM world.employee
GROUP BY dept_id
ORDER BY total_payout DESC;

-- Q11 - HAVING with aggregate filtering
SELECT dept_id
FROM world.employee
GROUP BY dept_id
HAVING MAX(salary) > 75000 AND AVG(salary) < 60000;

-- Q12 - IS NULL vs = NULL
SELECT * FROM world.employee
WHERE dept_id IS NULL;

-- Q13 - LIKE with wildcards
SELECT * FROM world.employee
WHERE emp_name LIKE 'H%z' AND emp_name LIKE CONCAT(REPEAT('_',2),'f','%');

-- Q14 - Complex HAVING + COUNT
SELECT dept_id
FROM world.employee
WHERE salary > 60000
GROUP BY dept_id
HAVING COUNT(*) > 2;

-- Q15 - ORDER BY + NULL Handling
SELECT * FROM world.employee
ORDER BY dept_id, CASE WHEN salary IS NULL THEN 1 ELSE 0 END, salary DESC;

-- Q16 - LIMIT with Tie Trap
SELECT * FROM world.employee
ORDER BY salary DESC
LIMIT 3;

-- Q17 - Subquery in SELECT (Correlated)
SELECT emp_name, salary,
       (SELECT AVG(salary) FROM world.employee e2 WHERE e2.dept_id = e1.dept_id) AS dept_avg
FROM world.employee e1;

-- Q18 - UPDATE with JOIN
UPDATE world.employee e
JOIN world.department d ON e.dept_id = d.dept_id
SET e.salary = e.salary * 1.1
WHERE d.dept_name='HR';

-- Q19 - DELETE with JOIN
DELETE e
FROM world.employee e
JOIN world.department d ON e.dept_id = d.dept_id
WHERE d.location='Mumbai';

-- Q20 - DISTINCT + COUNT Trap
SELECT COUNT(DISTINCT dept_id) FROM world.employee;

-- Q21 - 2nd Highest Salary in Department (subquery pattern)
-- SELECT emp_name, salary
-- FROM world.employee e
-- WHERE salary = (SELECT MAX(salary) FROM world.employee
--                 WHERE dept_id=e.dept_id AND salary < (SELECT MAX(salary) FROM world.employee WHERE dept_id=e.dept_id));

-- Q22-Q30 - GROUP BY, HAVING, ORDER BY, NULL handling, Correlated Subqueries
-- Refer to above Q1-Q21 patterns, mix & match

/* ==========================================================
   END OF SQL MASTERY SCRIPT
   ========================================================== */
