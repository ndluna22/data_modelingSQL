-- from the terminal run:
-- psql < craiglist.sql

DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist


CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL,

);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT,
    preferred_region TEXT,

);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    text TEXT,
    user_id INTEGER REFERENCES users,
    location TEXT,
    region_id INTEGER REFERENCES region,
    category_id INTEGER REFERENCES categories,
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT,
);


INSERT INTO region
    (region_name)
VALUES
    ('San Francisco'),
    ('Austin'),
    ('Atlanta'),
    ('Chicago');

INSERT INTO users
    (username, preferred_region)
VALUES
    ('Blue5623, Chicago'),
    ('ComputerScreen', 'San Francisco'),
    ('Chicken2038', 'Atlanta'),
    ('Red309_3', 'Chicago');

INSERT INTO posts
    (title, text, user_id, location, region_id, category_id)
VALUES
    ('Selling Car', 'Selling my old car', 2, 'Golden Gate Bridge', 1, 1),
    ('Room for Rent', 'Room available to rent', 4, 'downtown', 4, 2),
    ('Golden Retriever', 'looking for my dog', 3, 'suburbs', 3, 3),
    ('Free Clothes', 'garage sale for clothes', 1, 'Terrell', 2, 4);

INSERT INTO categories
    (category_name)
VALUES
    ('Cars'),
    ('Housing'),
    ('Pets'),
    ('Clothes');
