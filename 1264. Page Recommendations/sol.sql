/* Write your T-SQL query statement below */
SELECT 
    page_id as recommended_page
FROM
    (SELECT 
        *, 
        CASE WHEN user1_id > user2_id THEN user1_id ELSE user2_id END AS other_friend 
    FROM 
        Friendship 
    WHERE 
        user1_id=1 OR user2_id=1)as friends_of_one
JOIN
    Likes ON friends_of_one.other_friend = Likes.user_id
except
SELECT 
    page_id
FROM
    Likes
WHERE
    user_id = 1
ORDER BY
    1