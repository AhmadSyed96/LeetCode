# Write your MySQL query statement below
select
    name as warehouse_name, sum(width*height*length*units) as volume
from
    warehouse
join
    products using(product_id)
group by 
    1