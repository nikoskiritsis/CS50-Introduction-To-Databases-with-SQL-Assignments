-- Find the top 10 LEAST expensive players per hit
-- For year 2001, DIVIDE SALARY/HITS AS "dollars per hit"
-- Filter out 0 hits players
-- Sort ASC dollars per hit, first name, last name

SELECT "first_name", "last_name", "salary" / "H" AS "dollars per hit"
FROM "performances"
JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id"
JOIN "players"  ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001 AND "dollars per hit" IS NOT NULL
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;
