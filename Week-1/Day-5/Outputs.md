
**Query #1**

    -- 1. List all students along with their department names.
    SELECT s.student_name, d.department_name
    FROM Student s
    LEFT JOIN Department d
    ON s.department_id = d.department_id;

| student_name     | department_name  |
| ---------------- | ---------------- |
| John Doe         | Computer Science |
| Mary Jane        | Computer Science |
| Steve Rogers     | Mechanical       |
| Natasha Romanoff | Mechanical       |
| Bruce Wayne      | Electronics      |
| Clark Kent       | Electronics      |
| Diana Prince     | Civil            |
| Peter Parker     | Civil            |
| Tony Stark       | Computer Science |
| Wanda Maximoff   | Mathematics      |
| Barry Allen      | Mathematics      |
|                  |                  |
| Scott Lang       |                  |
| Jean Grey        |                  |
| Logan Howlett    | Biotechnology    |

---
**Query #2**

    -- 2. Display all staff members and their department names,
    -- including staff without departments.
    SELECT st.staff_name, d.department_name
    FROM Staff st
    LEFT JOIN Department d
    ON st.department_id = d.department_id;

| staff_name    | department_name  |
| ------------- | ---------------- |
| Alice Johnson | Computer Science |
| Bob Smith     | Computer Science |
| Charlie Brown | Mechanical       |
| David Lee     | Mechanical       |
| Eva Green     | Electronics      |
| Frank Hall    | Electronics      |
| Grace Miller  | Civil            |
|               |                  |
| Henry Ford    | Mathematics      |
| Ivy Clark     |                  |

---
**Query #3**

    -- 3. Find all departments that currently have no students assigned.
    SELECT d.department_name
    FROM Department d
    LEFT JOIN Student s
    ON d.department_id = s.department_id
    WHERE s.student_id IS NULL;

There are no results to be displayed.

---
**Query #4**

    -- 4. Show students who do not have any marks recorded.
    SELECT s.student_name
    FROM Student s
    LEFT JOIN Mark m
    ON s.student_id = m.student_id
    WHERE m.student_id IS NULL;

There are no results to be displayed.

---
**Query #5**

    -- 5. Display subjects that are not assigned to any staff member.
    SELECT subject_name
    FROM Subject
    WHERE staff_id IS NULL;

| subject_name |
| ------------ |
|              |

---
**Query #6**

    -- 6. Find the average CGPA department-wise.
    SELECT d.department_name,
           AVG(s.cgpa) AS avg_cgpa
    FROM Student s
    JOIN Department d
    ON s.department_id = d.department_id
    GROUP BY d.department_name;

| department_name  | avg_cgpa           |
| ---------------- | ------------------ |
|                  | 8.8000000000000000 |
| Mechanical       | 7.7500000000000000 |
| Computer Science | 9.2000000000000000 |
| Mathematics      | 6.8500000000000000 |
| Electronics      | 8.2000000000000000 |
| Civil            | 8.4000000000000000 |
| Biotechnology    | 7.7000000000000000 |

---
**Query #7**

    -- 7. Display departments where the average CGPA is greater than 8.0.
    SELECT d.department_name,
           AVG(s.cgpa) AS avg_cgpa
    FROM Student s
    JOIN Department d
    ON s.department_id = d.department_id
    GROUP BY d.department_name
    HAVING AVG(s.cgpa) > 8.0;

| department_name  | avg_cgpa           |
| ---------------- | ------------------ |
|                  | 8.8000000000000000 |
| Computer Science | 9.2000000000000000 |
| Electronics      | 8.2000000000000000 |
| Civil            | 8.4000000000000000 |

---
**Query #8**

    -- 8. Find the total number of students in each department.
    SELECT d.department_name,
           COUNT(s.student_id) AS total_students
    FROM Department d
    LEFT JOIN Student s
    ON d.department_id = s.department_id
    GROUP BY d.department_name;

| department_name  | total_students |
| ---------------- | -------------- |
|                  | 1              |
| Mechanical       | 2              |
| Computer Science | 3              |
| Mathematics      | 2              |
| Electronics      | 2              |
| Civil            | 2              |
| Biotechnology    | 1              |

---
**Query #9**

    -- 9. Display the highest and lowest marks scored in each subject.
    SELECT sub.subject_name,
           MAX(m.marks) AS highest_marks,
           MIN(m.marks) AS lowest_marks
    FROM Subject sub
    JOIN Mark m
    ON sub.subject_id = m.subject_id
    GROUP BY sub.subject_name;

| subject_name            | highest_marks | lowest_marks |
| ----------------------- | ------------- | ------------ |
|                         | 73            | 73           |
| Thermodynamics          | 72            | 72           |
| Database Systems        | 99            | 88           |
| Structural Engineering  | 87            | 87           |
| Artificial Intelligence | 97            | 44           |
| Digital Electronics     | 98            | 54           |
| Linear Algebra          | 90            | 65           |
| Signals and Systems     | 94            | 61           |
| Operating Systems       | 89            | 75           |
| Machine Design          | 81            | 66           |

