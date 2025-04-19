WITH cte (lower_bound, upper_bound, category) AS (
    SELECT 0, 19999, 'Low Salary'
    UNION ALL
    SELECT 20000, 50000, 'Average Salary'
    UNION ALL
    SELECT 50001, NULL, 'High Salary'
)
SELECT c.category, COUNT(a.account_id) AS accounts_count
FROM Accounts a
RIGHT JOIN cte c ON a.income >= c.lower_bound AND (a.income <= c.upper_bound OR c.upper_bound IS NULL)
GROUP BY c.category;