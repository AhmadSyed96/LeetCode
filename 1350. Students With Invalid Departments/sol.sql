# Write your MySQL query statement below
SELECT
    students.id, students.name
FROM
    students
LEFT JOIN 
    departments ON students.department_id=departments.id
WHERE
    departments.id IS NULL