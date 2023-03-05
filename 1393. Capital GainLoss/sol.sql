# Write your MySQL query statement below
SELECT
    stock_name, SUM(pl) as capital_gain_loss
FROM
    (SELECT
        stock_name, CASE WHEN operation = 'Buy' THEN price * -1 ELSE price END as pl
    FROM
        Stocks) as pls
GROUP BY 1