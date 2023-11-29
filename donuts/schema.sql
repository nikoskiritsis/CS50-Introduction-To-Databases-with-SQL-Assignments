CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "price_per_u" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten" TEXT NOT NULL CHECK("is_gluten" IN('yes','no') ),
    "price" TEXT NOT NULL,
    PRIMARY KEY("id")

);

CREATE TABLE "contains" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders"(
    "id" INTEGER,
    "number" INTEGER,
    "customer_id" INTEGER,
    "donut_id" INTEGER,
    "how_many" INTEGER NOT NULL CHECK("how_many" > 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

