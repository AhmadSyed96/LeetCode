# Write your MySQL query statement below
WITH cte AS
    (SELECT 
        bus_id, passenger_id
    FROM    
        (SELECT
            *,
            LAG(arrival_time,1,-999) OVER(order by arrival_time) as prev_bus_arrival_time
        FROM
            buses) AS b
    LEFT JOIN #left join instead of reg join 
        passengers p ON b.arrival_time>=p.arrival_time and p.arrival_time > b.prev_bus_arrival_time)
SELECT 
    bus_id, count(passenger_id) as passengers_cnt
FROM
    cte
GROUP BY 1 ORDER BY 1

# SELECT
#     buses.bus_id, COALESCE(passenger_cnt,0) as passengers_cnt
# FROM
#     (SELECT
#         bus_id, count(*) as passenger_cnt
#     FROM
#         cte
#     GROUP BY
#         1) AS t1
# RIGHT JOIN
#     buses USING(bus_id)
# ORDER BY
#     1

# with cte as (
#     SELECT
#         bus_id, arrival_time, ifnull(lag(arrival_time) over(order by arrival_time asc),0) as earliest
#     FROM buses
# )

# SELECT bus_id, count(p.passenger_id) as passengers_cnt 
# FROM cte c
# LEFT JOIN Passengers p  ON p.arrival_time > earliest and p.arrival_time <= c.arrival_time
# group by bus_id 
# order by bus_id asc 