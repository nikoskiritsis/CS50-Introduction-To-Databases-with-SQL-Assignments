-- Create a view that contains all dates that are available
-- at all listings
-- Must have columns id, property_type, host_name, date
CREATE VIEW "available" AS
SELECT "listings"."id", "property_type", "host_name", "date"
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "available" = 'TRUE';
