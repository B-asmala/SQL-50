WITH cte AS (
    SELECT  e.salary AS Salary, e.name AS Employee, d.name AS Department, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS r
    FROM Employee e
    JOIN Department d ON d.id = e.departmentId
) 
SELECT Department, Employee, Salary
FROM cte
WHERE r <= 3;