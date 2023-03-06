WITH c1 AS
    (select
        row_number() over (order by  arrival_time) as rn, -- create a row number for the sequence of the bus.
        bus_id,
        arrival_time,
        lag(arrival_time, 1 , -999) over(order by arrival_time) as prev_time,  
        capacity
    from 
        Buses),
c2 AS    
    (select 
        c1.rn,
        c1.bus_id,
        c1.capacity,
        count(p.passenger_id) as curr_passenger_cnt
    from 
        c1 
    left outer join 
        Passengers p on p.arrival_time <= c1.arrival_time and p.arrival_time > c1.prev_time)
