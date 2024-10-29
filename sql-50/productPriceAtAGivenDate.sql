/*
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.
*/
SELECT p1.product_id, 
    (
        CASE
            WHEN p2.new_price IS NOT NULL THEN p2.new_price
            ELSE 10
        END
    ) AS price
FROM
(
    SELECT product_id
    FROM Products
    GROUP BY product_id
) AS p1
LEFT JOIN
(
    SELECT p.product_id, p.change_date, p.new_price
    FROM (
        SELECT product_id, MAX(change_date) AS last_date
        FROM Products 
        WHERE change_date <= "2019-08-16"
        GROUP BY product_id
    ) AS cp
    LEFT JOIN Products p
    ON (cp.product_id = p.product_id AND cp.last_date = p.change_date) 
) AS p2
ON p1.product_id = p2.product_id