/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.
*/
SELECT DISTINCT num AS ConsecutiveNums
FROM ( 
    SELECT *, LAG(num) OVER() AS sec, LAG(num, 2) OVER() AS third
    FROM Logs 
) AS cons
WHERE num = sec AND sec = third