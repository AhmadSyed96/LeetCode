# Write your MySQL query statement below
SELECT
    gender, day, SUM(score_points) OVER(PARTITION BY gender ORDER BY day) AS total
FROM
    scores
GROUP BY
    1,2
ORDER BY
    1,2