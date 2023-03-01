# Write your MySQL query statement below
WITH cte as
    (SELECT
        distinct_posts_reported_as_spam_per_day.post_id,
        distinct_posts_reported_as_spam_per_day.action_date,
        remove_date IS NOT NULL as rem
    FROM
        (SELECT
            DISTINCT post_id, action_date
        FROM
            actions
        WHERE
            extra='spam') AS distinct_posts_reported_as_spam_per_day
    LEFT JOIN
        removals USING(post_id))
SELECT
    ROUND(AVG(percentage) * 100,2) AS average_daily_percent
FROM
    (SELECT  
        sum(rem)/count(rem) as percentage
    FROM
        cte
    GROUP BY
        action_date) AS t1