# Write your MySQL query statement below
SELECT
    round(100*SUM(case when order_date=customer_pref_delivery_date then 1 else 0 end)/count(*),2) as immediate_percentage
FROM
    (SELECT
        customer_id, order_date, customer_pref_delivery_date
    FROM
        delivery
    WHERE
        (customer_id, order_date) in
        (SELECT customer_id, MIN(order_date) FROM delivery GROUP BY 1)) AS t1