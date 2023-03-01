# Write your MySQL query statement below
WITH match_per_player as
    (SELECT match_id, first_player as player_id, first_score as score FROM matches
    UNION
    SELECT match_id, second_player as player_id, second_score as score FROM matches),
accumulated_scores as    
    (SELECT
        group_id, player_id, sum(score) as total_score
    FROM
        match_per_player
    JOIN
        players USING(player_id)
    GROUP BY 
        1,2)
SELECT
    group_id AS GROUP_ID, MIN(player_id) AS PLAYER_ID
FROM
    (SELECT
        group_id, player_id
    FROM
        accumulated_scores
    WHERE
        (group_id,total_score) = ANY (SELECT group_id, MAX(total_score) FROM accumulated_scores GROUP BY 1)) AS t1
GROUP BY
    1