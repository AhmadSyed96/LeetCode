# Write your MySQL query statement below
SELECT
    sell_date, count(DISTINCT product) as num_sold, GROUP_CONCAT(DISTINCT product) as products
FROM
    Activities
GROUP BY
    1