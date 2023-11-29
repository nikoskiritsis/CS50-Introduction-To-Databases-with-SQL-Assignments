-- Create temporary table meteorites_temp
CREATE TABLE "meteorites_temp" (
    "name" TEXT NOT NULL,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC
);

-- import meteorites.csv file to temporary table
.import --csv --skip 1 meteorites.csv meteorites_temp

-- Drop id column
ALTER TABLE "meteorites_temp" DROP COLUMN "id";

-- Drop nametype column


-- Set Mass to Null when empty
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';

-- Set year to NULL when empty
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';

-- Set lat to NULL when empty
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';

-- Set long to NULL when empty
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';

-- Set mass, lat, long to round 2 values
UPDATE "meteorites_temp" SET "mass" = ROUND("mass",2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

-- Drop any rows where nametype = Relict
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

-- Drop any rows where discovery IS NOT Fell OR Found
DELETE FROM "meteorites_temp" WHERE "discovery" != 'Fell'
AND "discovery" != 'Found';

-- Create meteorites table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT CHECK("discovery" IN ('Fell','Found')),
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,

    PRIMARY KEY("id")
);

-- Insert clean data into meteorites table
INSERT INTO "meteorites"("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year" ASC, "name";

-- Drop temporary table
DROP TABLE "meteorites_temp";