---
**Query #10**

    -- 10. Find students who scored more than 90 in any exam.
    SELECT DISTINCT s.student_name
    FROM Student s
    JOIN Mark m
    ON s.student_id = m.student_id
    WHERE m.marks > 90;

| student_name |
| ------------ |
| Bruce Wayne  |
| Mary Jane    |
| Tony Stark   |
| John Doe     |

---
**Query #11**

    -- 11. Display names of students who belong to Computer Science department.
    SELECT s.student_name
    FROM Student s
    JOIN Department d
    ON s.department_id = d.department_id
    WHERE d.department_name = 'Computer Science';

| student_name |
| ------------ |
| John Doe     |
| Mary Jane    |
| Tony Stark   |

---
**Query #12**

    -- 12. Find number of subjects handled by each staff member.
    SELECT st.staff_name,
           COUNT(sub.subject_id) AS total_subjects
    FROM Staff st
    LEFT JOIN Subject sub
    ON st.staff_id = sub.staff_id
    GROUP BY st.staff_name;

| staff_name    | total_subjects |
| ------------- | -------------- |
|               | 0              |
| David Lee     | 1              |
| Alice Johnson | 2              |
| Grace Miller  | 1              |
| Bob Smith     | 1              |
| Charlie Brown | 1              |
| Frank Hall    | 1              |
| Henry Ford    | 1              |
| Ivy Clark     | 0              |
| Eva Green     | 1              |

---
**Query #13**

    -- 13. Display students along with total marks obtained across all subjects.
    SELECT s.student_name,
           SUM(m.marks) AS total_marks
    FROM Student s
    LEFT JOIN Mark m
    ON s.student_id = m.student_id
    GROUP BY s.student_name;

| student_name     | total_marks |
| ---------------- | ----------- |
|                  |             |
| Peter Parker     |             |
| Bruce Wayne      | 192         |
| Logan Howlett    | 73          |
| Steve Rogers     | 138         |
| Mary Jane        | 184         |
| Jean Grey        | 90          |
| Tony Stark       | 196         |
| Scott Lang       | 44          |
| Barry Allen      | 65          |
| John Doe         | 254         |
| Wanda Maximoff   | 71          |
| Natasha Romanoff | 81          |
| Clark Kent       | 115         |
| Diana Prince     | 87          |

---
**Query #14**

    -- 14. Find departments with more than 2 staff members.
    SELECT d.department_name,
           COUNT(st.staff_id) AS total_staff
    FROM Department d
    JOIN Staff st
    ON d.department_id = st.department_id
    GROUP BY d.department_name
    HAVING COUNT(st.staff_id) > 2;

There are no results to be displayed.

---
**Query #15**

    -- 15. Display students whose CGPA is above average CGPA.
    SELECT student_name, cgpa
    FROM Student
    WHERE cgpa >
    (
        SELECT AVG(cgpa)
        FROM Student
    );

| student_name     | cgpa |
| ---------------- | ---- |
| John Doe         | 8.70 |
| Mary Jane        | 9.10 |
| Natasha Romanoff | 8.00 |
| Bruce Wayne      | 9.50 |
| Diana Prince     | 8.40 |
| Tony Stark       | 9.80 |
| Jean Grey        | 8.80 |

---
**Query #16**

    -- 16. Find staff members earning more than average salary of their department.
    SELECT staff_name, salary, department_id
    FROM Staff s1
    WHERE salary >
    (
        SELECT AVG(s2.salary)
        FROM Staff s2
        WHERE s1.department_id = s2.department_id
    );

| staff_name    | salary   | department_id |
| ------------- | -------- | ------------- |
| Alice Johnson | 95000.00 | 1             |
| Charlie Brown | 91000.00 | 2             |

---
**Query #17**

    -- 17. Display second highest salary among staff members.
    SELECT DISTINCT salary
    FROM Staff
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1;

| salary    |
| --------- |
| 120000.00 |

---
**Query #18**

    -- 18. Find students who scored highest marks in each subject.
    SELECT s.student_name,
           sub.subject_name,
           m.marks
    FROM Mark m
    JOIN Student s
    ON m.student_id = s.student_id
    JOIN Subject sub
    ON m.subject_id = sub.subject_id
    WHERE m.marks =
    (
        SELECT MAX(m2.marks)
        FROM Mark m2
        WHERE m.subject_id = m2.subject_id
    );

| student_name     | subject_name            | marks |
| ---------------- | ----------------------- | ----- |
| Tony Stark       | Database Systems        | 99    |
| Mary Jane        | Operating Systems       | 89    |
| Natasha Romanoff | Machine Design          | 81    |
| Steve Rogers     | Thermodynamics          | 72    |
| Bruce Wayne      | Digital Electronics     | 98    |
| Bruce Wayne      | Signals and Systems     | 94    |
| Diana Prince     | Structural Engineering  | 87    |
| Jean Grey        | Linear Algebra          | 90    |
| Logan Howlett    |                         | 73    |
| Tony Stark       | Artificial Intelligence | 97    |

