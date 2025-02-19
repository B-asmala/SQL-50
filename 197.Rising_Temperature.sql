SELECT today.id AS Id
FROM weather today
JOIN weather yesterday ON today.recordDate = yesterday.recordDate + INTERVAL 1 DAY
WHERE today.temperature > yesterday.temperature;