CREATE DATABASE catalog_of_my_things;

CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    publisher_date DATE
),

CREATE TABLE Labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
)