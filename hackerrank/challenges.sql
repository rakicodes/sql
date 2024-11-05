/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/
CREATE VIEW num_challenges_per_stu
AS (
    SELECT hacker_id, COUNT(hacker_id) AS total_ch
    FROM Challenges
    GROUP BY hacker_id
);

CREATE VIEW same_num_count
AS (
    SELECT total_ch, COUNT(total_ch) AS num_count
    FROM num_challenges_per_stu
    GROUP BY total_ch
);

CREATE VIEW total_ch_and_num_count
AS (
    SELECT hacker_id, sn.total_ch, num_count
    FROM num_challenges_per_stu nc
    JOIN same_num_count sn
    on nc.total_ch = sn.total_ch
);

CREATE VIEW maximum_ch
AS (
    SELECT MAX(total_ch) AS max_total
    FROM num_challenges_per_stu
);

SELECT h.hacker_id, h.name, total_ch
FROM Hackers h
JOIN total_ch_and_num_count t
ON h.hacker_id = t.hacker_id
WHERE NOT (num_count > 1 AND total_ch < (
    SELECT max_total
    FROM maximum_ch
))
ORDER BY total_ch DESC, h.hacker_id