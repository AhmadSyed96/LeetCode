# Write your MySQL query statement below
SELECT
    customer_id, name
FROM
    (SELECT
        customer_id,SUM(quantity*price) AS total
    FROM
        orders
    JOIN
        product USING(product_id)
    WHERE
        year(order_date)=2020 and month(order_date) in (6,7)
    GROUP BY
        1, month(order_date)) AS t1
JOIN
    customers USING(customer_id )
GROUP BY 1
HAVING SUM(total >= 100) = 2


# # Write your MySQL query statement below
# select customer_id, name
# from Customers join Orders using(customer_id)
#                join Product using (product_id)
# group by customer_id
# having sum(if(left(order_date, 7) = '2020-06', quantity * price, 0)) >= 100
# and sum(if(left(order_date, 7) = '2020-07', quantity * price, 0)) >= 100