---
**Query #19**

    -- 19. Display all students and their marks,
    -- including students without marks.
    SELECT s.student_name,
           m.subject_id,
           m.marks
    FROM Student s
    LEFT JOIN Mark m
    ON s.student_id = m.student_id;

| student_name     | subject_id | marks |
| ---------------- | ---------- | ----- |
| John Doe         | 201        | 88    |
| John Doe         | 201        | 91    |
| John Doe         | 202        | 75    |
| Mary Jane        | 201        | 95    |
| Mary Jane        | 202        | 89    |
| Steve Rogers     | 203        | 66    |
| Steve Rogers     | 204        | 72    |
| Natasha Romanoff | 203        | 81    |
| Bruce Wayne      | 205        | 98    |
| Bruce Wayne      | 206        | 94    |
| Clark Kent       | 205        | 54    |
| Clark Kent       | 206        | 61    |
| Diana Prince     | 207        | 87    |
| Peter Parker     | 207        |       |
| Tony Stark       | 201        | 99    |
| Tony Stark       | 210        | 97    |
| Wanda Maximoff   | 208        | 71    |
| Barry Allen      | 208        | 65    |
|                  | 209        |       |
| Scott Lang       | 210        | 44    |
| Jean Grey        | 208        | 90    |
| Logan Howlett    | 209        | 73    |

---
**Query #20**

    -- 20. Find subjects where average marks are below 70.
    SELECT sub.subject_name,
           AVG(m.marks) AS avg_marks
    FROM Subject sub
    JOIN Mark m
    ON sub.subject_id = m.subject_id
    GROUP BY sub.subject_name
    HAVING AVG(m.marks) < 70;

There are no results to be displayed.

---
**Query #21**

    -- 21. Display students ordered by CGPA in descending order.
    SELECT student_name, cgpa
    FROM Student
    ORDER BY cgpa DESC;

| student_name     | cgpa |
| ---------------- | ---- |
| Peter Parker     |      |
|                  |      |
| Tony Stark       | 9.80 |
| Bruce Wayne      | 9.50 |
| Mary Jane        | 9.10 |
| Jean Grey        | 8.80 |
| John Doe         | 8.70 |
| Diana Prince     | 8.40 |
| Natasha Romanoff | 8.00 |
| Logan Howlett    | 7.70 |
| Steve Rogers     | 7.50 |
| Wanda Maximoff   | 7.20 |
| Clark Kent       | 6.90 |
| Barry Allen      | 6.50 |
| Scott Lang       | 5.80 |

---
**Query #22**

    -- 22. Find total salary expenditure department-wise.
    SELECT d.department_name,
           SUM(st.salary) AS total_salary
    FROM Department d
    LEFT JOIN Staff st
    ON d.department_id = st.department_id
    GROUP BY d.department_name;

| department_name  | total_salary |
| ---------------- | ------------ |
|                  |              |
| Mechanical       | 146000.00    |
| Computer Science | 177000.00    |
| Mathematics      | 65000.00     |
| Electronics      | 99000.00     |
| Civil            | 120000.00    |
| Biotechnology    |              |

---
**Query #23**

    -- 23. Display departments where total salary exceeds 200000.
    SELECT d.department_name,
           SUM(st.salary) AS total_salary
    FROM Department d
    JOIN Staff st
    ON d.department_id = st.department_id
    GROUP BY d.department_name
    HAVING SUM(st.salary) > 200000;

There are no results to be displayed.

---
**Query #24**

    -- 24. Find students admitted after 2021 and having CGPA above 7.5.
    SELECT student_name, cgpa
    FROM Student
    WHERE admission_year > 2021
    AND cgpa > 7.5;

| student_name  | cgpa |
| ------------- | ---- |
| Diana Prince  | 8.40 |
| Logan Howlett | 7.70 |

---
**Query #25**

    -- 25. Display number of students admitted each year.
    SELECT admission_year,
           COUNT(*) AS total_students
    FROM Student
    GROUP BY admission_year
    ORDER BY admission_year;

| admission_year | total_students |
| -------------- | -------------- |
| 2019           | 2              |
| 2020           | 3              |
| 2021           | 4              |
| 2022           | 4              |
| 2023           | 2              |

---
**Query #26**

    -- 26. Find city with maximum number of students.
    SELECT city,
           COUNT(*) AS total_students
    FROM Student
    GROUP BY city
    ORDER BY total_students DESC
    LIMIT 1;

| city    | total_students |
| ------- | -------------- |
| Chicago | 2              |

---
**Query #27**

    -- 27. Display all departments and their staff count,
    -- including empty departments.
    SELECT d.department_name,
           COUNT(st.staff_id) AS total_staff
    FROM Department d
    LEFT JOIN Staff st
    ON d.department_id = st.department_id
    GROUP BY d.department_name;

| department_name  | total_staff |
| ---------------- | ----------- |
|                  | 0           |
| Mechanical       | 2           |
| Computer Science | 2           |
| Mathematics      | 1           |
| Electronics      | 2           |
| Civil            | 1           |
| Biotechnology    | 0           |

---
**Query #28**

    -- 28. Find students who failed in at least one subject (marks < 50).
    SELECT DISTINCT s.student_name
    FROM Student s
    JOIN Mark m
    ON s.student_id = m.student_id
    WHERE m.marks < 50;

