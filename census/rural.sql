-- Create a view that contains all census records relating to rural municipality
CREATE VIEW "rural" AS
SELECT "id", "district", "locality", "families", "households", "population", "male", "female"
FROM "census"
WHERE "locality" LIKE '%Rural%';
