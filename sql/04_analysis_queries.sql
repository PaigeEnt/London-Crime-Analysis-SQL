-- Key analysis queries for crime trends, hotspots, and outcomes.

-- Total number of crimes
SELECT COUNT(*) AS total_crimes
FROM crimes;

-- Total crimes by month
SELECT 
  month,
  COUNT(*) AS total_crimes
FROM crimes
GROUP BY month
ORDER BY total_crimes DESC;

-- Most common crime types
SELECT 
  crime_type,
  COUNT(*) AS total_crimes
FROM crimes
GROUP BY crime_type
ORDER BY total_crimes DESC;

-- Top 10 hotspot areas by LSOA
SELECT 
  lsoa_name,
  COUNT(*) AS total_crimes
FROM crimes
  WHERE lsoa_name IS NOT NULL
GROUP BY lsoa_name
ORDER BY total_crimes DESC
  LIMIT 10;

-- Outcomes by crime type
SELECT 
  crime_type,
  last_outcome_category,
  COUNT(*) AS total_crimes
FROM crimes
GROUP BY crime_type, last_outcome_category
ORDER BY crime_type, total_crimes DESC;
