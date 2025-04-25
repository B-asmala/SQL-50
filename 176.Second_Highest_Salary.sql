WITH cte AS(
SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS r
FROM Employee
) 
SELECT DISTINCT (CASE WHEN COUNT(*) > 0 THEN salary ELSE null END) AS SecondHighestSalary
FROM cte
WHERE r = 2;