# Write your MySQL query statement below
SELECT
    distinct viewer_id as id
FROM
    views
GROUP BY
    viewer_id, view_date
HAVING
    COUNT(distinct article_id) > 1