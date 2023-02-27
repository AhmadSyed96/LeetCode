# Write your MySQL query statement below
SELECT
    round(count(*)/(SELECT COUNT(DISTINCT player_id) FROM activity),2) as fraction
FROM
    (SELECT
        player_id, MIN(event_date) as first_login_date
    FROM
        activity
    GROUP BY 
        1) as first_login_dates
JOIN
    (SELECT  
        DISTINCT player_id, event_date
    FROM
        activity) as distinct_dates_per_palyer ON first_login_dates.player_id = distinct_dates_per_palyer.player_id 
    AND DATEDIFF(distinct_dates_per_palyer.event_date, first_login_dates.first_login_date)=1

# SELECT  
#     DISTINCT player_id, event_date
# FROM
#     activity

