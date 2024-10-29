/*
Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.
*/
SELECT visited_on, total_amount AS amount, ROUND(total_amount/7,2) AS average_amount
FROM (
    SELECT visited_on, SUM(amount) OVER(ORDER BY visited_on DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_amount, rk
    FROM (
        SELECT visited_on, SUM(amount) AS amount, RANK() OVER(ORDER BY visited_on) AS rk
        FROM Customer
        GROUP BY visited_on
    ) AS s
) AS s2
WHERE rk >= 7
ORDER BY visited_on ASC