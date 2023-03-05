# Write your MySQL query statement below
WITH unique_salaries AS
    (SELECT
        salary
    FROM
        employees
    GROUP BY
        1
    HAVING 
        count(*)<2),
salary_ranks AS    
    (SELECT  
        salary,
        ROW_NUMBER() OVER(ORDER BY salary) as sal_rnk
    FROM
        employees
    WHERE
        salary NOT IN (SELECT * FROM unique_salaries)
    GROUP BY
        1)
SELECT
    employees.*,
    salary_ranks.sal_rnk as team_id
FROM
    employees
JOIN
    salary_ranks USING(salary)
ORDER BY    
    4,1