/*
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference column) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a department and its name.
 

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.
*/
SELECT r.Department, e.name AS Employee, r.Salary
FROM Employee e
JOIN (
    SELECT d.name AS Department, e.salary AS Salary, e.departmentId, salary_by_department
    FROM (
        SELECT departmentId, salary, RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS salary_by_department
        FROM Employee e
        GROUP BY departmentId, salary
    ) AS e
    JOIN Department d
    ON e.departmentId = d.id
) AS r
ON r.departmentId = e.departmentId AND r.Salary = e.salary
WHERE salary_by_department <= 3