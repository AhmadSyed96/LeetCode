# Write your MySQL query statement below
SELECT 
    DISTINCT l1.num as ConsecutiveNums
FROM
    logs l1
LEFT JOIN
    logs l2 ON l1.id+1 = l2.id
LEFT JOIN
    logs l3 ON l1.id+2 = l3.id
WHERE
    l1.num=l2.num and l2.num=l3.num