| student_name |
| ------------ |
| Scott Lang   |

---
**Query #29**

    -- 29. Display staff hired before 2018.
    SELECT staff_name, hire_date
    FROM Staff
    WHERE hire_date < '2018-01-01';

| staff_name    | hire_date  |
| ------------- | ---------- |
| Alice Johnson | 2015-06-12 |
| Bob Smith     | 2017-09-01 |
| Charlie Brown | 2014-03-21 |
| Eva Green     | 2013-11-05 |
| Grace Miller  | 2010-02-28 |
| Ivy Clark     | 2012-04-17 |

---
**Query #30**

    -- 30. Find departments where no staff salary is recorded as NULL.
    SELECT d.department_name
    FROM Department d
    JOIN Staff st
    ON d.department_id = st.department_id
    GROUP BY d.department_name
    HAVING COUNT(*) = COUNT(st.salary);

| department_name  |
| ---------------- |
| Mechanical       |
| Computer Science |
| Mathematics      |
| Civil            |

---
**Query #31**

    -- 31. Assign a row number to students ordered by CGPA.
    SELECT 
        student_name,
        cgpa,
        ROW_NUMBER() OVER(ORDER BY cgpa DESC) AS row_num
    FROM Student;

| student_name     | cgpa | row_num |
| ---------------- | ---- | ------- |
| Peter Parker     |      | 1       |
|                  |      | 2       |
| Tony Stark       | 9.80 | 3       |
| Bruce Wayne      | 9.50 | 4       |
| Mary Jane        | 9.10 | 5       |
| Jean Grey        | 8.80 | 6       |
| John Doe         | 8.70 | 7       |
| Diana Prince     | 8.40 | 8       |
| Natasha Romanoff | 8.00 | 9       |
| Logan Howlett    | 7.70 | 10      |
| Steve Rogers     | 7.50 | 11      |
| Wanda Maximoff   | 7.20 | 12      |
| Clark Kent       | 6.90 | 13      |
| Barry Allen      | 6.50 | 14      |
| Scott Lang       | 5.80 | 15      |

---
**Query #32**

    -- 32. Rank students based on their CGPA.
    SELECT 
        student_name,
        cgpa,
        RANK() OVER(ORDER BY cgpa DESC) AS student_rank
    FROM Student;

| student_name     | cgpa | student_rank |
| ---------------- | ---- | ------------ |
| Peter Parker     |      | 1            |
|                  |      | 1            |
| Tony Stark       | 9.80 | 3            |
| Bruce Wayne      | 9.50 | 4            |
| Mary Jane        | 9.10 | 5            |
| Jean Grey        | 8.80 | 6            |
| John Doe         | 8.70 | 7            |
| Diana Prince     | 8.40 | 8            |
| Natasha Romanoff | 8.00 | 9            |
| Logan Howlett    | 7.70 | 10           |
| Steve Rogers     | 7.50 | 11           |
| Wanda Maximoff   | 7.20 | 12           |
| Clark Kent       | 6.90 | 13           |
| Barry Allen      | 6.50 | 14           |
| Scott Lang       | 5.80 | 15           |

---
**Query #33**

    -- 33. Display dense rank of staff salaries.
    SELECT 
        staff_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
    FROM Staff;

| staff_name    | salary    | dense_rank |
| ------------- | --------- | ---------- |
| Frank Hall    |           | 1          |
| Grace Miller  | 120000.00 | 2          |
| Eva Green     | 99000.00  | 3          |
| Ivy Clark     | 98000.00  | 4          |
| Alice Johnson | 95000.00  | 5          |
| Charlie Brown | 91000.00  | 6          |
| Bob Smith     | 82000.00  | 7          |
| Henry Ford    | 65000.00  | 8          |
| David Lee     | 55000.00  | 9          |
|               | 50000.00  | 10         |

---
**Query #34**

    -- 34. Find the top 3 highest scoring students using window functions.
    SELECT *
    FROM (
        SELECT 
            s.student_name,
            m.marks,
            ROW_NUMBER() OVER(ORDER BY m.marks DESC) AS rn
        FROM Student s
        JOIN Mark m
        ON s.student_id = m.student_id
    ) t
    WHERE rn <= 3;

| student_name | marks | rn  |
| ------------ | ----- | --- |
|              |       | 1   |
| Peter Parker |       | 2   |
| Tony Stark   | 99    | 3   |

---
**Query #35**

    -- 35. Display running total of marks for each student.
    SELECT 
        student_id,
        exam_date,
        marks,
        SUM(marks) OVER(
            PARTITION BY student_id
            ORDER BY exam_date
        ) AS running_total
    FROM Mark;

