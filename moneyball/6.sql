-- Find top 5 teams by total number of hits by players in year 2001
-- Sort by number of total hits
-- Return team name, total hits

-- team id = 84
SELECT "name", SUM("H") AS "total hits" FROM "performances"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = 2001
GROUP BY "team_id"
ORDER BY "total hits" DESC LIMIT 5;


