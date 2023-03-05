# Write your MySQL query statement below
SELECT
    member_id,
    name,
    case when conversion_rate >= 80 then 'Diamond' 
        when conversion_rate>=50 then 'Gold'
        when conversion_rate<50 then 'Silver'
        else 'Bronze' end as category
FROM
    (SELECT
        member_id,
        name,
        ROUND(100*count(charged_amount)/count(visit_id),0) AS conversion_rate
    FROM
        visits
    LEFT JOIN
        purchases USING(visit_id)
    RIGHT JOIN
        members USING(member_id)
    GROUP BY
        1) AS t1
