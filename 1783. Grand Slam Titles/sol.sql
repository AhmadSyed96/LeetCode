# Write your MySQL query statement below
WITH cte AS    
    (SELECT  year, 'Wimbledon' as event, Wimbledon as winner FROM Championships
    union
    SELECT  year, 'Fr_open' as event, Fr_open as winner FROM Championships
    union
    SELECT  year, 'US_open' as event, US_open as winner FROM Championships
    union
    SELECT  year, 'Au_open' as event, Au_open as winner FROM Championships)
SELECT
    winner as player_id, player_name, count(*) as grand_slams_count
FROM
    cte
JOIN
    Players ON cte.winner = Players.player_id
GROUP BY
    1,2
    
/*
SELECT player_id,player_name,
SUM(player_id=Wimbledon)+SUM(player_id=Fr_open)+SUM(player_id=US_open)+SUM(player_id=Au_open)
as grand_slams_count
FROM Players
JOIN Championships
ON player_id=Wimbledon or player_id=Fr_open or player_id=US_open or player_id=Au_open
GROUP BY player_id;
*/