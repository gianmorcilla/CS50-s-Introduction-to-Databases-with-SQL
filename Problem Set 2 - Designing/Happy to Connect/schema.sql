CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE schools (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "user_connections" (
    "id" INTEGER,
    "userA_id" INTEGER NOT NULL,
    "userB_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("userA_id") REFERENCES "users"("id"),
    FOREIGN KEY("userB_id") REFERENCES "users"("id")
);

CREATE TABLE "school_connections" (
    "id" INTEGER,
    "school_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "degree" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

CREATE TABLE "company_connections" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
