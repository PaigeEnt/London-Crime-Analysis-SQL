-- Updating month data type from text to date
ALTER TABLE crimes
ALTER COLUMN month SET DATA TYPE DATE
USING TO_DATE(month, 'YYYY-MM');

-- Standardised text fields by removing leading/trailing spaces
UPDATE crimes
SET 
  crime_type = TRIM(crime_type),
  location = TRIM(location),
  lsoa_name = TRIM(lsoa_name),
  last_outcome_category = TRIM(last_outcome_category);

-- Removing true duplicates
DELETE FROM crimes
WHERE ctid NOT IN (
  SELECT MIN(ctid)
  FROM crimes
  WHERE crime_id IS NOT NULL
  GROUP BY 
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
);
-- Similar records were retained where location or outcome values differed,
-- as these likely represent separate crime incidents.
