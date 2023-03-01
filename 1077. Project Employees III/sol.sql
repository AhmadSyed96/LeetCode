# Write your MySQL query statement below
WITH cte AS
(SELECT
    project_id, employee_id, experience_years, rank() over(partition by project_id order by experience_years desc) as exprnk
FROM
    project
JOIN
    employee USING(employee_id)
)

SELECT
    project_id, employee_id
FROM    
    cte
WHERE
    exprnk = 1