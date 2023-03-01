# Write your MySQL query statement below
SELECT
    dept_name,
    IFNULL(count(student_id),0) AS student_number
FROM
    student
RIGHT JOIN
    department USING(dept_id)
GROUP BY
    1
ORDER BY
    2 DESC