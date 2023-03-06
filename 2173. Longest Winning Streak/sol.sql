SELECT
    players.player_id,
    COALESCE(MAX(endd-strt) + 1,0) as longest_streak
FROM
    (SELECT
        player_id,
        MIN(game_num) as strt,
        MAX(game_num) as endd
    FROM
        (SELECT
            *,
            CAST(row_number() over() AS SIGNED) as rn
        FROM
            (SELECT
                *,
                CAST(row_number() over(partition by player_id order by match_day) AS SIGNED) as game_num
            FROM
                matches) AS t1
        WHERE 
            result='Win') AS t2
    GROUP BY
        player_id, game_num-rn) AS t3
RIGHT JOIN
    (SELECT DISTINCT player_id FROM matches) as players USING(player_id)
GROUP BY
    1




# WITH cte AS
#     (select player_id, match_day, result, 
#     row_number() over (partition by player_id order by match_day) as rnk,
#     row_number() over (partition by player_id,result order by match_day) as rnk2
#     from matches)
# select distinct player_id, count(*) as streak
# from cte
# where result='Win'
# group by player_id,rnk-rnk2