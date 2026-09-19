SELECT s."name" AS "School Names", d."name" AS "District Names", d."type", "dropped" AS "Drop Rates" FROM "schools" AS "s"
JOIN "districts" AS "d" ON "s"."district_id" = "d"."id"
JOIN "graduation_rates" ON "s"."id" = "graduation_rates"."school_id"
WHERE "dropped" > (SELECT AVG("dropped") FROM "graduation_rates")
ORDER BY "dropped" DESC;
