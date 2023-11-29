-- Represent artists by their name and age
CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
)

-- Represent producers by their name and age
CREATE TABLE "producers" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
)

-- Represent songs by their name, genre and year published
CREATE TABLE "songs" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

-- Connect artists with their songs
CREATE TABLE "song_by" (
    "id" INTEGER,
    "song_id" INTEGER,
    "artist_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

-- Connect producers with their songs
CREATE TABLE "produced_by" (
    "id" INTEGER,
    "song_id" INTEGER,
    "producer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id"),
    FOREIGN KEY("producer_id") REFERENCES "producers"("id")
);

-- Create indexes to speed common searches
CREATE INDEX "artist_name_search" ON "artists" ("name");
CREATE INDEX "producer_name_search" ON "producers" ("name");
CREATE INDEX "song_year_search" ON "songs" ("year");
