# Write your MySQL query statement below
WITH per_manager as
    (SELECT
        reports_to as employee_id, count(*) as reports_count, round(avg(age),0) as average_age
    FROM
        employees 
    WHERE 
        reports_to IS NOT NULL
    GROUP BY 
        1)
select
    per_manager.employee_id, employees.name, reports_count, average_age
from
    per_manager
join
    employees using(employee_id)
order by 
    1
    
/*
SELECT m.employee_id 
     , m.name
     , COUNT(e.employee_id) AS reports_count
     , ROUND(AVG(e.age),0) AS average_age 
FROM employees e
JOIN employees m 
  ON e.reports_to = m.employee_id 
GROUP BY m.employee_id
ORDER BY m.employee_id
*/