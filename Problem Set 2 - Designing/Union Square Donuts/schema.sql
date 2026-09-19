CREATE TABLE ingredients (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donuts (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK("gluten_free" IN ('yes', 'no')),
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donuts_ingredients (
    "donut_id" INTEGER NOT NULL,
    "ingredients_id" INTEGER NOT NULL,
    PRIMARY KEY("donut_id", "ingredients_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);

CREATE TABLE orders (
    "id" INTEGER NOT NULL,
    "donut_order" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_order") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE orders_donuts (
    "donut_id" INTEGER NOT NULL,
    "orders_id" INTEGER NOT NULL,
    PRIMARY KEY("donut_id", "orders_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("orders_id") REFERENCES "orders"("id")
);

CREATE TABLE customers (
    "id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
