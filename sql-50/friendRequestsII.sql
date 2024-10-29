/*
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.
*/
SELECT (
    CASE
        WHEN accepter_id IS NULL THEN requester_id
        ELSE accepter_id
    END
) AS id, (
    CASE
        WHEN num_accepted IS NOT NULL AND num_requested IS NOT NULL THEN num_accepted+num_requested
        WHEN num_accepted IS NULL THEN num_requested
        WHEN num_requested IS NULL THEN num_accepted
        ELSE 0
    END
) AS num
FROM (
    SELECT a.accepter_id, COUNT(accepter_id) AS num_accepted, r.requester_id, num_requested
    FROM RequestAccepted a
    LEFT JOIN
    (
        SELECT requester_id, COUNT(requester_id) AS num_requested
        FROM RequestAccepted
        GROUP BY requester_id
    ) AS r
    ON a.accepter_id = r.requester_id
    GROUP BY accepter_id
    UNION
    SELECT a.accepter_id, COUNT(accepter_id) AS num_accepted, r.requester_id, num_requested
    FROM RequestAccepted a
    RIGHT JOIN
    (
        SELECT requester_id, COUNT(requester_id) AS num_requested
        FROM RequestAccepted
        GROUP BY requester_id
    ) AS r
    ON a.accepter_id = r.requester_id
    GROUP BY accepter_id
) AS t
ORDER BY num DESC LIMIT 1