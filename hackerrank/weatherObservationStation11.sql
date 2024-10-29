-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE(CITY, "^[aeiou]", "i") OR NOT REGEXP_LIKE(CITY, "[aeiou]$", "i")