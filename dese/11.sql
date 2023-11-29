-- Find names of schools, per-pupil expenditure,graduation rate
-- Sort schools via per-pupil expenditure then by school name
SELECT "name", "per_pupil_expenditure" , "graduated"
FROM "schools"
JOIN "expenditures" ON "schools"."district_id" = "expenditures"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "per_pupil_expenditure" DESC, "name";
