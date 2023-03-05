# Write your MySQL query statement below
WITH RECURSIVE cte AS
    (SELECT 
        product_id, 
        period_start, 
        period_end, 
        average_daily_sales,
        year(period_start) as yr 
    FROM 
        sales

    UNION

    SELECT 
        product_id, 
        period_start, 
        period_end, 
        average_daily_sales,
        yr+1 
    FROM 
        cte 
    WHERE 
        yr < year(period_end))

SELECT    
    t1.product_id,
    product_name,
    cast(report_year as char) as report_year,
    average_daily_sales*(DATEDIFF(period_end,period_start)+1) as total_amount
FROM
    (SELECT 
        product_id,
        yr as report_year,
        case 
            when year(period_start) != yr then str_to_date(concat(yr, '-01-01'),'%Y-%m-%d')
            else period_start end as period_start,
        case 
            when year(period_end) != yr then str_to_date(concat(yr, '-12-31'),'%Y-%m-%d')
            else period_end end as period_end,
        average_daily_sales
    FROM 
        cte ) AS t1
JOIN
    product USING(product_id)
ORDER BY
    1,3