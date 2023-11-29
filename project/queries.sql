-- Find all songs given artist name
SELECT *
FROM "songs"
WHERE "id" IN (
    SELECT "song_id" FROM "song_by"
    WHERE "artist_id" = (
        SELECT "id" FROM "artists"
        WHERE "name" = 'Michael Jackson'
    )
);

-- Find all songs given producer name
SELECT *
FROM "songs"
WHERE "id" IN (
    SELECT "song_id" FROM "produced_by"
    WHERE "producer_id" = (
        SELECT "id" FROM "producer"
        WHERE "name" = 'DJ Premier'
    )
);


-- Find all pop songs released in 2023
SELECT *
FROM "songs"
WHERE "genre" = 'Pop'
AND "year" = 2023;

-- Add a new artist
INSERT INTO "artists"("name", "age")
VALUES('Kendrick Lamar', 36);

-- Add a new producer
INSERT INTO "producers"("name","age")
VALUES('J Dilla', 32);

-- Add a new song
INSERT INTO "songs"("name","genre","year")
VALUES('Nas Is Like','Hip-Hop', 1999);



