-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);


CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  artists_id INTEGER REFERENCES artists,
  producers_id INTEGER REFERENCES producers,
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums,
  producers_id INTEGER REFERENCES producers,
);




INSERT INTO artists
  (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay-Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Jessie J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');




INSERT INTO songs
  (title, duration_in_seconds, release_date, artists_id, album, producers_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 'Middle of Nowhere', 1),
  ('MMMBop', 238, '04-15-1997', 1, 'Middle of Nowhere', 2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 'A Night at the Opera', 3),
  ('One Sweet Day', 282, '11-14-1995', 3, 'Daydream', 4),
  ('One Sweet Day', 282, '11-14-1995', 4, 'Daydream', 4),
  ('Shallow', 216, '09-27-2018', 5, 'A Star Is Born', 5),
  ('Shallow', 216, '09-27-2018', 6, 'A Star Is Born', 5),
  ('How You Remind Me', 223, '08-21-2001', 7, 'Silver Side Up', 6),
  ('New York State of Mind', 276, '10-20-2009', 8, 'The Blueprint 3', 7),
  ('New York State of Mind', 276, '10-20-2009', 9, 'The Blueprint 3', 7),
  ('Dark Horse', 215, '12-17-2013', 10, 'Prism', 8),
  ('Dark Horse', 215, '12-17-2013', 11, 'Prism', 9),
  ('Moves Like Jagger', 201, '06-21-2011', 12, 'Hands All Over', 10),
  ('Moves Like Jagger', 201, '06-21-2011', 13, 'Hands All Over', 11),
  ('Complicated', 244, '05-14-2002', 14, 'Let Go', 12),
  ('Say My Name', 240, '11-07-1999', 15, 'The Writing''s on the Wall', 13);
