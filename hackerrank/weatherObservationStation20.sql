/*
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/

CREATE VIEW STATION_INDEX AS (
    SELECT *, ROW_NUMBER() OVER(ORDER BY LAT_N) AS i
    FROM STATION
    JOIN (
        SELECT ROUND(COUNT(*) / 2) AS middle
        FROM STATION
    ) t
);

SELECT ROUND(LAT_N, 4)
FROM STATION_INDEX
WHERE i = middle