SELECT ROUND(SUM(a.tiv_2016), 2) AS tiv_2016 
FROM Insurance a
JOIN
(SELECT pid, COUNT(*) OVER (PARTITION BY tiv_2015) AS c_tiv_15
FROM Insurance) b ON a.pid = b.pid
WHERE b.c_tiv_15 > 1 AND (a.lat, a.lon) IN
(SELECT lat, lon
FROM Insurance
GROUP BY lat, lon
HAVING COUNT(*) = 1);