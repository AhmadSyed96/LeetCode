# Write your MySQL query statement below
WITH template AS
    (SELECT DISTINCT spend_date, 'mobile' AS platform FROM spending
    UNION
    SELECT DISTINCT spend_date, 'desktop' AS platform FROM spending
    UNION
    SELECT DISTINCT spend_date, 'both' AS platform FROM spending),
results AS
    (SELECT
        *,
        IF(mobile_amount>0,IF(desktop_amount>0,'both','mobile'),'desktop') as platform,
        mobile_amount+desktop_amount as amount
    FROM    
        (SELECT
        spend_date,
        user_id,
        SUM(CASE platform WHEN 'mobile' THEN amount ELSE 0 END) mobile_amount,
        SUM(CASE platform WHEN 'desktop' THEN amount ELSE 0 END) desktop_amount
        FROM Spending
        GROUP BY spend_date, user_id) AS t1)
SELECT
    template.spend_date,
    template.platform,
    COALESCE(SUM(amount),0) as total_amount,
    COUNT(user_id) as total_users
FROM
    results
RIGHT JOIN
    template ON results.spend_date=template.spend_date and results.platform=template.platform
GROUP BY
    1,2