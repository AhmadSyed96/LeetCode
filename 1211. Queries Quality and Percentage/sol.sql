# Write your MySQL query statement below
SELECT
    query_name,
    ROUND(AVG(rating/position),2) as quality,
    ROUND(100*sum(case when rating < 3 then 1 else 0 end)/count(*),2) as poor_query_percentage
FROM
    Queries
GROUP BY
    1