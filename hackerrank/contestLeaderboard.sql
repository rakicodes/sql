/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.
*/
select h.hacker_id, h.name, t.totalScore
from (
    select hacker_id, sum(score) as totalScore
    from (
        select hacker_id, max(score) as score
        from Submissions s
        group by hacker_id, challenge_id
    ) as s
    group by hacker_id
    having sum(score) > 0
) as t
join Hackers h
on h.hacker_id = t.hacker_id
order by t.totalScore DESC, h.hacker_id ASC