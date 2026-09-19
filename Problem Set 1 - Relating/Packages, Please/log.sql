
-- *** The Lost Letter ***
SELECT * FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = "900 Somerville Avenue"
        )AND "contents" LIKE "%congrat%"
    )AND "action" = "Drop"
);
-- I worked my way backwords by getting the address ID first, tracing the steps to packages because it was still hard to visualize subqueries on its own--
SELECT * FROM "addresses"
WHERE "address" = "900 Somerville Avenue";

-- this is where i found the id of the letter
SELECT * FROM "packages"
WHERE "from_address_id" = "432";
AND "contents" LIKE "%congrat%";

SELECT * FROM "scans"
WHERE "package_id" = "384"
AND "action" = "Drop";

SELECT * FROM "addresses"
WHERE "id" = "854";

-- *** The Devious Delivery ***
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )AND "action" = "Drop"
);

--** here is where I step by stepped backwards answered before making it into one query, from the first one I immediately figured out the content of the package

SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;

SELECT * FROM "scans"
WHERE "package_id" = "5098"
AND "action" = "Drop";

SELECT "address", "type" FROM "addresses"
WHERE "id" = "348";

-- *** The Forgotten Gift ***
SELECT * FROM "drivers"
WHERE "id" = (
    SELECT "driver_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" LIKE "%109 T%"
        )
    ) AND "timestamp" LIKE "2023-08-23%"
);

-- how i wrote it one by one backwards
SELECT * FROM "addresses"
WHERE "address" LIKE "%109 T%";

SELECT * FROM "packages"
WHERE "from_address_id" = "9873";

SELECT * FROM "scans"
WHERE "package_id" = "9523"
AND "timestamp" LIKE "2023-08-23%";

SELECT * FROM "drivers"
WHERE "id" = "17";
