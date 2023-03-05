# # Write your MySQL query statement below
WITH cte AS
    (SELECT caller_id, recipient_id, call_time FROM calls
    union all
    SELECT recipient_id, caller_id, call_time FROM calls)
SELECT
    DISTINCT caller_id AS user_id
FROM
    (SELECT
        t0.caller_id,
        t1.recipient_id as max_caller,
        t2.recipient_id as min_caller
    FROM    
        (SELECT
            caller_id, DATE(call_time) as dt,
            MAX(call_time) as mx,MIN(call_time) as mn
        FROM
            cte
        GROUP BY 
            1,2) AS t0
    JOIN
        cte t1 ON t0.caller_id=t1.caller_id and t0.mx=t1.call_time
    JOIN
        cte t2 ON t0.caller_id=t2.caller_id and t0.mn=t2.call_time) AS t4
WHERE 
    max_caller = min_caller
ORDER BY
    1
