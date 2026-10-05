-- Top 3 most number of nationalities currenty in Japan
SELECT "nationalities"."country", COUNT("people"."id") AS "Number of People" FROM "people"
JOIN "nationalities" ON "people"."nationality_id" = "nationalities"."id"
GROUP BY "nationalities"."country"
ORDER BY "Number of People" DESC
LIMIT 3;

-- how many foreigners from each nationality are currently living in Japan
SELECT "nationalities"."country", COUNT("people"."id") AS "Number of People" FROM "people"
JOIN "nationalities" ON "people"."nationality_id" = "nationalities"."id"
GROUP BY "nationalities"."country"
ORDER BY "Number of People" DESC;

-- what is the level of Japanese of the highest possible salary available for foreigeners in Japan
SELECT "japanese_levels"."japanese_levels", "employment"."annual_income" FROM "employment"
JOIN "people" ON "employment"."people_id" = "people"."id"
JOIN "japanese_levels" ON "people"."japanese_level_id" = "japanese_levels"."id"
ORDER BY "employment"."annual_income" DESC
LIMIT 1;

-- top 5 most common type of visa currently being owned by people
SELECT "visa"."visa_type", COUNT("residence_history"."id") AS "Number of People" FROM "visa"
JOIN "residence_history" ON "visa"."id" = "residence_history"."visa_id"
WHERE "residence_history"."end_date" IS NULL
GROUP BY "visa"."visa_type"
ORDER BY "Number of People" DESC
LIMIT 5;


-- what is the name, the person's job, prefecuture they live in, and what job they have who are currently in Japan
SELECT "people"."first_name", "people"."last_name", "residence_history"."prefecture", "jobs"."title" FROM "people"
JOIN "employment" ON "people"."id" = "employment"."people_id"
JOIN "jobs" ON "employment"."job_id" = "jobs"."id"
JOIN "residence_history" ON "people"."id" = "residence_history"."people_id"
WHERE "employment"."end_date" IS NULL AND "residence_history"."end_date" IS NULL;


-- which prefecture currenty has the most foreigners
SELECT "prefecture", COUNT("id") AS "Number of People" FROM "residence_history"
GROUP BY "prefecture";

-- average annual income for each level of Japanese
SELECT "japanese_levels"."japanese_levels", ROUND(AVG("employment"."annual_income"), 2) AS "Average Annual Income" FROM "people"
JOIN "employment" ON "people"."id" = "employment"."people_id"
JOIN "japanese_levels" ON "people"."japanese_level_id" = "japanese_levels"."id"
GROUP BY "japanese_levels"."japanese_levels";

-- view the most common job available for foreigners for each level of Japanese
SELECT "japanese_levels"."japanese_levels", "jobs"."title" FROM "jobs"
JOIN "japanese_levels" ON "jobs"."required_japanese_level_id" = "japanese_levels"."id"
WHERE "japanese_levels"."id" = 3
GROUP BY "japanese_levels"."japanese_levels", "jobs"."title"
ORDER BY COUNT("jobs"."id") DESC
LIMIT 1;

--inserting data queries for each table
INSERT INTO "nationalities" ("id","country") VALUES (1,'Philippines');

INSERT INTO "japanese_levels" ("id","japanese_levels") 
  VALUES 
    (1,'Zero'),
    (2,'N5'),
    (3,'N4'),
    (4,'N3'),
    (5,'N2'),
    (6,'N1'),
    (7,'Native');

INSERT INTO "visa" ("id", "visa_type")
VALUES
    (1, 'Highly Skilled Professional'),
    (2, 'Special Highly Skilled Professional'),
    (3, 'Professor'),
    (4, 'Artist'),
    (5, 'Religious Activities'),
    (6, 'Journalist'),
    (7, 'Business Manager'),
    (8, 'Legal/Accounting Services'),
    (9, 'Medical Services'),
    (10, 'Researcher'),
    (11, 'Instructor'),
    (12, 'Engineer/Specialist in Humanities/International Services'),
    (13, 'Intra-Company Transferee'),
    (14, 'Nursing Care'),
    (15, 'Entertainer'),
    (16, 'Skilled Labor'),
    (17, 'Specified Skilled Worker'),
    (18, 'Technical Intern Training'),
    (19, 'Cultural Activities'),
    (20, 'Student'),
    (21, 'Training'),
    (22, 'Dependent'),
    (23, 'Spouse or Child of Japanese National'),
    (24, 'Spouse of Permanent Resident'),
    (25, 'Long-term Resident'),
    (26, 'Start-up'),
    (27, 'Diplomat');

INSERT INTO "people" ("id","first_name","last_name","nationality_id","arrival_date","japanese_level_id","highest_education") VALUES (1,'Jane','Doe',1,'2023-11-04',1,'Bachelor''s');

INSERT INTO "residence_history" ("id","people_id","visa_id","prefecture","start_date","end_date") VALUES (1,1,2,'Okayama','2023-11-21','2024-11-22');

INSERT INTO "jobs" ("id","title","industry","required_japanese_level_id") VALUES (1,'Native English Teacher','Education',2);

INSERT INTO "employment" ("id","people_id","job_id","visa_id","employment_type","annual_income","start_date","end_date") VALUES (1,1,1,2,'Part-time',3300000,'2023-03-04',NULL);

-- updating visa status query
INSERT INTO "residence_history" ("id","people_id","visa_id","prefecture","start_date","end_date") VALUES (2,1,1,'Okayama','2024-11-22', NULL);

--updating current level of japanese
UPDATE "people"
SET "japanese_level_id" = 6
WHERE "id" = 1;