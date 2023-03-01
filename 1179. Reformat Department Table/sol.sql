# Write your MySQL query statement below
SELECT
    id,
    sum(case month when 'Jan' then revenue else null end) as 'Jan_Revenue',
    sum(case month when 'Feb' then revenue else null end) as 'Feb_Revenue',
    sum(case month when 'Mar' then revenue else null end) as 'Mar_Revenue',
    sum(case month when 'Apr' then revenue else null end) as 'Apr_Revenue',
    sum(case month when 'May' then revenue else null end) as 'May_Revenue',
    sum(case month when 'Jun' then revenue else null end) as 'Jun_Revenue',
    sum(case month when 'Jul' then revenue else null end) as 'Jul_Revenue',
    sum(case month when 'Aug' then revenue else null end) as 'Aug_Revenue',
    sum(case month when 'Sep' then revenue else null end) as 'Sep_Revenue',
    sum(case month when 'Oct' then revenue else null end) as 'Oct_Revenue',
    sum(case month when 'Nov' then revenue else null end) as 'Nov_Revenue',
    sum(case month when 'Dec' then revenue else null end) as 'Dec_Revenue'
FROM
    department
GROUP BY
    1