/*
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.
*/
SELECT e.name
FROM (
    SELECT e1.managerId, COUNT(e1.managerId) as directsCount
    FROM Employee e1
    JOIN Employee e2
    ON e1.id = e2.id AND e1.managerId IS NOT NULL
    GROUP BY e1.managerId 
) AS managerDirectsCount
JOIN Employee e
ON e.id = managerDirectsCount.managerId
WHERE managerDirectsCount.directsCount >= 5