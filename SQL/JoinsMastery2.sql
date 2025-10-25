/* ==========================================================================
   🚀 CONDITIONAL JOINS PRACTICE
   Core Focus: LEFT JOIN, INNER JOIN, CASE, COALESCE, self join, filtered join
   Goal: Hafeez can handle conditional joins and NULL handling confidently.
   ========================================================================== */

/* ==========================================================
   Q1 - LEFT JOIN with conditional output using CASE
   Show employee bonus only if department is 'Finance'; else NULL.
========================================================== */
SELECT e.emp_name, e.salary,
       CASE WHEN d.dept_name = 'Finance' THEN e.bonus ELSE NULL END AS bonus
FROM employee AS e
LEFT JOIN department AS d
       ON e.dept_id = d.dept_id;

/* ==========================================================
   Q2 - Conditional filtering in ON clause
   Only join Finance department rows; others become NULL.
========================================================== */
SELECT e.emp_name, d.dept_name
FROM employee AS e
LEFT JOIN department AS d
       ON e.dept_id = d.dept_id AND d.dept_name = 'Finance';

/* ==========================================================
   Q3 - Handle NULLs using COALESCE
   Replace NULL department names with default text.
========================================================== */
SELECT e.emp_name, COALESCE(d.dept_name, 'No Department') AS department
FROM employee AS e
LEFT JOIN department AS d
       ON e.dept_id = d.dept_id;

/* ==========================================================
   Q4 - Conditional aggregation
   Sum salaries only for Finance employees.
========================================================== */
SELECT d.dept_name,
       SUM(CASE WHEN d.dept_name = 'Finance' THEN e.salary ELSE 0 END) AS finance_salary
FROM employee AS e
LEFT JOIN department AS d
       ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

/* ==========================================================
   Q5 - Multiple conditions in ON
   Join only Hyderabad Finance or HR departments.
========================================================== */
SELECT e.emp_name, d.dept_name
FROM employee AS e
LEFT JOIN department AS d
       ON e.dept_id = d.dept_id
      AND d.location = 'Hyderabad'
      AND d.dept_name IN ('Finance','HR');

/* ==========================================================
   Q6 - Self join example
   Show employees along with their manager's name.
========================================================== */
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employee AS



/***
✅ File Features & Takeaways:

Conditional joins in ON clause reduce intermediate rows → faster query execution.

CASE and COALESCE handle NULL values in SELECT.

Self join patterns for hierarchy (employee → manager).

Conditional aggregation avoids extra subqueries.

CROSS JOIN + WHERE shows how to filter combinations safely.

Materialization happens behind the scenes, DB chooses hash/merge/nested loop based on filtered join size.


*/