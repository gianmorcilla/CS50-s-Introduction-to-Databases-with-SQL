SELECT "name", "exemplary", "per_pupil_expenditure"  FROM "staff_evaluations"
JOIN "districts" ON "staff_evaluations"."district_id" = "districts"."id"
JOIN "expenditures" ON "staff_evaluations"."district_id" = "expenditures"."district_id"
WHERE "exemplary" > (SELECT AVG("exemplary") FROM "staff_evaluations")
    AND "per_pupil_expenditure" > (SELECT AVG("per_pupil_expenditure") FROM "expenditures")
    AND "type" = "Public School District"
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
