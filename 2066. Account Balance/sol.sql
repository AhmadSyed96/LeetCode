# Write your MySQL query statement below
SELECT
    account_id,
    day,
    sum(a2) over(partition by account_id order by day) as balance
FROM
    (SELECT
        *,
        case type when 'Deposit' then amount else -1*amount end as a2
    FROM
        transactions) AS t1