# # Write your MySQL query statement below
# WITH RECURSIVE cte(n, employee_id, manager_id) as
#     (SELECT 0 as n, employee_id, manager_id FROM employees WHERE employee_id=1
#     UNION ALL
#     SELECT n+1, employees.employee_id, employees.manager_id FROM cte JOIN employees ON cte.employee_id = employees.manager_id WHERE n < 3)
# SELECT
#     employee_id
# FROM
#     cte
# WHERE 
#     n = 3 AND employee_id != 1

# WITH RECURSIVE CTE AS (
#     SELECT employee_id, 1 as level
#     FROM Employees e
#     WHERE manager_id = 1 AND employee_id != 1
    
#     UNION ALL
    
#     SELECT e.employee_id, level+1 as level
#     FROM CTE, Employees e
#     WHERE CTE.employee_id = e.manager_id
# )
# SELECT employee_id
# FROM CTE
# WHERE level<=3
# ORDER BY employee_id

WITH RECURSIVE cte(n, employee_id, manager_id) as
    (SELECT 0 as n, employee_id, manager_id FROM employees WHERE employee_id=1
    UNION ALL
    SELECT n+1, employees.employee_id, employees.manager_id FROM cte JOIN employees ON cte.employee_id = employees.manager_id)
SELECT
    employee_id
FROM
    cte
WHERE 
    n < 3