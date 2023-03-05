# Write your MySQL query statement below
WITH cte AS
(SELECT
    customer_id, order_id, order_date,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) as rec
FROM
    orders)
SELECT
    name as customer_name, cte.customer_id, order_id, order_date
FROM
    cte
JOIN
    customers USING(customer_id)
WHERE
    rec < 4
ORDER BY
    1,2,4 DESC