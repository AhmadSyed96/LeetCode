# Write your MySQL query statement below
WITH cte AS
    (SELECT
        DISTINCT customer_id
    FROM
        customer
    ORDER BY
        1)
SELECT
    customer_id
FROM
    cte
WHERE NOT EXISTS
    (SELECT
        product_key
    FROM
        product
    WHERE 
        product_key NOT IN    
            (SELECT
                product_key
            FROM
                customer c1
            WHERE
                cte.customer_id = c1.customer_id))

/*
select customer_id
from (
    select customer_id, group_concat(distinct product_key order by product_key) as 'all_product'
    from Customer
    group by customer_id) temp1
    where all_product = (
        select group_concat(product_key order by product_key) as 'all_product' 
        from Product
*/