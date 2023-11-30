-- schema.sql

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
