# Write your MySQL query statement below
WITH cte AS
    (SELECT 
        *,
        ROW_NUMBER() OVER() as rownumber
    FROM
        logs)

SELECT
    MIN(log_id) as start_id,
    MAX(log_id) as end_id
FROM
    cte
GROUP BY
    log_id-rownumber