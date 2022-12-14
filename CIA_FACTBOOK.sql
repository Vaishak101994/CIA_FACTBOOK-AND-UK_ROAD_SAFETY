CREATE DATABASE CIA_FACTBOOK
USE CIA_FACTBOOK

CREATE OR REPLACE TABLE CIA_FACTBOOK (
country VARCHAR(100),
area	INT,
birth_rate	DECIMAL(7,2),
death_rate DECIMAL(7,2),	
infant_mortality_rate DECIMAL(7,2),	
internet_users INT,
life_exp_at_birth	DECIMAL(7,2),
materl_mortality_rate 	INT,
net_migration_rate	DECIMAL(7,2),
population 	INT,
population_growth_rate DECIMAL(7,2)
)

SELECT * FROM CIA_FACTBOOK

##1. Which country has the highest population? 

SELECT COUNTRY, MAX(POPULATION) AS MAX_POPULATION FROM CIA_FACTBOOK WHERE POPULATION IS NOT NULL GROUP BY COUNTRY ORDER BY MAX_POPULATION DESC LIMIT 1


##2. Which country has the least number of people? 

SELECT COUNTRY, MIN(POPULATION) AS MIN_POPULATION FROM CIA_FACTBOOK WHERE POPULATION IS NOT NULL GROUP BY COUNTRY ORDER BY MIN_POPULATION LIMIT 1



##3. Which country is witnessing the highest population growth? 

SELECT COUNTRY, MAX(POPULATION_GROWTH_RATE) AS MAX_POPULATION_GROWTH_RATE FROM CIA_FACTBOOK 
WHERE POPULATION_GROWTH_RATE IS NOT NULL AND POPULATION_GROWTH_RATE > 0  GROUP BY COUNTRY ORDER BY MAX_POPULATION_GROWTH_RATE DESC LIMIT 1

##4. Which country has an extraordinary number for the population? 

SELECT COUNTRY, MAX(LIFE_EXP_AT_BIRTH) AS MAX_LIFE_EXP_AT_BIRTH FROM CIA_FACTBOOK 
WHERE LIFE_EXP_AT_BIRTH IS NOT NULL GROUP BY COUNTRY ORDER BY MAX_LIFE_EXP_AT_BIRTH DESC LIMIT 1


##5. Which is the most densely populated country in the world?

SELECT COUNTRY, AREA, POPULATION, POPULATION_DENSITY_PER_SQKM FROM (
SELECT COUNTRY, AREA, POPULATION, POPULATION/AREA AS POPULATION_DENSITY_PER_SQKM FROM CIA_FACTBOOK WHERE AREA IS NOT NULL AND AREA > 0 
) WHERE POPULATION IS NOT NULL AND POPULATION > 0 GROUP BY COUNTRY, AREA, POPULATION, POPULATION_DENSITY_PER_SQKM ORDER BY POPULATION_DENSITY_PER_SQKM DESC LIMIT 1

