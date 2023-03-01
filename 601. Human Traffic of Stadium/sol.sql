# Write your MySQL query statement below
SELECT
    id,
    visit_date,
    people
FROM
    (SELECT
        *,
        COUNT(asd) over(partition by asd) AS streak
    FROM
        (SELECT
            *,
            id - ROW_NUMBER() OVER() AS asd
        FROM
            stadium
        WHERE 
            people>99) AS t1) AS t2
WHERE
    streak > 2