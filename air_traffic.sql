-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE planes
(
  id TEXT PRIMARY KEY,
  airline INTEGER REFERENCES airlines(id) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE airports
(
  id TEXT PRIMARY KEY,
  airport_name TEXT NOT NULL,
  airport_city TEXT NOT NULL,
  airport_country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  plane TEXT REFERENCES planes(id) NOT NULL,
  from_airport TEXT REFERENCES airports(id) NOT NULL,
  to_airport TEXT REFERENCES airports(id) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  flight_num INTEGER REFERENCES flights(id) NOT NULL,
  seat TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO airlines 
  (airline_name)
VALUES ('American Airlines'),('Delta Airlines'),('Spirit Airlines'),('United Airlines');

INSERT INTO planes 
  (id,airline)
VALUES ('AA2625', 1),('DL1416', 2),('NK812', 3),('UA2371', 4); 

INSERT INTO airports
  (id, airport_name, airport_city, airport_country)
VALUES
  ('LGA', 'LaGuardia Airport', 'Queens, New York City', 'USA'),
  ('DFW', 'DFW International Airport', 'Dallas', 'USA'),
  ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'USA');

INSERT INTO flights
  (plane, from_airport, to_airport, departure, arrival)
VALUES
  ('AA2625', 'LGA', 'DFW', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('DL1416', 'DFW', 'LAX', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('NK812', 'LAX', 'LGA', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('UA2371', 'DFW', 'LGA', '2018-04-15 16:50:00', '2018-04-15 21:00:00');

INSERT INTO tickets
  (first_name, last_name, seat, flight_num)
VALUES
  ('Jennifer', 'Finch', '33B', 3),
  ('Thadeus', 'Gathercoal', '8A', 4),
  ('Sonja', 'Pauley', '12F', 1),
  ('Jennifer', 'Finch', '20A', 2),
  ('Waneta', 'Skeleton', '23D', 2),
  ('Thadeus', 'Gathercoal', '18C', 1),
  ('Berkie', 'Wycliff', '9E', 4),
  ('Alvin', 'Leathes', '1A', 1),
  ('Berkie', 'Wycliff', '32B', 3),
  ('Cory', 'Squibbes', '10D', 1);