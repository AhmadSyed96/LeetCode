# Write your MySQL query statement below
WITH cte as
    (SELECT
        *
    FROM
        trips
    WHERE
        client_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
        AND driver_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes'))
SELECT
    request_at AS Day,
    ROUND((SELECT sum(status like 'cancel%')/count(*) FROM cte cte2 WHERE cte.request_at = cte2.request_at),2) as "Cancellation Rate"
FROM
    cte
WHERE
    request_at between '2013-10-01' and '2013-10-03'
GROUP BY
    1