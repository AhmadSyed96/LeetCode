# Write your MySQL query statement below
WITH match_by_team AS    
    (SELECT
        row_number() over() as match_id, 
        home_team_id as team, 
        home_team_goals as goal_for, 
        away_team_goals as goal_against,
        case when home_team_goals > away_team_goals then 3 when home_team_goals = away_team_goals then 1 else 0 end as points
    FROM
        matches

    UNION

    SELECT
        row_number() over() as match_id, 
        away_team_id as team,
        away_team_goals as goal_for,
        home_team_goals as goal_against,
        case when away_team_goals > home_team_goals then 3 when away_team_goals = home_team_goals then 1 else 0 end as points
    FROM
        matches)
SELECT
    teams.team_name,
    COALESCE(t1.matches_played,0) as matches_played,
    COALESCE(t1.points,0) as points,
    COALESCE(t1.goal_for,0) as goal_for,
    COALESCE(t1.goal_against,0) as goal_against,
    COALESCE(t1.goal_diff,0) as goal_diff
FROM
    teams
JOIN
    (SELECT 
        team as team_id,
        count(*) as matches_played,
        SUM(points) as points,
        SUM(goal_for) as goal_for,
        SUM(goal_against) as goal_against,
        SUM(goal_for-goal_against) as goal_diff
    FROM
        match_by_team
    GROUP BY
        1) AS t1 USING(team_id)
ORDER BY
    3 DESC, 6 DESC, 1