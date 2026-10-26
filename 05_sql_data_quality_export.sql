/*Show each continent and its average life expectancy for 2007, 
  sorted from highest average to lowest.
 */

SELECT
 continent,
 AVG(lifeExp) AS "average life expectancy"
FROM 
 development 
WHERE 
 year = 2007
GROUP BY continent 
ORDER BY "average life expectancy" DESC;

-- Display country records for 2007 that have no matching record in country_metadata.

SELECT 
 d.country
FROM development AS d
LEFT JOIN country_metadata AS c
ON d.country = c.country 
WHERE d.year = 2007
AND 
c.country IS NULL
ORDER BY d.country ASC;

-- Show country, year and life expectancy for records with missing lifeExp.

SELECT 
 country,
 year,
 lifeExp AS "life expectancy"
FROM development
WHERE lifeExp IS NULL;

-- Check for repeated country–year pairs in development. 
-- Show country, year, and the row count, keeping only pairs that occur more than once.

SELECT COUNT(*) AS "row count",
 year,
 country
FROM development
GROUP BY country, year
HAVING COUNT(*) > 1;

-- Select 2007 data for export to development_2007.csv via DBeaver.

SELECT
    country,
    year,
    continent,
    pop,
    lifeExp,
    gdpPercap
FROM development
WHERE year = 2007
ORDER BY country;
