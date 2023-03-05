# Write your MySQL query statement below
SELECT
    DISTINCT c1.user_id
FROM
    confirmations c1
JOIN
    confirmations c2 ON c1.user_id=c2.user_id 
    AND c1.time_stamp < c2.time_stamp
    AND TIMESTAMPDIFF(second, c1.time_stamp, c2.time_stamp) <= 86400