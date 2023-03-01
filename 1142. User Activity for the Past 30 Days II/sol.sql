# Write your MySQL query statement below
SELECT COALESCE(round(avg(sessions_count),2),0) as average_sessions_per_user from
    (select
        user_id,
        count(distinct session_id) as sessions_count
    from
        activity
    where 
        activity_date > '2019-06-27'
    group by
        1) as sessions_counts