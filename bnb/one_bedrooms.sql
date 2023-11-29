-- Create a view which contains all listings that have exactly one bedroom
-- Must have columns id, property_type,host_name,accomodates
CREATE VIEW "one_bedrooms" AS
SELECT "id", "property_type", "host_name", "accommodates"
FROM "listings"
WHERE "bedrooms" = 1;
