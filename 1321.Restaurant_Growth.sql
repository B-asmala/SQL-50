-- can be further optimized using a window function
SELECT DISTINCT a.visited_on,
(SELECT SUM(b.amount)
FROM Customer b
WHERE b.visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on) AS amount,
(SELECT ROUND( SUM(b.amount) / 7, 2)
FROM Customer b
WHERE b.visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on) AS average_amount
FROM Customer a
WHERE DATEDIFF(a.visited_on, (SELECT DISTINCT MIN(c.visited_on) FROM Customer c)) >= 6
ORDER BY 1;