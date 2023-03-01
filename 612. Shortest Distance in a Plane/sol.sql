# Write your MySQL query statement below
WITH points as
    (SELECT
        *,
        ROW_NUMBER() OVER() AS point
    FROM
        point2d)
SELECT 
    ROUND(MIN(shortest),2) as shortest
FROM
    (SELECT
        sqrt(pow(x2-x1,2)+pow(y2-y1,2)) as shortest
    FROM
        (SELECT
            p1.x as x1, p1.y as y1, p2.x as x2, p2.y as y2
        FROM
            points p1
        JOIN
            points p2 ON p1.point != p2.point) AS t1) AS t2