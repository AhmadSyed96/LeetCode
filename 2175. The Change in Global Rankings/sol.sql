# Write your MySQL query statement below
SELECT
    team_id, name,
    # rank() over(order by points DESC, name) as og_rnk,
    # rank() over(order by points + points_change DESC, name) as new_rnk,
    CAST(rank() over(order by points DESC, name) AS SIGNED) - CAST(rank() over(order by points + points_change DESC, name) AS SIGNED) as rank_diff
FROM
    teampoints
JOIN
    pointschange USING(team_id)