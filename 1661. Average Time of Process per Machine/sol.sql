# Write your MySQL query statement below
WITH pivoted as     
    (SELECT
        machine_id,
        process_id,
        SUM(case activity_type when 'start' then round(timestamp,3) else null end) as strt,
        SUM(case activity_type when 'end' then round(timestamp,3) else null end) as ed
    FROM
        activity
    GROUP BY
        1,2)
SELECT
    machine_id,
    ROUND(avg(ed-strt),3) as processING_time
FROM
    pivoted
GROUP BY 
    1