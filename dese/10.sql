-- Find th 10 public school districts with the highest per-pupil expenditures
-- Return the name of the districts and per-pupil expenditure
SELECT "name", "per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "name" NOT LIKE '%Public School%'
ORDER BY "per_pupil_expenditure" DESC LIMIT 10;
