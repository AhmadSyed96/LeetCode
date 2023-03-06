# Write your MySQL query statement below
SELECT
    DISTINCT user_id
FROM    
    (SELECT
        *,
        LAG(purchase_date) OVER(PARTITION BY user_id ORDER BY purchase_date) as prev
    FROM
        purchases) AS t1
WHERE DATEDIFF(purchase_date, prev) <=7