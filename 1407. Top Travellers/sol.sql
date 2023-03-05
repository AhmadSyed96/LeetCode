# Write your MySQL query statement below
SELECT
    name, COALESCE(dist,0) as travelled_distance
FROM
    (SELECT
        user_id, SUM(distance) as dist
    FROM
        Rides
    GROUP BY
        1)as tot_dist
RIGHT JOIN
    Users ON Users.id = tot_dist.user_id
ORDER BY
    2 DESC, 1