WITH RECURSIVE cte AS
    (SELECT task_id, subtasks_count, 1 AS lvl FROM tasks
    UNION
    SELECT task_id, subtasks_count, lvl+1 FROM cte WHERE lvl < subtasks_count)
SELECT task_id, lvl as subtask_id FROM cte WHERE (task_id,lvl) NOT IN (SELECT * FROM executed)