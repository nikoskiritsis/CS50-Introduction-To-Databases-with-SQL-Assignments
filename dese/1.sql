-- Find the names of public schools in Massachusetts
-- Find the cities of public schools in Massachusetts
SELECT "name", "city" FROM "schools" WHERE "state" = 'MA' AND "type" = 'Public School';
