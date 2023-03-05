# Write your MySQL query statement below
SELECT
    DISTINCT l1.account_id
FROM
    loginfo l1
JOIN
    loginfo l2 ON l1.account_id = l2.account_id AND l2.login <= l1.logout and l2.logout >= l1.login and l1.ip_address != l2.ip_address