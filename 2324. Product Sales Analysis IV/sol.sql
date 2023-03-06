# Write your MySQL query statement below
WITH cte AS
    (SELECT
        *, sum(quantity*price) as total
    FROM
        sales
    JOIN
        product USING(product_id)
    GROUP BY
        user_id, product_id)
SELECT
    user_id, product_id
FROM
    cte
WHERE
    (user_id,total) = ANY
        (SELECT
            user_id,
            MAX(total)
        FROM
            cte
        GROUP BY
            1)
