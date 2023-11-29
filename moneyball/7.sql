-- Find name of the player who has the top salary all time
-- Return first name and last name
SELECT "first_name", "last_name" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
ORDER BY "salary" DESC LIMIT 1;
