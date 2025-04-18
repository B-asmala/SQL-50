-- cte solution
WITH cte AS (
    SELECT product_id, MAX(change_date) AS max_change_date
    FROM Products 
    WHERE change_date <= '2019-08-16'
    GROUP BY 1
)
SELECT p.product_id, p.new_price AS price
FROM Products p
JOIN cte c ON p.product_id = c.product_id AND p.change_date = c.max_change_date
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM cte);