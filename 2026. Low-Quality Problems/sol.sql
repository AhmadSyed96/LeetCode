# Write your MySQL query statement below
SELECT
    problem_id
FROM
    problems
WHERE
    likes/(likes+dislikes) < 0.60
ORDER BY
    1