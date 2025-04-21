SELECT results FROM 
(SELECT u.name AS results
FROM MovieRating mr
JOIN Users u ON mr.user_id = u.user_id
GROUP BY u.user_id
ORDER BY COUNT(rating) DESC, u.name
LIMIT 1) a

UNION ALL

SELECT results FROM 
(SELECT m.title AS results
FROM MovieRating mr
JOIN Movies m ON m.movie_id = mr.movie_id
WHERE SUBSTR(created_at, 1, 7) = '2020-02'
GROUP BY m.movie_id
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1) b;