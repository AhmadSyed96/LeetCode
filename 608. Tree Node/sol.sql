# Write your MySQL query statement below
 SELECT
    DISTINCT id,
    case when p_id is null then 'Root' when s_id is null then 'Leaf' else 'Inner' end as type
FROM   
    (SELECT
        t2.id as s_id, t1.id, t1.p_id
    FROM
        tree t1
    LEFT JOIN
        tree t2 ON t1.id=t2.p_id) AS t1

