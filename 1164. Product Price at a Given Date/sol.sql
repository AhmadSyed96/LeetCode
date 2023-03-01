# Write your MySQL query statement below
SELECT
    P2.product_id, COALESCE(new_price,10) AS price
FROM
    (SELECT
        *
    FROM
        Products
    WHERE
        (product_id, change_date) = ANY
        (SELECT 
            product_id, MAX(change_date)
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
        GROUP BY
            1)) AS P1
RIGHT JOIN
    (SELECT DISTINCT product_id FROM Products) AS P2 ON P1.product_id = P2.product_id
