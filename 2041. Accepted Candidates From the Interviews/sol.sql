# Write your MySQL query statement below
SELECT
    candidate_id
FROM
    candidates
JOIN
    rounds USING(interview_id)
WHERE
    years_of_exp > 1
GROUP BY
    1
HAVING
    SUM(score)>15