# Write your MySQL query statement below
SELECT
    count(*) as accounts_count
FROM
    subscriptions
WHERE
    year(start_date)<=2021 AND year(end_date)>=2021
    AND account_id NOT IN (SELECT account_id FROM streams WHERE year(stream_date)=2021)