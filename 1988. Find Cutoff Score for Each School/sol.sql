# Write your MySQL query statement below
SELECT
    schools.school_id, COALESCE(score,-1) as score
FROM
    (SELECT
        school_id, score
    FROM
        (SELECT
            school_id, score, min(score) over(partition by school_id) as minscr
        FROM
            (SELECT
                school_id, score, student_count, max(student_count) over(partition by school_id) as maxstu
            FROM
                schools
            JOIN
                exam on student_count <= capacity) AS t1
        WHERE
            student_count = maxstu) AS t2
    WHERE
        score = minscr) AS t3
RIGHT JOIN
    schools USING(school_id)
ORDER BY 
    1