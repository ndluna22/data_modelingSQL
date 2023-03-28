-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT,
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    date DATE,
    doctor_id INTEGER REFERENCES doctor,
    patient_id INTEGER REFERENCES patient,

);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    birth_date DATE NOT NULL,

);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    type TEXT,

);

CREATE TABLE test_results
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases,
    patient_id INTEGER REFERENCES patients,
);


INSERT INTO doctors
    (name, specialty)
VALUES
    ('John Smith', 'Family Medicine'),
    ('May Kim', 'Internal medicine'),
    ('Brittany Smith', 'Family Medicine'),
    ('Jake Johnson', 'Cardiology');



INSERT INTO patients
    (first_name, last_name, birth_date)
VALUES
    ('Angel', 'Smith', '1980-01-01'),
    ('Mary', 'Cruz', '1991-11-25'),
    ('Steven', 'Tyler', '1971-05-21'),
    ('Cara', 'Smith', '1950-04-01');

INSERT INTO diseases
    (name, type)
VALUES
    ('Diabetes', 'Type 2 Diabetes'),
    ('Arthritis', 'Reheumatoid Arhritis'),
    ('Heart Disease', 'hyperlipidemia');

INSERT INTO test_results
    (visit_id, disease_id)
VALUES
    (1, 2),
    (2, 1),
    (3, 1),
    (4, 3);

INSERT INTO visits
    (date, doctor_id, patient_id)
VALUES
    ('2023-01-10', 1, 2),
    ('2022-10-15', 2, 4),
    ('2022-12-10', 3, 1),
    ('2023-03-05', 4, 3);

