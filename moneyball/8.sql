-- Find salary of the player with the most home runs in year 2001
-- Return salary
SELECT "salary" FROM "salaries"
WHERE "player_id" =(
    SELECT "player_id" FROM "performances"
    WHERE "year" = 2001
    ORDER BY "HR" DESC LIMIT 1)
AND "year" = 2001;

