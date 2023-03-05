# Write your MySQL query statement below
SELECT
    company_id,
    employee_id,
    employee_name,
    case when max(salary) over(partition by company_id) < 1000 then salary
        when max(salary) over(partition by company_id) between 1000 and 10000 then round((salary - 0.24*salary),0)
        else round((salary - 0.49*salary),0) end as salary
FROM
    salaries