-- Create the development table if it does not already exist.

CREATE TABLE IF NOT EXISTS development (
    country TEXT,
    year INTEGER,
    pop INTEGER,
    continent TEXT,
    lifeExp REAL,
    gdpPercap REAL,
    -- Each country-year pair must be unique.
    PRIMARY KEY (country, year)
);

-- List the tables in the database.

SELECT name
FROM sqlite_master
WHERE type = 'table';

-- Count all records in the development dataset.

SELECT COUNT(*) AS total_rows
FROM development;

-- Preview 10 rows of the dataset.

SELECT *
FROM development
LIMIT 10;

-- List the continents alphabetically.

SELECT DISTINCT continent
FROM development
ORDER BY continent ASC;

-- Show UK development indicators from earliest to latest year.

SELECT *
FROM development
WHERE country = 'United Kingdom'
ORDER BY year ASC;

-- Find the five most populated countries in 2007.

SELECT country, year, pop
FROM development
WHERE year = 2007
ORDER BY pop DESC
LIMIT 5;

