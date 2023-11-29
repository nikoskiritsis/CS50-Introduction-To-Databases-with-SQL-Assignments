-- Create a view that includes all the columns from listings except descriptions
CREATE VIEW "no_descriptions" AS
SELECT "id", "property_type", "host_name", "accommodates", "bedrooms"
FROM "listings";
