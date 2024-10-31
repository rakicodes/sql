/*
We define an employee's total earnings to be their monthly (months*salary) worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
*/
SELECT max_total, COUNT(*)
FROM Employee
JOIN (
    SELECT MAX(emp_total) AS max_total
    FROM (
        SELECT employee_id, months*salary AS emp_total
        FROM Employee
    ) AS t
) AS t2
WHERE max_total = months*salary
GROUP BY max_total