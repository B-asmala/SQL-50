WITH cte AS (
    SELECT id, email, MIN(id) OVER(PARTITION BY email) AS min_id
    FROM Person
)
DELETE FROM Person
WHERE id IN (SELECT id FROM cte WHERE id > min_id);