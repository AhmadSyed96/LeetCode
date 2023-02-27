# Write your MySQL query statement below
with recursive cte as
    (select num, frequency, 1 as lvl from numbers
    union
    select num, frequency, 1+lvl from cte where lvl<frequency)
select
    avg(num) as median
from
    (select 
        num,
        row_number() over(order by num) as row_id,
        (select count(1) from cte) as ct
    from cte) as t1
where
    row_id between ct/2 and ct/2+1

# alternate solution
# # Write your MySQL query statement below
# WITH tmp AS (SELECT num, Frequency,
#              SUM(Frequency) OVER (ORDER BY num ASC) rk1,
#              SUM(Frequency) OVER (ORDER BY num DESC) rk2
#              FROM Numbers)
# select round(avg(num),1) as median
# from tmp
# where abs(rk1-rk2) <= Frequency