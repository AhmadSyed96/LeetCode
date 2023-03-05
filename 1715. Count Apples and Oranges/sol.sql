# Write your MySQL query statement below
WITH counts AS
    (SELECT apple_count, orange_count FROM boxes
    UNION ALL
    SELECT chests.apple_count, chests.orange_count FROM boxes LEFT JOIN chests USING(chest_id))
SELECT
    SUM(apple_count) as apple_count,
    SUM(orange_count) as orange_count
FROM    
    counts