-- Create a view that contains 100 most frequently reviewed listings
-- sorted from most to least frequently reviewed
CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("reviews"."id") AS "reviews"
FROM "listings"
JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listings"."id"
ORDER BY "reviews" DESC, "property_type", "host_name";

