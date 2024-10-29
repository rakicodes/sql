-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT CITY, LEN FROM (SELECT CITY, LENGTH(CITY) LEN FROM STATION GROUP BY CITY) ORDER BY LEN ASC LIMIT 1;
SELECT CITY, LEN FROM (SELECT CITY, LENGTH(CITY) LEN FROM STATION GROUP BY CITY) ORDER BY LEN DESC LIMIT 1;