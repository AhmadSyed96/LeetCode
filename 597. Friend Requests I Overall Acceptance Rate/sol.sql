# Write your MySQL query statement below
WITH friendrequest_d AS
    (SELECT sender_id, send_to_id, MIN(request_date) AS request_date FROM friendrequest GROUP BY 1,2),
requestaccepted_d AS
    (SELECT requester_id, accepter_id, MIN(accept_date) AS accept_date FROM requestaccepted GROUP BY 1,2)
SELECT
    COALESCE(ROUND((SELECT COUNT(*) FROM requestaccepted_d)/(SELECT COUNT(*) FROM friendrequest_d),2),0) AS accept_rate


# SELECT
# ROUND(
#     IFNULL(
#     (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) AS A)
#     /
#     (SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) AS B),
#     0)
# , 2) AS accept_rate;