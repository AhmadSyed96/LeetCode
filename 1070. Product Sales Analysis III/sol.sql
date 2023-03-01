# Write your MySQL query statement below
SELECT 
    product_id, year as first_year, quantity, price
FROM
    sales
WHERE 
    (product_id, year) = any
        (SELECT
            product_id,
            MIN(year) as first_year
        FROM
            sales
        GROUP BY 
            1)