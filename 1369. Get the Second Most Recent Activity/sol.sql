# Write your MySQL query statement below
WITH cte AS        
    (SELECT
        *,
        count(*) over(partition by username) AS cnt,
        RANK() OVER(PARTITION BY username ORDER BY startdate DESC) as rnk
    FROM
        useractivity)
SELECT
    username, activity,startdate,enddate
FROM    
    cte
WHERE 
    rnk=2 AND cnt>1
union
SELECT username, activity,startdate,enddate FROM cte WHERE cnt = 1