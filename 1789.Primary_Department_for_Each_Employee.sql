WITH cte AS (
    SELECT employee_id, COUNT(department_id) AS department_count
    FROM Employee 
    GROUP BY 1
)
SELECT e.employee_id, e.department_id
FROM Employee e
JOIN cte c ON e.employee_id = c.employee_id
WHERE e.primary_flag = 'Y' OR c.department_count = 1;