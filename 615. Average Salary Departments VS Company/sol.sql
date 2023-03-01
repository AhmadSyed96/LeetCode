# Write your MySQL query statement below
SELECT  
    DISTINCT LEFT(pay_date,7) as pay_month, department_id,
    case when mnth_avg=dept_avg then 'same' when dept_avg>mnth_avg then 'higher' else 'lower' end as comparison    
FROM
    (SELECT
        *,
        ROUND(AVG(amount) OVER(PARTITION BY LEFT(pay_date,7)),2) as mnth_avg,
        ROUND(AVG(amount) OVER(PARTITION BY department_id, LEFT(pay_date,7)),2) as dept_avg
    FROM
        salary
    JOIN
        employee USING(employee_id)) AS t1
ORDER BY 1 DESC, 2