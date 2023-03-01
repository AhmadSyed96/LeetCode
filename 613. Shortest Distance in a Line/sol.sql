# Write your MySQL query statement below
WITH cte AS
    (SELECT
        *,
        ROW_NUMBER() OVER() AS rn
    FROM
        point)
SELECT
    MIN(dist) as shortest
FROM
    (SELECT
        c1.x as x1, c2.x as x2, abs(c1.x-c2.x) as dist
    FROM
        cte c1
    JOIN
        cte c2 ON c1.rn != c2.rn) AS t1