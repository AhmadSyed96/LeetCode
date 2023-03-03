# Write your MySQL query statement below
WITH match_per_team as 
    (SELECT match_id, host_team as team, case when host_goals>guest_goals then 3 when host_goals=guest_goals then 1 else 0 end as points FROM matches
    UNION
    SELECT match_id, guest_team as team, case when guest_goals>host_goals then 3 when guest_goals=host_goals then 1 else 0 end as points FROM matches)
SELECT
    team_id, team_name, COALESCE(num_points,0) as num_points
FROM
    (SELECT
        team,
        SUM(points) as num_points
    FROM
        match_per_team
    GROUP BY
        1) AS points_by_team
RIGHT JOIN
    teams on teams.team_id=points_by_team.team
ORDER BY
    num_points DESC,team_id