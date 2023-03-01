# Write your MySQL query statement below
WITH cte AS    
    (SELECT
        *,
        case when (player_id, install_date+interval 1 day) in (SELECT player_id,event_date FROM activity) then 1 else 0 end as day_one_retained
    FROM
        (SELECT
            player_id,
            MIN(event_date) AS install_date
        FROM
            activity
        GROUP BY
            1) AS t1)
SELECT
    install_date as install_dt,
    count(*) as installs,
    round(sum(day_one_retained)/count(*),2) as Day1_retention
FROM
    cte
GROUP BY
    1




# # Write your MySQL query statement below
# SELECT
# install_dt,
# COUNT(DISTINCT player_id) installs,
# ROUND(SUM(event_date = install_dt + INTERVAL 1 DAY) / COUNT(DISTINCT player_id),2) Day1_retention
# FROM
# (SELECT *, MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date) install_dt FROM activity) temp
# GROUP BY 1