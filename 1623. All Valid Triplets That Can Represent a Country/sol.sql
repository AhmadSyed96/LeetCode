# Write your MySQL query statement below
SELECT
    s1.student_name as member_A, s2.student_name as member_B, s3.student_name as member_C
FROM
    schoola s1
JOIN
    schoolb s2 ON s1.student_id<>s2.student_id
    and s1.student_name<>s2.student_name
JOIN
    schoolc s3 ON s2.student_id<>s3.student_id AND s1.student_id<>s3.student_id
    and s2.student_name<>s3.student_name and s1.student_name<>s3.student_name