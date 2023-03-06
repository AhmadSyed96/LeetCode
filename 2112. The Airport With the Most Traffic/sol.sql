# Write your MySQL query statement below
WITH total_flights AS
    (SELECT
        airport_id, SUM(flights_count) as total_flight   
    FROM
        (SELECT departure_airport as airport_id, flights_count FROM flights
        UNION ALL
        SELECT arrival_airport as airport_id, flights_count FROM flights) AS flights_extrap
    GROUP BY
        1)
SELECT
    airport_id
FROM    
    total_flights
WHERE
    total_flight = (SELECT MAX(total_flight) FROM total_flights)