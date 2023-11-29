-- Create a view which contains all the listings and number of days in June 2023
-- the property remained vacant
CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("available") AS "days_vacant"
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "available" = 'TRUE' AND ("date" BETWEEN '2023-06-01' AND '2023-06-30')
GROUP BY "listings"."id"
