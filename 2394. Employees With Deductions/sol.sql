# Write your MySQL query statement below
WITH cte AS
    (SELECT
        employees.employee_id, COALESCE(CEIL(SUM(TIMESTAMPDIFF(second, in_time, out_time)/60)),0) AS tot_sec
    FROM
        logs
    RIGHT JOIN
        employees USING(employee_id)
    GROUP BY
        1)
SELECT 
    cte.employee_id
FROM
    cte
JOIN
    employees ON employees.employee_id=cte.employee_id
    and tot_sec < employees.needed_hours*60
