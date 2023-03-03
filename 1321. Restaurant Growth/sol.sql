# # Write your MySQL query statement below
# SELECT
#     DISTINCT visited_on,
#     (select 
#         sum(amount)
#     from
#         customer c2
#     where 
#         c2.visited_on <= c1.visited_on and datediff(c1.visited_on, c2.visited_on) <=6) as amount,
#     (select 
#         round(sum(amount)/7,2)
#     from
#         customer c2
#     where 
#         c2.visited_on <= c1.visited_on and datediff(c1.visited_on, c2.visited_on) <=6) as average_amount
# FROM
#     customer c1
# ORDER BY 1
# LIMIT 100 offset 6

select 
    a.visited_on as visited_on, sum(b.day_sum) as amount, ROUND(AVG(b.day_sum), 2) AS average_amount

from
(select sum(amount) day_sum, visited_on as visited_on from Customer group by visited_on) a,
(select sum(amount) day_sum, visited_on as visited_on from Customer group by visited_on) b

where DATEDIFF(a.visited_on, b.visited_on) between 0 and 6
group by a.visited_on
having count(b.visited_on) = 7