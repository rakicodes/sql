/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/
SELECT h.hacker_id, name
FROM Hackers h
JOIN (
    SELECT hacker_id, COUNT(hacker_id) AS count_full_scores
    FROM (
        SELECT hacker_id, score, full_score
        FROM Submissions s
        JOIN (
            SELECT challenge_id, score AS full_score
            FROM Difficulty d
            JOIN Challenges c
            ON d.difficulty_level = c.difficulty_level
        ) AS c
        ON s.challenge_id = c.challenge_id
    ) AS s
    WHERE score=full_score
    GROUP BY hacker_id
    HAVING COUNT(hacker_id) > 1
) AS s
ON s.hacker_id = h.hacker_id
ORDER BY count_full_scores DESC, h.hacker_id ASC