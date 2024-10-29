/*
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
*/
SELECT MIN(name) AS results
FROM (
    SELECT name, rank_rated
    FROM (
        SELECT u.name, RANK() OVER(ORDER BY nm.nums_rated DESC) AS rank_rated
        FROM Users u
        JOIN (
            SELECT user_id, COUNT(movie_id) AS nums_rated
            FROM MovieRating
            GROUP BY user_id
        ) AS nm
        ON nm.user_id = u.user_id
    ) AS r
    WHERE rank_rated = 1
) AS user_most_rate
UNION ALL
SELECT MIN(title) AS results
FROM Movies m 
JOIN (
    SELECT movie_id, RANK() OVER(ORDER BY avg_rating DESC) AS rank_avg
    FROM (
        SELECT movie_id, AVG(rating) AS avg_rating
        FROM MovieRating
        WHERE created_at BETWEEN "2020-02-01" AND "2020-02-29"
        GROUP BY movie_id
    ) AS a
) as ma
ON ma.movie_id = m.movie_id
WHERE ma.rank_avg = 1