# Write your MySQL query statement below
SELECT
    e.employee_id
FROM
    Employees e
LEFT JOIN
    Salaries s ON e.employee_id = s.employee_id
WHERE 
    salary IS NULL

UNION

SELECT
    s.employee_id
FROM
    Salaries s
LEFT JOIN
    Employees e ON e.employee_id = s.employee_id
WHERE 
    name IS NULL

ORDER BY 1