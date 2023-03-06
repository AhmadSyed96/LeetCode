# Write your MySQL query statement below
# SELECT
#     count(customer_id) AS rich_count
# FROM
#     (SELECT
#         customer_id
#     FROM
#         store
#     GROUP BY
#         1
#     HAVING
#         SUM(amount>500)>0) AS t1

SELECT
    COUNT(DISTINCT customer_id) AS rich_count
FROM
    store
WHERE
    amount>500