# Write your MySQL query statement below
SELECT
    student_id, student_name
FROM
    (SELECT 
        *, 
        MAX(score) OVER(PARTITION BY exam_id) as mx, 
        MIN(score) OVER(PARTITION BY exam_id ) as mn
    FROM 
        exam) as t1
JOIN
    student USING(student_id)
GROUP BY
    1
HAVING SUM(score = mx) = 0 and sum(score = mn) = 0
