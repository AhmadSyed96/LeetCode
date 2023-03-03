# Write your MySQL query statement below
SELECT
    product_name,SUM(unit) AS unit
FROM
    orders
JOIN
    products USING(product_id)
WHERE
    left(order_date,7)='2020-02'
GROUP BY
    1
HAVING 
    SUM(unit)>99