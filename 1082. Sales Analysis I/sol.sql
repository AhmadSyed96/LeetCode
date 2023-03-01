# Write your MySQL query statement below
WITH cte AS
    (SELECT
        seller_id,
        SUM(price) AS total_sales,
        RANK() OVER(ORDER BY SUM(price) DESC) AS total_sales_rnk
    FROM
        sales
    GROUP BY
        1)
SELECT
    seller_id
FROM
    cte
WHERE
    total_sales_rnk=1
