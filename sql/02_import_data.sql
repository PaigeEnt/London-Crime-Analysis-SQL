-- Imports monthly CSV files from data.police.uk.
-- Update file paths depending on where the CSVs are stored locally.

-- Example of query to pull data from May 2025 csv file
COPY crimes(
  crime_id,
  month,
  reported_by,
  falls_within,
  longitude,
  latitude,
  location,
  lsoa_code,
  lsoa_name,
  crime_type,
  last_outcome_category,
  context
)
FROM 'FROM /path/to/Apr_25.csv'
DELIMITER ','
CSV HEADER;

-- Example of query to pull data from May 2025 csv file
COPY crimes(
  crime_id,
  month,
  reported_by,
  falls_within,
  longitude,
  latitude,
  location,
  lsoa_code,
  lsoa_name,
  crime_type,
  last_outcome_category,
  context
)
FROM 'FROM /path/to/May_25.csv'
DELIMITER ','
CSV HEADER;

-- COPY blocks repeated for March 2025 to March 2026
