# Write your MySQL query statement below
SELECT
    signups.user_id,
    round(sum(case action when 'confirmed' then 1 else 0 end) / count(*),2) as confirmation_rate
FROM
    confirmations
RIGHT JOIN
    signups USING(user_id)
GROUP BY
    1   
