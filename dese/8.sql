-- Find the names to all school districts and no of pupils enrolled in any school
SELECT "name", "pupils" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id";
