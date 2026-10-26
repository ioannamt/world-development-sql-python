--Find the country with the highest life expectancy in 2007.

SELECT 
 country,
 lifeExp,
 year,
 pop
FROM
 development 
WHERE year = 2007
ORDER BY lifeExp DESC
LIMIT 1;

-- Show the UK's life expectancy over time.
-- Order from earliest to latest year.

SELECT 
 country,
 lifeExp AS LifeExpectancy,
 year
FROM
 development 
WHERE country = 'United Kingdom'
ORDER BY year ASC;

-- Show average country life expectancy by continent for 2007.
-- Keep averages above 70 years; sort highest to lowest.

SELECT
    continent,
    AVG(lifeExp) AS "Average Life Expectancy"
FROM development
WHERE year = 2007
GROUP BY continent
HAVING AVG(lifeExp) > 70
ORDER BY AVG(lifeExp) DESC;

--Find the country with the highest GDP per person in 2007

SELECT
 country,
 gdpPercap AS "GDP per Person"
FROM
 development
WHERE year = 2007
ORDER BY gdpPercap DESC
LIMIT 1;

--For 2007, show the largest population recorded for a single country in each continent.

SELECT 
 MAX(pop) AS "Maximum Population",
 continent
FROM
 development 
WHERE year = 2007
GROUP BY continent
ORDER BY "Maximum Population" DESC;