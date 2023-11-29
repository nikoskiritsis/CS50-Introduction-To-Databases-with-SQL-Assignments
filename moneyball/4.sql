-- Find the lowest salaries in year 2001
-- Top 50 lowest salaries
-- Sort by salary, first_name , last_name , player id
-- First name, last name, salary
SELECT "first_name", "last_name", "salary" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "year" = 2001
ORDER BY "salary", "first_name", "last_name", "player_id" LIMIT 50;
