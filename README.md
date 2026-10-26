# World Development Analysis with SQL and Python

A beginner learning project exploring population, life expectancy, and GDP per person using Gapminder data.

## Project objectives

- Practise filtering, sorting, grouping, and joining data with SQL.
- Analyse data using Python and pandas.
- Check for missing life expectancy values and duplicate country-year records.
- Read data from CSV files and a SQLite database.

## Tools used

- SQLite and DBeaver
- Python and pandas
- Jupyter Notebook through Anaconda

## Dataset

The dataset contains population, life expectancy, and GDP per person for 142 countries across 12 years, from 1952 to 2007.

Most exercises focus on the 2007 subset, which contains 142 rows and six columns.

## Key findings

Among the countries included in the dataset in 2007:

- China had the largest population.
- Japan had the highest life expectancy, at 82.603 years.
- Norway had the highest GDP per person.
- Oceania had the highest average country life expectancy.

## Data quality checks

- No missing life expectancy values were found in the development table.
- No duplicate country-year pairs were found.

## How to run the notebooks

1. Download the project files and keep them together in one folder.
2. Install Anaconda with Python, pandas, and Jupyter Notebook.
3. Open Jupyter Notebook and navigate to the project folder.
4. Open `05_python_pandas.ipynb` or `07_python_final_practice.ipynb`.
5. Restart the kernel and run all cells from top to bottom.

The notebooks use `development_2007.csv`. The pandas notebook also connects to `world_development.db`.

## SQL exercises

Open `world_development.db` in DBeaver using a SQLite connection.

Review the numbered SQL scripts in order, from 01 to 07. Run the table setup statements before queries that use those tables.

## Learning context

This project was completed with guided support while learning SQL and Python. It includes introductory exercises, data analysis, joins, and data quality checks.

### Data source

The original CSV was downloaded from [Plotly’s datasets repository](https://github.com/plotly/datasets/blob/master/gapminderDataFiveYear.csv).

The file `gapminderDataFiveYear.csv` contains the source data. The 2007 subset was exported to `development_2007.csv` during this project.