# Write your MySQL query statement below
SELECT
    id,
    MAX(drink) OVER(PARTITION BY _grp) as drink
FROM 
    (SELECT
        *,
        COUNT(drink) OVER (ORDER BY row_id) AS _grp
    FROM
        (SELECT
            id,
            CASE drink WHEN '' THEN NULL ELSE drink END as drink,
            ROW_NUMBER() OVER() as row_id
        FROM
            coffeeshop) AS t1) AS t2