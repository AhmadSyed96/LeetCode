# Write your MySQL query statement below
SELECT
    eu.unique_id, name
FROM
    employeeuni eu
RIGHT JOIN
    employees e USING(id)