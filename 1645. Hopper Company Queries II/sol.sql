# Write your MySQL query statement below
WITH recursive months AS (
    select 1 as month
   union all
   select month + 1
   from months
   where month < 12),
cum_drivers as    
    (SELECT 
        month, cum_sum
    FROM
        (select 
            year(join_date) as yr, month(join_date) as month, sum(count(*)) over(order by left(join_date,7)) as cum_sum
        from
            drivers
        GROUP BY
            1,2
        ORDER BY 1) AS t1
    WHERE yr=2020),
accepted_counts as
    (SELECT
        month(requested_at) as month, count(DISTINCT driver_id) as accepted_rides
    FROM
        rides
    JOIN
        acceptedrides USING(ride_id)
    WHERE
        year(requested_at)=2020
    GROUP BY 
        1),
hooper_company_one as 
    (SELECT
        month,
        COALESCE(MAX(cum_sum) OVER(PARTITION BY grp),0) as active_drivers,
        COALESCE(accepted_rides,0) as accepted_rides
    FROM
        (SELECT
            *,
            count(cum_sum) over(order by month) as grp
        FROM
            months
        LEFT JOIN
            cum_drivers USING(month)) AS t1
    LEFT JOIN
        accepted_counts USING(month))
SELECT
    month, 
    COALESCE(ROUND(100*accepted_rides/active_drivers,2),0) as working_percentage
FROM
    hooper_company_one
