# Write your MySQL query statement below
WITH trans_per_cust AS
    (SELECT trans_id, paid_by as user_id, amount*-1 as amount FROM transactions
    UNION
    SELECT trans_id, paid_TO as user_id, amount FROM transactions)
SELECT
    users.user_id, users.user_name,
    (COALESCE(total,0)+credit) as credit,
    case when (COALESCE(total,0)+credit)>0 then 'No' else 'Yes' end as credit_limit_breached
FROM
    users
LEFT JOIN    
    (SELECT 
        user_id,
        sum(amount) as total
    FROM
        trans_per_cust
    GROUP BY
        1) AS t1 USING(user_id)