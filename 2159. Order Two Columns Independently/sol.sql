# Write your MySQL query statement below
SELECT
    first_col,
    second_col
FROM
    (SELECT 
        ROW_NUMBER() OVER(ORDER BY first_col) as id,
        first_col
    FROM
        data) AS t1
JOIN
    (SELECT 
        ROW_NUMBER() OVER(ORDER BY second_col DESC) as id,
        second_col
    FROM
        data) AS t2 USING(id)