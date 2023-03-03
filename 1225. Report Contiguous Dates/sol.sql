# Write your MySQL query statement below
SELECT
    status as period_state,
    MIN(day) as start_date,
    MAX(day) as end_date
FROM
    (SELECT
        day,
        rank() over(order by day) as ovr_rnk,
        status,
        rnk,
        (rank() over(order by day) - rnk) as inv
    FROM
        (SELECT fail_date as day, 'failed' as status, rank() over(order by fail_date) as rnk from failed where fail_date BETWEEN '2019-01-01' AND '2019-12-31'
        union
        SELECT success_date as day, 'succeeded' as status, rank() over(order by success_date) as rnk from succeeded where success_date BETWEEN '2019-01-01' AND '2019-12-31') AS t1) AS t2
GROUP BY
    inv, status
ORDER BY 
    2