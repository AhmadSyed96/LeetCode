# Write your MySQL query statement below
SELECT
    extra as report_reason,
    count(DISTINCT post_id) as report_count
FROM
    actions
WHERE
    action_date='2019-07-04' and action = 'report'
GROUP BY
    extra