/*
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
*/
SELECT IF(COUNT(*) = 1, t.salary, null) AS SecondHighestSalary
FROM (
    SELECT salary, RANK() OVER(ORDER BY salary DESC) AS rank_num
    FROM Employee
    GROUP BY salary
) t
WHERE t.rank_num = 2 