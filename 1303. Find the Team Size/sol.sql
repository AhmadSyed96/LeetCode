# Write your MySQL query statement below
SELECT
    employee_id, team_size
FROM
    employee
JOIN
    (SELECT
        team_id, count(*) as team_size
    FROM
        employee
    GROUP BY
        1) as team_sizes ON team_sizes.team_id = employee.team_id

/*
select
employee_id,
count(*) over(partition by team_id )as team_size
from
Employee
*/