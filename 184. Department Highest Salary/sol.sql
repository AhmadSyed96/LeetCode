# Write your MySQL query statement below\
SELECT  
    d.name as department, e.name as employee, salary
FROM
    employee e
JOIN
    department d ON e.departmentid=d.id
WHERE
    (departmentid, salary) = ANY
    (SELECT
        departmentid, MAX(salary)
    FROM
        employee
    GROUP BY
        1)