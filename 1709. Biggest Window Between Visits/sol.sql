# Write your MySQL query statement below
WITH cte AS
(SELECT
    *,
    DATEDIFF(next_visit_date, visit_date) as days_between
FROM
    (SELECT
        *,
        COALESCE(LEAD(visit_date) OVER(PARTITION BY user_id ORDER BY visit_date), STR_TO_DATE('2021-01-01','%Y-%m-%d')) as next_visit_date
    FROM
        uservisits) AS t1)
SELECT
    DISTINCT user_id,
    days_between AS biggest_window
FROM
    (SELECT
        *,
        RANK() OVER(PARTITION BY user_id ORDER BY days_between DESC) as wind_rnk
    FROM
        cte) AS rankings
WHERE
    wind_rnk = 1