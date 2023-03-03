# Write your MySQL query statement below
SELECT
    posts.post_id,
    count(distinct sub_id) as number_of_comments
FROM
    submissions
RIGHT JOIN
    (SELECT distinct sub_id as post_id FROM submissions WHERE parent_id IS NULL) AS posts ON posts.post_id=submissions.parent_id
GROUP BY
    1