-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT CI.NAME
FROM CITY CI
JOIN COUNTRY CO
ON CI.COUNTRYCODE = CO.CODE
WHERE CONTINENT = "Africa"