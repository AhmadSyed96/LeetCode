# Write your MySQL query statement below
SELECT
    name, SUM(amount) AS balance
FROM
    Transactions
JOIN
    Users USING(account)
GROUP BY
    1
HAVING
    SUM(amount) > 10000