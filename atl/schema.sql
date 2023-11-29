CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK("age" >= 0),
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY("name")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline_name" TEXT NOT NULL,
    "air_depart" TEXT NOT NULL,
    "air_head" TEXT NOT NULL,
    "departure" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_name") REFERENCES "airlines"("name")
);
