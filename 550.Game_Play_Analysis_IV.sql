-- cte solution
WITH cte AS (
    SELECT player_id, MIN(event_date) AS start
    FROM Activity
    GROUP BY 1
)
SELECT ROUND(COUNT(DISTINCT c.player_id) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity a
LEFT JOIN cte c ON a.player_id = c.player_id AND a.event_date = DATE_ADD(c.start, INTERVAL 1 DAY);