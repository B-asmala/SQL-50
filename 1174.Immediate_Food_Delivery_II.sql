-- cte solution
WITH cte AS (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY 1
)
SELECT ROUND(100.0  * COUNT(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE NULL END) / COUNT(*), 2) AS immediate_percentage
FROM Delivery d
JOIN cte c ON d.customer_id = c.customer_id
WHERE d.order_date = c.first_order;