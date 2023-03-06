# Write your MySQL query statement below
SELECT
    d.driver_id,
    COALESCE(COUNT(DISTINCT p.ride_id),0) as cnt
FROM
    rides d
LEFT JOIN
    rides p ON p.passenger_id=d.driver_id
GROUP BY
    1