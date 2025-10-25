/* Q1 - INNER JOIN basic
   List all employees with their department names for departments located in 'Delhi'.
*/
SELECT *,d.dept_name FROM 
world.employee AS e
INNER JOIN world.department AS d ON e.dept_id = e.dept_id
WHERE d.city ='Delhi';

/* Q2 - LEFT JOIN with NULL handling
   Show all departments and count of employees in each. Include departments with zero employees.
*/
SELECT e.dept_id, COUNT(e.dept_id) AS employees_count 
FROM world.department AS d LEFT JOIN world.employee AS e ON d.dept_id = e.dept_id
GROUP BY d.dept_id;


/* Q3 - Aggregates with JOIN
   Display total salary and avg salary per department.
*/
SELECT e.dept_id, SUM(salary) AS total_salary, AVG(salary) AS avg_salary 
FROM world.department AS d LEFT JOIN world.employee AS e ON d.dept_id = e.dept_id
GROUP BY d.dept_id;

/* Q4 - Self join
   List employees with their manager names.
*/
SELECT e.emp_name AS Employee, m.emp_name
FROM world.employee AS e
LEFT JOIN  world.employee AS m
WHERE e.manager_id = m.emp_id;

/* Q5 - Finding max salary per department
   Show employee names and salaries for the highest-paid employee in each department.
*/
SELECT e.emp_name, e.dept_id, d.highest_salary FROM world.employee AS e
JOIN 
(
SELECT dept_id, MAX(salary) AS highest_salary FROM 
world.employee GROUP BY dept_id
) AS d
ON e.dept_id= d.dept_id

/*Excellent framing of question*/


/* Q6 - Multiple joins
   For each employee, show name, salary, department name, and department location.
*/
SELECT e.emp_name AS Employee, e.salary AS Salary,
d.dept_name AS Department, d.dept_location AS DeptLocation
FROM world.employee AS e JOIN world.department AS d ON e.dept_id = d.dept_id;




/* Q7 - LEFT JOIN + filter trap
   Show all employees, and if their department is in 'Finance', show bonus else NULL.
*/

SELECT e.emp_name, e.salary,
       CASE WHEN d.dept_name = 'Finance' THEN e.bonus ELSE NULL END AS bonus
FROM world.employee AS e
LEFT JOIN world.department AS d
       ON e.dept_id = d.dept_id;




/* Q8 - Nested join pattern
   Get employees earning more than the avg salary of their department using JOIN (no subquery in WHERE).
*/

SELECT e.emp_name, e.salary
FROM world.employee AS e
JOIN (
SELECT dept_id, AVG(salary) AS avg_sal
FROM world.employee
GROUP BY dept_id
) AS d
ON e.dept_id = d.dept_id
WHERE e.salary> d.avg_sal;


/* Q9 - CROSS JOIN trap
   Show all possible employee-department combinations.
*/
SELECT e.emp_name, d.dept_name
FROM world.employee AS e
CROSS JOIN world.department AS d
ON e.dept_id = d.dept_id;






/* Q10 - Join with IN clause
   List employees working in departments with location in ('Hyderabad', 'Bengaluru').
*/

SELECT e.emp_name, d.dept_name
FROM world.employee AS e
JOIN world.department AS d
ON e.dept_id = d.dept_id
WHERE d.location IN ('Hyderabad','Bengaluru');
