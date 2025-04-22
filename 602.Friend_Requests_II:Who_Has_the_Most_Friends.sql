SELECT a.id AS id, COUNT(a.id) AS num
FROM 
(SELECT requester_id AS id
FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id
FROM RequestAccepted) a
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;