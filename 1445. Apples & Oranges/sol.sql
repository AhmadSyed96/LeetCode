/* Write your T-SQL query statement below */
with cte as
(SELECT
    sale_date, apples, oranges
FROM
    Sales
PIVOT
    (SUM(sold_num) FOR fruit in ([apples], [oranges])) as pvtbl)
SELECT
    sale_date, apples - oranges as diff
FROM
    cte