# Write your MySQL query statement below
SELECT
    t1.team_name as home_team,
    t2.team_name as away_team
FROM
    teams t1
JOIN 
    teams t2
WHERE
    t1.team_name!=t2.team_name