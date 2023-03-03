# Write your MySQL query statement below

(SELECT
    name AS results
FROM
    movierating
JOIN
    users USING(user_id)
group by
    user_id
HAVING
    count(*) = 
        (SELECT
            MAX(cnt)
        FROM
            (SELECT
                COUNT(*) AS cnt
            FROM
                movierating
            GROUP BY
                user_id)as mx)
ORDER BY 
    1
LIMIT 
    1)
    
union

(SELECT
    title as results
FROM
    movierating
JOIN
    movies USING(movie_id)
WHERE
    YEAR(created_at) = '2020' and MONTH(created_at)=2
GROUP BY
    movie_id
HAVING  
    ROUND(AVG(rating),2) = 
        (SELECT
            ROUND(MAX(avgrtg),2)
        FROM
            (SELECT
                AVG(rating) as avgrtg
            FROM
                movierating
            WHERE
                YEAR(created_at) = '2020' and MONTH(created_at)=2
            GROUP BY
                movie_id) as t2)
ORDER BY
    1
LIMIT
    1)



# SELECT
#     title as results
# FROM
#     movierating
# JOIN
#     movies USING(movie_id)
# WHERE
#     YEAR(created_at) = '2020' and MONTH(created_at)=2
# GROUP BY
#     movie_id
# HAVING  
#     ROUND(AVG(rating),2) = 
#         (SELECT
#             ROUND(MAX(avgrtg),2)
#         FROM
#             (SELECT
#                 AVG(rating) as avgrtg
#             FROM
#                 movierating
#             WHERE
#                 YEAR(created_at) = '2020' and MONTH(created_at)=2
#             GROUP BY
#                 movie_id) as t2)
