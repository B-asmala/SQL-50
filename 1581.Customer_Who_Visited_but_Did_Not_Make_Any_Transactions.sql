-- JOIN solution
SELECT v.customer_id, COUNT(v.visit_id) as count_no_trans
FROM visits v
LEFT JOIN transactions t ON t.visit_id = v.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;

-- SUBQUERY solution
SELECT customer_id, COUNT(visit_id) as count_no_trans
FROM visits
WHERE visit_id NOT IN (SELECT visit_id FROM transactions)
GROUP BY customer_id;