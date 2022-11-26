-- from the terminal run:
-- psql < music.sql
-- can not get this to work but i must move on. its been too long. i will try to cirlcle back with my mentor when we meet. 

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  artist INTEGER REFERENCES artists(id) NOT NULL,
  album_title TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  song_title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  features INTEGER REFERENCES artists(id),
  album INTEGER REFERENCES albums(id),
  producers INTEGER REFERENCES producers(id) NOT NULL
);

INSERT INTO artists(artist_name)
VALUES
  ("Hanson"),
  ("Queen"),
  ("Mariah Cary"),
  ("Lady Gaga"),
  ("Nickelback"),
  ("Jay Z"),
  ("Alicia Keys"),
  ("Katy Perry"),
  ("Juicy J"),
  ("Maroon 5"),
  ("Christina Aguilera"),
  ("Avril Lavigne"),
  ("Destiny''s Child"),
  ("Boyz II Men"),
  ("Bradley Cooper");

INSERT INTO producers(producer_name)
VALUES 
  ("Dust Brothers"),
  ("Stephen Lironi"),
  ("Roy Thomas Baker"),
  ("Walter Afanasieff"),
  ("Benjamin Rice"),
  ("Rick Parashar"),
  ("Al Shux"),
  ("Max Martin"),
  ("Cirkut"),
  ("Shellback"),
  ("Benny Blanco"),
  ("The Matrix"),
  ("Darkchild");

INSERT INTO albums(release_date, artist, album_title)
VALUES
  ('04-15-1997', 1, 'Middle of Nowhere'),
  ('10-31-1975', 2, 'A Night at the Opera'),
  ('11-14-1995', 3, 'Daydream'),
  ('09-27-2018', 4, 'A Star Is Born'),
  ('08-21-2001', 5, 'Silver Side Up'),
  ('10-20-2009', 6, 'The Blueprint 3'),
  ('12-17-2013', 8, 'Prism'),
  ('06-21-2011', 10, 'Hands All Over'),
  ('05-14-2002', 12, 'Let Go'),
  ('11-07-1999', 13, 'The Writing''s on the Wall');


INSERT INTO songs(song_title, duration_in_seconds, album, producers, features)
VALUES
  ('MMMBop', 238, 1, 1, NONE),
  ('Bohemian Rhapsody', 355, 2, 3, NONE),
  ('One Sweet Day', 282, 3, 4, 14),
  ('Shallow', 216, 4, 5, 15),
  ('How You Remind Me', 223, 5, 6, NONE),
  ('New York State of Mind', 276, 6, 7, 7),
  ('Dark Horse', 215, 7, 8, 9),
  ('Moves Like Jagger', 201, 8, 10, 11),
  ('Complicated', 244, 9, 12, NONE),
  ('Say My Name', 240, 10, 13, NONE);

--   (title, duration_in_seconds, release_date, artists, album, producers)
-- INSERT INTO songs
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
