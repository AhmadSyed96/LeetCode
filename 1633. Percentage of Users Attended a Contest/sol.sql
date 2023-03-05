# Write your MySQL query statement below
SELECT
    contest_id, ROUND(100*count(*)/(SELECT count(*) FROM Users),2) AS percentage
FROM
    Register
GROUP BY
    1
ORDER BY
    2 DESC, 1 