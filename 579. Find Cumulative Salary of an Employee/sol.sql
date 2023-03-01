# Write your MySQL query statement below
WITH months AS    
    (SELECT
        *
    FROM
        employee
    WHERE
        (id,month) NOT IN (SELECT id, MAX(month) FROM employee GROUP BY 1))
SELECT
    a.id, a.month, sum(b.salary) as salary
FROM
    months a 
JOIN
    months b ON a.id=b.id AND (a.month-b.month) BETWEEN 0 AND 2
GROUP BY 
    1,2
ORDER BY
    1, 2 desc

# better solution
# Write your MySQL query statement below
# select id, month, salary
# from (
#         select id, month, 
#             sum(salary) over(partition by id order by month range between 2 PRECEDING and current row) salary,
#             row_number() over(partition by id order by month desc) month_order
#         from Employee 
#     ) t
#     where month_order > 1
    