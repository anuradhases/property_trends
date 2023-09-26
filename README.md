# Boston Property Analysis 2023
## 19 cities, 194 property types, 150K properties

## Table of Contents
- [Project Overview](#projectoverview)
- [Key Insights](#keyinsights)
- [Interesting Facts](#keyinsights)

## Project Overview

In this project, I conducted an analysis on 154948 Boston property records from 1700 to 2022, aimed at providing a high-level overview of properties in the Boston area by cost, property type, and city.

The [data](https://data.boston.gov/dataset/e02c44d2-3c64-459c-8fe2-e1ce5f38a035/resource/1000d81c-5bb5-49e8-a9ab-44cd042f1db2/download/fy2023-property-assessment-data.csv) was downloaded as a csv from Analyze Boston and came in with 50+ columns. Data was coped into a database in PostgreSQL and Snowflake. Data cleaning and analysis was done in both PostgreSQL and Snowflake. Using the [Boston Property Data key](https://data.boston.gov/dataset/e02c44d2-3c64-459c-8fe2-e1ce5f38a035/resource/4973f23e-859e-4190-b308-8223c246147e/download/property-assessment-fy2023-data-key.pdf), irrelevant variables were removed, resulting in 28 relevant variables.<br>




After first look at the dataset, the following questions came to mind.<br>
- How many zipcodes and cities are included in the dataset? <br>
- What is the average property cost for all cities? <br>
- What are the top 5 most expensive and top 5 cheapest cities based on the averages of land cost, building cost, total property cost, gross tax, and gross tax portion of total cost? <br>
- What are the averages of land cost, building cost, total property cost, gross tax, and gross tax portion of total cost for each city? <br>
- What are the top 10 most expensive property types per city? <br>
- How does total property cost change with city and property type? <br>
- How does land, building, and total property cost, and gross tax change with year built based on property type and city? <br>

This [Tableau dashboard](https://public.tableau.com/app/profile/anuradha.s6397/viz/Boston_Property_Analysis_23/BostonPropertyDashboard?publish=yes>)
 provides a visual reprentation of Boston area property costs and property types.
It answers how property costs varies with city(s), property type(s) and year built.<br>

## Key Insights:
- **Top 5 most expensive cities: Readville, Boston, Roxbury Crossing, Allston, Brookline** <br>
- **Top 5 cheapest cities: Dedham, Chesnut Hill, Hyde Park, Mattapan, Newton**
- **Average property cost: 1.12 million**


## Interesting Facts:
- **Boston** has the most expensive building a **2.14 billion**.
- **East Boston** has the largest property at **6.9 million sq ft**.
- **Jamaica Plain** has the oldest building, built in **1700**.



<img src = "https://github.com/anuradhases/property_trends/assets/49212192/86a17de8-1d59-432c-bffa-c04e11b7f882" width = 750 height= 550 >











