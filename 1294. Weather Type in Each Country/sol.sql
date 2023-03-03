# Write your MySQL query statement below
SELECT 
    country_name, 
    CASE WHEN round(avg(weather_state),3) <= 15.0 THEN 'Cold' WHEN round(avg(weather_state),3) >= 25.0 THEN 'Hot' ELSE 'Warm' END AS weather_type
FROM
    Weather
JOIN
    Countries USING(country_id)
WHERE 
    YEAR(day) = '2019' AND MONTH(day) = 11
GROUP BY
    1