# Write your MySQL query statement below
SELECT
    class
FROM
    courses
GROUP BY
    1
HAVING
    COUNT(*) > 4