# Write your MySQL query statement below
SELECT
    department.name as Department, t1.name AS Employee, salary AS Salary
FROM
    (SELECT
        *,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM
        employee) AS t1
JOIN
    department ON t1.departmentId = department.id
WHERE 
    rnk < 4