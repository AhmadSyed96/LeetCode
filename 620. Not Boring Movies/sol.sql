# Write your MySQL query statement below
SELECT
    *
FROM
    cinema
WHERE 
    description!='boring' and MOD(id,2)!=0
ORDER BY
    4 DESC