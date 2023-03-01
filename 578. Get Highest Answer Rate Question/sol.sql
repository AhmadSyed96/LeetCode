# Write your MySQL query statement below
SELECT
    question_id as survey_log
FROM
    (SELECT
        question_id,
        RANK() OVER(ORDER BY COALESCE(SUM(CASE action WHEN 'answer' THEN 1 END),0)/SUM(CASE action WHEN 'show' THEN 1 END) DESC) as rnk
    FROM
        surveylog
    GROUP BY
        1) AS t1
WHERE
    rnk = 1
ORDER BY
    question_id
LIMIT
    1;

# Better solution
SELECT
    question_id as survey_log
FROM
    surveylog
GROUP BY
    1
ORDER BY
    count(answer_id)/sum(case when action='show' then 1 end) DESC, question_id 
LIMIT 1;