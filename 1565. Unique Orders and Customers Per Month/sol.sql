# Write your MySQL query statement below
SELECT
    LEFT(order_date, 7) AS month,
    count(order_id) AS order_count,
    count(DISTINCT customer_id) AS customer_count
FROM
    orders
WHERE 
    invoice>20
GROUP BY 
    1