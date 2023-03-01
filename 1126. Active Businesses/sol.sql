# Write your MySQL query statement below
WITH cte AS
(SELECT
    *, 
    avg(occurences) over(partition by event_type) as average_activity,
    count(event_type) over(partition by business_id) as event_count
FROM
    events)
SELECT 
    business_id
FROM
    cte
GROUP BY 
    1
HAVING
    sum(occurences > average_activity) > 1
