# SQL Joins Assignment – Day 2

## 📌 Overview
This project demonstrates the use of different SQL JOIN operations using PostgreSQL.  
The assignment focuses on understanding how relational tables interact using:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN

The database simulates a simple academic management system containing:

- Students
- Courses
- Instructors
- Enrollments

---

# 📂 Database Schema

## Tables Used

### 1. instructors
Stores instructor details.

| Column | Type |
|--------|------|
| instructor_id | INT |
| instructor_name | VARCHAR |
| department | VARCHAR |

---

### 2. students
Stores student information.

| Column | Type |
|--------|------|
| student_id | INT |
| student_name | VARCHAR |
| email | VARCHAR |

---

### 3. courses
Stores course details.

| Column | Type |
|--------|------|
| course_id | INT |
| course_name | VARCHAR |
| instructor_id | INT |

---

### 4. enrollments
Stores enrollment records.

| Column | Type |
|--------|------|
| enrollment_id | INT |
| student_id | INT |
| course_id | INT |
| enrollment_date | DATE |

---

# 🚀 Topics Covered

- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- Handling NULL values
- Multi-table joins
- Relationship mapping
- Query filtering

---

# 📝 Tasks Performed

## 1. Display all students and the courses they are enrolled in
Used `LEFT JOIN` to include students without enrollments.

---

## 2. Find all courses with no students enrolled
Used `LEFT JOIN` with `NULL` filtering.

---

## 3. Display all instructors and the courses they teach
Included instructors without assigned courses.

---

## 4. Find courses without instructors
Filtered rows where `instructor_id IS NULL`.

---

## 5. Display students and enrollment information using RIGHT JOIN
Retrieved all enrollment records even if student data is missing.

---

## 6. Find students not enrolled in any course
Used `LEFT JOIN` and `NULL` conditions.

---

## 7. FULL OUTER JOIN on students and enrollments
Displayed matched and unmatched rows from both tables.

---

## 8. Find courses never enrolled by students
Identified unused courses.

---

## 9. FULL OUTER JOIN on instructors and courses
Displayed assigned and unassigned relationships.

---

## 10. Generate combined report
Displayed:

- Student Name
- Course Name
- Instructor Name

Even when some data was unavailable.

---

## ⭐ Bonus Challenge
Used `CROSS JOIN` to display every possible student-course combination.

---

# 💻 Sample Query

```sql
SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;
```

---

# 📊 Key Learning Outcomes

After completing this assignment, I learned:

- How JOINs combine related tables
- Difference between LEFT, RIGHT, and FULL OUTER JOIN
- Handling unmatched records
- Using CROSS JOIN for combinations
- Writing multi-table SQL queries
- Working with relational database structures

---

# 🛠️ Technologies Used

- PostgreSQL
- SQL
- DB Fiddle / pgAdmin

---

# 📌 Conclusion

This assignment strengthened my understanding of SQL JOIN operations and relational database concepts.  
It provided hands-on experience in combining multiple tables and retrieving meaningful insights from connected datasets.

