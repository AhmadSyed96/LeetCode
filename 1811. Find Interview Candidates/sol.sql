# Write your MySQL query statement below
WITH gold_medal_condtion AS
    (SELECT
        gold_medal as user_id
    FROM
        contests
    GROUP BY
        1
    HAVING
        count(*) > 2),
contests_extrap AS
    (SELECT contest_id, gold_medal as user_id FROM contests
    UNION ALL
    SELECT contest_id, silver_medal as user_id FROM contests
    UNION ALL
    SELECT contest_id, bronze_medal as user_id FROM contests),
conseq_medals_cond as
    (SELECT
        distinct ce1.user_id
    FROM
        contests_extrap ce1
    JOIN
        contests_extrap ce2 ON ce1.contest_id+1=ce2.contest_id
        and ce1.user_id=ce2.user_id
    JOIN
        contests_extrap ce3 ON ce2.contest_id+1=ce3.contest_id
        and ce1.user_id=ce3.user_id)
SELECT
    users.name, users.mail
FROM
    users
JOIN    
    (SELECT * FROM gold_medal_condtion
    UNION
    SELECT * from conseq_medals_cond) AS t1 USING(user_id)