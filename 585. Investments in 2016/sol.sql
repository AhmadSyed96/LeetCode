# # Write your MySQL query statement below
SELECT
    lat,lon
FROM
    insurance
GROUP BY
    1,2
HAVING 
    COUNT(*) = 1


SELECT
    tiv_2015
FROM
    insurance
GROUP BY
    1
HAVING
    COUNT(*) > 1;

# Better solution
SELECT
    ROUND(SUM(tiv_2016),2) as tiv_2016
FROM
    insurance
WHERE
    tiv_2015 in (SELECT tiv_2015 FROM insurance GROUP BY 1 HAVING COUNT(*) > 1)
    and (lat,lon) in (SELECT lat,lon FROM insurance GROUP BY 1,2 HAVING  COUNT(*) = 1);