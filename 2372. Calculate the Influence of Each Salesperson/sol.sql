# Write your MySQL query statement below
WITH tot_per_sp AS
    (SELECT
        salesperson_id,
        SUM(price) as total
    FROM
        sales
    JOIN
        customer USING(customer_id)
    GROUP BY 
        1)
SELECT
    salesperson.salesperson_id, name, COALESCE(total,0) as total
FROM
    tot_per_sp
RIGHT JOIN
    salesperson USING(salesperson_id)
