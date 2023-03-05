# Write your MySQL query statement below
SELECT
    DATE_FORMAT(day, '%W, %M %e, %Y') as day
FROM
    days