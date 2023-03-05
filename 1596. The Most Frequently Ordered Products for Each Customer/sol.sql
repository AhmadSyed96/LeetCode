# Write your MySQL query statement below
SELECT  
    customer_id, rankings.product_id, product_name
FROM
    (SELECT
        customer_id,
        product_id,
        RANK() OVER(partition by customer_id order by count(*) DESC) as rnk
    FROM
        orders
    GROUP BY 
        1,2) as rankings
JOIN
    products USING(product_id)
WHERE
    rnk = 1
ORDER BY
    1,2,3
