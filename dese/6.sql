-- Find the names of the schools (public or charter) that have 100.0 grad rate
SELECT "name" FROM "schools"
WHERE "id" IN (SELECT "school_id" FROM "graduation_rates" WHERE "graduated" = 100.0);
