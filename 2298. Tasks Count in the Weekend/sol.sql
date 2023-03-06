# Write your MySQL query statement below
SELECT
    SUM(CASE day_type WHEN 'weekday' THEN 1 END) AS weekend_cnt,
    SUM(CASE day_type WHEN 'workday' THEN 1 END) AS working_cnt
FROM
    (SELECT
        *,
        CASE dAYofweek(submit_date) WHEN 1 THEN  'weekday' WHEN 7 THEN  'weekday' ELSE 'workday' END as day_type
    FROM
        tasks) AS t1

/*
# Write your MySQL query statement below
select 
sum(case when weekday(submit_date) >= 5 then 1 else 0 end) as weekend_cnt, 
sum(case when weekday(submit_date) < 5 then 1 else 0 end) as working_cnt
from tasks
*/