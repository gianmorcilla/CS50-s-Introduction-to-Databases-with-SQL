SELECT "name", "pupils" FROM "expenditures"
JOIN "districts"
ON "expenditures"."district_id" = "districts"."id";

