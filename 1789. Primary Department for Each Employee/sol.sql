# Write your MySQL query statement below
SELECT
    employee_id, department_id
FROM
    employee
WHERE
    primary_flag='Y'

UNION

SELECT
    employee_id, department_id
FROM
    employee
GROUP BY
    1
HAVING 
    count(*) = 1
    