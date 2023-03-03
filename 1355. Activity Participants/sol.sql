# Write your MySQL query statement below
SELECT
    activity
FROM
    (SELECT
        activity, cnt,
        RANK() OVER(ORDER BY cnt DESC) as mx,
        RANK() OVER(ORDER BY cnt) as mn
    FROM
        (SELECT
            activity,
            count(*) as cnt
        FROM
            friends
        GROUP BY 
            1) AS t1) AS t2
WHERE mx!=1 and mn!=1


# select activity
# from friends 
# group by activity
# having count(*) > (select count(*) from friends group by activity order by count(*) limit 1)
# and count(*) < (select count(*) from friends group by activity order by count(*) desc limit 1)