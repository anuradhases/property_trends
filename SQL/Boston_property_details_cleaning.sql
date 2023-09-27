------------------------------
-- Boston Property Analysis --
------------------------------

-- View data
SELECT *
FROM boston_property_details;

-- ***************************
-- DATA CLEANING -------------
-- ***************************

-- Remove duplicate rows
DROP TABLE IF EXISTS boston_property_details_cleaned;
CREATE TABLE boston_property_details_cleaned AS
SELECT DISTINCT *
FROM boston_property_details;

-- View data
SELECT * FROM boston_property_details_cleaned;

-- Rename columns
ALTER TABLE boston_property_details_cleaned
RENAME COLUMN "LAND_VALUE" TO "LAND_COST";

ALTER TABLE boston_property_details_cleaned
RENAME COLUMN "BLDG_VALUE" TO "BUILDING_COST";

ALTER TABLE boston_property_details_cleaned
RENAME COLUMN "TOTAL_VALUE" TO "PRPTY_TOTAL_COST";

-- Count number of nulls in PID
SELECT
(SELECT COUNT(*) FROM boston_property_details_cleaned WHERE "PID" is NULL) as PID_NULL;


-- Total number of rows
SELECT COUNT(*) FROM boston_property_details_cleaned;


-- Determine % missing data for all columns
DROP TABLE IF EXISTS null_counts;
CREATE TABLE null_counts AS
SELECT 'city' as column_name, (COUNT(*)-COUNT("CITY"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'zip_code' as column_name, (COUNT(*) - COUNT("ZIP_CODE"))::float/ (COUNT(*))*100 AS null_percent from boston_property_details_cleaned
UNION ALL
SELECT 'num_bldgs' as column_name, (COUNT(*) - COUNT("NUM_BLDGS"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'lu_desc' as column_name, (COUNT(*) - COUNT("LU_DESC"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'own_occ' as column_name, (COUNT(*) - COUNT("OWN_OCC"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'res_floor' as column_name, (COUNT(*) - COUNT("RES_FLOOR"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'land_sf' as column_name, (COUNT(*) - COUNT("LAND_SF"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'gross_area' as column_name, (COUNT(*) - COUNT("GROSS_AREA"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'living_area' as column_name, (COUNT(*) - COUNT("LIVING_AREA"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'land_cost' as column_name, (COUNT(*) - COUNT("LAND_COST"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'building_cost' as column_name, (COUNT(*) - COUNT("BUILDING_COST"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'prpty_total_cost' as column_name, (COUNT(*) - COUNT("PRPTY_TOTAL_COST"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'gross_tax' as column_name, (COUNT(*) - COUNT("GROSS_TAX"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'yr_built' as column_name, (COUNT(*) - COUNT("YR_BUILT"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'yr_remodel' as column_name, (COUNT(*) - COUNT("YR_REMODEL"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'int_cond' as column_name, (COUNT(*) - COUNT("INT_COND"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'ext_cond' as column_name,(COUNT(*) - COUNT("EXT_COND"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'overall_cond' as column_name, (COUNT(*) - COUNT("OVERALL_COND"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'bed_rms' as column_name, (COUNT(*) - COUNT("BED_RMS"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'full_bth' as column_name, (COUNT(*) - COUNT("FULL_BTH"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'hlf_bth' as column_name, (COUNT(*) - COUNT("HLF_BTH"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'kitchens' as column_name, (COUNT(*) - COUNT("KITCHENS"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'tt_rms' as column_name, (COUNT(*) - COUNT("TT_RMS"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'heat_type' as column_name, (COUNT(*) - COUNT("HEAT_TYPE"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'ac_type' as column_name, ((COUNT(*) - COUNT("AC_TYPE"))::float/(COUNT(*)))*100 AS null_percent FROM boston_property_details_cleaned
UNION ALL
SELECT 'num_parking' as column_name, (COUNT(*) - COUNT("NUM_PARKING"))::float/ (COUNT(*))*100 AS null_percent FROM boston_property_details_cleaned;


UPDATE null_counts
SET null_percent = ROUND(null_percent);

-- View columns with more than 5% missing data
SELECT *
FROM null_counts
WHERE null_percent > 5
ORDER BY null_percent DESC;


--check for duplicates in PID(primary key) column
SELECT "PID",COUNT(*)
FROM boston_property_details_cleaned
GROUP BY "PID"
ORDER BY COUNT(*) DESC;

-- Since duplicates in PID, create new primary key column
ALTER TABLE boston_property_details_cleaned
ADD COLUMN Property_primary_id INT;

UPDATE boston_property_details_cleaned
SET Property_primary_id = UNIFORM(1000000,2000000, RANDOM());


SELECT Property_primary_id
FROM boston_property_details_cleaned;

-- Add 0 to beginning of ZIP_CODE column to graph on map
UPDATE boston_property_details_cleaned
SET "ZIP_CODE" = LPAD("ZIP_CODE"::text, 5,'0');

-- Trim whitespace for all categorical variables
UPDATE boston_property_details_cleaned
SET "CITY" = TRIM("CITY", ' '),
"LU_DESC" = TRIM("LU_DESC", ' '),
"OWN_OCC" = TRIM("OWN_OCC", ' '),
"INT_COND" = TRIM("INT_COND", ' '),
"EXT_COND" = TRIM("EXT_COND", ' '),
"OVERALL_COND" = TRIM("OVERALL_COND", ' '),
"HEAT_TYPE" = TRIM("HEAT_TYPE", ' '),
"AC_TYPE" = TRIM("AC_TYPE", ' ');

-- View cities and cleaned data
SELECT DISTINCT ("CITY")
FROM boston_property_details_cleaned;

SELECT * FROM Boston_Property_Details_cleaned;


-- ***************************
-- ANALYSIS 
-- ***************************

--Average land, building, property total cost, gross tax and gross tax as portion of property total
-- cost grouped by city
DROP TABLE IF EXISTS average_property_value_stats;
CREATE TABLE average_property_value_stats (
    city VARCHAR(30),
	avg_land_cost INT,
	avg_building_cost INT,
	avg_prpty_total_cost INT,
	avg_gross_tax INT,
	avg_gross_tax_portion FLOAT);


INSERT INTO average_property_value_stats (city, avg_land_cost, avg_building_cost, avg_prpty_total_cost, avg_gross_tax, avg_gross_tax_portion)
SELECT
"CITY",
ROUND(AVG("LAND_COST"::float)) AS avg_land_cost,
ROUND(AVG("BUILDING_COST"::float)) AS avg_building_cost,
ROUND(AVG("PRPTY_TOTAL_COST"::float)) AS avg_prpty_total_cost,
ROUND(AVG("GROSS_TAX"::float)) AS avg_gross_tax,
ROUND(AVG(CASE WHEN "PRPTY_TOTAL_COST"::float > "GROSS_TAX"::float AND "GROSS_TAX"::float != 0 AND "PRPTY_TOTAL_COST"::float != 0 AND "GROSS_TAX" IS NOT NULL AND "PRPTY_TOTAL_COST" IS NOT NULL THEN "GROSS_TAX"::float/"PRPTY_TOTAL_COST"::float*100 END),2) AS avg_gross_tax_portion
FROM boston_property_details_cleaned
WHERE "CITY" IS NOT NULL
GROUP BY "CITY";

-- Top 5 most expensive cities by avg property total cost, avg building cost and avg land cost
SELECT *
FROM average_property_value_stats
ORDER BY avg_prpty_total_cost DESC, avg_building_cost DESC, avg_land_cost DESC
LIMIT 5;

-- Top 5 cheapest cities by avg property total cost, avg building cost and avg land cost
SELECT *
FROM average_property_value_stats
ORDER BY avg_prpty_total_cost ASC, avg_building_cost ASC, avg_land_cost ASC
LIMIT 5;

--Average land, building and total property cost for all cities
SELECT ROUND(AVG("LAND_COST"::float)) AS avg_land_cost_Boston,
ROUND(AVG("BUILDING_COST"::float)) AS avg_building_cost_Boston,
ROUND(AVG("PRPTY_TOTAL_COST"::float)) AS avg_prpty_cost_Boston
FROM boston_property_details_cleaned;

--Number of zip codes in Dataset
SELECT COUNT(DISTINCT("ZIP_CODE")) AS number_of_zip_codes
FROM boston_property_details_cleaned;

-- Number of cities in Dataset
SELECT COUNT(DISTINCT("CITY")) AS number_of_zip_codes
FROM boston_property_details_cleaned;

--Number of zip codes per city
SELECT "CITY",COUNT(DISTINCT("ZIP_CODE")) AS zip_codes_per_city 
FROM boston_property_details_cleaned
WHERE "CITY" IS NOT NULL
GROUP BY "CITY"
ORDER BY zip_codes_per_city DESC;

--Which city has the most expensive property (highest property total cost)?
SELECT "CITY", MAX("PRPTY_TOTAL_COST"::float) AS most_expensive_building
FROM boston_property_details_cleaned
WHERE "PRPTY_TOTAL_COST"::float = (SELECT MAX("PRPTY_TOTAL_COST"::float) FROM boston_property_details_cleaned)
GROUP BY "CITY";


--Which city has the largest property(highest gross area)?
SELECT "CITY", MAX("GROSS_AREA"::float) as largest_property
FROM boston_property_details_cleaned
WHERE "GROSS_AREA"::float = (SELECT MAX("GROSS_AREA"::float) FROM boston_property_details_cleaned)
GROUP BY "CITY";



--Which city has the oldest property(yr built)?
SELECT "CITY", TO_CHAR(MIN(TO_DATE("YR_BUILT" || '-01-01')), 'YYYY') as oldest_property
FROM boston_property_details_cleaned
WHERE TO_DATE("YR_BUILT" || '-01-01') = (SELECT MIN(TO_DATE("YR_BUILT" || '-01-01')) FROM boston_property_details_cleaned)
GROUP BY "CITY";







