# Write your MySQL query statement below
SELECT MAX(num) AS num
FROM
(SELECT
    num
FROM
    MyNumbers
GROUP BY
    1
HAVING
    count(*) = 1 ) as nums