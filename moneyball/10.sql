-- Find all player's first names, last names, salaries, home runs, year
-- Sort by player id least to greatest
-- then by year,desc
-- if multiple salaries in a year, sort by hr desc, salary desc

SELECT "first_name", "last_name", "salary", "HR", "performances"."year"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON  "players"."id" = "performances"."player_id"

WHERE "salaries"."year" = "performances"."year"

GROUP BY "performances"."player_id" , "performances"."year"
ORDER BY "performances"."player_id", "performances"."year" DESC, "HR" DESC, "salary" DESC;
