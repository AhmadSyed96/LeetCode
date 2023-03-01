# Write your MySQL query statement below
SELECT
    sales.product_id, sum(quantity) as total_quantity
FROM
    sales
GROUP BY
    1