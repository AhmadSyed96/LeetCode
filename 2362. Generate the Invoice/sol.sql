# Write your MySQL query statement below
WITH cte AS
    (SELECT
        invoice_id
    FROM    
        (SELECT
            invoice_id,
            SUM(price*quantity) as total
        FROM
            purchases
        JOIN
            products USING(product_id)
        GROUP BY
            1) AS t1
    ORDER BY 
        total DESC, invoice_id
    LIMIT
        1   )
SELECT
    purchases.product_id, purchases.quantity, products.price*purchases.quantity as price
FROM
    purchases
JOIN
    products USING(product_id)
WHERE
    invoice_id IN (SELECT * FROM cte)