-- Show Germany's population, life expectancy and continent for 2007.
-- Join development records to the country lookup table.

SELECT 
 d.country AS Country,
 d.pop AS Population,
 d.lifeExp AS LifeExpectancy,
 c.continent AS Continent
FROM
 development AS d
INNER JOIN 
 countries AS c
ON d.country = c.country
WHERE d.country = 'Germany' 
AND d.year = 2007;

-- Create a small metadata table for practising joins.

CREATE TABLE IF NOT EXISTS country_metadata (
    country TEXT PRIMARY KEY,
    capital TEXT
);

-- Add the example countries only if they are not already present.

INSERT INTO country_metadata (country, capital)
VALUES
    ('France', 'Paris'),
    ('United Kingdom', 'London')
ON CONFLICT(country) DO NOTHING;
SELECT 
 d.country AS Country,
 d.pop AS Population,
 c.capital AS Capital
FROM
 development AS d
LEFT JOIN 
 country_metadata AS c
ON c.country = d.country 
WHERE d.year = 2007
AND d.country = 'France';

-- Show France, Germany and the UK in 2007 with populations and capitals.
-- Keep countries without matching metadata; sort by country name.

SELECT 
 d.country AS Country,
 d.pop AS Population,
 c.capital AS Capital
FROM
 development AS d
LEFT JOIN 
 country_metadata AS c
ON c.country = d.country 
WHERE d.year = 2007
AND d.country IN ('France', 'United Kingdom', 'Germany')
ORDER BY d.country ASC;

-- Now change the LEFT JOIN to INNER JOIN

SELECT 
 d.country AS Country,
 d.pop AS Population,
 c.capital AS Capital
FROM
 development AS d
INNER JOIN 
 country_metadata AS c
ON c.country = d.country 
WHERE d.year = 2007
AND d.country IN ('France', 'United Kingdom', 'Germany')
ORDER BY d.country ASC;

-- Show 2007 country names and populations with no matching metadata.
-- Sort alphabetically by country.

SELECT 
 d.country,
 d.pop
FROM development AS d
LEFT JOIN 
 country_metadata AS c
ON d.country = c.country
WHERE
 d.year = 2007
AND 
 c.country IS NULL
ORDER BY 
 d.country ASC;

-- For 2007, list the country name, population and capital for countries that have a matching record in country_metadata.

SELECT 
 d.country AS CountryName,
 d.pop AS Population,
 c.capital AS Capital
FROM
 development AS d
INNER JOIN 
 country_metadata AS c
ON 
 d.country = c.country
WHERE
 d.year = 2007
ORDER BY 
 d.pop DESC;

-- Example 2: LEFT JOIN keeps all left records initially.
-- IS NOT NULL then excludes records with no right-table match.
-- This gives the same result as the INNER JOIN above.

SELECT
    d.country AS CountryName,
    d.pop AS Population,
    c.capital AS Capital
FROM development AS d
LEFT JOIN country_metadata AS c
    ON d.country = c.country
WHERE d.year = 2007
  AND c.country IS NOT NULL
ORDER BY d.pop DESC;

-- ON: match country to country, not country to capital.
-- IS NULL: keep unmatched records.
-- IS NOT NULL: keep matched records when checking c.country here.
