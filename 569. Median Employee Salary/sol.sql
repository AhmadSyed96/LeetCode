# Write your MySQL query statement below
with ordered_purchases as
    (select
        *,
        row_number() over (partition by company order by salary) as row_id,
        (select count(1) from employee e2 where e1.company = e2.company) as ct
    from employee e1)
select id,company, salary
from ordered_purchases
where row_id between ct/2.0 and ct/2.0 + 1