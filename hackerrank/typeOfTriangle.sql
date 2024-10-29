/* Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
SELECT (
    CASE
        WHEN A=B AND A=C AND B=C THEN "Equilateral"
        WHEN (A+B>C AND A+C>B AND B+C>A) AND (A=B OR B=C OR A=C) THEN "Isosceles"
        WHEN (A+B>C AND A+C>B AND B+C>A) THEN "Scalene"
        ELSE "Not A Triangle"
    END
)
FROM TRIANGLES