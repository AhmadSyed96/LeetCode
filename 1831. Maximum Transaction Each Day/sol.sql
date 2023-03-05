# Write your MySQL query statement below
WITH cte AS
    (SELECT
        *,
        max(amount) over(partition by DATE(day)) as mx
    FROM
        transactions)
SELECT
    transaction_id
FROM
    cte
WHERE
    amount = mx
ORDER BY 1
