# Write your MySQL query statement below
SELECT
    DISTINCT title AS TITLE
FROM
    tvprogram
JOIN
    content USING(content_id)
WHERE
    LEFT(program_date,7)='2020-06' AND kids_content='Y' AND content_type='Movies'