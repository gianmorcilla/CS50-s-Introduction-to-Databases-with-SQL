--find id of top 3 users, order ids by number of messages most to least

SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'creativewisdom377'
)
GROUP BY "to_user_id"
ORDER BY COUNT("to_user_id") DESC
LIMIT 3;
