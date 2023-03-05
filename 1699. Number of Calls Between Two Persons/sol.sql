# Write your MySQL query statement below
SELECT
    distinct least(from_id, to_id) as person1, 
    greatest(from_id, to_id) as person2, 
    count(*) as call_count,
    sum(duration) as total_duration
FROM
    calls
GROUP BY
    1,2