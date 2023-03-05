# Write your MySQL query statement below
SELECT
    DISTINCT id, name
FROM
    (SELECT 
        id,count(*) as cnt
    FROM
        (SELECT
            *,
            ROW_NUMBER() OVER(PARTITION BY id ORDER BY login_date) as rw,
            DATE_SUB(login_date, interval ROW_NUMBER() OVER(PARTITION BY id ORDER BY login_date) day) as gb
        FROM
            (SELECT DISTINCT * FROM logins) t1) t2
    GROUP BY 
        id, gb) t3
JOIN
    accounts USING(id)
WHERE 
    cnt >= 5
ORDER BY
    1

# SELECT
#         *,
#         ROW_NUMBER() OVER(PARTITION BY id ORDER BY login_date) as rw,
#         DATE_SUB(login_date, interval ROW_NUMBER() OVER(PARTITION BY id ORDER BY login_date) day)
#     FROM
#         (SELECT DISTINCT * FROM logins) t1