# Write your MySQL query statement below
SELECT
    product.name,
    COALESCE(rest,0) as rest,
    COALESCE(paid,0) as paid,
    COALESCE(canceled,0) as canceled,
    COALESCE(refunded,0) as refunded
FROM
    product
LEFT JOIN    
    (SELECT
        product_id,
        SUM(rest) as rest,
        SUM(paid) as paid,
        SUM(canceled) as canceled,
        SUM(refunded) as refunded
    FROM
        invoice
    GROUP BY
        1) AS t1 USING(product_id)
ORDER BY 1