# Write your MySQL query statement below
WITH cte AS
    (SELECT
        items.*, orders.order_id, orders.quantity, orders.order_date,
        DAYNAME(order_date) AS dy
    FROM 
        orders
    RIGHT JOIN
        items USING(item_id))
SELECT
    item_category AS CATEGORY,
    SUM(case dy when 'Monday' then quantity else 0 end) as MONDAY,
    SUM(case dy when 'Tuesday' then quantity else 0 end) as TUESDAY,
    SUM(case dy when 'Wednesday' then quantity else 0 end) as WEDNESDAY,
    SUM(case dy when 'Thursday' then quantity else 0 end) as THURSDAY,
    SUM(case dy when 'Friday' then quantity else 0 end) as FRIDAY,
    SUM(case dy when 'Saturday' then quantity else 0 end) as SATURDAY,
    SUM(case dy when 'Sunday' then quantity else 0 end) as SUNDAY
FROM
    cte
GROUP BY
    1
ORDER BY
    1