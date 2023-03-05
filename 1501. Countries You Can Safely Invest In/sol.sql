# # Write your MySQL query statement below
WITH cte AS    
    (SELECT
        id, country.name, duration
    FROM
        person
    JOIN
        country ON country.country_code = left(person.phone_number,3)
    JOIN
        (SELECT caller_id, duration FROM calls
        UNION ALL
        SELECT callee_id, duration FROM calls) as allcall ON allcall.caller_id = person.id)

SELECT
    name as country
FROM
    cte
group by name
having
    avg(duration) > (SELECT avg(duration) FROM cte)

    #forgot union all