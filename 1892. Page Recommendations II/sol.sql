/* Write your T-SQL query statement below */
WITH cte AS
    (SELECT 
        user1_id as user_id, 
        page_id,
        COUNT(*) as friends_likes
    FROM
        (SELECT user1_id, user2_id FROM Friendship
        union
        SELECT user2_id, user1_id FROM Friendship) as all_friends
    JOIN
        Likes ON all_friends.user2_id = Likes.user_id 
    GROUP BY
        user1_id, page_id)
SELECT
    *
FROM
    cte
WHERE
    page_id NOT IN
        (SELECT
            page_id
        FROM
            Likes
        WHERE
            cte.user_id = Likes.user_id)