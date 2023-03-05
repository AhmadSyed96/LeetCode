/* Write your T-SQL query statement below */
select ppl.customer_id, customer_name
from
(select customer_id from orders where product_name = 'A'
intersect
select customer_id from orders where product_name = 'B'
except
select customer_id from orders where product_name = 'C') as ppl
join customers c on ppl.customer_id = c.customer_id