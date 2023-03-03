# Write your MySQL query statement below
SELECT
    s.student_id, s.student_name, s.subject_name, count(e.subject_name) as attended_exams
FROM
    examinations e
RIGHT JOIN
    (SELECT
        *
    FROM
        students
    CROSS JOIN
        subjects) s ON e.student_id = s.student_id AND e.subject_name = s.subject_name
GROUP BY
    1,2,3
ORDER BY
    1, 2