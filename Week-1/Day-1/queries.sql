-- BASIC QUERIES
-- 1. display all employee details
SELECT * FROM Employee;

-- 2. show only employee name and salary
SELECT name, salary FROM Employee;

-- 3. employees older than 30
SELECT * FROM Employee
WHERE age > 30;

-- 4. display all department names
SELECT name FROM Department;

-- 5. employees working in IT department
SELECT * FROM Employee
WHERE department_id = 1;


-- STRING MATCHING QUERIES
-- 6. names starting with J
SELECT * FROM Employee
WHERE name LIKE 'J%';

-- 7. names ending with e
SELECT * FROM Employee
WHERE name LIKE '%e';

-- 8. names containing a
SELECT * FROM Employee
WHERE name LIKE '%a%';

-- 9. names having exactly 8 characters
SELECT * FROM Employee
WHERE name LIKE '________';

-- 10. second character should be a
SELECT * FROM Employee
WHERE name LIKE '_a%';

-- DATE QUERIES
-- 11. employees hired in 2020
SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 12. employees hired in january
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

-- 13. employees hired before 2019
SELECT * FROM Employee
WHERE YEAR(hire_date) < 2019;

-- 14. employees hired after march 1 2021
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

-- 15. employees hired in last 2 years
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- AGGREGATE QUERIES
-- 16. total salary of employees
SELECT SUM(salary) AS total_salary
FROM Employee;

-- 17. average salary
SELECT AVG(salary) AS avg_salary
FROM Employee;

-- 18. minimum salary
SELECT MIN(salary) AS min_salary
FROM Employee;

-- 19. number of employees in each department
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id;

-- 20. average salary in each department
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id;


-- GROUP BY QUERIES
-- 21. total salary department wise
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- 22. average age in each department
SELECT department_id, AVG(age) AS avg_age
FROM Employee
GROUP BY department_id;

-- 23. employees hired every year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total
FROM Employee
GROUP BY YEAR(hire_date);

-- 24. highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- 25. department with highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;


-- HAVING QUERIES
-- 26. departments having more than 2 employees
SELECT department_id, COUNT(*) AS total
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27. departments with avg salary greater than 55000
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28. years with more than 1 employee hired
SELECT YEAR(hire_date) AS year, COUNT(*) AS total
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- 29. departments with salary expense less than 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30. departments with max salary above 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;


-- ORDER BY QUERIES
-- 31. employees ordered by salary
SELECT * FROM Employee
ORDER BY salary;

-- 32. employees ordered by age descending
SELECT * FROM Employee
ORDER BY age DESC;

-- 33. employees ordered by hire date
SELECT * FROM Employee
ORDER BY hire_date;

-- 34. order by department and salary
SELECT * FROM Employee
ORDER BY department_id, salary;

-- 35. departments ordered by total salary
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;


-- JOIN QUERIES
-- 36. employee names with department names
SELECT e.name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- 37. project names with department names
SELECT p.name, d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

-- 38. employee names with project names
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
JOIN Project p
ON d.department_id = p.department_id;

-- 39. all employees with departments including null values
SELECT e.name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- 40. all departments with employees
SELECT d.name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 41. employees without department
SELECT * FROM Employee
WHERE department_id IS NULL;

-- 42. employee names with project count
SELECT e.name, COUNT(p.project_id) AS project_count
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.name;

-- 43. departments without employees
SELECT d.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44. employees in same department as john doe
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
)
AND name <> 'John Doe';

-- 45. department with highest average salary
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;


-- NESTED AND CORRELATED QUERIES
-- 46. employee with highest salary
SELECT name
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- 47. employees earning more than average salary
SELECT name
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- 48. second highest salary
SELECT MAX(salary)
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- 49. department with most employees
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 50. employees earning more than department average
SELECT name
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 51. third highest salary
SELECT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 52. employees older than all HR employees
SELECT name
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Department
        WHERE name = 'HR'
    )
);

-- 53. departments with average salary above 55000
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
HAVING AVG(e.salary) > 55000;

-- 54. employees working in departments with at least 2 projects
SELECT name
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

-- 55. employees hired on same date as jane smith
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);


-- COMBINED MODERATE DIFFICULTY QUERIES
-- 56. total salary of employees hired in 2020
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57. average salary department wise in descending order
SELECT d.name, AVG(e.salary) AS avg_salary
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY avg_salary DESC;

-- 58. departments with more than 1 employee and avg salary above 55000
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
HAVING COUNT(*) > 1
AND AVG(e.salary) > 55000;

-- 59. employees hired in last 2 years ordered by hire date
SELECT name
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

-- 60. total employees and avg salary for departments with more than 2 employees
SELECT d.name,
COUNT(*) AS total_emp,
AVG(e.salary) AS avg_salary
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
HAVING COUNT(*) > 2;

-- 61. employees whose salary is greater than department average
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 62. employees hired on same date as oldest employee
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    ORDER BY age DESC
    LIMIT 1
);

-- 63. department names with total project count
SELECT d.name,
COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY total_projects DESC;

-- 64. highest paid employee in each department
SELECT d.name AS department,
e.name,
e.salary
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 65. employees older than department average age
SELECT name, salary
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 66. display employees whose salary is between 50000 and 70000
SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 70000;
