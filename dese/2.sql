-- Find names of districts that are not operational = non-op at the end of school name
SELECT "name" FROM "districts" WHERE "name" LIKE '%non-op%';
