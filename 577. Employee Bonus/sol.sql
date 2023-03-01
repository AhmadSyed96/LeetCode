# Write your MySQL query statement below
SELECT
    name, bonus
FROM
    bonus
RIGHT JOIN
    employee USING(empid)
WHERE 
    COALESCE(bonus,0) < 1000