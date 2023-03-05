# Write your MySQL query statement below
SELECT
    order_id
    # SUM(quantity),
    # COUNT(DISTINCT product_id),
    # MAX(quantity)
FROM
    ordersdetails od1
GROUP BY
    1
HAVING
    MAX(quantity) > 
        (SELECT MAX(avg1) FROM(SELECT
            SUM(quantity)/COUNT(DISTINCT product_id) as avg1
        FROM
            ordersdetails od2
        GROUP BY
            order_id) as t1)