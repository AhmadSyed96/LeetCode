# # Write your MySQL query statement below
# SELECT 
#     t1.product_name, t1.product_id, orders.order_id, t1.order_date
# FROM    
#     (SELECT
#         product_name, products.product_id,
#         (SELECT
#             MAX(order_date) 
#         FROM
#             orders
#         WHERE
#             products.product_id = orders.product_id
#         GROUP BY
#             product_id) as order_date
#     FROM
#         products) as t1
# JOIN
#     orders ON t1.product_id=orders.product_id and t1.order_date=orders.order_date
# ORDER BY
#     1,2,3

# SELECT
#     product_name, orders.product_id, order_id, order_date 
# FROM
#     orders
# JOIN
#     products USING(product_id)
# WHERE
#     (product_id, order_date) = ANY
#         (SELECT
#             product_id, MAX(order_date)
#         FROM
#             orders
#         GROUP BY
#             1)
# ORDER BY
#     1,2,3

SELECT
    product_name, product_id, order_id, order_date
FROM
    (SELECT
        product_id, order_id, order_date, RANK() OVER(partition by product_id order by order_date DESC) as prod_recency
    FROM
        orders) as ranks
JOIN
    products USING(product_id)
WHERE 
    prod_recency = 1
ORDER BY
    1,2,3

