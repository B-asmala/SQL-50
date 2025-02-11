/*
alias column names cannot be used in all clauses of an SQL query.
Instead, you can use the alias name to refer to a column only in 
GROUP BY, ORDER BY, or HAVING clauses.
*/
SELECT DISTINCT author_id AS id FROM Views 
WHERE author_id = viewer_id
ORDER BY id;