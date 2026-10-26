-- Create a country lookup table if it does not already exist.

CREATE TABLE IF NOT EXISTS countries (
    country TEXT PRIMARY KEY,
    continent TEXT
);

-- Add countries that are not already in the lookup table.

INSERT INTO countries (country, continent)
SELECT DISTINCT country, continent
FROM development
WHERE country NOT IN (
    SELECT country FROM countries
);

-- List distinct country-year pairs for 2007.

SELECT DISTINCT country, year
FROM development
WHERE year = 2007;

-- Count distinct countries in 2007.

SELECT COUNT(DISTINCT country) AS total_countries
FROM development
WHERE year = 2007;

-- Calculate total population by continent for 2007.

SELECT SUM(pop) AS "total_population", continent
FROM development
WHERE year = 2007
GROUP BY continent;

-- Calculate average country life expectancy by continent for 2007.

SELECT AVG(lifeExp) AS "Average_life_expectancy", continent
FROM development
WHERE year = 2007
GROUP BY continent;

-- Show continents with average country life expectancy above 70 years.

SELECT AVG(lifeExp) AS "Average_life_expectancy", continent
FROM development
WHERE year = 2007
GROUP BY continent
HAVING AVG(lifeExp) > 70
ORDER BY Average_life_expectancy DESC;

-- Show continents with more than 30 country records in 2007.

SELECT COUNT(country) AS "Number_of_countries", continent
FROM development
WHERE year = 2007
GROUP BY continent
HAVING COUNT(country) > 30
ORDER BY Number_of_countries DESC;

-- Show population and life expectancy summaries for continents
-- whose total population exceeds 500 million in 2007.

SELECT SUM(pop) AS "Total_population", AVG(lifeExp) as "Average_country_life_expectancy", continent
FROM development
WHERE year = 2007
GROUP BY continent
HAVING SUM(pop) > 500000000
ORDER BY Total_population DESC;

-- Count records in the country lookup table.

SELECT COUNT(*) FROM countries;

-- Join 2007 development records to their country lookup entries.

SELECT development.country,
       development.year,
       development.pop,
       countries.continent
FROM development
INNER JOIN countries
    ON development.country = countries.country
WHERE development.year = 2007;

-- Show the UK's continent using an INNER JOIN for 2007.

SELECT development.country, countries.continent
FROM development
INNER JOIN countries
    ON development.country = countries.country
WHERE development.country = 'United Kingdom'
  AND development.year = 2007;

-- Show France's population and continent for 2007.

SELECT development.country, 
       development.pop,
       countries.continent
FROM development
INNER JOIN countries
 ON countries.country = development.country
WHERE development.year = 2007 AND development.country = 'France';

-- Show European countries in 2007, largest population first.

SELECT development.country, 
       development.pop,
       countries.continent
FROM development
INNER JOIN countries
 ON countries.country = development.country
WHERE development.year = 2007 AND development.continent = 'Europe'
ORDER BY development.pop DESC;

-- Show the five most populated Asian countries in 2007.

SELECT development.country, 
       development.pop,
       countries.continent
FROM development
INNER JOIN countries
 ON countries.country = development.country
WHERE development.year = 2007 AND development.continent = 'Asia'
ORDER BY development.pop DESC
LIMIT 5;

-- Show the UK's 2007 record using a LEFT JOIN.

SELECT development.country, 
       development.pop,
       countries.continent
FROM development
LEFT JOIN countries 
 ON countries.country = development.country
WHERE development.year = 2007 AND development.country = 'United Kingdom';

