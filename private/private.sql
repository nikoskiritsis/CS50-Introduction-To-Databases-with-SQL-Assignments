-- Create view that decodes an encoded message

CREATE TABLE "ids"(
    "sent_id" INTEGER,
    "stchar" INTEGER,
    "length" INTEGER
);

INSERT INTO "ids"("sent_id", "stchar", "length")
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);


CREATE VIEW "message" AS
SELECT substr("sentence", "stchar" , "length" ) AS "phrase"
FROM "sentences"
JOIN "ids" ON "sentences"."id" = "ids"."sent_id"
WHERE "id" IN (SELECT "sent_id" FROM "ids");

