# Write your MySQL query statement below
SELECT
    name as customers
FROM
    customers
WHERE
    id NOT IN (SELECT DISTINCT customerid FROM orders)