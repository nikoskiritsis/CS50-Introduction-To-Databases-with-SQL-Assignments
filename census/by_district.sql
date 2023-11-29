-- Create a view which contains the sums used in total, but by district
-- Add district as extra column this time
CREATE VIEW "by_district" AS
SELECT "district", SUM("families") AS "families", SUM("households") AS "households", SUM("population") AS "population", SUM("male") AS "male", SUM("female") AS "female"
FROM "census"
GROUP BY "district";
