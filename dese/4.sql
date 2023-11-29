-- Find the 10 names of the cities with the most public schools
-- Find the number of public schools each city has
SELECT "city" , COUNT(*) AS no_of_public_schools FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY no_of_public_schools DESC, "city" LIMIT 10 ;

