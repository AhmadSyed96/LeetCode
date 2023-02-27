# Write your MySQL query statement below
SELECT
    firstname,lastname,city,state
FROM
    address
RIGHT JOIN
    person USING(personid)