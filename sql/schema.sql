-- schema.sql

-- Define the catalog_of_my_things database
CREATE DATABASE catalog_of_my_things;

-- Define the books table
CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    publisher_date DATE
),

-- Define the labels table
CREATE TABLE Labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
)

-- Define the genres table
CREATE TABLE genres (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- Define the music_albums table
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  genre_id VARCHAR(36),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);
