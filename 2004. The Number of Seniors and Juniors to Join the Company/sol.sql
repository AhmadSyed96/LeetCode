# Write your MySQL query statement below
WITH cumsums AS
    (SELECT
        *,
        SUM(salary) OVER(PARTITION BY experience ORDER BY salary) AS cumsum
    FROM
        candidates),
seniors AS
    (SELECT
        *
    FROM
        cumsums
    WHERE
        cumsum<70000 AND experience='Senior'),
juniors AS
    (SELECT
        *
    FROM
        cumsums
    WHERE
        experience='Junior' AND cumsum<70000-(SELECT COALESCE(MAX(cumsum),0) FROM seniors)),
counts AS
    (SELECT
        experience,
        count(*) as accepted_candidates
    FROM
        (SELECT * FROM seniors UNION SELECT * FROM juniors) AS t1
    GROUP BY 
        1)
SELECT
    experiences.experience, COALESCE(accepted_candidates,0) as accepted_candidates
FROM
    counts
RIGHT JOIN
    (SELECT DISTINCT experience FROM candidates) AS experiences USING(experience)