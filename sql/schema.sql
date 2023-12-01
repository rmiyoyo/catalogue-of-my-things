-- schema.sql

-- Define the catalog_of_my_things database
CREATE DATABASE catalog_of_my_things;

-- Define the items table
CREATE TABLE items (
    id INT PRIMARY KEY,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id VARCHAR(36),
    author_id INT,
    label_id INT,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres (id),
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors (id),
    CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels (id)
);

-- Add indexes for items table
CREATE INDEX idx_items_genre_id ON items (genre_id);
CREATE INDEX idx_items_author_id ON items (author_id);
CREATE INDEX idx_items_label_id ON items (label_id);

-- Define the books table
CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    publisher_date DATE
);

-- Define the labels table
CREATE TABLE Labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
);

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

-- Define the games table
CREATE TABLE games (
    id INT PRIMARY KEY,
    multiplayer VARCHAR(10) NOT NULL,
    date_last_played DATE NOT NULL,
    publish_date DATE NOT NULL,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES items (id)
);

-- Define the authors table
CREATE TABLE authors (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);
