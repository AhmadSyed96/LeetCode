# Write your MySQL query statement below
WITH RECURSIVE years AS
    (SELECT MIN(year(order_date)) as yr, MAX(year(order_date)) as mx FROM orders
    UNION
    SELECT yr+1,mx FROM years WHERE yr<mx),
yearly_customer_totals as
    (SELECT
        customer_id, year(order_date) as yr, SUM(price) as total_purchases,
        MIN(year(order_date)) OVER(PARTITION BY customer_id) as min_year,
        MAX(year(order_date)) OVER(PARTITION BY customer_id) as max_year
    FROM
        orders
    GROUP BY
        1,2)
SELECT 
    customer_id
FROM
    (SELECT
        crosss.yr, crosss.customer_id, COALESCE(total_purchases,0) as total_purchases,
        LEAD(COALESCE(total_purchases,0)) OVER(PARTITION BY crosss.customer_id ORDER BY crosss.yr) as prev_tot,
        case when COALESCE(total_purchases,0) >=LEAD(COALESCE(total_purchases,0)) OVER(PARTITION BY crosss.customer_id ORDER BY crosss.yr) then 1 else 0 end as asd
    FROM
        (SELECT
            yr, customer_id
        FROM 
            years, (SELECT DISTINCT customer_id, min_year, max_year FROM yearly_customer_totals) AS cust_ranges
        WHERE
            years.yr BETWEEN cust_ranges.min_year and cust_ranges.max_year) AS crosss
    LEFT JOIN 
        yearly_customer_totals USING(yr, customer_id)) AS t1
GROUP BY
    1
HAVING 
    SUM(asd) = 0


# with cte as
#     (SELECT customer_id, year(order_date) as yr, SUM(price) as total FROM orders GROUP BY 1,2),
# cte2 as
#     (SELECT 
#         customer_id, yr, total,
#         (yr - lag(yr) over(partition by customer_id order by yr)) as year_diff,
#         (total - lag(total) over(partition by customer_id order by yr)) as total_diff
#     FROM
#         cte)
# SELECT 
#     Distinct customer_id
# FROM
#     cte2
# WHERE 
#     customer_id not in (SELECT customer_id FROM cte2 WHERE year_diff>1 or total_diff<=0)
