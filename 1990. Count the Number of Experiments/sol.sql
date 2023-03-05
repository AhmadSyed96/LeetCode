# Write your MySQL query statement below
WITH plats_x_exps AS
    (SELECT 'Android' platform, 'Reading' experiment_name
    UNION
    SELECT 'Android' platform, 'Sports' experiment_name
    UNION
    SELECT 'Android' platform, 'Programming' experiment_name
    UNION
    SELECT 'IOS' platform, 'Reading' experiment_name
    UNION
    SELECT 'IOS' platform, 'Sports' experiment_name
    UNION
    SELECT 'IOS' platform, 'Programming' experiment_name
    UNION
    SELECT 'Web' platform, 'Reading' experiment_name
    UNION
    SELECT 'Web' platform, 'Sports' experiment_name
    UNION
    SELECT 'Web' platform, 'Programming' experiment_name),
results AS    
    (SELECT
        platform,
        experiment_name,
        count(*) as num_experiments
    FROM
        experiments
    GROUP BY
        1,2)
SELECT
    plats_x_exps.platform,
    plats_x_exps.experiment_name,
    COALESCE(results.num_experiments,0) as num_experiments
FROM
    plats_x_exps
LEFT JOIN
    results USING(platform,experiment_name)
