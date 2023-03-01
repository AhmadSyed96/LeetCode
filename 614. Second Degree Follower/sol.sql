# Write your MySQL query statement below
SELECT
    followee as follower,
    count(*) as num 
FROM
    follow
WHERE
    followee in (SELECT DISTINCT follower FROM follow)
GROUP BY
    1
ORDER BY
    1