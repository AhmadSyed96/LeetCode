# Write your MySQL query statement below
WITH cte AS
    (SELECT
        product_id,
        YEAR(purchase_date) as yr,
        count(*) as times_purchased
    FROM
        orders
    GROUP BY 
        1,2)
SELECT
    DISTINCT yr1.product_id
FROM
    cte yr1
JOIN
    cte yr2 ON yr1.product_id=yr2.product_id AND (yr1.yr-yr2.yr)=1
WHERE
    yr1.times_purchased>2 and yr2.times_purchased>2