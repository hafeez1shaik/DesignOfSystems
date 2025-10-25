-- Write a query to show emp_name, dept_id, salary, dept_avg_salary, and salary_difference

WITH salary_ranked AS(
SELECT emp_name, dept_id, salary, AVG(salary) OVER (
PARTITION BY dept_id
) AS dept_avg_salary
FROM world.employee)
SELECT emp_name, dept_id, salary, dept_avg_salary, salary-dept_avg_salary AS salary_diff
FROM salary_ranked


-- Write a query to assign rank to each employee by salary within their department

SELECT emp_name, RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
FROM world.employee

-- Use a subquery or CTE with RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC)
-- and filter rank <= 2

WITH salary_ranked  AS (
SELECT emp_name, RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
FROM world.employee
)
SELECT emp_name, salary_rank FROM salary_ranked WHERE salary_rank <=2;

-- Use CASE WHEN salary > AVG(salary) OVER (PARTITION BY dept_id)
-- THEN 'Above Avg' ELSE 'Below Avg' END AS status

SELECT emp_name, dept_id, salary, CASE WHEN salary > AVG(salary) OVER (PARTITION BY dept_id) THEN 'Above Average' 
ELSE 'Below Average' END AS `status`
FROM world.employee


SELECT 
    emp_name,
    dept_id,
    salary,
    LAG(salary, 1) OVER (PARTITION BY dept_id ORDER BY salary) AS prev_salary,
    LEAD(salary, 1) OVER (PARTITION BY dept_id ORDER BY salary) AS next_salary
FROM world.employee;


/* ======================================================================
   📘 SQL Notes — Window Functions & Frame Clauses
   Author: Hafeez
   Purpose: Reference & practice file for interview and real-life SQL use
   ====================================================================== */

/* ==========================================================
   1️⃣ Window Function Basics
   ========================================================== */
/*
Window functions allow performing aggregate or ranking operations across a “window” of rows
without collapsing them like GROUP BY does. You can:
  - Partition the data (PARTITION BY)
  - Order the rows within partition (ORDER BY)
  - Define frame/window (ROWS BETWEEN ...)
Common functions: SUM(), AVG(), COUNT(), RANK(), DENSE_RANK(), LAG(), LEAD()
*/

/* Example: Average salary per department (window function) */
SELECT emp_name, dept_id, salary,
       AVG(salary) OVER (PARTITION BY dept_id) AS dept_avg_salary
FROM world.employee;

/* ==========================================================
   2️⃣ Ranking Functions
   ========================================================== */

/* Rank employees by salary within their department */
SELECT emp_name, dept_id, salary,
       RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
FROM world.employee;

/* Top 2 employees per department using CTE */
WITH salary_ranked AS (
    SELECT emp_name, dept_id, salary,
           RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
    FROM world.employee
)
SELECT emp_name, dept_id, salary, salary_rank
FROM salary_ranked
WHERE salary_rank <= 2;

/* ==========================================================
   3️⃣ Conditional Window Functions
   ========================================================== */

/* Label employees as Above or Below Avg salary per department */
SELECT emp_name, dept_id, salary,
       CASE 
           WHEN salary > AVG(salary) OVER (PARTITION BY dept_id) THEN 'Above Average'
           ELSE 'Below Average'
       END AS salary_status
FROM world.employee;

/* ==========================================================
   4️⃣ Frame Clauses
   ========================================================== */
/*
Frame clauses control the set of rows a window function operates on:
  - ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  => Cumulative sum/avg
  - ROWS BETWEEN N PRECEDING AND CURRENT ROW          => Rolling window
  - ROWS BETWEEN CURRENT ROW AND N FOLLOWING          => Forward-looking window
  - LAG()/LEAD() for comparing previous/next rows
*/

/* 4.1 Cumulative Salary per Department */
SELECT emp_name, dept_id, salary,
       SUM(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_salary
FROM world.employee;

/* 4.2 Rolling Average of last 3 salaries per department */
SELECT emp_name, dept_id, salary,
       AVG(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS rolling_avg
FROM world.employee;

/* 4.3 Salary difference from previous employee in department */
SELECT emp_name, dept_id, salary,
       salary - LAG(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary
       ) AS diff_prev_salary
FROM world.employee;

/* ==========================================================
   5️⃣ Key Takeaways
   ========================================================== */
/*
- Window functions let you aggregate without collapsing rows (unlike GROUP BY)
- PARTITION BY defines logical groups for the function
- ORDER BY defines the order within each partition
- Frame clauses allow moving/cumulative/lagged calculations
- Use LAG() and LEAD() for row-to-row comparisons
- Very powerful in analytics, reporting, and real-life dashboards
*/

