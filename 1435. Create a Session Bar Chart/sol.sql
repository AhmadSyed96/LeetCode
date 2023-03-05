# Write your MySQL query statement below
SELECT '[0-5>' as bin, SUM(duration/60<5) as total FROM sessions
UNION
SELECT '[5-10>' as bin, SUM(duration/60>=5 AND duration/60<10) as total FROM sessions
UNION
SELECT '[10-15>' as bin, SUM(duration/60>=10 AND duration/60<15) as total FROM sessions
UNION
SELECT '15 or more' as bin, SUM(duration/60>15) as total FROM sessions