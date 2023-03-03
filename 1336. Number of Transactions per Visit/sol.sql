-- /* Write your T-SQL query statement below */
WITH trans_per_visit as 
    (--join with visits to also get visits that had 0 transactions
    SELECT
        visits.user_id,
        visits.visit_date,
        COALESCE(transactions_counts.num_trans,0) as num_trans
    FROM
        visits
    LEFT JOIN
        (--get count of trans per user per date
        SELECT
            user_id, transaction_date, count(*) as num_trans
        FROM
            transactions
        GROUP BY
            user_id,transaction_date) AS transactions_counts on visits.user_id=transactions_counts.user_id and visits.visit_date=transactions_counts.transaction_date),

tot_visits_per_trans_count as
    (SELECT
        num_trans, count(*) as visit_count
    FROM
        trans_per_visit
    GROUP BY
        num_trans),
max_trans as
    (SELECT MAX(num_trans) as mx FROM tot_visits_per_trans_count),
rcte as
    (SELECT 0 as transactions_count
    UNION ALL
    SELECT  transactions_count+1 FROM rcte WHERE transactions_count<(SELECT mx FROM max_trans))
SELECT 
    rcte.transactions_count, COALESCE(tot_visits_per_trans_count.visit_count,0) as visits_count
FROM 
    rcte
LEFT JOIN
    tot_visits_per_trans_count ON rcte.transactions_count=tot_visits_per_trans_count.num_trans