| student_id | exam_date  | marks | running_total |
| ---------- | ---------- | ----- | ------------- |
| 101        | 2024-03-10 | 88    | 88            |
| 101        | 2024-03-11 | 75    | 163           |
| 101        | 2024-05-10 | 91    | 254           |
| 102        | 2024-03-10 | 95    | 95            |
| 102        | 2024-05-11 | 89    | 184           |
| 103        | 2024-03-09 | 66    | 66            |
| 103        | 2024-05-12 | 72    | 138           |
| 104        | 2024-05-12 | 81    | 81            |
| 105        | 2024-03-14 | 98    | 98            |
| 105        | 2024-05-14 | 94    | 192           |
| 106        | 2024-03-14 | 54    | 54            |
| 106        | 2024-05-14 | 61    | 115           |
| 107        | 2024-03-16 | 87    | 87            |
| 108        | 2024-05-16 |       |               |
| 109        | 2024-03-20 | 97    | 97            |
| 109        | 2024-05-10 | 99    | 196           |
| 110        | 2024-03-18 | 71    | 71            |
| 111        | 2024-05-18 | 65    | 65            |
| 112        | 2024-03-21 |       |               |
| 113        | 2024-05-20 | 44    | 44            |
| 114        | 2024-03-18 | 90    | 90            |
| 115        | 2024-05-22 | 73    | 73            |

---
**Query #36**

    -- 36. Find the average marks for each subject using window functions.
    SELECT 
        subject_id,
        marks,
        AVG(marks) OVER(
            PARTITION BY subject_id
        ) AS average_marks
    FROM Mark;

| subject_id | marks | average_marks       |
| ---------- | ----- | ------------------- |
| 201        | 91    | 93.2500000000000000 |
| 201        | 99    | 93.2500000000000000 |
| 201        | 95    | 93.2500000000000000 |
| 201        | 88    | 93.2500000000000000 |
| 202        | 75    | 82.0000000000000000 |
| 202        | 89    | 82.0000000000000000 |
| 203        | 66    | 73.5000000000000000 |
| 203        | 81    | 73.5000000000000000 |
| 204        | 72    | 72.0000000000000000 |
| 205        | 98    | 76.0000000000000000 |
| 205        | 54    | 76.0000000000000000 |
| 206        | 61    | 77.5000000000000000 |
| 206        | 94    | 77.5000000000000000 |
| 207        |       | 87.0000000000000000 |
| 207        | 87    | 87.0000000000000000 |
| 208        | 65    | 75.3333333333333333 |
| 208        | 71    | 75.3333333333333333 |
| 208        | 90    | 75.3333333333333333 |
| 209        |       | 73.0000000000000000 |
| 209        | 73    | 73.0000000000000000 |
| 210        | 44    | 70.5000000000000000 |
| 210        | 97    | 70.5000000000000000 |

---
**Query #37**

    -- 37. Display previous exam marks for each student using LAG().
    SELECT 
        student_id,
        exam_date,
        marks,
        LAG(marks) OVER(
            PARTITION BY student_id
            ORDER BY exam_date
        ) AS previous_marks
    FROM Mark;

| student_id | exam_date  | marks | previous_marks |
| ---------- | ---------- | ----- | -------------- |
| 101        | 2024-03-10 | 88    |                |
| 101        | 2024-03-11 | 75    | 88             |
| 101        | 2024-05-10 | 91    | 75             |
| 102        | 2024-03-10 | 95    |                |
| 102        | 2024-05-11 | 89    | 95             |
| 103        | 2024-03-09 | 66    |                |
| 103        | 2024-05-12 | 72    | 66             |
| 104        | 2024-05-12 | 81    |                |
| 105        | 2024-03-14 | 98    |                |
| 105        | 2024-05-14 | 94    | 98             |
| 106        | 2024-03-14 | 54    |                |
| 106        | 2024-05-14 | 61    | 54             |
| 107        | 2024-03-16 | 87    |                |
| 108        | 2024-05-16 |       |                |
| 109        | 2024-03-20 | 97    |                |
| 109        | 2024-05-10 | 99    | 97             |
| 110        | 2024-03-18 | 71    |                |
| 111        | 2024-05-18 | 65    |                |
| 112        | 2024-03-21 |       |                |
| 113        | 2024-05-20 | 44    |                |
| 114        | 2024-03-18 | 90    |                |
| 115        | 2024-05-22 | 73    |                |

---
**Query #38**

    -- 38. Display next exam marks for each student using LEAD().
    SELECT 
        student_id,
        exam_date,
        marks,
        LEAD(marks) OVER(
            PARTITION BY student_id
            ORDER BY exam_date
        ) AS next_marks
    FROM Mark;

| student_id | exam_date  | marks | next_marks |
| ---------- | ---------- | ----- | ---------- |
| 101        | 2024-03-10 | 88    | 75         |
| 101        | 2024-03-11 | 75    | 91         |
| 101        | 2024-05-10 | 91    |            |
| 102        | 2024-03-10 | 95    | 89         |
| 102        | 2024-05-11 | 89    |            |
| 103        | 2024-03-09 | 66    | 72         |
| 103        | 2024-05-12 | 72    |            |
| 104        | 2024-05-12 | 81    |            |
| 105        | 2024-03-14 | 98    | 94         |
| 105        | 2024-05-14 | 94    |            |
| 106        | 2024-03-14 | 54    | 61         |
| 106        | 2024-05-14 | 61    |            |
| 107        | 2024-03-16 | 87    |            |
| 108        | 2024-05-16 |       |            |
| 109        | 2024-03-20 | 97    | 99         |
| 109        | 2024-05-10 | 99    |            |
| 110        | 2024-03-18 | 71    |            |
| 111        | 2024-05-18 | 65    |            |
| 112        | 2024-03-21 |       |            |
| 113        | 2024-05-20 | 44    |            |
| 114        | 2024-03-18 | 90    |            |
| 115        | 2024-05-22 | 73    |            |

