-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT

);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  travel_time_id INTEGER REFERENCES travel_times,
  airline_id INTEGER REFERENCES airline,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);



CREATE TABLE travel_times
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline,

);


INSERT INTO airlines

  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, from_city, travel_times_id, airlines_id, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E', 'New York', 'United States', 'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');


INSERT INTO times
  ( departure, arrival, airline_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2 ),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3 ),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3 ),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4 ),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 5),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6),
  ('22019-01-20 19:30:00', '2019-01-20 22:45:00', 7);