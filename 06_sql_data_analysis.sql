/*
-- Calculate average country life expectancy by continent for 2007.
-- Sort highest to lowest for comparison with the pandas results.
*/

SELECT continent,
       AVG(lifeExp) AS average_life_expectancy
FROM development 
WHERE year = 2007
GROUP BY continent 
ORDER BY AVG(lifeExp) DESC;
