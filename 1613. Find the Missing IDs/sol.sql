# Write your MySQL query statement below
WITH RECURSIVE cte AS
    (SELECT 1 as lvl
    union
    SELECT lvl + 1 FROM cte WHERE lvl < (SELECT MAX(customer_id) FROM customers))

SELECT
    lvl as ids
FROM
    cte
WHERE 
    lvl NOT IN (SELECT customer_id FROM customers)
