SELECT s.user_id, 
COALESCE((SELECT ROUND(COUNT(CASE WHEN c.action = 'confirmed' THEN 1 ELSE NULL END) / COUNT(action), 2) FROM Confirmations c GROUP BY c.user_id HAVING c.user_id = s.user_id) ,0) AS confirmation_rate
FROM Signups s;