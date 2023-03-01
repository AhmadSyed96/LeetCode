# Write your MySQL query statement below
WITH cte AS    
    (SELECT
        users.user_id, order_id, order_date, orders.item_id, item_brand, favorite_brand,
        rank() over(partition by seller_id order by order_date) as sale_num,
        count(order_id) over(partition by seller_id) as tot_prods_sold
    FROM
        orders
    JOIN
        items USING(item_id)
    RIGHT JOIN
        users ON orders.seller_id=users.user_id)
SELECT
    user_id as seller_id, case when item_brand=favorite_brand then 'yes' else 'no' end as 2nd_item_fav_brand
FROM
    cte
WHERE
    tot_prods_sold>1 and sale_num=2
union
SELECT
    user_id as seller_id, 'no' as 2nd_item_fav_brand
FROM
    cte
WHERE
    tot_prods_sold<2
ORDER BY 1