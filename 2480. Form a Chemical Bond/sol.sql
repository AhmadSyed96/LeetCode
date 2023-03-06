# Write your MySQL query statement below
WITH metals AS
    (SELECT
        symbol as metal
    FROM
        elements
    WHERE
        type='Metal'),
nonmetals as
    (SELECT
        symbol as nonmetal
    FROM
        elements
    WHERE
        type='Nonmetal')
SELECT * FROM metals, nonmetals