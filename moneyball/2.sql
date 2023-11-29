-- Find Cal Ripken Jr. salaries through the years
-- Sort by year descending
-- 2 columns, year salary
SELECT "year" , "salary" FROM "salaries"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken')
ORDER BY "year" DESC;

