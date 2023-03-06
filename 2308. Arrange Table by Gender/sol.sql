# Write your MySQL query statement below
SELECT
    user_id, gender
FROM
    genders
ORDER BY
    RANK() OVER(PARTITION BY gender ORDER BY user_id),
    CASE gender WHEN 'female' THEN 1 WHEN 'other' THEN 2 ELSE 3 END