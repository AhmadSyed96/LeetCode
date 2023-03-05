# Write your MySQL query statement below
SELECT
    product_id,
    SUM(case store when 'store1' then price else null end) as store1,
    SUM(case store when 'store2' then price else null end) as store2,
    SUM(case store when 'store3' then price else null end) as store3
FROM
    products
GROUP BY
    1