# Write your MySQL query statement below
SELECT
    product_name, year, price
FROM
    sales
JOIN
    product USING(product_id)