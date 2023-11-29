-- Among 10 least expensive players per hit
-- Among 10 least expensive players per RBI
-- Return first name, last name
SELECT "first_name", "last_name"
FROM "performances"
JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id"
JOIN "players"  ON "players"."id" = "performances"."player_id"
WHERE ("salaries"."year" = 2001) AND ("performances"."year" = 2001) AND ("dollars per hit" IS NOT NULL) AND ("RBI per hit" IS NOT NULL)
AND ("salary" / "H" IN (
       SELECT "salary" / "H" AS "dollars per hit"
       FROM "performances"
       JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id"
       JOIN "players"  ON "players"."id" = "performances"."player_id"
       WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001 AND "dollars per hit" IS NOT NULL
       ORDER BY "dollars per hit"
       LIMIT 10)
)
AND ("salary" / "RBI" IN (
    SELECT "salary" / "RBI" AS "RBI per hit"
    FROM "performances"
    JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id"
    JOIN "players"  ON "players"."id" = "performances"."player_id"
    WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001 AND "RBI per hit" IS NOT NULL
    ORDER BY "RBI per hit"
    LIMIT 10)
    )
ORDER BY "players"."id";
