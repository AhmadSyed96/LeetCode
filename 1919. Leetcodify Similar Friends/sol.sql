# Write your MySQL query statement below
WITH friends_extrap as
    (SELECT user1_id, user2_id FROM friendship UNION SELECT user2_id, user1_id FROM friendship),
possible_recs as
    (SELECT
        l1.user_id as user_id,
        l2.user_id as recommended_id,
        count(distinct l1.song_id) as cnt
    FROM
        listens l1
    JOIN
        listens l2 ON l1.user_id<>l2.user_id
        AND l1.day=l2.day
        AND l1.song_id=l2.song_id
    GROUP BY
        1,2,l1.day
    HAVING 
        cnt>2)
SELECT
    LEAST(user_id, recommended_id) AS user1_id, GREATEST(user_id, recommended_id) AS user2_id
FROM
    possible_recs
WHERE
    (user_id, recommended_id) in (SELECT * FROM friends_extrap)
group by 
    1,2