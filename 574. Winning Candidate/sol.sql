# Write your MySQL query statement below
SELECT
    name
FROM
    vote
JOIN
    candidate ON vote.candidateId = candidate.id
GROUP BY 1
ORDER BY COUNT(*) DESC
LIMIT 1