---
**Query #39**

    -- 39. Find highest marks within each subject using MAX() OVER().
    SELECT 
        subject_id,
        student_id,
        marks,
        MAX(marks) OVER(
            PARTITION BY subject_id
        ) AS highest_marks
    FROM Mark;

| subject_id | student_id | marks | highest_marks |
| ---------- | ---------- | ----- | ------------- |
| 201        | 101        | 91    | 99            |
| 201        | 109        | 99    | 99            |
| 201        | 102        | 95    | 99            |
| 201        | 101        | 88    | 99            |
| 202        | 101        | 75    | 89            |
| 202        | 102        | 89    | 89            |
| 203        | 103        | 66    | 81            |
| 203        | 104        | 81    | 81            |
| 204        | 103        | 72    | 72            |
| 205        | 105        | 98    | 98            |
| 205        | 106        | 54    | 98            |
| 206        | 106        | 61    | 94            |
| 206        | 105        | 94    | 94            |
| 207        | 108        |       | 87            |
| 207        | 107        | 87    | 87            |
| 208        | 111        | 65    | 90            |
| 208        | 110        | 71    | 90            |
| 208        | 114        | 90    | 90            |
| 209        | 112        |       | 73            |
| 209        | 115        | 73    | 73            |
| 210        | 113        | 44    | 97            |
| 210        | 109        | 97    | 97            |

---
**Query #40**

    -- 40. Display cumulative average marks ordered by exam date.
    SELECT 
        exam_date,
        marks,
        AVG(marks) OVER(
            ORDER BY exam_date
        ) AS cumulative_average
    FROM Mark;

| exam_date  | marks | cumulative_average  |
| ---------- | ----- | ------------------- |
| 2024-03-09 | 66    | 66.0000000000000000 |
| 2024-03-10 | 95    | 83.0000000000000000 |
| 2024-03-10 | 88    | 83.0000000000000000 |
| 2024-03-11 | 75    | 81.0000000000000000 |
| 2024-03-14 | 98    | 79.3333333333333333 |
| 2024-03-14 | 54    | 79.3333333333333333 |
| 2024-03-16 | 87    | 80.4285714285714286 |
| 2024-03-18 | 71    | 80.4444444444444444 |
| 2024-03-18 | 90    | 80.4444444444444444 |
| 2024-03-20 | 97    | 82.1000000000000000 |
| 2024-03-21 |       | 82.1000000000000000 |
| 2024-05-10 | 91    | 84.2500000000000000 |
| 2024-05-10 | 99    | 84.2500000000000000 |
| 2024-05-11 | 89    | 84.6153846153846154 |
| 2024-05-12 | 72    | 83.5333333333333333 |
| 2024-05-12 | 81    | 83.5333333333333333 |
| 2024-05-14 | 61    | 82.8235294117647059 |
| 2024-05-14 | 94    | 82.8235294117647059 |
| 2024-05-16 |       | 82.8235294117647059 |
| 2024-05-18 | 65    | 81.8333333333333333 |
| 2024-05-20 | 44    | 79.8421052631578947 |
| 2024-05-22 | 73    | 79.5000000000000000 |

---
**Query #41**

    -- 41. Find the first student admitted in each department.
    SELECT *
    FROM (
        SELECT 
            student_name,
            department_id,
            admission_year,
            ROW_NUMBER() OVER(
                PARTITION BY department_id
                ORDER BY admission_year
            ) AS rn
        FROM Student
    ) t
    WHERE rn = 1;

| student_name     | department_id | admission_year | rn  |
| ---------------- | ------------- | -------------- | --- |
| Tony Stark       | 1             | 2019           | 1   |
| Natasha Romanoff | 2             | 2021           | 1   |
| Bruce Wayne      | 3             | 2019           | 1   |
| Peter Parker     | 4             | 2021           | 1   |
| Wanda Maximoff   | 5             | 2022           | 1   |
| Jean Grey        | 6             | 2020           | 1   |
| Logan Howlett    | 7             | 2022           | 1   |
| Scott Lang       |               | 2021           | 1   |

---
**Query #42**

    -- 42. Display the latest hired staff member in each department.
    SELECT *
    FROM (
        SELECT 
            staff_name,
            department_id,
            hire_date,
            ROW_NUMBER() OVER(
                PARTITION BY department_id
                ORDER BY hire_date DESC
            ) AS rn
        FROM Staff
    ) t
    WHERE rn = 1;

