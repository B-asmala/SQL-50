WITH cte AS (
    SELECT b.id, b.name AS name, COUNT(*) AS c
    FROM Employee a
    INNER JOIN Employee b ON a.managerId = b.id
    GROUP BY b.id
)
SELECT name
FROM cte
WHERE c >= 5;