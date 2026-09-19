CREATE TABLE "temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC
);

.import --csv --skip 1 "meteorites.csv" temp

--import the csv next
--replace the values to null
UPDATE "temp" SET "mass" = NULL WHERE "mass" = "";
UPDATE "temp" SET "year" = NULL WHERE "year" = "";
UPDATE "temp" SET "lat" = NULL WHERE "lat" = "";
UPDATE "temp" SET "long" = NULL WHERE "long" = "";

--round up to the nearest hundred
UPDATE "temp"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

--delete all nametype = "Relict"
DELETE FROM "temp"
WHERE "nametype" = "Relict";

--sort by year, oldest to newest first DESC
--if same year, by name in alphabetical order DESC
--do this with SELECT at the end, time to make a the main table and import
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "temp"
ORDER BY "year", "name";

DROP TABLE "temp";
