WITH friends_per_user AS
    (SELECT user1_id as user, user2_id as friend FROM friendship
    UNION
    SELECT user2_id as user, user1_id as friend FROM friendship),
friend_counts AS
    (SELECT
        user1, user2, COUNT(*) AS common_friend_count
    FROM
        (SELECT
            fpu1.user as user1, fpu1.friend as common_friend, fpu2.user as user2
        FROM
            friends_per_user fpu1
        JOIN
            friends_per_user fpu2 USING(friend)
        WHERE
            fpu1.user != fpu2.user) AS common_friends
    GROUP BY
        1,2)
SELECT
    *
FROM    
    (SELECT
        DISTINCT LEAST(user1, user2) AS user1_id,
        GREATEST(user1, user2) AS user2_id,
        common_friend_count AS common_friend
    FROM
        friend_counts
    WHERE
        common_friend_count > 2) AS possible_answers
WHERE
    (user1_id,user2_id) = any(SELECT * FROM friendship)