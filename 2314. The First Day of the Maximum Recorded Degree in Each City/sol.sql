# # Write your MySQL query statement below
# WITH cte AS    
#     (SELECT
#         *
#     FROM
#         weather
#     WHERE
#         (city_id, degree) = ANY
#         (SELECT
#             city_id,
#             MAX(degree)
#         FROM 
#             weather
#         GROUP BY 
#             1) )
# SELECT
#     *
# FROM
#     cte
# WHERE
#     (city_id, day) = ANY
#         (SELECT
#             city_id,
#             MIN(day)
#         FROM
#             cte
#         GROUP BY
#             1)
# ORDER BY
#     1
SELECT
    city_id,
    day,
    degree
FROM
    (SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY city_id ORDER BY degree DESC, day) AS rnk
    FROM
        weather) AS t1
WHERE
    rnk=1