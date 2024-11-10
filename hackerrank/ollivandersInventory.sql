/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*/
SELECT w1.id, w1.age, w2.min_coins, w1.`power`
FROM (
    SELECT id, `power`, age, coins_needed
    FROM Wands w
    JOIN Wands_Property wp
    ON w.code = wp.code
) w1
JOIN (
    SELECT `power`, age, MIN(coins_needed) AS min_coins
    FROM Wands w
    JOIN (
        SELECT code, age
        FROM Wands_Property
        WHERE is_evil = 0
    ) AS ne
    ON w.code = ne.code
    GROUP BY `power`, age
) w2
ON w1.age = w2.age AND w1.power = w2.power AND w1.coins_needed = w2.min_coins
ORDER BY w1.power DESC, w1.age DESC