# Write your MySQL query statement below
SELECT
    DISTINCT buyer_id
FROM
    sales
WHERE
    buyer_id in (SELECT buyer_id as buyer_id1 FROM sales JOIN product USING(product_id) WHERE product_name='S8')
    and buyer_id not in (SELECT buyer_id as buyer_id2 FROM sales JOIN product USING(product_id) WHERE product_name='iPhone')

# # Write your MySQL query statement below
# SELECT s.buyer_id
# FROM Sales AS s INNER JOIN Product AS p
# ON s.product_id = p.product_id
# GROUP BY s.buyer_id
# HAVING SUM(CASE WHEN p.product_name = 'S8' THEN 1 ELSE 0 END) > 0
# AND SUM(CASE WHEN p.product_name = 'iPhone' THEN 1 ELSE 0 END) = 0;