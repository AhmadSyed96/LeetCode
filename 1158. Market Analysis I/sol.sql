# Write your MySQL query statement below
SELECT
    user_id as buyer_id, join_date, COALESCE(COUNT(order_id),0) AS orders_in_2019
FROM
    Users
LEFT JOIN
    (SELECT * FROM Orders WHERE YEAR(order_date) = '2019') AS filt_ords ON Users.user_id = filt_ords.buyer_id
GROUP BY
    1,2