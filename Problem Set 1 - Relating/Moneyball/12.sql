SELECT "first_name", "last_name"
FROM (
    SELECT "first_name", "last_name", "id"
    FROM (
        SELECT "first_name", "last_name", players."id" AS "id" FROM "performances"
        JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
        JOIN "players" ON "performances"."player_id" = "players"."id"
        WHERE "h" > "0"
        AND performances."year" = 2001
        AND salaries."year" = 2001
        ORDER BY salaries."salary"/performances."h", "first_name", "last_name"
    LIMIT 10)

    INTERSECT

    SELECT "first_name", "last_name", "id"
    FROM (
        SELECT "first_name", "last_name", players."id" AS "id" FROM "performances"
        JOIN "salaries" ON "performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
        JOIN "players" ON "performances"."player_id" = "players"."id"
        WHERE performances."year" = 2001
        AND "RBI" > "0"
        ORDER BY "salary"/"RBI"
        LIMIT 10)
) ORDER BY "id";
