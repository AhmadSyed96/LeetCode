# Write your MySQL query statement below
SELECT
    session_id
FROM
    playback
LEFT JOIN
    ads ON playback.customer_id=ads.customer_id
    and timestamp between start_time and end_time
WHERE
    ad_id IS NULL