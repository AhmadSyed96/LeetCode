# Write your MySQL query statement below
SELECT
    requester_id as id,
    count(*) as num
FROM
    (SELECT  requester_id, accepter_id FROM requestaccepted
    UNION
    SELECT accepter_id, requester_id FROM requestaccepted) AS t1
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    1