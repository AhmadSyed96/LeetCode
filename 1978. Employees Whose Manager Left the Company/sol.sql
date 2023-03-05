# Write your MySQL query statement below
WITH cte AS
    (SELECT employee_id, name, NULLIF(manager_id,0) as manager_id, salary  FROM employees)
SELECT
    employee_id
FROM
    cte 
WHERE
    salary<30000 AND manager_id not in (select employee_id from cte)
ORDER BY
    1