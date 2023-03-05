# Write your MySQL query statement below
SELECT
    queries.id,  queries.year, COALESCE(npv,0) as npv
FROM
    queries
LEFT JOIN
    npv USING(id, year)
