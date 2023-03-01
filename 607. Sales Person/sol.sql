# Write your MySQL query statement below
SELECT
    sp.name
FROM
    SalesPerson sp
WHERE
    sp.sales_id NOT IN (SELECT DISTINCT sales_id FROM Orders JOIN Company USING(com_id) WHERE name LIKE 'RED')