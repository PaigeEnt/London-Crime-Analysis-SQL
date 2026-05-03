# UK Crime Analysis using SQL (data.police.uk)

This project analyses London police-recorded crime data from March 2025 to March 2026. Identifying patterns in crime type, location, and trends over time.

The aim was to develop practical SQL skills while exploring real-world crime data in a way that reflects intelligence and crime analysis workflows.

# Dataset
- Source: data.police.uk
- Area: London
- Time Period: March 2025 –March 2026
- Data includes crime type, location (LSOA), and outcomes

Raw datasets were not included in this repository and can be downloaded directly from the official source.

# Tools Used  
- SQL (data cleaning, aggregation, analysis)  
- Beekeeper Studio (SQL client)

# Project Structure
sql/
  01_create_table.sql
  02_import_data.sql
  03_clean_data.sql
  04_analysis_queries.sql

outputs/   **(to be added)**

LICENCE (MIT)
README.md (This file)

# Data Preparation

A table was created using the CREATE TABLE query. The dataset was imported from multiple monthly CSV files provided by data.police.uk.

  Due to the structure of the source data, ingestion required multiple COPY statements, with file paths adapted to local environments.

# Data Cleaning

After creating the table and importing the data, data cleaning focused on ensuring the dataset was suitable for analysis while preserving the integrity of the original records.

The following steps were applied:

- Converted the month field from text format (YYYY-MM) to a proper date format for time-based analysis
- Standardised text fields by removing leading and trailing whitespace
- Checked for duplicate records using full-row comparisons
- Identified a small number of duplicate entries; however, care was taken to retain records where duplication may reflect valid anonymised data
- Missing values (e.g. location and outcome fields) were retained and handled during analysis rather than being artificially replaced

# Key Questions

The analysis was guided by the following questions:
- How does crime change over time?
- What are the most common crime types?
- Which areas experience the highest levels of crime (hotspots)?
- How do crime outcomes vary across different offence types?

# Dataset Validation:

Despite earlier data cleaning, I rechecked the dataset before continuing with the analysis to confirm that all data was correct. The dataset was validated prior to analysis by:
- Checking for missing values across key variables 
- Verifying consistency in categorical fields (e.g. crime type, outcome categories)
- Assessing potential duplicate records and confirming whether they represented true duplicates or valid repeated observations

No major data quality issues were identified beyond expected missing values inherent to the dataset. All data types were correct and correctly formatted. Only duplicates were IDs where other key variables were significantly varied, suggesting alternate cases.

# Analysis Approach

The analysis focused on:

- Aggregating crime counts by time to identify trends
- Grouping by location (LSOA & Location) to identify hotspots
- Examining the distribution of crime types
- Analysing outcome categories to understand how incidents are resolved
Missing location data was excluded from spatial analysis to ensure results reflected real geographic areas.

# Results

## 1. Crime Trends Over Time
- Crime levels remained relatively stable across the analysed period, with minor fluctuations month to month
- A noticeable peak occurred in December 2025, suggesting a potential seasonal increase
- Lower levels were observed in early 2026, particularly in February

## 2. Common Crime Types
- “Other theft” was the most frequently recorded offence, significantly higher than all other categories
- Violent offences and shoplifting also accounted for a large proportion of reported crimes
- Less common offences such as robbery and bicycle theft appeared at much lower frequencies

## 3. Hotspots
- Crime was highly concentrated in specific LSOA areas, particularly within the City of London regions
- The top hotspot, City of London 001F, recorded significantly more incidents than all other areas (6604). This indicates a strong geographic concentration.
- Other areas showed a sharp drop-off, suggesting crime is not evenly distributed

## 4. Outcomes
- The majority of cases resulted in “investigation complete; no suspect identified”, indicating a large proportion of unresolved incidents (4496)
- A significant number of cases were also categorised as “unable to prosecute suspect” (1784)
- Fewer cases progressed to court-related outcomes
