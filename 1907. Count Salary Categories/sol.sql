# Write your MySQL query statement below

SELECT  'Low Salary' AS category, count(*) as accounts_count FROM accounts WHERE income<20000
UNION 
SELECT  'Average Salary' AS category, count(*) as accounts_count FROM accounts WHERE income>=20000 and income<=50000
UNION
SELECT  'High Salary' AS category, count(*) as accounts_count FROM accounts WHERE income>50000
