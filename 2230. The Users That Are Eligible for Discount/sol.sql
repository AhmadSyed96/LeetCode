CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	# Write your MySQL query statement below.
	SELECT
        distinct user_id
    FROM
        purchases
    WHERE
        time_stamp between startDate and endDate
        and amount >= minAmount
    ORDER BY user_id;
END