| staff_name   | department_id | hire_date  | rn  |
| ------------ | ------------- | ---------- | --- |
| Bob Smith    | 1             | 2017-09-01 | 1   |
| David Lee    | 2             | 2020-07-15 | 1   |
| Frank Hall   | 3             | 2021-01-12 | 1   |
| Grace Miller | 4             | 2010-02-28 | 1   |
| Henry Ford   | 5             |            | 1   |
|              |               | 2022-08-18 | 1   |

---
**Query #43**

    -- 43. Divide students into 4 CGPA quartiles using NTILE().
    SELECT 
        student_name,
        cgpa,
        NTILE(4) OVER(ORDER BY cgpa DESC) AS quartile
    FROM Student;

| student_name     | cgpa | quartile |
| ---------------- | ---- | -------- |
| Peter Parker     |      | 1        |
|                  |      | 1        |
| Tony Stark       | 9.80 | 1        |
| Bruce Wayne      | 9.50 | 1        |
| Mary Jane        | 9.10 | 2        |
| Jean Grey        | 8.80 | 2        |
| John Doe         | 8.70 | 2        |
| Diana Prince     | 8.40 | 2        |
| Natasha Romanoff | 8.00 | 3        |
| Logan Howlett    | 7.70 | 3        |
| Steve Rogers     | 7.50 | 3        |
| Wanda Maximoff   | 7.20 | 3        |
| Clark Kent       | 6.90 | 4        |
| Barry Allen      | 6.50 | 4        |
| Scott Lang       | 5.80 | 4        |

---
**Query #44**

    -- 44. Find percentage rank of students based on CGPA.
    SELECT 
        student_name,
        cgpa,
        PERCENT_RANK() OVER(ORDER BY cgpa DESC) AS percentage_rank
    FROM Student;

| student_name     | cgpa | percentage_rank     |
| ---------------- | ---- | ------------------- |
| Peter Parker     |      | 0                   |
|                  |      | 0                   |
| Tony Stark       | 9.80 | 0.14285714285714285 |
| Bruce Wayne      | 9.50 | 0.21428571428571427 |
| Mary Jane        | 9.10 | 0.2857142857142857  |
| Jean Grey        | 8.80 | 0.35714285714285715 |
| John Doe         | 8.70 | 0.42857142857142855 |
| Diana Prince     | 8.40 | 0.5                 |
| Natasha Romanoff | 8.00 | 0.5714285714285714  |
| Logan Howlett    | 7.70 | 0.6428571428571429  |
| Steve Rogers     | 7.50 | 0.7142857142857143  |
| Wanda Maximoff   | 7.20 | 0.7857142857142857  |
| Clark Kent       | 6.90 | 0.8571428571428571  |
| Barry Allen      | 6.50 | 0.9285714285714286  |
| Scott Lang       | 5.80 | 1                   |

---
**Query #45**

    -- 45. Display cumulative distribution of salaries.
    SELECT 
        staff_name,
        salary,
        CUME_DIST() OVER(ORDER BY salary DESC) AS cumulative_distribution
    FROM Staff;

| staff_name    | salary    | cumulative_distribution |
| ------------- | --------- | ----------------------- |
| Frank Hall    |           | 0.1                     |
| Grace Miller  | 120000.00 | 0.2                     |
| Eva Green     | 99000.00  | 0.3                     |
| Ivy Clark     | 98000.00  | 0.4                     |
| Alice Johnson | 95000.00  | 0.5                     |
| Charlie Brown | 91000.00  | 0.6                     |
| Bob Smith     | 82000.00  | 0.7                     |
| Henry Ford    | 65000.00  | 0.8                     |
| David Lee     | 55000.00  | 0.9                     |
|               | 50000.00  | 1                       |

---
**Query #46**

    -- 46. Find subjects where a student's marks are above subject average.
    SELECT *
    FROM (
        SELECT 
            student_id,
            subject_id,
            marks,
            AVG(marks) OVER(
                PARTITION BY subject_id
            ) AS avg_marks
        FROM Mark
    ) t
    WHERE marks > avg_marks;

| student_id | subject_id | marks | avg_marks           |
| ---------- | ---------- | ----- | ------------------- |
| 109        | 201        | 99    | 93.2500000000000000 |
| 102        | 201        | 95    | 93.2500000000000000 |
| 102        | 202        | 89    | 82.0000000000000000 |
| 104        | 203        | 81    | 73.5000000000000000 |
| 105        | 205        | 98    | 76.0000000000000000 |
| 105        | 206        | 94    | 77.5000000000000000 |
| 114        | 208        | 90    | 75.3333333333333333 |
| 109        | 210        | 97    | 70.5000000000000000 |

---
**Query #47**

    -- 47. Find departments whose average staff salary is higher than overall average salary.
    SELECT d.department_name,
           AVG(s.salary) AS avg_salary
    FROM Department d
    JOIN Staff s
    ON d.department_id = s.department_id
    GROUP BY d.department_name
    HAVING AVG(s.salary) >
    (
        SELECT AVG(salary)
        FROM Staff
    );

| department_name  | avg_salary          |
| ---------------- | ------------------- |
| Computer Science | 88500.000000000000  |
| Electronics      | 99000.000000000000  |
| Civil            | 120000.000000000000 |

