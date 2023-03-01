# Write your MySQL query statement below
SELECT
    *,
    CASE WHEN x+y>z and y+z>x and z+x>y then 'Yes' else 'No' end as triangle
FROM
    triangle