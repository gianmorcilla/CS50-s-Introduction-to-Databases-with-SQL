SELECT "first_name", "last_name", (salaries."salary"/performances."H") AS "dollars per hit" FROM "performances"
JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
JOIN "players" ON "performances"."player_id" = "players"."id"
WHERE "h" > "0"
AND performances."year" = 2001
AND salaries."year" = 2001
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10
;
