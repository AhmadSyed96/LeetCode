# Write your MySQL query statement below
WITH cte AS
(SELECT *
FROM Enrollments
WHERE (student_id, grade) = ANY(SELECT student_id, MAX(grade) FROM Enrollments GROUP BY 1))
SELECT
    student_id, MIN(course_id) AS course_id, grade
FROM
    cte
GROUP BY 
    1,3
ORDER BY
    1