SELECT B.num
FROM MyNumbers A
LEFT JOIN MyNumbers B ON A.num = B.num AND A.num IN
(
    SELECT *
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)
ORDER BY B.num DESC
LIMIT 1;