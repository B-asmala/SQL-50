WITH cte AS(
    SELECT DISTINCT product_id, SUM(unit) AS s
    FROM Orders
    WHERE SUBSTRING(order_date, 1, 7) = '2020-02'
    GROUP BY 1 
)
SELECT p.product_name, c.s AS unit
FROM cte c
JOIN Products p ON p.product_id = c.product_id
WHERE c.s >= 100;
