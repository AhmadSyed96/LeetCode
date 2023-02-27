# Write your MySQL query statement below
SELECT
    player_id, device_id
FROM
    activity
WHERE
    (player_id, event_date) = ANY
    (SELECT
        player_id, MIN(event_date)
    FROM
        activity
    GROUP BY
        1)