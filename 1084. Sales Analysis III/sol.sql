/* Write your T-SQL query statement below */
WITH filtered_products as
    (SELECT 
        product_id
    FROM 
        Sales 
    EXCEPT
    SELECT 
        product_id 
    FROM 
        Sales 
    WHERE 
        sale_date <'2019-01-01' OR sale_date >'2019-03-31')
SELECT 
    filtered_products.product_id, product_name
FROM 
    filtered_products
LEFT JOIN 
    Product ON filtered_products.product_id = Product.product_id