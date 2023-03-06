# Write your MySQL query statement below
SELECT
    student_id, department_id,
    COALESCE(ROUND(100* (RANK() OVER(PARTITION BY department_id ORDER BY mark DESC) - 1) /
    (COUNT(*) OVER(PARTITION BY department_id) -1),2),0) as percentage
FROM
    students

/*
SELECT student_id, department_id, 
    ROUND(100*PERCENT_RANK() OVER (
          PARTITION BY department_id 
          ORDER BY mark DESC)
    , 2) AS percentage 
FROM Students
*/