# SELECT
#     *
# FROM
#     orders
# WHERE
#     order_id NOT IN
#     (SELECT
#         order_id
#     FROM
#         orders
#     JOIN
#         (SELECT
#             DISTINCT customer_id
#         FROM
#             orders
#         WHERE
#             order_type = 0) AS customers USING(customer_id)
#     WHERE
#         order_type=1)

SELECT * FROM orders WHERE order_type=0
UNION
SELECT * FROM orders WHERE order_type=1 AND customer_id NOT IN (SELECT DISTINCT customer_id FROM orders WHERE order_type=0)



# # Write your MySQL query statement below
# SELECT order_id, customer_id, order_type
# FROM Orders
# WHERE (customer_id, order_type) IN 
#                 (SELECT customer_id, MIN(order_type) 
#                  FROM Orders GROUP BY customer_id);