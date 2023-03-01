# Write your MySQL query statement below
SELECT
    first_login as login_date,
    count(*) as user_count
FROM
    (SELECT
        user_id,
        MIN(activity_date) as first_login
    FROM
        traffic
    where activity = 'login'
    GROUP BY
        1) AS first_logins
WHERE
    first_login between date_add('2019-06-30', interval -90 day) and '2019-06-30'
GROUP BY    
    1
ORDER BY 1