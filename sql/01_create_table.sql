-- Creates the main table for UK police crime data.

DROP TABLE IF EXISTS crimes;

CREATE TABLE crimes (
  crime_id TEXT,
  month TEXT,
  reported_by TEXT,
  falls_within TEXT,
  longitude FLOAT,
  latitude FLOAT,
  location TEXT,
  lsoa_code TEXT,
  lsoa_name TEXT,
  crime_type TEXT,
  last_outcome_category TEXT,
  context TEXT
);
