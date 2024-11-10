/*
Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

CREATE VIEW student_salary AS (
    SELECT name, salary, s.id
    FROM Students s
    JOIN Packages p
    ON s.id = p.id
);

SELECT s.name
FROM student_salary s
JOIN (
    SELECT f.id, friend_id, salary AS f_salary
    FROM Friends f
    JOIN student_salary s
    ON s.id = f.friend_id
) AS t
ON t.id = s.id
WHERE s.salary < t.f_salary
ORDER BY t.f_salary