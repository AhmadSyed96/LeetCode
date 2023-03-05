# Write your MySQL query statement below
SELECT
    points1.id as P1, points2.id as P2, (abs(points1.x_value-points2.x_value))*(abs(points1.y_value-points2.y_value)) as AREA
FROM
    points points1
JOIN
    points points2 ON points1.x_value<>points2.x_value 
    and points1.y_value<>points2.y_value
    and points1.id < points2.id
ORDER BY
    3 DESC, 1,2

