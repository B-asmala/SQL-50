WITH months_cte AS (
    SELECT id, SUBSTRING(trans_date, 1, 7) AS month -- get the year and month part from string
    FROM Transactions
)

SELECT m.month, t.country, COUNT(*) AS trans_count, COUNT(CASE WHEN t.state = 'approved' THEN 1 ELSE NULL END) AS approved_count, SUM(t.amount) AS trans_total_amount, SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_total_amount
FROM Transactions t
INNER JOIN months_cte m ON m.id = t.id
GROUP BY t.country, m.month;