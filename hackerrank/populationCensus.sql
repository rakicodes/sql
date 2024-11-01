-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
SELECT SUM(ci.POPULATION)
FROM CITY ci
JOIN COUNTRY co
ON COUNTRYCODE = CODE
WHERE CONTINENT = "Asia"