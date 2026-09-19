CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE check_ins (
    "id" INTEGER,
    "passenger_id" INTEGER UNIQUE NOT NULL,
    "flight_id" INTEGER UNIQUE NOT NULL,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ("A", "B", "C", "D", "E", "F", "T")),
    PRIMARY KEY("id")
);

CREATE TABLE flights (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departing" INTEGER NOT NULL,
    "heading" INTEGER NOT NULL,
    "d_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "a_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
)
