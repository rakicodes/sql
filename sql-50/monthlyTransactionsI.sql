/*
Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.
*/
WITH Approved AS (
    SELECT id, amount
    FROM Transactions 
    WHERE state = "approved"
)
SELECT SUBSTRING(t1.trans_date, 1, 7) as `month`, 
        t1.country, 
        COUNT(t1.id) AS trans_count, 
        COUNT(a.id) AS approved_count,
        SUM(t1.amount) AS trans_total_amount,
        IFNULL(SUM(a.amount),0) AS approved_total_amount
FROM Transactions t1
LEFT JOIN Approved a
ON t1.id = a.id
GROUP BY `month`, t1.country;