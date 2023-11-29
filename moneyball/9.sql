-- Find average salary of all teams in year 2001
-- Sort by lowest
-- Return top 5 team name, avg salary as "average salary"

SELECT "name", ROUND(AVG("salary"), 2) AS "average salary" FROM "salaries"
JOIN "teams" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "team_id"
ORDER BY "average salary" ASC LIMIT 5;
