# Boston Property Analysis 2023

## Table of Contents
- [Project Overview](#projectoverview)
- [Data Source](#datasource)
- [Key Insights](#keyinsights)
- [Interesting Facts](#keyinsights)

## Project Overview
In this project, I conducted an analysis on ____ Boston property records from years 1700 to 202, to showcase key insights and effective visualizations aimed at providing a high-level overview of properties in the Boston area by cost and city.

## Data Source
This dataset was downloaded as a csv from Boston Open Source Data and came in with over 50 columns.
Data cleaning and analysis was done in both PostgreSQL and Snowflake.
Details of each column were provided here and
In order to have an effective analysis, 20 columns were selected.
This left with __ relevant columns. 
In order to determine which columns were relevant, 

After first look at the dataset, the following questions came to mind.

Exploratory Data Analysis and Data Visualizations:
- How many zipcodes and cities are included in the dataset? <br>
- What is the average property cost for all cities? <br>
- What is the average land, property, and total cost and gross tax based on city? (most expensive and least expensive)  <br>
- What is the average portion of gross tax based on total value for each city? <br>
- What are the top 10 most expensive properties per city? <br>
- How does land value, building value, total value and gross tax change with year built based on property type and city? <br>

Tableau dashboard: 

## Key Insights

## Interesting Facts
- Which city has the most expensive property (highest building value)? <br>
- Which city has the largest property (highest gross_area)? <br>
- Which city has the oldest property (yr_built)? <br>


--154948 observations
-- No nulls for PID
--no columns with more than 60% missing data
--since don't have enough information about data collection cannot fill in missing values

--avg ignores null values

-- Top 5 most expensive: Readville, Boston, Roxbury Crossing, Allston, Brookline
-- Top 5 cheapest: Dedham, Chesnut Hill, Hyde Park, Mattapan, Newton

--37 zip codes
-- 19 cities
--Boston has 24 zip codes

--Boston has the most expensive building a 2.14 billion.
-- East Boston has the largest property at 6.9 million sq ft.
-- Jamaica Plain has the oldest building in 1700






