--put all the numbers in a single table

CREATE TABLE "draft" (
    "id" INTEGER,
    "s_index" INTEGER,
    "length" INTEGER,
    PRIMARY KEY("id")
);

INSERT INTO "draft" ("id", "s_index", "length")
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5)
;

CREATE VIEW "message" AS
SELECT substr("sentence", "s_index", "length") AS "phrase"
FROM "draft"
JOIN "sentences" ON "draft"."id" = "sentences"."id";
