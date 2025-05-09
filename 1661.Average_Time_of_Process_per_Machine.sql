SELECT T1.machine_id, ROUND(AVG(T2.timestamp - T1.timestamp), 3) AS processing_time
FROM activity T1
JOIN activity T2 ON T1.machine_id = T2.machine_id AND T1.process_id = T2.process_id AND T2.activity_type = 'end' AND T1.activity_type = 'start'
GROUP BY T1.machine_id;