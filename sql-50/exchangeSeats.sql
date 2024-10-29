/*
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.
*/
SELECT s1_id AS id, 
    (
        CASE
            WHEN s2_student IS NULL THEN s1_student
            ELSE s2_student
        END
    ) AS student
FROM (
    SELECT s1.id AS s1_id, s1.student AS s1_student, s2.id AS s2_id, s2.student AS s2_student
    FROM Seat s1
    LEFT JOIN Seat s2
    ON s2.id = s1.id+1
    WHERE MOD(s1.id, 2) != 0
) AS s1
UNION
SELECT s2_id AS id, s1_student AS student
FROM (
    SELECT s1.id AS s1_id, s1.student AS s1_student, s2.id AS s2_id, s2.student AS s2_student
    FROM Seat s1
    LEFT JOIN Seat s2
    ON s2.id = s1.id+1
    WHERE MOD(s1.id, 2) != 0
) AS s2
WHERE s2_id IS NOT NULL
ORDER BY id