--find the friend IDs of lovelytrust487
--find the friend IDs of exceptionalinspiration482
--intersect to find mutuals

SELECT "friend_id"
FROM "friends"
WHERE "user_id" = (
    SELECT "id"
    FROM "users"
    WHERE "username" = "lovelytrust487"
)
INTERSECT
SELECT "friend_id"
FROM "friends"
WHERE "user_id" = (
    SELECT "id"
    FROM "users"
    WHERE "username" = "exceptionalinspiration482"
);
