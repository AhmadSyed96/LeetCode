# Write your MySQL query statement below
SELECT
    person_name
FROM
    (SELECT
        *,
        SUM(weight) OVER(order by turn) AS acc_weight
    FROM
        queue) AS t1
WHERE
    acc_weight <= 1000
ORDER by
    acc_weight DESC
LIMIT 1