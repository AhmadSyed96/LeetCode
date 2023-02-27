/* 
 Please write a DELETE statement and DO NOT write a SELECT statement.
 Write your T-SQL query statement below
 */
 DELETE FROM Person
WHERE id not in (SELECT min(id) FROM Person GROUP BY email)