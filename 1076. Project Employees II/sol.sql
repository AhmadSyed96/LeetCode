# Write your MySQL query statement below
SELECT
    project_id
FROM
    project
GROUP BY
    1
HAVING
    COUNT(*)=(SELECT COUNT(*) FROM project GROUP BY project_id ORDER BY 1 DESC LIMIT 1)