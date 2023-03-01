# Write your MySQL query statement below
SELECT
    seat_id
FROM
    (SELECT 
        *,
        COALESCE(lag(free) over(order by seat_id),0) as lg,
        COALESCE(lead(free) over(order by seat_id),0) as ld
    FROM
        Cinema) as c1
WHERE
    free = 1 AND lg+ld >= 1