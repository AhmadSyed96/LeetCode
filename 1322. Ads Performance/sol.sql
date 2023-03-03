WITH cte AS
    (SELECT
        ad_id,
        COALESCE(SUM(clicked),0) as total_clicks,
        COALESCE(SUM(viewed),0) as total_views,
        (COALESCE(SUM(clicked),0)+COALESCE(SUM(viewed),0)) chck
    FROM
        (SELECT
            *,
            case action when 'Clicked' then 1 else 0 end as clicked,
            case action when 'Viewed' then 1 else 0 end as viewed
        FROM
            ads) AS ads_pivot
    GROUP BY
        1)
SELECT
    ad_id,
    round(case chck when 0 then 0 else 100*total_clicks/(total_clicks+total_views) end,2) as ctr
FROM
    cte  
ORDER BY
    2 desc, 1