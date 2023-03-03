# Write your MySQL query statement below
SELECT
    prices.product_id, round(sum(units*price)/sum(units),2) as average_price
FROM
    Prices 
JOIN
    UnitsSold on Prices.product_id = UnitsSold.product_id and purchase_date BETWEEN start_date and end_date
GROUP BY
    1
