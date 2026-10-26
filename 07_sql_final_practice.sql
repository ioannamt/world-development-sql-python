-- Calculate total population by continent for 2007.
-- Keep totals above 500 million; sort largest to smallest.

SELECT continent,
       SUM(pop) AS total_population
FROM development 
WHERE year = 2007
GROUP BY continent
HAVING total_population > 500000000
ORDER BY total_population DESC;

-- Show European countries' life expectancy and available capitals for 2007.
-- Keep countries without matching metadata; sort alphabetically.

SELECT 
      m.capital,
      d.country,
      d.lifeExp     
FROM development AS d
LEFT JOIN country_metadata AS m
ON m.country = d.country 
WHERE d.year = 2007
AND d.continent = 'Europe'
ORDER BY d.country ASC;

-- Show European countries in 2007 with no matching metadata.
-- Sort alphabetically by country.

SELECT 
      d.country    
FROM development AS d
LEFT JOIN country_metadata AS m
ON m.country = d.country 
WHERE d.year = 2007
AND d.continent = 'Europe'
AND m.country IS NULL
ORDER BY d.country ASC;