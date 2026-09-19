CREATE VIEW "most_populated" AS
SELECT "district", "families", "households", "population", "male", "female"
FROM "by_district"
ORDER BY "population" DESC;
