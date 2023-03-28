-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,

);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER REFERENCES teams,

);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee_name TEXT,
);

CREATE TABLE season_dates
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    season_id INTEGER REFERENCES season,
    number_goals INTEGER,
);


CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    date DATE,
    season_id INTEGER REFERENCES season_dates,
    team_id INTEGER REFERENCES teams,
    referee_id INTEGER REFERENCES referees,
);




CREATE TABLE standings
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    result INTEGER,

);


INSERT INTO teams
    (team_name)
VALUES
    ('Blue Dragons'),
    ('Flying Cars'),
    ('Green Rockets'),
    ('Tampa Alligators');

INSERT INTO players
    (name, team_id)
VALUES
    ('John Smith', 1),
    ('Junior Garcia', 1),
    ('Eddie McCallister', 1),
    ('Ben Outside', 1),
    ('Emily Park', 1),
    ('Vanessa Smith', 1),
    ('Jason Nickels', 1),
    ('David Smith', 1);


INSERT INTO referees
    (referee_name)
VALUES
    ('Steven Houses'),
    ('Angela Smith'),
    ('John Johnson');


INSERT INTO season_dates
    (start_date, end_date)
VALUES
    ('2022-10-05', '2022-12-05'),
    ('2023-01-05', '2023-03-05');


INSERT INTO matches
    (date, season_id, team_id, referee_id)
VALUES
    ('2023-01-05', 2, 1, 3),
    ('2023-02-25', 2, 2, 1),
    ('2022-11-15', 1, 1, 3),
    ('2022-12-01', 1, 4, 2);

INSERT INTO goals
    (player_id, match_id, season_id, number_goals)
VALUES
    (1, 2, 1, 5),
    (4, 3, 1 , 10);


INSERT INTO standings
    (match_id, result)
VALUES
    (1, 'Lost'),
    (2, 'Won'),
    (3, 'Tie'),
    (4, 'Tie');