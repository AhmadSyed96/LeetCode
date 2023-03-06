# Write your MySQL query statement below
WITH ny as
    (SELECT 1 as row_id, SUM(score>89) as nycnt FROM newyork),
cal as
    (SELECT 1 as row_id, SUM(score>89) as calcnt FROM california)
SELECT
    case when nycnt>calcnt then 'New York University' 
        when calcnt>nycnt then 'California University' 
        else 'No Winner' end as winner
FROM
    ny
JOIN
    cal USING(row_id)