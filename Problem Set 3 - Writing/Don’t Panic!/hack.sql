
-- password is in table "users"
-- "password"
-- table "user_logs" has information of old and new passwords

-- change admin password to oops using the MD5 hashes

UPDATE "users"
SET "password" = "982c0381c279d139fd221fce974916e7"
WHERE "username" = "admin";

-- delete the evidence of the log

DELETE FROM "user_logs"
WHERE "new_password" = "982c0381c279d139fd221fce974916e7";

-- blame "emily33"
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ("update", "admin", "admin",
    (SELECT "password" FROM "users" WHERE "username" = "admin"),
    (SELECT "password" FROM "users" WHERE "username" = "emily33")
);

