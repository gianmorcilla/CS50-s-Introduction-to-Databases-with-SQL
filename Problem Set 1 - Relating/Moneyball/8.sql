SELECT "salary" FROM "salaries"
WHERE "player_id" = (
    SELECT players."id" FROM "players"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    WHERE "HR" = (
        SELECT MAX("HR") FROM "performances"
    ) AND "year" = "2001"
) AND "year" = "2001";
