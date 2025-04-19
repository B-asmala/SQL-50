-- window function solution
SELECT b.person_name
FROM(
    SELECT person_id,
    SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
) a
JOIN Queue b ON a.person_id = b.person_id
WHERE a.cumulative_weight <= 1000
ORDER BY a.cumulative_weight DESC
LIMIT 1;