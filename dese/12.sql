-- Find public school districts with above-average per-pupil exp AND above-average
-- of teachers rated "exemplary".
-- Query returns name of districts, per-pupil exp and % of teachers = 'exemplary'.
-- Sort by %, then by per-pupil exp
SELECT "name" , "exemplary", "per_pupil_expenditure"
FROM "districts"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures")
    AND "exemplary" > (
        SELECT AVG("exemplary")
        FROM "staff_evaluations")
    AND "name" NOT LIKE '%(District)%'
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;