---
**Query #48**

    -- 48. Display students who scored above department average marks.
    SELECT *
    FROM (
        SELECT 
            st.student_name,
            d.department_name,
            m.marks,
            AVG(m.marks) OVER(
                PARTITION BY d.department_name
            ) AS dept_avg_marks
        FROM Student st
        JOIN Department d
        ON st.department_id = d.department_id
        JOIN Mark m
        ON st.student_id = m.student_id
    ) t
    WHERE marks > dept_avg_marks;

| student_name     | department_name  | marks | dept_avg_marks      |
| ---------------- | ---------------- | ----- | ------------------- |
| Mary Jane        | Computer Science | 95    | 90.5714285714285714 |
| John Doe         | Computer Science | 91    | 90.5714285714285714 |
| Tony Stark       | Computer Science | 99    | 90.5714285714285714 |
| Tony Stark       | Computer Science | 97    | 90.5714285714285714 |
| Bruce Wayne      | Electronics      | 98    | 76.7500000000000000 |
| Bruce Wayne      | Electronics      | 94    | 76.7500000000000000 |
| Wanda Maximoff   | Mathematics      | 71    | 68.0000000000000000 |
| Natasha Romanoff | Mechanical       | 81    | 73.0000000000000000 |

---
**Query #49**

    -- 49. Find the 3rd highest mark using DENSE_RANK().
    SELECT *
    FROM (
        SELECT 
            student_id,
            subject_id,
            marks,
            DENSE_RANK() OVER(
                ORDER BY marks DESC
            ) AS rnk
        FROM Mark
    ) t
    WHERE rnk = 3;

| student_id | subject_id | marks | rnk |
| ---------- | ---------- | ----- | --- |
| 105        | 205        | 98    | 3   |

---
**Query #50**

    -- 50. Generate a report showing:
    -- student name,
    -- department,
    -- subject,
    -- exam type,
    -- marks,
    -- department average,
    -- overall rank.
    SELECT 
        st.student_name,
        d.department_name,
        sub.subject_name,
        m.exam_type,
        m.marks,
        AVG(m.marks) OVER(
            PARTITION BY d.department_name
        ) AS department_average,
    
        RANK() OVER(
            ORDER BY m.marks DESC
        ) AS overall_rank
    FROM Mark m
    JOIN Student st
    ON m.student_id = st.student_id
    JOIN Department d
    ON st.department_id = d.department_id
    JOIN Subject sub
    ON m.subject_id = sub.subject_id;

| student_name     | department_name  | subject_name            | exam_type | marks | department_average  | overall_rank |
| ---------------- | ---------------- | ----------------------- | --------- | ----- | ------------------- | ------------ |
| Logan Howlett    | Biotechnology    |                         | Final     | 73    | 73.0000000000000000 | 14           |
| Peter Parker     | Civil            | Structural Engineering  | Final     |       | 87.0000000000000000 | 1            |
| Diana Prince     | Civil            | Structural Engineering  | Mid       | 87    | 87.0000000000000000 | 11           |
| Mary Jane        | Computer Science | Database Systems        | Mid       | 95    | 90.5714285714285714 | 5            |
| Tony Stark       | Computer Science | Database Systems        | Final     | 99    | 90.5714285714285714 | 2            |
| John Doe         | Computer Science | Operating Systems       | Mid       | 75    | 90.5714285714285714 | 13           |
| John Doe         | Computer Science | Database Systems        | Final     | 91    | 90.5714285714285714 | 7            |
| Tony Stark       | Computer Science | Artificial Intelligence | Mid       | 97    | 90.5714285714285714 | 4            |
| Mary Jane        | Computer Science | Operating Systems       | Final     | 89    | 90.5714285714285714 | 9            |
| John Doe         | Computer Science | Database Systems        | Mid       | 88    | 90.5714285714285714 | 10           |
| Bruce Wayne      | Electronics      | Digital Electronics     | Mid       | 98    | 76.7500000000000000 | 3            |
| Bruce Wayne      | Electronics      | Signals and Systems     | Final     | 94    | 76.7500000000000000 | 6            |
| Clark Kent       | Electronics      | Digital Electronics     | Mid       | 54    | 76.7500000000000000 | 20           |
| Clark Kent       | Electronics      | Signals and Systems     | Final     | 61    | 76.7500000000000000 | 19           |
| Wanda Maximoff   | Mathematics      | Linear Algebra          | Mid       | 71    | 68.0000000000000000 | 16           |
| Barry Allen      | Mathematics      | Linear Algebra          | Final     | 65    | 68.0000000000000000 | 18           |
| Steve Rogers     | Mechanical       | Thermodynamics          | Final     | 72    | 73.0000000000000000 | 15           |
| Steve Rogers     | Mechanical       | Machine Design          | Mid       | 66    | 73.0000000000000000 | 17           |
| Natasha Romanoff | Mechanical       | Machine Design          | Final     | 81    | 73.0000000000000000 | 12           |
| Jean Grey        |                  | Linear Algebra          | Mid       | 90    | 90.0000000000000000 | 8            |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
