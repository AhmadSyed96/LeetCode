# Write your MySQL query statement below
WITH follower_counts AS
    (SELECT
        user1_id,
        user2_id,
        COUNT(*) as follower_count
    FROM
        (SELECT
            r1.user_id as user1_id, r1.follower_id as follower_id, r2.user_id as user2_id
        FROM
            relations r1
        JOIN
            relations r2 USING(follower_id)
        WHERE
            r1.user_id != r2.user_id) as common_followers
    GROUP BY 
        1,2)
SELECT
    user1_id, user2_id
FROM
    (SELECT 
        DISTINCT LEAST(user1_id, user2_id) as user1_id,
        GREATEST(user1_id,user2_id) as user2_id,
        RANK() OVER(ORDER BY follower_count DESC) as follower_rank
    FROM
        follower_counts) AS follower_ranks
WHERE
    follower_rank = 1