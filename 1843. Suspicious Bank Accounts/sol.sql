# Write your MySQL query statement below
WITH cte AS
    (SELECT
        t1.*, max_income
    FROM   
        (SELECT
            account_id, date_format(day, '%Y-%m-01') as mnth, SUM(amount) AS total
        FROM
            transactions
        WHERE
            type='Creditor'
        GROUP BY
            1,2) AS t1
    JOIN
        accounts USING(account_id)
    WHERE 
        total>max_income)
SELECT
    DISTINCT m1.account_id
FROM
    cte m1
JOIN
    cte m2 ON m1.account_id=m2.account_id
    and m1.mnth+interval 1 month=m2.mnth