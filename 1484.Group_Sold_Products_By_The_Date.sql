WITH cte AS (
    SELECT DISTINCT *
    FROM Activities
)
SELECT sell_date, COUNT(product) AS num_sold, GROUP_CONCAT(product ORDER BY product) AS products
FROM cte
GROUP BY 1
ORDER BY 1;