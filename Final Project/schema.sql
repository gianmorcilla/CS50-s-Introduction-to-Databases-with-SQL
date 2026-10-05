-- this table stores all the possible nationalities living in Japan (written prevents the same nationality being written over and over)
CREATE TABLE "nationalities" (
  "id" INTEGER,
  "country" TEXT NOT NULL UNIQUE,
  PRIMARY KEY("id")
);

-- this table represents the current japanese level of each person has achieved
CREATE TABLE "japanese_levels" (
  "id" INTEGER,
  "japanese_levels" TEXT NOT NULL CHECK("japanese_levels" IN ('Zero', 'N5', 'N4', 'N3', 'N2', 'N1', 'Native')),
  PRIMARY KEY("id")
);

-- this table stores basic information about each foreigner living in Japan, their arrival date, highest form of education, and currently which prefecture in Japan they live in.
CREATE TABLE "people" (
  "id" INTEGER,
  "first_name" TEXT NOT NULL,
  "last_name" TEXT NOT NULL,
  "nationality_id" INTEGER NOT NULL,
  "arrival_date" TEXT NOT NULL,
  "japanese_level_id" INTEGER NOT NULL,
  "highest_education" TEXT NOT NULL CHECK("highest_education" IN ('NONE', 'High School', 'Bachelor''s', 'Master''s', 'Doctorate')),
  PRIMARY KEY("id"),
  FOREIGN KEY("nationality_id") REFERENCES "nationalities"("id"),
  FOREIGN KEY("japanese_level_id") REFERENCES "japanese_levels"("id")
);

-- this table contains information regarding the person's residence history, what type of visa they had from a certain date and an end date, and the prefecture they lived in.
CREATE TABLE "residence_history" (
  "id" INTEGER,
  "people_id" INTEGER NOT NULL,
  "visa_id" INTEGER NOT NULL,
  "prefecture" TEXT NOT NULL,
  "start_date" TEXT NOT NULL,
  "end_date" TEXT,
  PRIMARY KEY("id"),
  FOREIGN KEY("people_id") REFERENCES "people"("id"),
  FOREIGN KEY("visa_id") REFERENCES "visa"("id")
);

-- this table contains all information regarding the types of visa a foreigner can obtain in Japan according to https://www.mofa.go.jp/j_info/visit/visa/long/index.html
CREATE TABLE "visa" (
  "id" INTEGER,
   "visa_type" TEXT NOT NULL CHECK("visa_type" IN (
      'Highly Skilled Professional',
      'Special Highly Skilled Professional',
      'Professor',
      'Artist',
      'Religious Activities',
      'Journalist',
      'Business Manager',
      'Legal/Accounting Services',
      'Medical Services',
      'Researcher',
      'Instructor',
      'Engineer/Specialist in Humanities/International Services',
      'Intra-Company Transferee',
      'Nursing Care',
      'Entertainer',
      'Skilled Labor',
      'Specified Skilled Worker',
      'Technical Intern Training',
      'Cultural Activities',
      'Student',
      'Training',
      'Dependent',
      'Spouse or Child of Japanese National',
      'Spouse of Permanent Resident',
      'Long-term Resident',
      'Start-up',
      'Diplomat'
    )),
  PRIMARY KEY ("id")
);

-- this table contains the names of jobs, the industry they are in, and the required japanese level in order to get the job.
CREATE TABLE "jobs" (
  "id" INTEGER,
  "title" TEXT NOT NULL,
  "industry" TEXT NOT NULL,
  "required_japanese_level_id" INTEGER NOT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("required_japanese_level_id") REFERENCES "japanese_levels"("id")
);

-- this table contains all employment data of each foreigner living in japan
CREATE TABLE "employment" (
  "id" INTEGER,
  "people_id" INTEGER NOT NULL,
  "job_id" INTEGER NOT NULL,
  "visa_id" INTEGER NOT NULL,
  "employment_type" TEXT NOT NULL CHECK("employment_type" IN ('Permanent', 'Contract', 'Part-time', 'Temporary', 'Dispatched')),
  "annual_income" NUMERIC NOT NULL,
  "start_date" TEXT NOT NULL,
  "end_date" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("people_id") REFERENCES "people"("id"),
  FOREIGN KEY ("job_id") REFERENCES "jobs"("id"),
  FOREIGN KEY ("visa_id") REFERENCES "visa"("id")
);

-- this view contains all the common job information any foreigner would need living in japan
CREATE VIEW "Jobs Information" AS
SELECT "jobs"."title", "jobs"."industry", "visa"."visa_type", "employment"."employment_type", "japanese_levels"."japanese_levels" FROM "employment"
JOIN "visa" ON "employment"."visa_id" = "visa"."id"
JOIN "jobs" ON "employment"."job_id" = "jobs"."id"
JOIN "japanese_levels" ON "jobs"."required_japanese_level_id" = "japanese_levels"."id"
ORDER BY "jobs"."title" ASC;

-- index for faster data pulling based on the most common queries used
CREATE INDEX "people_nationalities_index" ON "people" ("nationality_id");
CREATE INDEX "employment_annual_income_index" ON "employment" ("annual_income");
CREATE INDEX "residence_history_end_date_visa_id_index" ON "residence_history" ("end_date", "visa_id");
CREATE INDEX "employment_annual_end_date_index" ON "employment" ("end_date");
CREATE INDEX "residence_history_prefecture_index" ON "residence_history" ("prefecture");
CREATE INDEX "employment_people_index" ON "employment" ("people_id");
