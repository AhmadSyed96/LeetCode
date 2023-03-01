# Write your MySQL query statement below
WITH cte AS
    (SELECT
        transactions.*, chargebacks.trans_date as chargeback_date
    FROM
        transactions
    LEFT JOIN
        chargebacks on transactions.id=chargebacks.trans_id)
SELECT
    chargeback_totals.month, chargeback_totals.country, COALESCE(approved_count,0) as approved_count, COALESCE(approved_amount,0) as approved_amount, COALESCE(chargeback_count,0) AS chargeback_count, COALESCE(chargeback_amount,0) AS chargeback_amount
FROM    
    (SELECT
        left(chargeback_date,7) as month, country, count(*) as chargeback_count, SUM(amount) as chargeback_amount
    FROM
        cte
    WHERE
        chargeback_date
    GROUP BY 1,2) AS chargeback_totals
LEFT JOIN
    (SELECT
        left(trans_date,7) as month, country, count(*) as approved_count, SUM(amount) as approved_amount
    FROM
        cte
    WHERE 
        state='approved'
    GROUP BY
        1,2) AS approved_totals USING(month,country)
UNION
SELECT
    approved_totals.month, approved_totals.country, COALESCE(approved_count,0) as approved_count, COALESCE(approved_amount,0) as approved_amount, COALESCE(chargeback_count,0) AS chargeback_count, COALESCE(chargeback_amount,0) AS chargeback_amount
FROM    
    (SELECT
        left(chargeback_date,7) as month, country, count(*) as chargeback_count, SUM(amount) as chargeback_amount
    FROM
        cte
    WHERE
        chargeback_date
    GROUP BY 1,2) AS chargeback_totals
RIGHT JOIN
    (SELECT
        left(trans_date,7) as month, country, count(*) as approved_count, SUM(amount) as approved_amount
    FROM
        cte
    WHERE 
        state='approved'
    GROUP BY
        1,2) AS approved_totals USING(month,country)