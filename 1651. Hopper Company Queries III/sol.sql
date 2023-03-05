# Write your MySQL query statement below
WITH RECURSIVE months AS
    (SELECT 1 AS month
    UNION
    SELECT month+1 FROM months WHERE month<12),
available_monthly_sums as
    (SELECT
        month(requested_at) as month,
        SUM(ride_distance) as tot_ride_distance,
        SUM(ride_duration) as tot_ride_duration
    FROM    
        rides
    JOIN
        acceptedrides USING(ride_id)
    WHERE
        year(requested_at)=2020
    GROUP BY
        1) 
SELECT  
    month, 
    ROUND(AVG(tot_ride_distance) OVER(ORDER BY month ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING),2) AS average_ride_distance,
    ROUND(AVG(tot_ride_duration) OVER(ORDER BY month ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING),2) AS average_ride_duration
FROM
    (SELECT
        months.month,
        COALESCE(tot_ride_distance,0) as tot_ride_distance,
        COALESCE(tot_ride_duration,0) as tot_ride_duration
    FROM
        months
    LEFT JOIN
        available_monthly_sums USING(month)) AS t1
LIMIT 10
