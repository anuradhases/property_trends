# Boston Property Analysis 2023
## 19 cities, 194 property types, 150K properties

## Table of Contents
- [Project Overview](#projectoverview)
- [Key Insights](#keyinsights)
- [Interesting Facts](#interestingfacts)

## Project Overview

In this project, I conducted an analysis on 154948 Boston property records from 1700 to 2022, aimed at providing a high-level overview of properties in the Boston area by cost, property type, and city.

The [data](https://data.boston.gov/dataset/property-assessment/resource/1000d81c-5bb5-49e8-a9ab-44cd042f1db2) was downloaded as a csv from Analyze Boston and came in with 50+ columns. Data was copied into a database in PostgreSQL and [Snowflake](BostonPropertyDetails_Snowflake_use_case.pdf). Data cleaning and analysis was done in both PostgreSQL and [Snowflake](BostonPropertyDetails_Snowflake_use_case.pdf). Using the [Boston Property Data key](https://data.boston.gov/dataset/property-assessment/resource/4973f23e-859e-4190-b308-8223c246147e), irrelevant variables were removed, resulting in 28 relevant variables.<br>




After first look at the dataset, the following questions came to mind.<br>
- How many zipcodes and cities are included in the dataset? <br>
- What is the average land cost, building cost and total property cost for all cities? <br>
- What are the top 5 most expensive and top 5 cheapest cities based on the averages of land cost, building cost, total property cost, gross tax, and gross tax portion of total cost? <br>
- What are the averages of land cost, building cost, total property cost, gross tax, and gross tax portion of total cost for each city? <br>
- What are the top 10 cheapest property types per city? <br>
- How does total property cost change with city and property type? <br>
- How does land, building, and total property cost, and gross tax change with year built based on property type and city? <br>

This [Tableau dashboard](https://public.tableau.com/app/profile/anuradha.s6397/viz/Boston_Property_Analysis_23/BostonPropertyDashboard?publish=yes>)
 provides a visual representation of Boston area property costs and property types.
It answers how property costs varies with city(s), property type(s) and year built.<br>

## Key Insights:
- **Top 5 most expensive cities: Readville, Boston, Roxbury Crossing, Allston, Brookline** <br>
- **Top 5 cheapest cities: Dedham, Chesnut Hill, Hyde Park, Mattapan, Newton**
- **Land is significantly cheaper than buildings and properties with:**
- **Average land cost: 376,000**
- **Average building cost: 1.12 million**
- **Average property cost: 1.5 million**


## Interesting Facts:
- **Boston** has the most expensive property at **2.14 billion**.
- **East Boston** has the largest property at **6.9 million sq. ft**.
- **Jamaica Plain** has the oldest property, built in **1700**.



<img src = "https://github.com/anuradhases/property_trends/assets/49212192/d20864b9-f805-412f-a8d7-38deaa76700b" width = 750 height= 550 >











