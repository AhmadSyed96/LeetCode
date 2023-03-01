# Write your MySQL query statement below
SELECT 
    CASE WHEN MOD(id,2) = 0 THEN lg else ld end as id,
    student
FROM
    (SELECT
        *,
        LAG(id) OVER(ORDER BY id) AS lg,
        CASE WHEN MOD(COUNT(*) OVER(),2)=0 THEN LEAD(id) OVER(ORDER BY id) ELSE  (LEAD(id) OVER(ORDER BY id),id) END AS ld
    FROM
        Seat) AS s1
ORDER BY
    1