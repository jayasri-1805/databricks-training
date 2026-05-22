-- 1.Retrieve employee names and their managers,including employees without managers.
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- 2.Display all employees and their departments,including employees without departments.
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 3.List employees who report to a manager.
SELECT e.emp_name,
       m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- 4.Find total salary paid department-wise,including departments with no employees.
SELECT d.dept_name,
       SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 5. Display employees who do not belong to any department.
SELECT emp_name
FROM employees
WHERE dept_id IS NULL;

-- 6.Fetch employees and their projects,including employees without projects.
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- 7.List employees who completed at least one project.
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id;

-- 8.Show employees and projects,ensuring all projects are included.
SELECT e.emp_name,
       p.project_name
FROM employees e
RIGHT JOIN projects p
ON e.emp_id = p.emp_id;

-- 9.Display employees and their salaries.
SELECT emp_name,
       salary
FROM employees;

-- 10.Retrieve employees and department names,including employees without departments.
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 11.Display all departments and employees,including departments without employees.
SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- 12.List employees with contact information,including employees without contact records.
SELECT e.emp_name,
       c.contact_number,
       c.email
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;

-- 13. Show employees and department names,including unmatched rows from both tables.
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- 14.Find employees who have not completed any project.
SELECT e.emp_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

-- 15.Retrieve employees and their project names,including employees without projects.
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- 16.List all projects and assigned employees,including projects without employees.
SELECT p.project_name,
       e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.emp_id = e.emp_id;

-- 17.Show employees who have both manager and project.
SELECT e.emp_name,
       m.emp_name AS manager_name,
       p.project_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
INNER JOIN projects p
ON e.emp_id = p.emp_id;

-- 18.List employees and departments,excluding employees without departments.
SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 19.Display employees belonging to multiple departments.
SELECT e.emp_name,
       d.dept_name
FROM employee_department ed
JOIN employees e
ON ed.emp_id = e.emp_id
JOIN departments d
ON ed.dept_id = d.dept_id;

-- 20.List all departments and employees, including departments without employees.
SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- 21.Retrieve employees with projects but no department.
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
WHERE e.dept_id IS NULL;

-- 22.Find total employees in each department,including empty departments.
SELECT d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 23.Show employees who report to managers only.
SELECT e.emp_name,
       m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- 24.Display all employees with managers, including employees without managers.
SELECT e.emp_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- 25.Find department names and employee counts,including departments without employees.
SELECT d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 26.List all employees and departments,including empty departments.
SELECT e.emp_name,
       d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- 27.Show employees without salary records.
SELECT e.emp_name
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;

-- 28.Retrieve employees and project assignments,including employees without projects.
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- 29.List employees with department and project assignments.
SELECT e.emp_name,
       d.dept_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- 30.Display employees with department names, including employees without departments.
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
